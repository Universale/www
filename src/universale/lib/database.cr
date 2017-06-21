# Database
module Universale
  DB = PG.connect(ENV["PG_URL"])
end
