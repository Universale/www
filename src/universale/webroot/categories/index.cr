get "/categories" do |env|
  categories = DB.exec({String}, "SELECT categories.name FROM categories ORDER BY categories.name ASC").to_hash

  render "src/universale/webroot/categories/index.slang", "src/universale/webroot/layouts/layout.slang"
end
