#!/usr/bin/env crystal

# ## Requires

# Load env
require "dotenv"
Dotenv.load

# Database
require "pg"
require "topaz"

# Web
require "kemal"
require "kilt/slang"

# ## Load the application

# Libs
require "./universale/lib/*"

# Web service
include Universale
require "./universale/webroot/*"

# Web server
Kemal.run
