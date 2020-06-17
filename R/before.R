rm(list = ls(all = TRUE))

pacman::p_load(char = c('knitr', 'tidyverse'))
opts_chunk$set(error = TRUE, 
               out.width = '100%', #results = 'hide',
               #cache = TRUE,
               message = FALSE, warning = FALSE)

