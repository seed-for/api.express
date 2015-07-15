'use strict'

fs = require 'fs'
path = require 'path'

GLOBAL.loquire =
  config: (name) ->
    name = name || 'environment'
    return require "./config/#{name}"
  components: (name) ->
    return require "./components/#{name}"
  middlewares: (name) ->
    return require "./middlewares/#{name}"
  utils: (name) ->
    return require "./utils/#{name}"

traverse = (directory, callback) ->
  fs.readdirSync path.join(__dirname, directory)
    .forEach (file) ->
      stat = fs.statSync path.join(__dirname, directory, file)
      callback file if stat.isDirectory()

traverse 'domains', (domain) ->
  loquire[domain] = (name) ->
    name =
      if name
        "#{domain}.#{name}"
      else
        'index'
    require "./domains/#{domain}/#{name}"

loquire.domains = (callback) ->
  traverse 'domains', (domain) ->
    callback loquire[domain]
