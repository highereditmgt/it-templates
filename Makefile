SOURCES := $(wildcard *.md)
HTML_FILES := $(SOURCES:.md=.html)
DOCX_FILES := $(SOURCES:.md=.docx)
.PHONY: html docx clean all

all: html docx $(SUBDIRS)
	make -C policy all

html: $(HTML_FILES)
docx: $(DOCX_FILES)

clean:
	-rm *.html *.docx
	make -C policy clean

%.html: %.md
	multimarkdown -t html $< > $@

%.docx: %.md
	pandoc -f markdown -t docx -s $< -o $@
