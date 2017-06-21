private def record_show(env)
  begin
    id = Int32.new env.params.url["id"]
    record = Record.find(id)
    if Universale::ApiJson.json?(env)
      record
    else
      render "src/universale/webroot/records/show.slang", "src/universale/webroot/layouts/layout.slang"
    end
  rescue err : DB::Error
    pp err
    env.response.status_code = 404
  rescue err : ArgumentError
    pp err
    env.response.status_code = 400
  end
end

get "/records/:id" do |env|
  record_show env
end
