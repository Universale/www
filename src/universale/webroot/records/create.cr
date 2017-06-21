private def records_create(env)
  begin
    data = env.params.body
    category_name = data["category_name"]
    category_id = Universale::DB.query_one("SELECT id FROM categories WHERE name = $1", [category_name], as: {id: Int32})[:id] rescue nil
    category_id = Category.insert({name: category_name}) if category_id.nil?
    record = {title: data["title"], data: data["data"], description: data["description"], category_id: category_id}
    id = Record.insert(record)
    if Universale::ApiJson.json?(env)
      record = Record.find(id)
    else
      env.redirect "/records/#{id}"
    end
  rescue err
    env.response.status_code = 400
    pp err
    err
  end
end

post "/records" do |env|
  records_create(env)
end
