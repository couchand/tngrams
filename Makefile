all: getScripts extractLines

extractLines: all_lines.txt

allLines.txt: getScripts
	coffee src/all.coffee > $@

getScripts: s1 s2 s3 s4 s5 s6 s7

s1:
	curl http://antoa.com/tng/chrono/seasonone.htm > $@.html
	grep '<a href="../scripts' $@.html | sed "s#^.*/scripts/##" | sed 's#".*$$##' > $@
	./fetchAll $@
s2:
	curl http://antoa.com/tng/chrono/seasontwo.htm > $@.html
	grep '<a href="../scripts' $@.html | sed "s#^.*/scripts/##" | sed 's#".*$$##' > $@
	./fetchAll $@
s3:
	curl http://antoa.com/tng/chrono/seasonthree.htm > $@.html
	grep '<a href="../scripts' $@.html | sed "s#^.*/scripts/##" | sed 's#".*$$##' > $@
	./fetchAll $@
s4:
	curl http://antoa.com/tng/chrono/seasonfour.htm > $@.html
	grep '<a href="../scripts' $@.html | sed "s#^.*/scripts/##" | sed 's#".*$$##' > $@
	./fetchAll $@
s5:
	curl http://antoa.com/tng/chrono/seasonfive.htm > $@.html
	grep '<a href="../scripts' $@.html | sed "s#^.*/scripts/##" | sed 's#".*$$##' > $@
	./fetchAll $@
s6:
	curl http://antoa.com/tng/chrono/seasonsix.htm > $@.html
	grep '<a href="../scripts' $@.html | sed "s#^.*/scripts/##" | sed 's#".*$$##' > $@
	./fetchAll $@
s7:
	curl http://antoa.com/tng/chrono/seasonseven.htm > $@.html
	grep '<a href="../scripts' $@.html | sed "s#^.*/scripts/##" | sed 's#".*$$##' > $@
	./fetchAll $@
