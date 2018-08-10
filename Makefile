publish:
	git pull ;\
	Rscript --quiet _render.R "bookdown::gitbook" ;\
	Rscript --quiet _render.R "bookdown::pdf_book" ;\
	Rscript --quiet _render.R "bookdown::epub_book" ;\
	git add .; git commit -m 'publish: gitbook'; git push

gitbook:
	Rscript --quiet _render.R "bookdown::gitbook"

pdf:
	Rscript --quiet _render.R "bookdown::pdf_book"

all:
	Rscript --quiet _render.R

clean:
	Rscript -e "options(bookdown.clean_book = TRUE);bookdown::clean_book()"

rmd:
	Rscript -e "rmarkdown::render('keynote.Rmd', output_format = 'html_document', encoding = 'UTF-8')"

