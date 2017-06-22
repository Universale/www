class Model
end

module Model::Helper
  # the name of the table
  def table_name
    table = self.to_s.downcase
    table =~ /y$/ ? table[0..-2] + "ies" : table + "s"
  end

  macro def columns(**c)
    @@columns = c
  end
end
