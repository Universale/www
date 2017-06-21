private def records_create(env)
  begin
    data = env.params.body
    record = {data["title"], data["data"], data["description"], data["category_id"]}
    id = Universale::DB.query_one("INSERT INTO records (title, data, description, category_id) VALUES ($1, $2, $3, $4) RETURNING id", *record, as: {id: Int32})[:id]
    if Universale::ApiJson.json?(env)
      record = Universale::DB.query_one("SELECT title, data, description FROM records WHERE id = $1 LIMIT 1;", [id], as: {title: String, data: String, description: String})
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

post "/records.json" do |env|
  records_create(env)
end
