get "/categories" do |env|
  categories = DB.exec({String}, "SELECT categories.name FROM categories ORDER BY categories.name ASC").to_hash

  if env.json? #.split(";").any?{|s| s.split("/").includes?("json") }
    env.json!
    categories
  else
    render "src/universale/webroot/categories/index.slang", "src/universale/webroot/layouts/layout.slang"
  end
end
