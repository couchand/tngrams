# extract the dialog from the given script

fs = require 'fs'
cheerio = require 'cheerio'

isDialog = (p) ->
    /^ *[-.A-Z'"()][-.A-Z0-9 '"()]*\r/.test p

extract = (season, episode, file) ->
    fs.readFile file, (err, body) ->
        throw err if err?
        $ = cheerio.load body.toString()

        $("p").map (i, p) ->
            t = $(p).text()
            return unless isDialog t
            console.log t
            d =
                season: season
                episode: episode
                character: t.split("\n")[0]
                    .replace(/\([^)]*\)/g, '')
                    .trim()
                line: t.split("\n")
                    .slice(1)
                    .map((l) -> l.trim())
                    .join(" ")
                    .replace(/\([^)]*\)/g, '')
                    .trim()
            console.log d

module.exports = extract
