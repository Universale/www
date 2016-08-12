post "/records" do |env|
  begin
    id = Record.create(env.params.body)
    record = Record.find(id)
    if env.json?
      env.json!
      record
    else
      env.redirect "/records/#{id}"
    end
  rescue e
    env.response.status_code = 400
  end
end
