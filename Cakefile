{exec} = require 'child_process'

task 'build', 'Build project from src/**/*.coffee to lib/**/*.js', ->
  exec "coffee --compile --output public/js/src coffee/client", (err, stdout, stderr) ->
    throw err if err
    print stdout + stderr

  exec "coffee --compile --output server/ coffee/server/", (err, stdout, stderr) ->
    throw err if err
    print stdout + stderr

