PDF = susam-mitocw-1801.pdf
DIST = $(HOME)/git/blob/lab/mitocw/1801-single-variable-calculus/$(PDF)

pdf:
	cd tex && pdflatex main && pdflatex main
	mv tex/main.pdf "$(PDF)"
	make view
	cp "$(PDF)" $(DIST)
	make clean

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
