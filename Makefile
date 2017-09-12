gitbook:
	Rscript --quiet _render.R "bookdown::gitbook"

all:
	Rscript --quiet _render.R

clean:
	Rscript -e "options(bookdown.clean_book = TRUE);bookdown::clean_book()"

publish:
	Rscript --quiet _render.R "bookdown::gitbook" ; lazygit 'publish: gitbook'
