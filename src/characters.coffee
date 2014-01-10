# calculate most common characters

fs = require 'fs'
lines = JSON.parse fs.readFileSync('all_lines.json').toString()

counts = {}
seasonCounts = []

for line in lines
    counts[line.character] ?= 0
    counts[line.character]++
    seasonCounts[line.season] ?= {}
    seasonCounts[line.season][line.character] ?= 0
    seasonCounts[line.season][line.character]++

byCount = (a,b) ->
    if a[1] is b[1]
        0
    else if a[1] < b[1]
        1
    else
        -1

overall = ([k, v] for k, v of counts).sort byCount
seasons = (([k, v] for k, v of season).sort byCount for season in seasonCounts)

module.exports =
    overall: overall
    seasons: seasons
