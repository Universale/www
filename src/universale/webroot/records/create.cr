private def records_create(env)
  begin
    data = env.params.body
    record = {title: data["title"], data: data["data"], description: data["description"], category_id: data["category_id"]}
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
