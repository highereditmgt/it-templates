SOURCES := $(wildcard *.md)
HTML_FILES := $(SOURCES:.md=.html)
ODF_FILES := $(SOURCES:.md=.odf)
.PHONY: html odf

all: html odf
html: $(HTML_FILES)
odf: $(ODF_FILES)

clean:
	-rm *.html *.odf

%.html: %.md
	multimarkdown -t html $< > $@

%.odf: %.md
	multimarkdown -t odf $< > $@
