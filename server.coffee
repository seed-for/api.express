'use strict'

process.env.NODE_ENV = process.env.NODE_ENV || 'development'

require './loquire'

config = loquire.config()

loquire.config 'mongoose'

app = loquire.config 'express'

server = require 'http'
  .createServer app
server.listen config.port, config.ip, ->
  console.log """
    Express server listening on #{config.ip}:#{config.port}, in #{config.env} mode
  """
