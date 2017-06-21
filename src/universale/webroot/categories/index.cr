private def categories
  Universale::DB.query_all("SELECT name FROM categories ORDER BY categories.name ASC", as: {name: String})
end

get "/categories" do |env|
  categories = categories()
  if Universale::ApiJson.json?(env)
    categories
  else
    render "src/universale/webroot/categories/index.slang", "src/universale/webroot/layouts/layout.slang"
  end
end

get "/categories.json" do |env|
  categories = categories()
end
