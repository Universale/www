#!/usr/bin/env crystal
require "kemal"
require "pg"
require "kilt/slang"

# Data base
DB = PG.connect(ENV["PG_URL"])
require "./universale/lib/models/*"

# Web service
require "./universale/webroot/resources"
Kemal.run
