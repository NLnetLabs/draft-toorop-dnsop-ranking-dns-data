SOURCE = draft-toorop-dnsop-ranking-dns-data

all:	$(SOURCE).txt $(SOURCE).html

$(SOURCE).txt:	$(SOURCE).xml
	xml2rfc $(SOURCE).xml -n --text

$(SOURCE).html:	$(SOURCE).xml
	xml2rfc $(SOURCE).xml -n --html

$(SOURCE).xml:	$(SOURCE).mkd
	kramdown-rfc2629 $(SOURCE).mkd >$(SOURCE).new.xml
	mv $(SOURCE).new.xml $(SOURCE).xml

clean:
	rm -f $(SOURCE).txt $(SOURCE).html $(SOURCE).xml
