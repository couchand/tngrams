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
    lines = []
    files = fs.readdirSync dir
    files.forEach (file) ->
        name = file.replace /.htm/, ''
        source = path.join dir, file
        lines = lines.concat extract num, name, source
    lines

module.exports = season
