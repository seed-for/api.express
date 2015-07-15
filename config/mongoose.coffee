'use strict'

config = loquire.config()
mongoose = require 'mongoose'
Grid = require 'gridfs-stream'
_ = require 'lodash'

mongoose.status = 'CONNECTING'
mongoose.connect config.mongo.uri, config.mongo.options

connection = mongoose.connection
db = connection.db
mongo = mongoose.mongo

connection.on 'connected', () ->
  mongoose.status = 'CONNECTED'

connection.on 'disconnected', () ->
  mongoose.status = 'DISCONNECTED'

connection.on 'error', (err) ->
  console.log 'Error on mongoose:', err

if (connection.hosts)
  console.log 'Mongoose connected to', _.map connection.hosts, (connection) ->
    "#{connection.host}:#{connection.port}/#{db.databaseName}"
else
  console.log 'Mongoose connected to',
    "#{connection.host}:#{connection.port}/#{db.databaseName}"

mongoose.initialize = () ->
  Q = require 'bluebird'

  user = Q.defer()

  loquire.user 'model'
    .ensureIndexes () ->
      user.resolve()

  Q.all [
    user.promise
  ]

gfs = new Grid db, mongo

mongoose.gfs = gfs

module.exports = exports = mongoose
