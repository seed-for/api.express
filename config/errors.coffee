'use strict'

# THE BASE ERROR

class BaseError extends Error
  constructor: (@name, @code, @message) ->
    e = super @message
    @stack = e.stack

# AUTHENTICATION ERRORS: 401

class AuthenticationError extends BaseError

exports.AuthenticationRequiredError =
  class AuthenticationRequiredError extends AuthenticationError
    constructor: (@message = 'No Authorization header was found.') ->
      super 'AuthenticationRequiredError', 'AUTHENTICATION_REQUIRED', @message

exports.AuthenticationInvalidError =
  class AuthenticationInvalidError extends AuthenticationError
    constructor: (@message = 'The given Authorization header format is bad.') ->
      super 'AuthenticationInvalidError', 'AUTHENTICATION_INVALID', @message

# AUTHORIZATION ERRORS: 403

class AuthorizationError extends BaseError

# NOT FOUND ERRORS: 404

class NotFoundError extends BaseError

exports.ApiNotFoundError =
  class ApiNotFoundError extends NotFoundError
    constructor: (@url, @message = "No resource for url:#{@url} is found.") ->
      super 'ApiNotFoundError', 'API_NOT_FOUND', @message

# Helpers

exports.status = (err) ->
  switch err.code
    when 'AUTHENTICATION_REQUIRED', 'AUTHENTICATION_INVALID'
      401
    when 'API_NOT_FOUND'
      404
    else
      500
