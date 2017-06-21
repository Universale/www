private def record_update(env)
  begin
    id = Int32.new env.params.url["id"]
    data = env.params.body
    # record = {data["title"], data["data"], data["description"], data["category_id"]}
    # success = Universale::DB.exec("UPDATE records SET title = $1, data = $2, description = $3, category_id = $4) WHERE id = $5", *record, id) rescue false
    record = {title: data["title"], data: data["data"], description: data["description"], category_id: data["category_id"]}
    success = Record.update({id: id}, record)
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

put "/records/:id" do |env|
  record_update(env)
end
