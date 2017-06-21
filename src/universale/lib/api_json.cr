class HTTP::Server::Context
  def json?
    self.request.headers["Accept"].to_s.split(";").includes?("application/json")
  end

  def json!
    self.response.content_type = "application/json"
  end
end

module Universale::ApiJson
  extend self

  def json?(env)
    if env.json?
      env.json!
      true
    else
      false
    end
  end
end
