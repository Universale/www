post "/records" do |env|
  begin
    id = Record.create(env.params.body)
    if env.json?
      env.json!
      Record.find(id)
    else
      env.redirect "/records/#{id}"
    end
  rescue e
    env.response.status_code = 400
  end
end
