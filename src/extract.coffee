# extract the dialog from the given script

fs = require 'fs'
cheerio = require 'cheerio'

isDialog = (p) ->
    /^ *[-.A-Z'"()][-.A-Z0-9 '"()]*\r/.test p

extract = (file) ->
    fs.readFile file, (err, body) ->
        throw err if err?
        $ = cheerio.load body.toString()

        $("p").map (i, p) ->
            t = $(p).text()
            return unless isDialog t
            console.log t
            d =
                character: t.split("\n")[0].trim()
                line: t.split("\n")
                    .slice(1)
                    .map((l) -> l.trim())
                    .join(" ")
            console.log d

module.exports = extract
