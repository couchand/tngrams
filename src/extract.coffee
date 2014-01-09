# extract the dialog from the given script

fs = require 'fs'
cheerio = require 'cheerio'

isDialog = (p) ->
    /^ *[-.A-Z'"()][-.A-Z0-9 '"()]*\r/.test p

extract = (file) ->
    fs.readFile file, (err, body) ->
        $ = cheerio.load body.toString()

        $("p").map (i, p) ->
            t = $(p).text()
            console.log t if isDialog t

module.exports = extract
