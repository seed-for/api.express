'use strict'

path = require 'path'
_ = require 'lodash'

PORT = process.env.PORT || 9000
WEB_PORT = process.env.WEB_PORT || 8000

common =
  env: process.env.NODE_ENV
  root: "#{path.normalize __dirname}/../.."
  temp: './.tmp/'
  domain: process.env.DOMAIN || "http://localhost:#{PORT}"
  web: process.env.WEB || "http://localhost:#{WEB_PORT}"
  ip: process.env.IP || '0.0.0.0'
  port: PORT
  mongo:
    options:
      db:
        w: 'majority'
        j: true
  token:
    secret: process.env.TOKEN_SECRET || 'seed'
    expiresInMinutes: process.env.TOKEN_EXPIRATION || 60 * 24 * 365

module.exports = _.merge common, require "./#{process.env.NODE_ENV}"
