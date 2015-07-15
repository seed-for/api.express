'use strict'

version = loquire.config 'version'
mongoose = loquire.config 'mongoose'

exports.version = (req, res) ->
  res.finish version: version

exports.status = (req, res) ->
  res.finish
    status:
      version: version
      database: mongoose.status
