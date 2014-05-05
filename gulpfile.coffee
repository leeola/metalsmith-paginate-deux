#
# # Gulpfile
#
# A simple gulpfile. Use `cult` to run this.
#
{spawn} = require 'child_process'
gulp   = require 'gulp'
coffee = require 'gulp-coffee'


paths =
  coffee: [
    '!node_modules/**'
    '!gulpfile.coffee'
    '**/*.coffee'
  ]


gulp.task 'coffee', ->
  gulp.src paths.coffee
    .pipe coffee()
    .pipe gulp.dest 'build'


gulp.task 'publish', ['test'], ->
  proc = spawn 'npm publish'
  proc.stderr.pipe process.stderr
  proc.stdout.pipe process.stdout


gulp.task 'test', ['build'], ->
  proc = spawn '../node_modules/mocha/bin/mocha', cwd: 'build'
  proc.stderr.pipe process.stderr
  proc.stdout.pipe process.stdout



gulp.task 'build', ['coffee']
gulp.task 'default', ['build']
