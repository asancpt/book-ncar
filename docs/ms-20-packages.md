# 설치하기 {#installation}


```r
library(tidyverse)
```

```
## + ggplot2 2.2.1        Date: 2017-10-20
## + tibble  1.3.4           R: 3.4.2
## + tidyr   0.7.1          OS: macOS High Sierra 10.13
## + readr   1.1.1         GUI: unknown
## + purrr   0.2.3      Locale: en_US.UTF-8
## + dplyr   0.7.4          TZ: Asia/Seoul
## + stringr 1.2.0      
## + forcats 0.2.0
```

```
## ── Conflicts ────────────────────────────────────────────────────
```

```
## * filter(),  from dplyr, masks stats::filter()
## * lag(),     from dplyr, masks stats::lag()
```

```r
library(NonCompart)
```

## 이 장에서는 {#summary-r-packages}

`NonCompart` [@R-NonCompart],  `ncar` [@R-ncar], `pkr` [@R-pkr] 은 비구획 분석을 R을 통해 쉽고 빠르게 (매우 빠르게) 행할 수 있는 패키지입니다. 
이에 대해 알아보겠습니다.

## 패키지에 대하여

`NonCompart`의 패키지 제목은 Noncompartmental Analysis for Pharmacokinetic Data, 
`ncar`의 패키지 제목은 Noncompartmental Analysis for Pharmacokinetic Report,
`pkr`의 패키지 제목은 Pharmacokinetics in R 입니다.

`NonCompart`의 `DESCRIPTION` 파일을 보면 다음과 같이 설명하고 있습니다.

> Conduct a noncompartmental analysis as closely as possible to the most widely used commercial software for pharmacokinetic analysis, i.e. 'Phoenix(R) WinNonlin(R)' <https://www.certara.com/software/pkpd-modeling-and-simulation/phoenix-winnonlin/>.
             Some features are
             1) Use of CDISC SDTM terms
             2) Automatic slope selection with the same criterion of WinNonlin(R)
             3) Supporting both 'linear-up linear-down' and 'linear-up log-down' method
             4) Interval(partial) AUCs with 'linear' or 'log' interpolation method
             * Reference: Gabrielsson J, Weiner D. Pharmacokinetic and Pharmacodynamic Data Analysis - Concepts and Applications. 5th ed. 2016. (ISBN:9198299107).

`ncar`의 `DESCRIPTION` 파일을 보면 다음과 같이 설명하고 있습니다.

> Conduct a noncompartmental analysis as closely as possible to the most widely used commercial software for pharmacokinetic analysis, i.e. 'Phoenix(R) WinNonlin(R)' <https://www.certara.com/software/pkpd-modeling-and-simulation/phoenix-winnonlin/>.
             Some features are
             1) CDISC SDTM terms
             2) Automatic slope selection with the same criterion of WinNonlin(R)
             3) Supporting both 'linear-up linear-down' and 'linear-up log-down' method
             4) Interval(partial) AUCs with 'linear' or 'log' interpolation method
             5) Produce pdf, rtf, text report files.
             * Reference: Gabrielsson J, Weiner D. Pharmacokinetic and Pharmacodynamic Data Analysis - Concepts and Applications. 5th ed. 2016. (ISBN:9198299107).

`pkr`의 `DESCRIPTION` 파일을 보면 다음과 같이 설명하고 있습니다.

> Conduct a noncompartmental analysis as closely as possible to the most widely used commercial software for pharmacokinetic analysis, i.e. 'Phoenix(R) WinNonlin(R)' <https://www.certara.com/software/pkpd-modeling-and-simulation/phoenix-winnonlin/>.
             Some features are
             1) CDISC SDTM terms
             2) Automatic slope selection with the same criterion of WinNonlin(R)
             3) Supporting both 'linear-up linear-down' and 'linear-up log-down' method
             4) Interval(partial) AUCs with 'linear' or 'log' interpolation method
             * Reference: Gabrielsson J, Weiner D. Pharmacokinetic and Pharmacodynamic Data Analysis - Concepts and Applications. 5th ed. 2016. (ISBN:9198299107).

## 설치 

우선 R을 설치합니다. 
R은 아래 링크에서 다운로드 받을 수 있습니다.
<https://r-project.org/>

R을 실행한 후, 아래와 같이 패키지를 설치합니다. 

```r
install.packages('NonCompart')
install.packages('ncar')
install.packages('pkr')
```

이제 아래와 같이 입력하여 패키지를 불러올 수 있습니다.

```r
library(NonCompart)
library(ncar)
library(pkr)
```

## 기타 설치

자료 분석을 위해 몇가지 도구가 필요한데 `tidyverse`[@R-tidyverse]를 설치하면 다수의 편리한 패키지[@R-tidyr; @R-dplyr; @R-tibble; @R-ggplot2; @R-purrr; @R-readr]의 설치와 불러오기 과정을 쉽게 끝낼 수 있습니다. 
이 책에서는 이를 주로 사용하겠습니다.  
다음과 같이 설치하고 불러올 수 있습니다.
다만 비구획분석을 위한 함수의 입력을 위해 `tibble` 형식은 `as.data.frame()`을 통하여 데이타프레임으로 자료 형식을 변환하는 것이 좋습니다.

```r
install.packages('devtools')
devtools::install_github('tidyverse/tidyverse')
library(tidyverse)
```

