VISOR=evince
.PHONY=clean
FICHAUX=*.bbl *.blg *.brf *.lof *.glo *.out *.snm *.nav 
FICHAUX2=*.toc *.log *.aux *.idx *.dvi 
FICHAUX3= *.pdf

all: memoria

memoria: memoria.tex
	@echo "se están convirtiendo las imágenes a PDF, espere un poco\n"
	@./pasaraepsypdf.py images/
	@./pasaraepsypdf.py images/pan/
	@./pasaraepsypdf.py images/trends
	@pdflatex -interaction batchmode $< 2> /dev/null
	@bibtex $(basename $<) 2> /dev/null
	@pdflatex -interaction batchmode $< 2> /dev/null
	@pdflatex -interaction batchmode $< 2> /dev/null
	@$(VISOR) $(basename $<).pdf

manual: ./manual-asterisk/manual-asterisk.tex
	@echo "se están convirtiendo las imágenes a PDF, espere un poco\n"
	@./pasaraepsypdf.py images/
	@./pasaraepsypdf.py images/pan/
	@./pasaraepsypdf.py images/trends
	@pdflatex -interaction batchmode $< 2> /dev/null
	@pdflatex -interaction batchmode $< 2> /dev/null
	@pdflatex -interaction batchmode $< 2> /dev/null

introvoip: ./intro-voip/intro-voip.tex
	@echo "se están convirtiendo las imágenes a PDF, espere un poco\n"
	@./pasaraepsypdf.py images/
	@./pasaraepsypdf.py images/pan/
	@./pasaraepsypdf.py images/trends
	@pdflatex -interaction batchmode $< 2> /dev/null
	@pdflatex -interaction batchmode $< 2> /dev/null
	@pdflatex -interaction batchmode $< 2> /dev/null

presentacion: presentacion.tex
	@echo "se están convirtiendo las imágenes a PDF, espere un poco\n"
	@./pasaraepsypdf.py images/
	@./pasaraepsypdf.py images/pan/
	@./pasaraepsypdf.py images/trends
	@pdflatex -interaction batchmode $< 2> /dev/null
	@pdflatex -interaction batchmode $< 2> /dev/null
	@pdflatex -interaction batchmode $< 2> /dev/null
	@$(VISOR) $(basename $<).pdf

clean:
	@$(RM) $(FICHAUX)$(FICHAUX2) 2> /dev/null 
	@$(RM) manual-asterisk/$(FICHAUX)$(FICHAUX2) 2> /dev/null 
	@$(RM) intro-voip/$(FICHAUX)$(FICHAUX2) 2> /dev/null 

clean-all:
	@$(RM) -R images/*.eps images/*.pdf 2> /dev/null
	@$(RM) -R images/pan/*.eps images/pan/*.pdf 2> /dev/null
	@$(RM) -R images/trends/*.eps images/trends/*.pdf 2> /dev/null
	@$(RM) $(FICHAUX)$(FICHAUX2)${FICHAUX3} 2> /dev/null 
