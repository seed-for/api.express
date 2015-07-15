'use strict'

EXECUTABLE = 'node_modules/coffee-script/bin/coffee'

gulp = require 'gulp'
$ = require('gulp-load-plugins')
  lazy: true
  rename:
    'gulp-live-server': 'server'

gulp.task 'default', []

gulp.task 'serve', ->
  server = $.server 'server.coffee', {}, false
  server.start EXECUTABLE
  gulp.watch [
      '**/*.coffee'
      '!gulpfile.coffee'
      '!node_modules/**/*'
    ], server.start.bind(server, EXECUTABLE)

# TODO
gulp.task 'build', []

# TODO
gulp.task 'test', []
