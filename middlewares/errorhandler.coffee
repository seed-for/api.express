'use strict'

errors = loquire.config 'errors'

module.exports = () ->
  (err, req, res, next) ->
    res.statusCode = errors.status err
    console.error err.stack if res.statusCode is 500
    error = {}
    for key, value of err
      error[key] = value if key isnt 'stack'
    json = JSON.stringify error: error
    res.setHeader 'Content-Type', 'application/json'
    res.end json
