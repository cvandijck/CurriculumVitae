ifeq ($(OS), Windows_NT)
	MAKE_OS := Windows
else
	MAKE_OS := Linux
endif

ifeq ($(MAKE_OS), Windows)
	REMOVE = del
else
	REMOVE = rm
endif

DOCNAME = resume

compile:
	$(info MAKE: compile xelatex, bibtex and xelatex (2) ...)
	xelatex $(DOCNAME) --interaction=nonstopmode
	bibtex $(DOCNAME)
	xelatex $(DOCNAME) --interaction=nonstopmode
	xelatex $(DOCNAME) --interaction=nonstopmode

update:
	$(info MAKE: compile pdflatex ...)
	xelatex $(DOCNAME) --interaction=nonstopmode

clean:
	$(info MAKE: clean temporary files ...)
	$(REMOVE) *.blg *.bbl *.aux *.log
