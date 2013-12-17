SOURCES := $(wildcard *.md)
HTML_FILES := $(SOURCES:.md=.html)
DOCX_FILES := $(SOURCES:.md=.docx)
.PHONY: html docx

all: html docx
html: $(HTML_FILES)
docx: $(DOCX_FILES)

clean:
	-rm *.html *.docx

%.html: %.md
	multimarkdown -t html $< > $@

%.docx: %.md
	pandoc -f markdown -t docx -s $< -o $@
