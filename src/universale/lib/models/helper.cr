class Model
end

module Model::Helper
  # the name of the table
  def table_name
    table = self.to_s.downcase
    table =~ /y$/ ? table[0..-2] + "ies" : table + "s"
  end

  # the name of the table, escaped for injection in a sql
  def escaped_table_name
    "\"#{self.table_name}\""
  end

  # the name of a given column, escaped
  def escaped_column(col)
    "\"#{col}\""
  end

  # the name of a given column, escaped
  def escaped_full_column(col)
    "\"#{table_name}\".\"#{col}\""
  end

  def default_fields
    {id: Int32}
  end

  def default_fields(fields : NamedTuple? = nil)
    fields || self.default_fields
  end
end
