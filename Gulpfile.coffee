gulp = require 'gulp'
shell = require 'gulp-shell'

gulp.task 'default' ->
    gulp.watch '*.tex', ['renderDoc']


