#!/usr/bin/env crystal
require "kemal"
require "pg"
require "kilt/slang"

# Data base
DB = PG.connect(ENV["PG_URL"])

# Web service
require "./universale/webroot/resources"
Kemal.run
