get "/categories/:name/records" do |env|
  category_name = env.params.url["name"]

  offset = env.params.query["offset"]? || "0"
  search = env.params.query["search"]? || nil

  q1 = "SELECT records.title, records.data FROM records
  INNER JOIN categories ON categories.id = records.category_id
  WHERE categories.name = $1"
  q2 = "ORDER BY created_at DESC OFFSET $2 LIMIT 100;"

  records = if search.nil?
    DB.exec({String, String}, "#{q1} #{q2}", [category_name, offset]).to_hash
  else
    DB.exec({String, String}, "#{q1} AND records.title LIKE '%' || $3 || '%' #{q2}", [category_name, offset, search.to_s]).to_hash
  end

  render "src/universale/webroot/categories/records.slang", "src/universale/webroot/layouts/layout.slang"
end
