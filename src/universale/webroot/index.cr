get "/" do
  recents = Universale::DB.query_all("SELECT title, data, description FROM records ORDER BY created_at DESC LIMIT 10;", as: {title: String, data: String, description: String})
  categories = Category.all
  render "src/universale/webroot/index.slang", "src/universale/webroot/layouts/layout.slang"
end
