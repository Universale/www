#!/usr/bin/env crystal
require "kemal"
require "pg"
require "kilt/slang"
require "dotenv"

# Load env
Dotenv.load

# Database
DB = PG.connect(ENV["PG_URL"])

# Libs
require "./universale/lib/*"

# Web service
require "./universale/webroot/resources"
Kemal.run
