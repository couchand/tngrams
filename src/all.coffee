# extract all

season = require './season'

lines = []

lines = lines.concat season i for i in [1..7]

console.log JSON.stringify lines
