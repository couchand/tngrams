# calculate most common characters

fs = require 'fs'
lines = JSON.parse fs.readFileSync('all_lines.json').toString()

counts = {}

for line in lines
    counts[line.character] ?= 0
    counts[line.character]++

byCount = (a,b) ->
    if a[1] is b[1]
        0
    else if a[1] < b[1]
        1
    else
        -1

overall = ([k, v] for k, v of counts).sort byCount

module.exports =
    overall: overall
