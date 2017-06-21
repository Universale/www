class Model
end

module Model::Forge
  def forge_fields_list(fields : Tuple)
    fields.map { |c| escaped_full_column(c) }
  end
end
