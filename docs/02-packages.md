
# R과 그 패키지에 대하여 {#R-and-packages}

## 이 장에서는 {#summary-r-packages}

R [@R-base]은 통계 소프트웨어 입니다. 
특히 자료의 재현가능한 편집이라는 측면이 가장 중요합니다. 오류를 줄일 수 있고, 한번 설정한 것을 반복해서 적용하는 것이 쉽기 때문입니다.
이 책에서 주로 다루게 될 `NonCompart` [@R-NonCompart],  `ncar` [@R-ncar], `pkr` [@R-pkr] 은 비구획 분석을 R을 통해 쉽고 빠르게 (매우 빠르게) 행할 수 있는 R 패키지입니다.

`NonCompart`의 패키지 제목은 Noncompartmental Analysis for Pharmacokinetic Data, 
`ncar`의 패키지 제목은 Noncompartmental Analysis for Pharmacokinetic Report,
`pkr`의 패키지 제목은 Pharmacokinetics in R 입니다.

## R에 대하여 {#basic}

굉장히 유용한 소프트웨어이지만 이에 대해 여기서 자세히 설명하긴 힘듭니다. 
R에 대한 많은 책들을 bookdown.org^[https://bookdown.org]에서 무료로 읽을 수 있습니다. 
Coursera^[https://coursera.com]에서 무료 온라인 강의를 들을 수 있습니다.

## 설치 {#install}

우선 R을 설치합니다. 
R은 아래 링크^[https://cran.r-project.org/]에서 다운로드 받을 수 있습니다. 

R을 실행한 후, 콘솔 창에서 비구획분석을 위한 패키지를 설치하는 방법은 다음과 같습니다. 
홑따옴표 등의 인용 부호에 주의하세요.


```r
install.packages('NonCompart')
install.packages('ncar')
install.packages('pkr')
```

설치는 한번만 하면 되지만, 비구획분석을 위해서는 매 세션마다 패키지를 *불러오기*해야 합니다.


```r
library(NonCompart)
library(ncar)
library(pkr)
```

## 기타 설치

아래 두 패키지는 비구획분석과는 관계없지만 자료 처리 혹은 그림 등을 그리는데 도움을 줍니다. 


```r
library(ggplot2) 
library(dplyr) 
library(knitr) 
```

도움이 필요할때는 맨 앞에 물음표를 붙여서 콘솔창에 입력하거나 `help()` 함수를 사용합니다.


```r
?NonCompart
help(tblNCA)
```

자료 분석을 위해 몇가지 도구가 필요한데 `tidyverse`[@R-tidyverse]를 설치하면 다수의 편리한 패키지 `tidyr` [@R-tidyr], `dplyr` [@R-dplyr], `tibble` [@R-tibble], `ggplot2` [R-ggplot2], `purrr` [@R-purrr], `readr` [@R-readr]의 설치와 불러오기 과정을 쉽게 끝낼 수 있습니다. 

다만 비구획분석을 위한 함수의 입력을 위해 `tibble` 형식은 `as.data.frame()`을 통하여 데이타프레임으로 자료 형식을 변환하는 것이 좋습니다.
마찬가지로 `readr` 패키지의 `read_csv()` 명령어를 쓸 경우 `tibble`로 읽혀지기 때문에 `as.data.frame()`으로 바꿔주거나 처음부터 `read_csv()`를 쓰는 것을 고려할 수 있습니다.

```r
install.packages('devtools')
devtools::install_github('tidyverse/tidyverse')
library(tidyverse)
```

# 기본 자료 {#datasets}

## 이 장에서는 {#introdatasets}

R에는 theophylline과 Indomethacin의 약동학 데이터가 내장되어 있습니다.

- `Theoph`: theophylline의 약동학 데이터, 12명, 320mg PO 단회투여, 0~24시간 채혈, NONMEM 의 run 폴더의 THEOPP 데이터와 동일합니다.
- `Indometh`: Indomethacin의 약동학 데이터, 6명, 25mg IV bolus 단회투여, 0~8시간 채혈(0, 0.25, 0.5, 0.75, 1, 1.25, 2, 3, 4, 5, 6, 8 h)
(데이터명의 첫글짜가 대문자임에 주의하길)

먼저 데이터를 살펴보겠습니다. 



## 데이타에 대해 {#TheophData}

Theoph 자료의 첫 10개 (Table \@ref(tab:head)) 혹은 마지막 10개 관찰값만 보고 싶으면 다음을 입력합니다. 
대상자 번호가 첫 열에 나와있고 시간 순서대로 혈장에서 측정한 테오필린의 농도가 나와있습니다. 

```r
head(Theoph, n=10)
tail(Theoph, n=10)
```


Table: (\#tab:head)Theoph 자료의 첫 10개 관찰값

Subject      Wt   Dose    Time    conc
--------  -----  -----  ------  ------
1          79.6   4.02    0.00    0.74
1          79.6   4.02    0.25    2.84
1          79.6   4.02    0.57    6.57
1          79.6   4.02    1.12   10.50
1          79.6   4.02    2.02    9.66
1          79.6   4.02    3.82    8.58
1          79.6   4.02    5.10    8.36
1          79.6   4.02    7.03    7.47
1          79.6   4.02    9.05    6.89
1          79.6   4.02   12.12    5.94

그림을 그려서 대략적인 자료의 모습을 파악합니다. (Figure \@ref(fig:ggtheoph))


```r
ggplot(Theoph, aes(Time, conc, group = Subject, color = Subject)) +
  geom_point(size = 4) + 
  geom_line(size = 1) +
  theme_bw() +
  labs(title = 'Oral Administration of Theoph (320 mg)',
       x = 'Time (hour)', y = 'Concentration (ng/mL)')
```

<div class="figure">
<img src="02-packages_files/figure-html/ggtheoph-1.png" alt="Concentration-time curves of oral administration of Theoph (N = 12)" width="576" />
<p class="caption">(\#fig:ggtheoph)Concentration-time curves of oral administration of Theoph (N = 12)</p>
</div>


데이터가 Subject, weight, Dose, Time, Concentration 으로 구성되었음을 알 수 있습니다.



