get "/records/:id" do |env|
  begin
    id = Int32.new env.params.url["id"]
    record = Universale::DB.query_one("SELECT title, data, description FROM records WHERE id = $1 LIMIT 1;", id, as: {title: String, data: String, description: String})
    if Universale::ApiJson.json?(env)
      record
    else
      render "src/universale/webroot/records/show.slang", "src/universale/webroot/layouts/layout.slang"
    end
  rescue err : DB::Error
    env.response.status_code = 404
  rescue err : ArgumentError
    env.response.status_code = 400
  end
end
