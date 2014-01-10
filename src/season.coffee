# extract a season of dialog

fs = require 'fs'
path = require 'path'
extract = require './extract'

word = [
    'zero'
    'one'
    'two'
    'three'
    'four'
    'five'
    'six'
    'seven'
]

season = (num) ->
    dir = "season#{word[num]}"
    fs.readdir dir, (err, files) ->
        throw err if err?
        files.forEach (file) ->
            extract path.join dir, file

module.exports = season
