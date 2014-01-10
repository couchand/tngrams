# sort and extract keys

byCount = (a,b) ->
    if a[1] is b[1]
        0
    else if a[1] < b[1]
        1
    else
        -1

module.exports = (counts, min = 0) ->
    ([k, v] for k, v of counts when v > min).sort byCount
