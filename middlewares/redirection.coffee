'use strict'

# Enables redirection to https for production mode on AWS.
# This middleware should be at the first place.
module.exports = ->
  (req, res, next) ->
    if req.headers['x-forwarded-proto'] is 'http'
      res.redirect "https://#{req.get 'host'}#{req.url}"
    else
      next()
