gulp = require 'gulp'
coffee = require 'gulp-coffee'
concat = require 'gulp-concat'
uglify = require 'gulp-uglify'

gulp.task 'server', ()->
  gulp.src ['**/*.coffee', '!node_modules', '!client/**/*.coffee', '!bower_components', '!gulpfile.coffee']
  .pipe coffee()
  .pipe gulp.dest './'

gulp.task 'client', ()->
  gulp.src ['client/**/*.coffee']
  .pipe coffee bare: true
  .pipe concat 'viola_config.min.js'
  .pipe uglify()
  .pipe gulp.dest 'public/js/'

gulp.task 'default', ['client', 'server'], ()->

gulp.task 'watch', ['default'], ()->
  gulp.watch '**/*.coffee', ['default']