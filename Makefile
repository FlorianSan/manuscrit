SHELL=bash
MAINFILE=main
LATEX=pdflatex
LATEXOPT=--shell-escape -synctex=1
NONSTOP=--interaction=nonstopmode

LATEXMK=latexmk
LATEXMKOPT=-pdf
CONTINUOUS=-pvc

pdf:
	$(LATEXMK) $(LATEXMKOPT) \
	    -e "add_cus_dep('nlo', 'nls', 0, 'nlo2nls');" \
	    -e "sub nlo2nls { system('makeindex -s nomencl.ist -o \"$(MAINFILE).nls\" \"$(MAINFILE).nlo\"'); }" \
	    -pdflatex="$(LATEX) $(LATEXOPT) $(NONSTOP) %O %S" $(MAINFILE)
read:
	evince ${MAINFILE}.pdf &

clean:
	rm -f ${MAINFILE}.{ps,log,aux,out,dvi,bbl,fls,blg,fdb_latexmk,nav,snm,toc,vrb,synctex.gz,maf,mtc*,nlo,nls,ilg,brf,lof,lot}
	rm -f *.aux
	rm -f chapters/*.aux
