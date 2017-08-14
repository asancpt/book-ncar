# setup ----

library(tidyverse)
library(NonCompart, lib = './lib')
# install.packages("lib/NonCompart_0.3.3.tar.gz", repos = NULL, lib = "./lib", type = "source")

tblNcaWrap <- function(df) {
  parameters <- attributes(df)$dimnames[[2]]
  paramUnits <- tibble(param = parameters[c(1, grep('b0', parameters):grep('MRTEVIFP', parameters))],
                       units = attributes(df)$units)
  df %>% 
    as_tibble() %>% 
    tidyr::gather(param, value, b0:MRTEVIFP) %>% 
    left_join(paramUnits, by = 'param') %>% 
    filter(param %in% c('CMAX', 'AUCLST')) %>% 
    arrange(SUBJ) %>% 
    mutate(value = as.numeric(value))
}  

# main ----

Conc <- read.csv("lib/NonCompart-src/tests/BE-Conc.csv", as.is=TRUE) # folder 위치는 맞추세요.
Res1 <- tblNCA(Conc, key=c("SUBJ", "GRP", "PRD", "TRT"), colTime="TIME", colConc="CONC", dose=100)

tblNcaWrap(Res1) %>% View
