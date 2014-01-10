# calculate most common characters

fs = require 'fs'
lines = JSON.parse fs.readFileSync('all_lines.json').toString()

sort = require './sort'

counts = {}
seasonCounts = []

for line in lines
    counts[line.character] ?= 0
    counts[line.character]++
    seasonCounts[line.season] ?= {}
    seasonCounts[line.season][line.character] ?= 0
    seasonCounts[line.season][line.character]++

overall = sort counts
seasons = (sort season for season in seasonCounts)

module.exports =
    overall: overall
    seasons: seasons
