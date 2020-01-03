
\cleardoublepage

# (APPENDIX) Appendix {-}

# Phoenix WinNonLin 과 결과 비교 {#wnl-comparison}

## Introduction

NonCompart R package [@R-NonCompart; @Kim_2018] can conduct a noncompartmental analysis as similar as possible to the most widely used commercial software for pharmacokinetic analysis, i.e. [Phoenix^®^   WinNonlin^®^](https://www.certara.com/software/pkpd-modeling-and-simulation/phoenix-winnonlin/) [@wnl].
This document provides validation of noncompartmental analysis performed by NonCompart R package version 0.4.1 as compared to the results from the commercial software, WinNonlin^®^ version 6.3 and 7.0.

## Results

A function, `Equal()` will return `TRUE` if there is no difference between results from NonCompart and WinNonlin.


```r
# install.packages("NonCompart", repos="http://pmx.amc.seoul.kr")
library(NonCompart)
RptCfg = read.csv("data-raw/RptCfg.csv", as.is=TRUE)

Equal = function(Wres, Rres, Tol=0.001)
{
  Wres[,"ID"] = as.character(Wres[,"Subject"])
  ColName0 = colnames(Rres)
  rownames(RptCfg) = RptCfg[,"PPTESTCD"]
  colnames(Rres) = c(ColName0[1], RptCfg[ColName0[-1],"WNL"])
  Inter = intersect(colnames(Wres), colnames(Rres))
  
  IsSame = TRUE
  for (i in 1:nrow(Wres)) {
    for (j in Inter) {
      R = as.numeric(Rres[i,j])
      W = as.numeric(Wres[i,j])
      if (W != 0) {
        if(abs((R - W)/W) > Tol) {
          print(Wres[i,j])
          print(Rres[i,j])
          IsSame = FALSE
        }
      }
    }
  }
  return(IsSame)
}
```

Eight comparison tests were performed using `Theoph` and `Indometh` default datasets. (Table 1)
Detailed side-by-side comparison is in Appendix A.


Table: (\#tab:unnamed-chunk-3)Description of settings for the noncompartmental analysis performed in WinNonlin and links to the raw data

 No.  Dataset          Down     Route                  Hyperlink                                                                                                                                 
----  ---------------  -------  ---------------------  ------------------------------------------------------------------------------------------------------------------------------------------
   1  Theoph (n=12)    Linear   Extravascular          [CSV](https://raw.githubusercontent.com/asancpt/NonCompart-tests/master/Final_Parameters_Pivoted_Theoph_Linear.csv)                       
   2  Theoph (n=12)    Log      Extravascular          [CSV](https://raw.githubusercontent.com/asancpt/NonCompart-tests/master/Final_Parameters_Pivoted_Theoph_Log.csv)                          
   3  Indometh (n=6)   Linear   IV Bolus               [CSV](https://raw.githubusercontent.com/asancpt/NonCompart-tests/master/Final_Parameters_Pivoted_Indometh_Linear.csv)                     
   4  Indometh (n=6)   Log      IV Bolus               [CSV](https://raw.githubusercontent.com/asancpt/NonCompart-tests/master/Final_Parameters_Pivoted_Indometh_Log.csv)                        
   5  Indometh (n=6)   Linear   IV Infusion (0.25hr)   [CSV](https://raw.githubusercontent.com/asancpt/NonCompart-tests/master/Final_Parameters_Pivoted_Indometh_Linear_Infusion.csv)            
   6  Indometh (n=6)   Log      IV Infusion (0.25hr)   [CSV](https://raw.githubusercontent.com/asancpt/NonCompart-tests/master/Final_Parameters_Pivoted_Indometh_Log_Infusion.csv)               
   7  Indometh (n=6)   Linear   Extravascular          [CSV](https://raw.githubusercontent.com/asancpt/NonCompart-tests/master/Final_Parameters_Pivoted_Indometh_Linear_Wrong_Extravascular.csv) 
   8  Indometh (n=6)   Log      Extravascular          [CSV](https://raw.githubusercontent.com/asancpt/NonCompart-tests/master/Final_Parameters_Pivoted_Indometh_Log_Wrong_Extravascular.csv)    


```r
Theoph[,"Subject"] = as.numeric(as.character(Theoph[,"Subject"]))
Indometh[,"Subject"] = as.numeric(as.character(Indometh[,"Subject"]))

Wres1 = read.csv("data-raw/Final_Parameters_Pivoted_Theoph_Linear.csv")
Rres1 = tblNCA(Theoph, "Subject", "Time", "conc", dose=320, concUnit="mg/L")
Equal(Wres1, Rres1)
```

```
## [1] TRUE
```

```r
Wres2 = read.csv("data-raw/Final_Parameters_Pivoted_Theoph_Log.csv")
Rres2 = tblNCA(Theoph, "Subject", "Time", "conc", dose=320, down="Log", 
               concUnit="mg/L")
Equal(Wres2, Rres2) 
```

```
## [1] TRUE
```

```r
Wres3 = read.csv("data-raw/Final_Parameters_Pivoted_Indometh_Linear.csv")
Rres3 = tblNCA(Indometh, "Subject", "time", "conc", dose=25, adm="Bolus", 
               concUnit="mg/L")
Equal(Wres3, Rres3)
```

```
## Error in if (abs((R - W)/W) > Tol) {: TRUE/FALSE가 필요한 곳에 값이 없습니다
```

```r
Wres4 = read.csv("data-raw/Final_Parameters_Pivoted_Indometh_Log.csv")
Rres4 = tblNCA(Indometh, "Subject", "time", "conc", dose=25, adm="Bolus", 
               down="Log", concUnit="mg/L")
Equal(Wres4, Rres4)
```

```
## Error in if (abs((R - W)/W) > Tol) {: TRUE/FALSE가 필요한 곳에 값이 없습니다
```

```r
Wres5 = read.csv("data-raw/Final_Parameters_Pivoted_Indometh_Linear_Infusion.csv")
Rres5 = tblNCA(Indometh, "Subject", "time", "conc", dose=25, adm="Infusion", 
               dur=0.25, concUnit="mg/L")
Equal(Wres5, Rres5)
```

```
## Error in if (abs((R - W)/W) > Tol) {: TRUE/FALSE가 필요한 곳에 값이 없습니다
```

```r
Wres6 = read.csv("data-raw/Final_Parameters_Pivoted_Indometh_Log_Infusion.csv")
Rres6 = tblNCA(Indometh, "Subject", "time", "conc", dose=25, adm="Infusion", 
               dur=0.25, down="Log", concUnit="mg/L")
Equal(Wres6, Rres6)
```

```
## Error in if (abs((R - W)/W) > Tol) {: TRUE/FALSE가 필요한 곳에 값이 없습니다
```

```r
Wres7 = read.csv("data-raw/Final_Parameters_Pivoted_Indometh_Linear_Wrong_Extravascular.csv")
Rres7 = tblNCA(Indometh, "Subject", "time", "conc", dose=25, concUnit="mg/L")
Equal(Wres7, Rres7)
```

```
## Error in if (abs((R - W)/W) > Tol) {: TRUE/FALSE가 필요한 곳에 값이 없습니다
```

```r
Wres8 = read.csv("data-raw/Final_Parameters_Pivoted_Indometh_Log_Wrong_Extravascular.csv")
Rres8 = tblNCA(Indometh, "Subject", "time", "conc", dose=25, down="Log", 
               concUnit="mg/L")
Equal(Wres8, Rres8)
```

```
## Error in if (abs((R - W)/W) > Tol) {: TRUE/FALSE가 필요한 곳에 값이 없습니다
```

```r
devtools::session_info()
```

```
## - Session info ---------------------------------------------------------------
##  setting  value                       
##  version  R version 3.6.1 (2019-07-05)
##  os       Windows 10 x64              
##  system   x86_64, mingw32             
##  ui       RTerm                       
##  language (EN)                        
##  collate  Korean_Korea.949            
##  ctype    Korean_Korea.949            
##  tz       Asia/Seoul                  
##  date     2020-01-03                  
## 
## - Packages -------------------------------------------------------------------
##  package     * version date       lib source        
##  assertthat    0.2.1   2019-03-21 [1] CRAN (R 3.6.1)
##  backports     1.1.5   2019-10-02 [1] CRAN (R 3.6.1)
##  bookdown      0.16    2019-11-22 [1] CRAN (R 3.6.1)
##  callr         3.4.0   2019-12-09 [1] CRAN (R 3.6.1)
##  cli           2.0.0   2019-12-09 [1] CRAN (R 3.6.1)
##  crayon        1.3.4   2017-09-16 [1] CRAN (R 3.6.1)
##  desc          1.2.0   2018-05-01 [1] CRAN (R 3.6.1)
##  devtools      2.2.1   2019-09-24 [1] CRAN (R 3.6.1)
##  digest        0.6.23  2019-11-23 [1] CRAN (R 3.6.1)
##  ellipsis      0.3.0   2019-09-20 [1] CRAN (R 3.6.1)
##  evaluate      0.14    2019-05-28 [1] CRAN (R 3.6.1)
##  fansi         0.4.0   2018-10-05 [1] CRAN (R 3.6.1)
##  fs            1.3.1   2019-05-06 [1] CRAN (R 3.6.1)
##  glue          1.3.1   2019-03-12 [1] CRAN (R 3.6.1)
##  highr         0.8     2019-03-20 [1] CRAN (R 3.6.1)
##  hms           0.5.2   2019-10-30 [1] CRAN (R 3.6.1)
##  htmltools     0.4.0   2019-10-04 [1] CRAN (R 3.6.1)
##  knitr         1.26    2019-11-12 [1] CRAN (R 3.6.1)
##  magrittr      1.5     2014-11-22 [1] CRAN (R 3.6.1)
##  memoise       1.1.0   2017-04-21 [1] CRAN (R 3.6.1)
##  NonCompart  * 0.4.5   2019-09-27 [1] CRAN (R 3.6.1)
##  pillar        1.4.3   2019-12-20 [1] CRAN (R 3.6.2)
##  pkgbuild      1.0.6   2019-10-09 [1] CRAN (R 3.6.1)
##  pkgconfig     2.0.3   2019-09-22 [1] CRAN (R 3.6.1)
##  pkgload       1.0.2   2018-10-29 [1] CRAN (R 3.6.1)
##  prettyunits   1.0.2   2015-07-13 [1] CRAN (R 3.6.1)
##  processx      3.4.1   2019-07-18 [1] CRAN (R 3.6.1)
##  ps            1.3.0   2018-12-21 [1] CRAN (R 3.6.1)
##  R6            2.4.1   2019-11-12 [1] CRAN (R 3.6.1)
##  Rcpp          1.0.3   2019-11-08 [1] CRAN (R 3.6.1)
##  readr         1.3.1   2018-12-21 [1] CRAN (R 3.6.1)
##  remotes       2.1.0   2019-06-24 [1] CRAN (R 3.6.1)
##  rlang         0.4.2   2019-11-23 [1] CRAN (R 3.6.1)
##  rmarkdown     2.0     2019-12-12 [1] CRAN (R 3.6.1)
##  rprojroot     1.3-2   2018-01-03 [1] CRAN (R 3.6.1)
##  sessioninfo   1.1.1   2018-11-05 [1] CRAN (R 3.6.1)
##  stringi       1.4.3   2019-03-12 [1] CRAN (R 3.6.0)
##  stringr       1.4.0   2019-02-10 [1] CRAN (R 3.6.1)
##  testthat      2.3.1   2019-12-01 [1] CRAN (R 3.6.1)
##  tibble        2.1.3   2019-06-06 [1] CRAN (R 3.6.1)
##  usethis       1.5.1   2019-07-04 [1] CRAN (R 3.6.1)
##  vctrs         0.2.1   2019-12-17 [1] CRAN (R 3.6.1)
##  withr         2.1.2   2018-03-15 [1] CRAN (R 3.6.1)
##  xfun          0.11    2019-11-12 [1] CRAN (R 3.6.1)
##  zeallot       0.1.0   2018-01-28 [1] CRAN (R 3.6.1)
## 
## [1] C:/Users/cmc/Rlib
## [2] C:/Program Files/R/R-3.6.1/library
```



\pagebreak

## Conclusion 

*There is no discrepancy* between results from NonCompart and WinNonlin. We also performed multiple analyses with the real clinical trial datasets and have found no differences (data not shown: confidential).  Noncompartmental analysis performed by the open-source R package, NonCompart can be **qualified and validated** enough to acquire the identical results of the commercial software, WinNonlin.

*Please report issues regarding validation of the R package to <https://github.com/asancpt/NonCompart-tests/issues>.*

------

**Affiliation**:  
Sungpil Han  
M.D/Ph.D, Resident  
Department of Clinical Pharmacology and Therapeutics,  
Asan Medical Center, University of Ulsan,  
Seoul 05505, Republic of Korea  
E-mail: shan@acp.kr  
URL: www.github.com/shanmdphd

\pagebreak

