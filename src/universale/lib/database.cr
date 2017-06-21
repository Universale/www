require "uri"

# Database
module Universale
  DATABASE_URL = URI.parse ENV["DATABASE_URL"]
  DB           = PG.connect(ENV["DATABASE_URL"])
end

Topaz::Db.setup(Universale::DATABASE_URL)
