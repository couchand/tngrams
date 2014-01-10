# extract the dialog from the given script

fs = require 'fs'
cheerio = require 'cheerio'

isDialog = (p) ->
    /^ *[-.A-Z'"()][-.A-Z0-9 '"()]*\r/.test p

extract = (season, episode, file) ->
    body = fs.readFileSync(file)
    $ = cheerio.load body.toString()

    lines = []

    $("p").map (i, p) ->
        t = $(p).text()
        return unless isDialog t
        lines.push
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

    lines

module.exports = extract
