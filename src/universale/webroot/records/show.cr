get "/records/:id" do |env|
  record = Record.find(env.params.url["id"].to_i)
  if env.json?
    env.json!
    record
  else
    render "src/universale/webroot/records/show.slang", "src/universale/webroot/layouts/layout.slang"
  end
end
