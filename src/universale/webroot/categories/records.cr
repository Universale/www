get "/categories/:name/records" do |env|
  category_name = env.params.url["name"]

  offset = env.params.query["offset"]? || "0"
  records = DB.exec({String, String},
  "SELECT records.title, records.data FROM records
  INNER JOIN categories ON categories.id = records.category_id
  WHERE categories.name = $1 ORDER BY created_at DESC OFFSET $2 LIMIT 100;",
  [category_name, offset]).to_hash

  render "src/universale/webroot/categories/records.slang", "src/universale/webroot/layouts/layout.slang"
end
