# extract a season of dialog

fs = require 'fs'
path = require 'path'
extract = require './extract'

season = (name) ->
    dir = "season#{name}"
    fs.readdir dir, (err, files) ->
        throw err if err?
        files.forEach (file) ->
            extract path.join dir, file

module.exports = season
