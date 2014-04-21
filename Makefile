SOURCES := $(wildcard *.md)
HTML_FILES := $(SOURCES:.md=.html)
DOCX_FILES := $(SOURCES:.md=.docx)
.PHONY: html docx clean all

# FIXME this should be automated
all: html docx 
	make -C csi all
	make -C policy all
	make -C projects all
	make -C services all
	make -C misc all

html: $(HTML_FILES)
docx: $(DOCX_FILES)

clean:
	-rm *.html *.docx
	make -C csi clean
	make -C policy clean
	make -C projects clean
	make -C services clean

%.html: %.md
	multimarkdown -t html $< > $@

%.docx: %.md
	pandoc -f markdown -t docx -s $< -o $@
