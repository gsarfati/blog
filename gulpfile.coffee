gulp   = require 'gulp'
less   = require 'gulp-less'
coffee = require 'gulp-coffee'
jade   = require 'retro-gulp-jade'
gutil  = require 'gulp-util'

gulp.task 'less', ->
  gulp.src './less/style.less'
  .pipe less()
  .pipe gulp.dest './css/'
  .on 'error', gutil.log

gulp.task 'includes', ->
  gulp.src './includes/*.jade'
  .pipe jade pretty: true
  .pipe gulp.dest './_includes'
  .on 'error', gutil.log

gulp.task 'layouts', ->
  gulp.src './layouts/*.jade'
  .pipe jade pretty: true
  .pipe gulp.dest './_layouts/'
  .on 'error', gutil.log

gulp.task 'index', ->
  gulp.src './index.jade'
  .pipe jade pretty: true
  .pipe gulp.dest './'
  .on 'error', gutil.log

gulp.task 'build', ['less', 'includes', 'layouts', 'index']

gulp.task 'watch', ['build'], ->
  gulp.watch './less/**/*.less', ['less']
  gulp.watch './includes/*.jade', ['includes']
  gulp.watch './layouts/*.jade', ['layouts']
  gulp.watch './index.jade', ['index']
