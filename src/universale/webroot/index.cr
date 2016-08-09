get "/" do
  recents = DB.exec({String, String}, "SELECT records.title, records.data FROM records ORDER BY created_at DESC LIMIT 10;").to_hash

  render "src/universale/webroot/index.ecr", "src/universale/webroot/layouts/layout.ecr"
end
