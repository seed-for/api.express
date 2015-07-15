'use strict'

express = require 'express'
compression = require 'compression'
bodyParser = require 'body-parser'
methodOverride = require 'method-override'
passport = require 'passport'
morgan = require 'morgan'
cors = require 'cors'
errorhandler = loquire.middlewares 'errorhandler'
redirection = loquire.middlewares 'redirection'

loquire.config 'promise'
loquire.config 'response'

app = express()

env = app.get 'env'

app.use redirection() if env is 'production'

app.use compression()

app.use bodyParser.urlencoded(extended: false)
app.use bodyParser.json()
app.use methodOverride()
app.use passport.initialize(userProperty: 'me')

app.use morgan('dev') if env isnt 'test'

app.use cors
  origin: true
  allowedHeaders: ['Content-Type', 'Authorization']
  exposedHeaders: ['Auth-Token']
  credentials: true
  maxAge: 86400

loquire.config('routes')(app)

app.use errorhandler()

module.exports = app
