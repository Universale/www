#!/usr/bin/env crystal

require "./init"

# Web service
include Universale
require "./universale/webroot/*"
Kemal.run
