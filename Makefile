SOURCES := $(wildcard *.md **/*.md)
HTML_FILES := $(SOURCES:.md=.html)
DOCX_FILES := $(SOURCES:.md=.docx)

all: html docx
html: $(HTML_FILES)
docx: $(DOCX_FILES)

clean:
	find . \( -name '*.docx' -o -name '*.html' \) -print0 | xargs -0 rm

%.html: %.md
	multimarkdown -t html $< > $@

%.docx: %.md
	pandoc -f markdown -t docx -s $< -o $@
