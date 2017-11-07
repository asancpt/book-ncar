# setup ----

# install.packages("lib/NonCompart_0.3.3.tar.gz", repos = NULL, lib = "./lib", type = "source")
# install.packages("lib/NonCompart_0.3.3.tar.gz", repos = NULL, type = "source")

library(tidyverse)
library(NonCompart) # 0.3.3
library(ncar) # 0.3.7

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

Conc <- read.csv("cran/NonCompart/tests/BE-Conc.csv", as.is=TRUE) 
Res1 <- tblNCA(Conc, key=c("SUBJ", "GRP", "PRD", "TRT"), colTime="TIME", colConc="CONC", dose=100)

tblNcaWrap(Res1) #%>% View

