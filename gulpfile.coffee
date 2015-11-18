gulp = require 'gulp'
coffee = require 'gulp-coffee'
concat = require 'gulp-concat'
uglify = require 'gulp-uglify'
replace = require 'gulp-token-replace'

gulp.task 'server', ()->
  gulp.src ['**/*.coffee', '!node_modules', '!client/**/*.coffee', '!bower_components', '!gulpfile.coffee']
  .pipe coffee()
  .pipe gulp.dest './'

gulp.task 'client', ['server'], ()->
  models = require './models/config'
  gulp.src ['client/**/*.coffee']
  .pipe replace global: modelsMap: JSON.stringify (models.getModelsMap())
  .pipe coffee bare: true
  .pipe concat 'viola_config.min.js'
  .pipe uglify()
  .pipe gulp.dest 'public/js/'

gulp.task 'default', ['client', 'server'], ()->

gulp.task 'watch', ['default'], ()->
  gulp.watch '**/*.coffee', ['default']