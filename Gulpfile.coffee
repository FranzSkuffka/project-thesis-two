gulp = require 'gulp'
shell = require 'gulp-shell'

gulp.task 'default', ->
    gulp.watch '*.tex', ['renderDoc','clean']

gulp.task 'renderDoc', ->
    console.log 'rendering'
gulp.task 'clean', ->
    console.log 'cleaning'
