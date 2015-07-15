'use strict'

http = require 'http'
res = http.ServerResponse.prototype

# NOTE: Adds convenient methods for express.

res.setToken = (token) ->
  @setHeader 'Auth-Token', token
  @token = token

res.finish = (data) ->
  result =
    data: data
  result.token = @token if @token
  @json result
