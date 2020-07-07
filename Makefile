NAME = 1801-single-variable-calculus
PDF = susam-mitocw-$(NAME).pdf
DIST = $(HOME)/git/blob/lab/mitocw/$(NAME)/$(PDF)

pdf:
	cd tex && pdflatex main
	cd tex && pdflatex main
	mv tex/main.pdf "$(PDF)"
	make view
	cp "$(PDF)" $(DIST)
	make clean

deps:
	false # This target is not used right now.
	rm -rf texmf texmfvar ~/Library/texlive
	TEXMFHOME=texmf tlmgr init-usertree
	TEXMFHOME=texmf tlmgr --usermode install siunitx

view:
	if command -v xdg-open > /dev/null; then \
	    xdg-open "$(PDF)"; \
	elif command -v open > /dev/null; then \
	    open "$(PDF)"; \
	else \
	    echo Cannot find xdg-open or open; \
	fi

clean:
	find . -name "*.out" -exec rm {} +
	find . -name "*.aux" -exec rm {} +
	find . -name "*.log" -exec rm {} +
	find . -name "*.toc" -exec rm {} +
