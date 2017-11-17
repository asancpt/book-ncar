gitbook:
	Rscript --quiet _render.R "bookdown::gitbook"

pdf:
	Rscript --quiet _render.R "bookdown::pdf_book"

openpdf:
	start ../docs-handout/handout.pdf

all:
	Rscript --quiet _render.R

clean:
	Rscript -e "options(bookdown.clean_book = TRUE);bookdown::clean_book()"

publish:
	Rscript --quiet _render.R "bookdown::gitbook" ; lazygit 'publish: gitbook'

rmd:
	Rscript -e "rmarkdown::render('keynote.Rmd', output_format = 'html_document', encoding = 'UTF-8')"
