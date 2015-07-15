'use strict'

express = require 'express'
controller = loquire.common 'controller'
errors = loquire.config 'errors'

router = express.Router()

router.get '/version', [
  controller.version
]

router.get '/status', [
  controller.status
]

module.exports = router
