
all: thesis.pdf

.PHONY: clean

LATEX_FLAGS=-shell-escape -synctex=1
BIBER_FLAGS=

TARGET?=preface

thesis.pdf:
	lualatex $(LATEX_FLAGS) thesis
	biber $(BIBER_FLAGS) thesis
	makeglossaries thesis
	lualatex $(LATEX_FLAGS) thesis
	lualatex $(LATEX_FLAGS) thesis

clean:
	-@$(RM) \
		$(wildcard thesis-gnuplottex*) \
		$(addprefix thesis,.gnuploterrors .fls .pdf .fdb_latexmk .aux .bbl .bcf .blg .lof .log .lol .lot .out .run.xml .toc .acn .glo .ist .acr .alg .glg .gls .synctex.gz) \
		$(addprefix chapters/, *.gnuploterrors *.fls *.pdf *.fdb_latexmk *.aux *.bbl *.bcf *.blg *.lof *.log *.lol *.lot *.out *.run*.xml *.toc *.acn *.glo *.ist *.acr *.alg *.glg *.gls *.synctex*.gz)
