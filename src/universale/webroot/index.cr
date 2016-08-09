get "/" do
  recents = DB.exec({String, String}, "SELECT records.title, records.data FROM records ORDER BY created_at DESC LIMIT 10;").to_hash
  best = DB.exec({String, String}, "SELECT records.title, records.data FROM records ORDER BY id ASC LIMIT 10;").to_hash # TODO

  render "src/universale/webroot/index.slang", "src/universale/webroot/layouts/layout.slang"
end
