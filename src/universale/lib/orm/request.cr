class Request
  alias Value = String | Int32 | Int64 | Float32 | Float64 | Bool | Time | Nil

  property table : String
  property verb : Symbol

  property select_f : Array(String)
  property update_f : Hash(String, Value)
  property insert_f : Hash(String, Value)

  # [ {"column" => {join: "AND", op: "=" value: 1}} ]
  property where_f : Array(NamedTuple(join: String, op: String, column: String, value: Value))

  property offset : Int32?
  property limit : Int32?
  property idx : Int32

  def initialize(@table, @verb)
    @select_f = [] of String
    @update_f = {} of String => Value
    @insert_f = {} of String => Value
    @where_f = Array(NamedTuple(join: String, op: String, column: String, value: Value)).new
    @idx = 0
  end

  def select(*fields)
    @select_f += fields.to_a.map(&.to_s)
    self
  end

  def where(col : String | Symbol, val : Value, op : String = "=")
    @where_f << {join: "AND", op: op, column: col.to_s, value: val}
    self
  end

  def and(col : String | Symbol, val : Value, op : String = "=")
    where(col, val)
    self
  end

  def or(col : String | Symbol, val : Value, op : String = "=")
    @where_f << {join: "OR", op: op, column: col.to_s, value: val}
    self
  end

  def limit(i : Int)
    limit = i.to_i
    self
  end

  def offset(i : Int)
    offset = i.to_i
    self
  end

  def update(col : String | Symbol, val : Value)
    @update_f[col.to_s] = val
    self
  end

  def insert(col : String | Symbol, val : Value)
    @insert_f[col.to_s] = val
    self
  end

  {% for fct in ["where", "and", "or", "update", "insert"] %}
  def {{fct.id}}(**args)
    args.each { |k, v| {{fct.id}}(k, v) }
    self
  end
  {% end %}

  def params
    case verb
    when :select
      where_f.map { |clause| clause[:value] } + [offset] + [limit]
    when :insert
      insert_f.values
    when :update
      update_f.values + where_f.map { |clause| clause[:value] } + [offset] + [limit]
    when :delete
      where_f.map { |clause| clause[:value] } + [offset] + [limit]
    else
      raise "Not a valid verb"
    end.compact
  end

  # TODO fix that with a macro ?
  def to_s : String
    res = case verb
          when :select
            to_s_select
          when :insert
            to_s_insert
          when :update
            to_s_update
          when :delete
            to_s_delete
          else
            raise "Not a valid verb"
          end
    @idx = 0
    res
  end

  private def forge_where
    unless where_f.empty?
      forge_where_list = where_f.map_with_index do |clause, i|
        {clause: "#{escape(table, clause[:column])} #{clause[:op]} $#{@idx + i}", join: clause[:join]}
      end
      @idx = where_f.size + 1
      res = forge_where_list.reduce(forge_where_list.shift[:clause]) { |l, r| "#{l} #{r[:join]} #{r[:clause]}" }
      "WHERE #{res}"
    else
      nil
    end
  end

  private def to_s_offset
    if offset
      res = "OFFSET $#{@idx}"
      @idx += 1
      res
    end
  end

  private def to_s_limit
    if limit
      res = "LIMIT $#{@idx}"
      @idx += 1
      res
    end
  end

  private def to_s_select : String
    @idx = 1

    forge_select = select_f.map { |col| escape(table, col) }.join(", ")
    forge_where = forge_where()

    p1 = "SELECT #{forge_select} FROM #{escape(table)}"
    p2 = forge_where
    p3 = to_s_offset
    p4 = to_s_limit
    [p1, p2, p3, p4].map(&.to_s).compact.join(" ").to_s + ";"
  end

  private def to_s_insert : String
    @idx = 1
    forged_fields_name = insert_f.keys.join(", ")
    forged_fields_value = insert_f.values.map_with_index { |_, i| "$#{@idx + i}" }.join(", ")
    @idx += insert_f.size
    p1 = "INSERT INTO #{escape(table)} (#{forged_fields_name}) VALUES (#{forged_fields_value}) RETURNING id;"
  end

  private def to_s_update : String
    @idx = 1

    forge_update = update_f.map_with_index { |tuple, i| "#{tuple[0]} = $#{@idx + i}" }.join(", ")
    @idx += update_f.size
    forge_where = forge_where()
    pp forge_where.to_s
    p1 = "UPDATE #{escape(table)} SET #{forge_update} #{forge_where}"
    p2 = to_s_offset
    p3 = to_s_limit
    [p1, p2, p3].map(&.to_s).compact.join(" ").to_s + ";"
  end

  private def to_s_delete : String
    ""
  end

  def escape(*names)
    names.map { |name| "\"#{name}\"" }.reduce { |lhs, rhs| "#{lhs}.#{rhs}" }
  end
end
