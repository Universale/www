#!/usr/bin/env crystal
require "kemal"
require "pg"
require "kilt/slang"
require "dotenv"

# Load env
Dotenv.load

# Libs
require "./universale/lib/*"

# Web service
require "./universale/webroot/*"

# Web server
Kemal.run
