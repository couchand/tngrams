# extract all

season = require './season'

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

season word[i] for i in [1..7]
