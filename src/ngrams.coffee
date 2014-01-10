# calculate n-grams

MINIMUM = 50

sort = require './sort'

fs = require 'fs'
lines = JSON.parse fs.readFileSync('all_lines.json').toString()

tokens = (line) ->
    line.trim()
        .split(/\s+/)
        .map((token) ->
            token.replace(/[-.?!"]*$/, '')
                .replace(/^["]/, '')
                .toLowerCase()
                .trim()
        ).filter (token) ->
            token.length > 0

unigrams = {}
bigrams = {}
trigrams = {}

for line in lines
    words = tokens line.line

    continue unless words.length > 0
    for i in [0...words.length]
        unigram = words[i]
        unigrams[unigram] ?= 0
        unigrams[unigram]++

    continue unless words.length > 1
    for i in [0...words.length-1]
        bigram = "#{words[i]} #{words[i+1]}"
        bigrams[bigram] ?= 0
        bigrams[bigram]++

    continue unless words.length > 2
    for i in [0...words.length-2]
        trigram = "#{words[i]} #{words[i+1]} #{words[i+2]}"
        trigrams[trigram] ?= 0
        trigrams[trigram]++

module.exports =
    unigrams: sort unigrams, MINIMUM * 3
    bigrams: sort bigrams, MINIMUM * 2
    trigrams: sort trigrams, MINIMUM
