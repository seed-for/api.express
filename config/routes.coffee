'use strict'

errors = loquire.config 'errors'

module.exports = (app) ->
  loquire.domains (domain) ->
    app.use '/', domain()

  app.route '/*'
    .all (req, res, next) ->
      next new errors.ApiNotFoundError req.url
