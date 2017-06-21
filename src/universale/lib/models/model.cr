require "./helper"
require "./forge"
require "../orm/request"

class Model
  extend Model::Helper
  extend Model::Forge

  # find an element, raise if not found
  def self.find(id : Int, fields : NamedTuple? = nil)
    fields = default_fields(fields)
    request = Request.new(verb: :select, table: table_name).select(*fields.keys).where("id", id).limit(1)
    Universale::DB.query_one(request.to_s, request.params, as: fields)
  end

  # find an element, nil if not found
  def self.find?(id : Int, fields : NamedTuple? = nil)
    find(id, fields) rescue nil
  end

  # insert an element, raise if error, return the id of the element
  def self.insert(data)
    forged_fields_name = data.keys.map { |k| escaped_column(k) }.join(", ")
    forged_fields_value = data.values.map_with_index { |_, i| "$#{i + 1}" }.join(", ")
    sql_forged = "INSERT INTO #{escaped_table_name} (#{forged_fields_name}) VALUES (#{forged_fields_value}) RETURNING id;"
    Universale::DB.query_one(sql_forged, *data.values, as: {id: Int32})[:id]
  end

  # update an element, raise if error
  def self.update(selection : NamedTuple, update : NamedTuple)
    request = Request.new(verb: :update, table: table_name).where(**selection).update(**update)
    Universale::DB.exec(request.to_s, request.params)
  end

  def self.all(fields : NamedTuple? = nil)
    fields = default_fields(fields)
    request = Request.new(verb: :select, table: table_name).select(*fields.keys)
    Universale::DB.query_all(request.to_s, request.params, as: fields)
  end
end
