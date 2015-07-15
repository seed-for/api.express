'use strict'

Q = require 'bluebird'

# NOTE: Adds convenient methods for promise and express.

Q.prototype.next = (next) ->
  @then ->
    next()
  .catch (err) ->
    next err

Q.prototype.finish = (res, next) ->
  @then (result) ->
    res.finish result
  .catch (err) ->
    next err
