

---
title: "R을 사용한 비구획분석"
author: "배균섭, 한성필, 윤석규, 조용순"
description: "이 책은 R 패키지를 사용하여 비구획분석을 쉽게 따라할 수 있도록 쓰여졌습니다.  값비싼 상용소프트웨어와 동일한 결과를 얻으면서, 한번 익혀두면 속도와 연속성 측면에서 잇점이 많은 것을 발견할 수 있을 것입니다.  무엇보다 무료로 사용할 수 있는 R기반의 공개 소프트웨어라는 점에서 많은 연구자 혹은 기관에서 손쉽게 설치하고 실행할 수 있으리라 생각됩니다."
date: "2017-11-15"
url: 'https\://asancpt.github.io/book-ncar/'
github-repo: asancpt/book-ncar
cover-image: assets/cover.jpg
bibliography: ["bib/manual.bib", "bib/packages.bib"]
documentclass: krantz
biblio-style: apalike
link-citations: yes
colorlinks: yes
fontsize: 12pt
header-includes:
  - \usepackage{kotex}
output:
  bookdown::pdf_book: 
    keep_tex: yes
    pandoc_args: --top-level-division=chapter
    toc_depth: 3
    toc_unnumbered: no
    toc_appendix: yes
    #template: null
    #dev: "cairo_pdf"
    #latex_engine: xelatex
    #includes:
    #  in_header: latex/preamble.tex
    #  before_body: latex/before_body.tex
    #  after_body: latex/after_body.tex
  bookdown::gitbook:
    df_print: kable
    css: css/style.css
    split_by: chapter
    config:
      toolbar:
        position: static
      toc:
        #collapse: chapter
        before: |
          <li><a href="./index.html">R을 사용한 비구획분석</a></li>
        after: |
          <li><a href="http://github.com/asancpt/book-ncar">book-ncar Github 저장소</a></li>
      #download: [pdf]
      edit:
        link: https://github.com/asancpt/book-ncar/edit/master/%s
        text: "Edit"
  bookdown::pdf_document2: default
  bookdown::tufte_book2: default
  html_document: 
    df_print: kable
  bookdown::html_chapters:
    css: css/style.css
  bookdown::epub_book:
    stylesheet: css/style.css
editor_options: 
  chunk_output_type: console
---



# 책 머리에 {-}

[<img src="assets/cover.jpg" style="max-width:20%;min-width:80px;float:right;margin: 10px 10px 5px 5px" alt="Github repo" />](https://github.com/asancpt/book-ncar)

이 책은 R을 사용하여 비구획분석을 간단히 수행할 수 있도록 안내할 것입니다. 
널리 쓰이지만 값비싼 상용 소프트웨어와 동일한 결과를 얻을 수 있음을 반복적으로 확인하였습니다. 
숫자 계산 뿐만 아니라 시각화도 가능하여 농도-시간 곡선, 용량군 별 파라메터의 forest plot 등의 유용한 그림도 쉽게 그릴 수 있습니다.
CDISC SDTM 표준을 따르는 용어를 사용한 것도 큰 장점입니다.

한번 익혀두면 속도와 연속성 측면에서 커다란 잇점이 있음을 것을 발견할 수 있을 것입니다. 
또한 재현가능한 연구를 보다 수월하게 구현할 수 있습니다.
무엇보다 무료로 사용할 수 있는 R기반의 공개 소프트웨어라는 점에서 학교, 연구소, 정부기관, 제약회사 등에서 라이센스 등의 제약 없이 손쉽게 설치하고 실행할 수 있으리라 생각됩니다.
책에 대한 피드백, 오탈자 신고 등은 [깃허브 저장소](https://github.com/asancpt/book-ncar/issues)에 남겨주십시오.

감사합니다.

2017년 11월  
서울아산병원 임상약리학과, 울산대학교 임상약리학교실  
교수 배균섭,  
전공의 한성필, 윤석규, 조용순

![Creative Commons License](assets/cc.png)  
이 저작물은 [크리에이티브 커먼즈 저작자표시-비영리-동일조건변경허락 4.0 국제 라이선스](http://creativecommons.org/licenses/by-nc-sa/4.0/) 에 따라 이용할 수 있습니다.

<!-- https://creativecommons.org/choose/?lang=ko -->

## 감사의 글 {-}

본 출판물은 2016, 2017년도 정부(미래창조과학부)의 재원으로 한국연구재단 첨단 사이언스·교육 허브 개발 사업의 지원을 받아 수행된 연구입니다 (NRF-2016-936606).

## 저자 소개 {-}

**배균섭**

서울아산병원 임상약리학과 과장, 울산대학교 의과대학 임상약리학교실 교수입니다. 수십편의 논문을 저술하였고 20년 이상의 프로그래밍 경력을 갖고 있습니다.

**한성필**

서울아산병원 임상약리학과 전공의입니다.

**윤석규**

서울아산병원 임상약리학과 전공의입니다.

**조용순**

서울아산병원 임상약리학과 전공의입니다.

\mainmatter


<!--chapter:end:index.Rmd-->


# 비구획 분석이란 {#introduction}

## 이 장에서는 {#summary-introduction}

약동학과 비구획 분석에 대해 간략히 알아보겠습니다.

## 약동학 {#PK-introduction}

신체에 약물이 들어올 때, 약물의 양과 효과는 관련성이 있습니다. 
따라서 약물의 효과를 파악하기 위해 우리 몸에서 약물이 가지는 약동학적 특성을 파악하는 것은 중요합니다.
다양한 신약 개발 과정에서 이러한 약동학적 특성을 파악하여, 약물의 개발을 지속하거나 중지하기도 하며, 마취통증의학과나 내과 등의 다양한 임상 의학에서도 신체에 중요 영향을 미칠 수 있는 약물에 대하여 대략적인 농도를 파악하기 위해 약물의 약동학적 특성을 이용합니다.

약동학적 약물의 특성은 간단하게 ADME라는 용어로 설명할 수 있습니다. 
이는 absorption (흡수), distribution (분포), metabolism (대사), excretion (배설)을 의미합니다. 
약물이 다양한 경로 (경구제 복용, 피하 주사, 정맥 주사, 근육 주사 등)를 통해 우리 몸에 들어오게 되면, 정맥주사 이외의 나머지는 흡수 (absorption)의 과정을 거쳐 우리 몸의 정맥에 분포하게 되며, 이러한 약물은 분포 (distribution)와 제거 (metabolism) 과정에서 감소하게 되고, 제거 과정은 우리 몸에 투여된 물질이 여러 기관 (organ)을 통해서 다른 물질로 변하여 (metabolism) 제거되거나 물질이 변화하지 않고 그대로 배설 (excretion) 되는 과정으로 진행되게 됩니다. 
이러한 수치들은 각각 약물의 농도가 증가하고 감소하는 과정과 밀접하게 연관되어 있으며, 이러한 과정들을 정량화하여 식을 세울 수 있다면, 약물을 투여한 이후의 농도를 보다 정확하게 예측할 수 있습니다. 
이 때 흡수와 관련된 지표로는 흡수속도 상수 (absorption rate constant)와 생체이용률 (bioavailability), 분포, 제거와 관련된 지표로는 분포용적 (Volume of distribution)과 청소율 (Clearance)을 이용하게 되며, 다음 값들을 정확하게 예측하는 것이 약동학 분야에서의 핵심 중의 하나라고 볼 수 있습니다.

이러한 지표들을 구하기 위해서 현재 여러가지 방법들을 사용하고 있으며, 그 중 가장 간단하고도 객관적이며 널리 쓰이는 방법은 비구획분석 (Non-compartmental analysis, NCA)으로 *미국의 FDA (Food and Drug Administration)에서는 NCA 계산을 하는 소프트웨어를 규정하고 있지 않아*, 상용 소프트웨어를 사용하지 않고 약동학적 지표를 구하는 것을 허용하고 있습니다.
따라서 무료로 누구나 사용할 수 있는 R 패키지를 사용하여 주어진 시간과 농도로부터 비구획 분석 방법으로 약동학적 주요 지표를 직접 구해보고자 합니다.

- NonCompart [@R-NonCompart]
- pkr [@R-pkr]
- ncar [@R-ncar]

## 비구획 분석 이론 및 계산 방법 {#ncar-method}

비구획 분석이란 시간, 농도가 표현되어 있는 곡선에서 아무런 가정을 하지 않고 분석하는 것을 의미합니다. 
이때 다음과 같은 가정을 통해서 최대농도 (C~max~) 및 최대농도에 도달하는 시간 (T~max~), 전체 시간-농도 곡선의 면적 (Area under the time-concentration curve, AUC)등을 구하게 됩니다. 
이를 통해 측정된 지표들을 통하여 약물의 특성을 파악하고 특정구간에서의 농도를 예측하게 됩니다. 
비구획 분석에서는 statistical moment theory (단순히 하나의 분자가 우리 몸에 들어와서 제거되지 까지는 예측하는 것이 힘들지만 그 개개의 분자들의 양이 늘어날수록 그들의 전반적인 행동이 규칙적으로 이루어진다는 이론)를 가정하고 이를 통해 우리는 각각의 분자가 우리 몸에서 얼마나 머무는지에 대한 평균값을 예상할 수 있게 됩니다. 
이 시간을 MRT (mean residence time)이라고 지칭하게 되며, 이것은 농도와 시간의 곱을 적분한 값에서 단순 농도 값을 적분한 농도를 나누어 준 값으로 다음과 같이 표현해 줄 수 있습니다. (Equation \@ref(eq:mrt))

$$
\begin{equation}
  MRT = \frac{AUMC}{AUC} = \frac{\int_{0}^{\infty} t \cdot C(t) dt}{\int_{0}^{\infty} C(t) dt}
  (\#eq:mrt)
\end{equation}
$$

이때 식에서 표현된 AUMC는 area under the first moment curve로 농도와 시간의 곱을 시간에 대해서 적분한 값에 해당하며 AUC는 area under concentration으로 농도를 시간에 대해 적분한 값에 해당합니다. 
하지만 이 때, 각각의 약물에서 농도와 시간 사이의 명확한 함수관계를 확인할 수 없고, 주어진 정보도 제한적이므로 농도를 시간으로 적분하기에는 상당한 어려움이 따릅니다.
따라서 이를 간소화 하기 위해 Linear trapezoidal method(농도-시간 곡선에서 농도를 측정한 점과 점 사이의 면적을 사다리꼴이라 가정하고 넓이를 구하는 방식)를 사용하게 됩니다.
처음 농도를 측정한 부분부터 마지막 샘플까지를 t~1~,t~2~ …t~last~로 표현했을 시 t~1~과 t~2~의 사이의 AUC와 AUMC는 다음과 같이 계산됩니다. ^[이 수식은 `NonCompart::AUC()` 함수에서 계산 되게 됩니다.]

$$
AUC_{t_1-t_2} = 
  (t_2-t_1)\cdot \frac{C_2+C_1}{2} \\
AUMC_{t_1-t_2} = 
  (t_2-t_1)\cdot \frac{t_2 \cdot C_2 + t_1 \cdot C_1}{2}
$$



이 방식을 계속 이용하여 각각의 구간 값의 합을 모두 더한 값으로 AUC~last~(처음 농도를 측정하기 시작한 구간부터 마지막 농도를 측정한 구간까지 linear trapezoidal method를 통해서 값을 계산한 방식), AUMC~last~(처음 농도를 측정하기 시작한 구간부터 마지막 농도를 측정한 구간까지 linear trapezoidal method를 통해서 값을 계산한 방식)를 측정해 주게 됩니다.

![Linear trapezoidal method](assets/figures/trapezoidal.png)

추가적으로 마지막으로 농도를 잰 시점에서 모든 약물이 우리 몸에서 빠져나가는 시점까지의 값을 구하기 위해서 마지막으로 측정한 점의 기울기가 그대로 약물이 모두 제거되는 시점까지 그대로 유지된다는 가정을 세우게 됩니다.
다음과 같이 C~last~(가장 마지막으로 농도를 측정한 시점)에서 λ (C~max~ 이후에 선형성이 가장 높은 3점을 선택하여 구한 기울기)를 구한 후 다음과 같은 약동학 공식을 대입하여 값을 구해주게 됩니다.

$$
AUC_{t_{last}-\infty} = 
  \frac{C_{last}}{\lambda} \\
AUMC_{t_{last}-\infty} = 
  \frac{t_{last} \cdot C_{last}}{\lambda} + 
  \frac{C_{last}}{\lambda^2}
$$

약물이 우리 몸에 들어온 후 가장 높은 농도의 경우 실제 개개인에서 농도를 측정한 값들 중 가장 높은 농도를 실제 가장 높은 농도라 가정하여 사용하게 되고, 이 지표를 C~max~라 부릅니다. 또한 이때의 시점을 T~max~라 부르게 됩니다.
위에서 구한 AUC와 C~max~, λ 를 가지고 나머지 주요 값을 계산하게 됩니다.
이 중 청소율(제거되는 속도)에 해당하는 clearance(일반적으로 CL이라 지칭한다.) 의 경우 다음의 약동학 기본 공식을 활용하여 구해주게 됩니다.

$$
CL = \frac{D \cdot F}{AUC}
$$

수식에서 D는 dose로 투여량을, F는 생체이용률을 의미합니다.

우리 몸의 분포 (disposition)을 알기 위해 우리 몸의 volume을 나타내는 volume of distribution at steady state (Vdss)는 아래 식을 이용하여 값을 구하게 됩니다. 

$$
Vd_{ss} = MRT \cdot CL = \frac{AUMC}{AUC} \cdot \frac{D}{AUC}
$$

우리 몸의 생체이용률을 나타내는 F의 경우 기본적으로 정맥주사시의 생체이용률을 1이라고 가정하고, 다음 식으로 구합니다.

$$
F = \frac{D_{iv}}{D_{oral}} \cdot \frac{AUC_{oral}}{AUC_{iv}}
$$

(이중 Div는 정맥주사 투여량, Doral은 경구 투여량, AUCoral은 경구 투여에서의 AUC, AUCiv는 정맥투여에서의 AUC를 의미한다.
이처럼 AUC, C~max~, AUMC, λ 를 구하는 부분에 있어서는 non-compartmental analysis의 기본 가정들을 활용하였고 그 밖의 부분들에서는 현재 정형화된 공식들을 활용하여 적용하였다. 
위 내용을 바탕으로 R을 기반으로 한 script를 구성한 후 전세계적으로 널리 쓰이고 있는 CDISC terminology를 각각의 지표들에 적용하여 결과값을 도출하였다. 

또한 투여되는 방식을 3가지 분류(Extravascular, IV infusion, IV bolus)로 구분하여, 그에 맞는 각각의 식을 적용하였다. 
마지막으로 시간당 농도의 변화율이 농도 증가 곡선보다 감소 곡선에서 완만하다는 점을 고려하여 농도가 감소하는 구간에서는 log값을 선택적으로 줄 수 있도록 설정하였으며, 흡수 속도 상수의 경우 현 NCA method를 통해 구하기에는 한계가 있어 따로 값을 제시하지 않았습니다. 

흡수속도 상수를 구하기 위해서는 구획분석방법(compartmental analysis)이나 비선형 혼합모형(non-linear mixed effect modeling)을 사용하는 것이 바람직합니다.
 
Figure 2. Linear trapezoidal method를 적용한 AUC의 계산 Script

 
Figure 3 약동학 지표들에 대해 각각의 공식을 적용한 Script의 예



<!--chapter:end:01-introduction.Rmd-->


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
# install.packages(c('tidyverse', 'knitr')) # 설치 안되어 있으면 맨앞의 #을 지우고 설치.
library(tidyverse) # For presentation only, dplyr, tidyr, ggplot2
library(knitr) # For reports
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

\begin{table}

\caption{(\#tab:head)Theoph 자료의 첫 10개 관찰값}
\centering
\begin{tabular}[t]{lrrrr}
\toprule
Subject & Wt & Dose & Time & conc\\
\midrule
1 & 79.6 & 4.02 & 0.00 & 0.74\\
1 & 79.6 & 4.02 & 0.25 & 2.84\\
1 & 79.6 & 4.02 & 0.57 & 6.57\\
1 & 79.6 & 4.02 & 1.12 & 10.50\\
1 & 79.6 & 4.02 & 2.02 & 9.66\\
\addlinespace
1 & 79.6 & 4.02 & 3.82 & 8.58\\
1 & 79.6 & 4.02 & 5.10 & 8.36\\
1 & 79.6 & 4.02 & 7.03 & 7.47\\
1 & 79.6 & 4.02 & 9.05 & 6.89\\
1 & 79.6 & 4.02 & 12.12 & 5.94\\
\bottomrule
\end{tabular}
\end{table}

그림을 그려서 대략적인 자료의 모습을 파악합니다. (Figure \@ref(fig:ggtheoph))


```r
ggplot(Theoph, aes(Time, conc, group = Subject, color = Subject)) +
  geom_point(size = 4) + 
  geom_line(size = 1) +
  theme_bw() +
  labs(title = 'Oral Administration of Theoph (320 mg)',
       x = 'Time (hour)', y = 'Concentration (ng/mL)')
```

![(\#fig:ggtheoph)Concentration-time curves of oral administration of Theoph (N = 12)](02-packages_files/figure-latex/ggtheoph-1.pdf) 


데이터가 Subject, weight, Dose, Time, Concentration 으로 구성되었음을 알 수 있습니다.




<!--chapter:end:02-packages.Rmd-->


---
output: html_document
editor_options: 
  chunk_output_type: console
---

# R을 사용한 비구획분석 {#noncompart}

## 이 장에서는 {#summary-noncompart}

`NonCompart` [@R-NonCompart]은 비구획 분석을 R을 통해 쉽고 빠르게 (매우 빠르게) 행할 수 있는 패키지입니다. 
약동학 교재의 내용을 충실히 반영하였습니다. [@gab; @tozer]
이에 대해 좀더 자세히 알아보겠습니다.

`NonCompart`의 `DESCRIPTION` 파일을 보면 다음과 같이 설명하고 있습니다.

> Conduct a noncompartmental analysis as closely as possible to the most widely used commercial software for pharmacokinetic analysis, i.e. 'Phoenix(R) WinNonlin(R)' <https://www.certara.com/software/pkpd-modeling-and-simulation/phoenix-winnonlin/>.
             Some features are
             1) Use of CDISC SDTM terms
             2) Automatic slope selection with the same criterion of WinNonlin(R)
             3) Supporting both 'linear-up linear-down' and 'linear-up log-down' method
             4) Interval(partial) AUCs with 'linear' or 'log' interpolation method
             * Reference: Gabrielsson J, Weiner D. Pharmacokinetic and Pharmacodynamic Data Analysis - Concepts and Applications. 5th ed. 2016. (ISBN:9198299107).


```r
library(tidyverse)
library(NonCompart)
library(ncar)
```

## NonCompart 사용법 {#how-to-use}

tblNCA의 사용법은 다음과 같습니다.

```r
tblNCA(concData, key = "Subject", colTime = "Time", colConc = "conc", 
       dose = 0, adm = "Extravascular", dur = 0, doseUnit = "mg", 
       timeUnit = "h", concUnit = "ug/L", down = "Linear", MW = 0)
# args(NonCompart::tblNCA)
```

concData는 데이터셋을 설정하며, `key`는 subject ID의 컬럼명 혹은 treatment code의 컬럼명(교차시험에서 사용), `colTime`은 time의 컬럼명, `colConc`는 concentration의 컬럼명 등을 함수 인자로 갖습니다. 그 외 인자들에 대해서 살펴보자면 다음과 같습니다. 

1. `down`
    - AUC와 AUMC를 구하는 trapezoidal method 설정, 기본값은 `Linear`
    - `Linear`와 `Log` 중 선택 가능하며 각각 linear trapezoidal method와 linear-up and log-down method를 의미합니다.
2. `dose`
    - 투여량에 대한 설정입니다. 단위에 주의해야 합니다.  벡터값을 줌으로서 각 대상자별 용량을 다르게 할 수 있습니다.
3. `adm`
    - 투여경로에 대한 설정, 기본값은 "Extravascular"으로 경구 투여 등을 의미합니다.
    - Bolus, Infusion, Extravascular 중에서 선택 가능하다.
4. `dur`
    - 주입하는 기간(infusion duration)을 설정합니다. 기본값은 0입니다.

이제 약동학 파라미터를 산출하기 위해서는 아래와 같이 하면 됩니다.
우선 Theophylline 의 약동학 파라미터를 구해보겠습니다.


```r
TheophNca <- NonCompart::tblNCA(Theoph, "Subject", "Time", "conc", dose=320, concUnit="mg/L")
head(TheophNca)
```

```
##      Subject b0                 CMAX   CMAXD        TMAX   TLAG CLST  
## [1,] "1"     "2.36878509420585" "10.5" "0.0328125"  "1.12" "0"  "3.28"
## [2,] "2"     "2.41123733696293" "8.33" "0.02603125" "1.92" "0"  "0.9" 
## [3,] "3"     "2.52971150145858" "8.2"  "0.025625"   "1.02" "0"  "1.05"
## [4,] "4"     "2.59275546723663" "8.6"  "0.026875"   "1.07" "0"  "1.15"
## [5,] "5"     "2.55109229061238" "11.4" "0.035625"   "1"    "0"  "1.57"
## [6,] "6"     "2.0334043955261"  "6.44" "0.020125"   "1.15" "0"  "0.92"
##      CLSTP               TLST    LAMZHL             LAMZ                
## [1,] "3.28014647414312"  "24.37" "14.304377571097"  "0.0484569969657749"
## [2,] "0.888639849106919" "24.3"  "6.65934156262252" "0.104086443688432" 
## [3,] "1.05509670837553"  "24.17" "6.76608737718236" "0.102444314109434" 
## [4,] "1.15642160174997"  "24.65" "6.98124666099893" "0.0992870205306231"
## [5,] "1.55569511595616"  "24.35" "8.0022640410078"  "0.0866188839818201"
## [6,] "0.941271173708175" "23.85" "7.89499786796582" "0.0877957400561702"
##      LAMZLL LAMZUL  LAMZNPT CORRXY               R2                 
## [1,] "9.05" "24.37" "3"     "-0.99999986483748"  "0.999999729674979"
## [2,] "7.03" "24.3"  "4"     "-0.998596709529913" "0.99719538828397" 
## [3,] "9"    "24.17" "3"     "-0.999662423945811" "0.999324961849213"
## [4,] "9.02" "24.65" "3"     "-0.999461923749821" "0.998924137025692"
## [5,] "7.02" "24.35" "4"     "-0.999323363372814" "0.998647184582752"
## [6,] "2.03" "23.85" "7"     "-0.999120281624298" "0.998241337153017"
##      R2ADJ               AUCLST      AUCALL      AUCIFO            
## [1,] "0.999999459349959" "148.92305" "148.92305" "216.611933038226"
## [2,] "0.995793082425955" "91.5268"   "91.5268"   "100.173459143183"
## [3,] "0.998649923698427" "99.2865"   "99.2865"   "109.535970740547"
## [4,] "0.997848274051385" "106.7963"  "106.7963"  "118.378881427603"
## [5,] "0.997970776874129" "121.2944"  "121.2944"  "139.419777837118"
## [6,] "0.99788960458362"  "73.77555"  "73.77555"  "84.2544183301878"
##      AUCIFOD             AUCIFP             AUCIFPD            
## [1,] "0.676912290744456" "216.614955803818" "0.67692173688693" 
## [2,] "0.313042059822447" "100.064317640308" "0.312700992625963"
## [3,] "0.342299908564208" "109.585721753278" "0.342455380478994"
## [4,] "0.369934004461258" "118.44355857992"  "0.370136120562249"
## [5,] "0.435686805740995" "139.254630430615" "0.435170720095671"
## [6,] "0.263295057281837" "84.4966985785753" "0.264052183058048"
##      AUCPEO             AUCPEP             AUMCLST       
## [1,] "31.2489169404534" "31.2498763313113" "1459.0711035"
## [2,] "8.63168669340252" "8.53203003991598" "706.586566"  
## [3,] "9.3571734209797"  "9.39832451573008" "803.18587"   
## [4,] "9.7843308603032"  "9.83359392402986" "901.0842105" 
## [5,] "13.0005786254328" "12.8974026752838" "1017.1143165"
## [6,] "12.4371736674055" "12.688245527848"  "609.1523875" 
##      AUMCIFO            AUMCIFP            AUMCPEO           
## [1,] "4505.53481941065" "4505.67086458209" "67.6160286851172"
## [2,] "999.772287999786" "996.071583509104" "29.3252499112927"
## [3,] "1150.96476871455" "1152.65289026304" "30.2162940315685"
## [4,] "1303.25240140958" "1305.4981091996"  "30.8588106551423"
## [5,] "1667.72161189007" "1661.79367436228" "39.011744571249" 
## [6,] "978.428485741731" "986.966459689532" "37.7417566662308"
##      AUMCPEP            VZFO               VZFP              
## [1,] "67.6170064935417" "30.4867482345887" "30.4863228055447"
## [2,] "29.0626720309864" "30.6904415765423" "30.7239160557228"
## [3,] "30.318495985664"  "28.5170999496524" "28.5041534217657"
## [4,] "30.9777467963968" "27.2259641330176" "27.2110971545992"
## [5,] "38.7941877387202" "26.4979946505636" "26.5294196385914"
## [6,] "38.280335514986"  "43.2597344953234" "43.135694392041" 
##      CLFO               CLFP               MRTEVLST          
## [1,] "1.47729626669981" "1.47727565168591" "9.79748335465867"
## [2,] "3.19445891892989" "3.19794315842211" "7.71999639449866"
## [3,] "2.92141474473231" "2.92008844656286" "8.08957783787323"
## [4,] "2.70318485984093" "2.70170876184947" "8.43741038313125"
## [5,] "2.29522672438806" "2.29794872178016" "8.38550103302378"
## [6,] "3.79802040465035" "3.78713021198604" "8.25683288704727"
##      MRTEVIFO           MRTEVIFP          
## [1,] "20.8000305256292" "20.8003683211179"
## [2,] "9.98041094468705" "9.95431345556755"
## [3,] "10.5076420187191" "10.5182762117325"
## [4,] "11.0091630001303" "11.0221115006327"
## [5,] "11.9618725389051" "11.9334895308224"
## [6,] "11.612785479182"  "11.6805328053348"
```

여기서 `dose=320`으로 되었다는 것은 아미노필린 400mg 투여시 테오필린 320mg이 체내로 들어감을 의미합니다.




이는 문자(character)로 구성된 matrix로 구성된 결과물과 단위 정보가 담긴 attribute를 포함하고 있습니다.

다음으로 Indomethacin 의 약동학 파라미터를 구해보자. 이는 IV bolus 이므로 AdmMode 옵션이 추가됩니다.


```r
NonCompart::tblNCA(Indometh, "Subject", "time", "conc", dose=25, adm="Bolus", dur=0.5, concUnit="mg/L")
```

```
##      Subject b0                    CMAX   CMAXD    TMAX   TLAG CLST  
## [1,] "1"     "-1.72421059639646"   "1.5"  "0.06"   "0.25" NA   "0.05"
## [2,] "2"     "-0.175286858431038"  "2.03" "0.0812" "0.25" NA   "0.08"
## [3,] "3"     "0.155579544657487"   "2.72" "0.1088" "0.25" NA   "0.08"
## [4,] "4"     "0.200296947923903"   "1.85" "0.074"  "0.25" NA   "0.07"
## [5,] "5"     "-0.982357129866236"  "2.05" "0.082"  "0.25" NA   "0.06"
## [6,] "6"     "-0.0499189799474626" "2.31" "0.0924" "0.25" NA   "0.09"
##      CLSTP                TLST LAMZHL             LAMZ               
## [1,] "0.0502485064135143" "8"  "4.37812701206528" "0.158320482400297"
## [2,] "0.0747559092002026" "8"  "2.293063170278"   "0.302280019819912"
## [3,] "0.0399725765960521" "8"  "1.64294680807057" "0.421892648718165"
## [4,] "0.0319601103599335" "8"  "1.52191040768299" "0.455445456618709"
## [5,] "0.0495714902818329" "8"  "2.74244612209262" "0.252747784168332"
## [6,] "0.0562424678832525" "8"  "1.9606985693831"  "0.353520521401732"
##      LAMZLL LAMZUL LAMZNPT CORRXY               R2                 
## [1,] "5"    "8"    "3"     "-0.998532286621828" "0.997066727426216"
## [2,] "0.75" "8"    "9"     "-0.973482979595454" "0.947669111562043"
## [3,] "0.5"  "8"    "10"    "-0.935855785859431" "0.875826051926574"
## [4,] "0.25" "8"    "11"    "-0.93425095790181"  "0.872824852340449"
## [5,] "1"    "8"    "8"     "-0.935544879811905" "0.875244222142273"
## [6,] "0.75" "8"    "9"     "-0.950764854539454" "0.903953808627429"
##      R2ADJ               AUCLST             AUCALL            
## [1,] "0.994133454852432" "2.04045212765957" "2.04045212765957"
## [2,] "0.94019327035662"  "3.24851993865031" "3.24851993865031"
## [3,] "0.860304308417395" "3.5544211409396"  "3.5544211409396" 
## [4,] "0.858694280378276" "2.78527877697842" "2.78527877697842"
## [5,] "0.854451592499318" "2.45885817307692" "2.45885817307692"
## [6,] "0.890232924145633" "3.335703125"      "3.335703125"     
##      AUCIFO             AUCIFOD              AUCIFP            
## [1,] "2.356267234094"   "0.0942506893637602" "2.35783687568268"
## [2,] "3.51317520778672" "0.140527008311469"  "3.49582675451177"
## [3,] "3.74404283793542" "0.149761713517417"  "3.64916698853258"
## [4,] "2.93897445882733" "0.117558978353093"  "2.85545207631751"
## [5,] "2.69624897829181" "0.107849959131673"  "2.6549884396387" 
## [6,] "3.59028523424544" "0.143611409369818"  "3.4947956372543" 
##      AUCIFPD              AUCPEO             AUCPEP             AUMCLST   
## [1,] "0.0943134750273071" "13.4031956080679" "13.4608441871624" "3.27125" 
## [2,] "0.139833070180471"  "7.53322147298048" "7.07434416028442" "6.39875" 
## [3,] "0.145966679541303"  "5.064624129685"   "2.59636919578418" "5.00625" 
## [4,] "0.1142180830527"    "5.22956847710184" "2.45751977142578" "4.381875"
## [5,] "0.106199537585548"  "8.80448382646355" "7.3872361790195"  "3.7075"  
## [6,] "0.139791825490172"  "7.09086026973962" "4.55226939619547" "5.5325"  
##      AUMCIFO            AUMCIFP            AUMCPEO           
## [1,] "7.79255448051925" "7.81502594373644" "58.0208260567461"
## [2,] "9.39152229661219" "9.19534267578028" "31.8667432402495"
## [3,] "6.97267842561125" "5.9887901357925"  "28.2019090166038"
## [4,] "5.94890277791985" "5.09733758170571" "26.3414588608858"
## [5,] "6.54586634839538" "6.05253416426272" "43.3612022813628"
## [6,] "8.28929076671746" "7.25526351286615" "33.2572573975366"
##      AUMCPEP            C0                 AUCPBEO           
## [1,] "58.1415337127341" "2.3936170212766"  "20.6556421367339"
## [2,] "30.4131425481974" "2.52815950920245" "16.2180906146511"
## [3,] "16.4063210350329" "4.96536912751678" "25.6586578338762"
## [4,] "14.0360054682958" "2.46223021582734" "18.3407098132283"
## [5,] "38.7446662938147" "4.04086538461538" "28.2376805408852"
## [6,] "23.7450164258139" "3.705625"         "20.9441054384092"
##      AUCPBEP            VZO                VZP               
## [1,] "20.6418914166255" "67.0159780403394" "66.9713646630007"
## [2,] "16.2985748053719" "23.541317103064"  "23.6581436704179"
## [3,] "26.3257654132706" "15.8269504052657" "16.2384403063513"
## [4,] "18.8771782040751" "18.6770302753637" "19.2233360879334"
## [5,] "28.6765155625511" "36.6853492769315" "37.2554674926062"
## [6,] "21.5163689969229" "19.6968340826101" "20.2350179834082"
##      CLO                CLP                MRTIVLST          
## [1,] "10.6100019718742" "10.6029387604525" "1.35319860272937"
## [2,] "7.11606980050102" "7.15138413759623" "1.7197431817699" 
## [3,] "6.67727402760856" "6.85087859189834" "1.15845718655517"
## [4,] "8.5063685820445"  "8.75518108230375" "1.32322672194186"
## [5,] "9.27214074118575" "9.41623685691155" "1.2578136838452" 
## [6,] "6.96323505484772" "7.15349410806788" "1.40857085977938"
##      MRTIVIFO           MRTIVIFP           VSSO              
## [1,] "3.05716073616986" "3.06448965971139" "32.4364814390986"
## [2,] "2.42322912782616" "2.38037711005347" "17.2438676162182"
## [3,] "1.61233938216802" "1.39113896530691" "10.766031880241" 
## [4,] "1.77414238750939" "1.53512454261863" "15.0915090651833"
## [5,] "2.17776776221254" "2.02968381100988" "20.1925691928519"
## [6,] "2.0588112018653"  "1.82601939167072" "14.3359863321416"
##      VSSP              
## [1,] "32.4925961939597"
## [2,] "17.0229911063336"
## [3,] "9.53052415577672"
## [4,] "13.4402933545148"
## [5,] "19.1119835091079"
## [6,] "13.0624189595342"
## attr(,"units")
##  [1] ""          ""          "mg/L"      "mg/L/mg"   "h"        
##  [6] "h"         "mg/L"      "mg/L"      "h"         "h"        
## [11] "/h"        "h"         "h"         ""          ""         
## [16] ""          ""          "h*mg/L"    "h*mg/L"    "h*mg/L"   
## [21] "h*mg/L/mg" "h*mg/L"    "h*mg/L/mg" "%"         "%"        
## [26] "h2*mg/L"   "h2*mg/L"   "h2*mg/L"   "%"         "%"        
## [31] "mg/L"      "%"         "%"         "L"         "L"        
## [36] "L/h"       "L/h"       "h"         "h"         "h"        
## [41] "L"         "L"
```



## 구간 NCA {#interval-NCA}

1. iAUC
    - 일부구간에 대한 AUC를 구하기 위한 구간설정 옵션입니다.
    - "Name", "Start", "End" 3개의 컬럼으로 구성된 데이터 프레임으로 설정해야 합니다.

일부 구간의 AUC를 구하는 방법은 조금 더 복잡하므로 자세히 알아봅시다.
예를 들어 0~12시간까지의 AUC, 0~24시간까지의 AUC를 구하고자 한다면 다음과 같이 하면 됩니다.
먼저 구하고자 하는 구간에 대한 정보를 갖는 변수를 아래와같이 생성합니다.


```r
iAUC <- data.frame(Name=c("AUC[0-12h]","AUC[0-24h]"), Start=c(0,0), End=c(12,24)) ; iAUC
```

```
##         Name Start End
## 1 AUC[0-12h]     0  12
## 2 AUC[0-24h]     0  24
```
        Name Start End
1 AUC[0-12h]     0  12
2 AUC[0-24h]     0  24

이제 iAUC 옵션을 이용해서 이를 구합니다.


```r
# tblNCA(Theoph, "Subject", "Time", "conc", dose=320, iAUC=iAUC)
```

맨 마지막 파라미터로 AUC[0-12h], AUC[0-24h]가 추가되었음을 알 수 있습니다.

개인별 일부 구간의 AUC를 구하는 방법은 아래와 같다.
예를 들어 0~12시간까지의 AUC, 0~24시간까지의 AUC를 구하고자 한다면 다음과 같이 하면 된다.

> iAUC = data.frame(Name=c("AUC[0-12h]","AUC[0-24h]"), Start=c(0,0), End=c(12,24)) ; iAUC

        Name Start End
1 AUC[0-12h]     0  12
2 AUC[0-24h]     0  24



```r
#IntAUC
#IntAUC(Theoph[Theoph$Subject==1,"Time"], Theoph[Theoph$Subject==1, "conc"], Dose=320, iAUC=iAUC)
```

```
        CMAX        CMAXD         TMAX         TLAG         CLST        CLSTP         TLST       LAMZHL         LAMZ 
  10.5000000    0.0328125    1.1200000    0.0000000    3.2800000    3.2801465   24.3700000   14.3043776    0.0484570 
      LAMZLL       LAMZUL      LAMZNPT       CORRXY           R2        R2ADJ       AUCLST       AUCALL       AUCIFO 
   9.0500000   24.3700000    3.0000000   -0.9999999    0.9999997    0.9999995  148.9230500  148.9230500  216.6119330 
     AUCIFOD       AUCPEO       AUCIFP      AUCIFPD       AUCPEP      AUMCLST      AUMCIFO      AUMCPEO      AUMCIFP 
   0.6769123   31.2489169  216.6149558    0.6769217   31.2498763 1459.0711035 4505.5348194   67.6160287 4505.6708646 
     AUMCPEP     MRTEVLST     MRTEVIFO     MRTEVIFP         VZFO         VZFP         CLFO         CLFP   AUC[0-12h] 
  67.6170065    9.7974834   20.8000305   20.8003683   30.4867482   30.4863228    1.4772963    1.4772757   91.7355220 
  AUC[0-24h] 
 147.6945866 
```

김민걸 선생님 자료를 옮겨와서 변형합니다. <http://blog.naver.com/kimmingul>


## 함수 살펴보기 {#functions}

NonCompart 패키지 내의 여러가지 함수를 살펴보겠습니다. AUC(), BestSlope(), IntAUC(), Interpol(), LinAUC(), LogAUC(), Slope(), sNCA(), tblNCA(), Unit(), UnitUrine(), UT()라는 함수가 있습니다.

### AUC

AUC와 AUMC를  'Linear trapezoidal method' 혹은 'linear-up and log-down method'의 두가지 방식으로 계산하게 됩니다.


```r
AUC(Theoph[Theoph$Subject==1, "Time"], Theoph[Theoph$Subject==1, "conc"])
```

```
##             AUC        AUMC
##  [1,]   0.00000    0.000000
##  [2,]   0.44750    0.088750
##  [3,]   1.95310    0.801534
##  [4,]   6.64735    5.065382
##  [5,]  15.71935   19.138321
##  [6,]  32.13535   66.198241
##  [7,]  42.97695  114.461665
##  [8,]  58.25290  206.281512
##  [9,]  72.75650  322.298798
## [10,]  92.45055  528.521903
## [11,] 148.92305 1459.071104
```

```r
AUC(Theoph[Theoph$Subject==1, "Time"], Theoph[Theoph$Subject==1, "conc"], down="Log")
```

```
##             AUC        AUMC
##  [1,]   0.00000    0.000000
##  [2,]   0.44750    0.088750
##  [3,]   1.95310    0.801534
##  [4,]   6.64735    5.065382
##  [5,]  15.71410   19.243482
##  [6,]  32.11090   66.830600
##  [7,]  42.95189  115.151380
##  [8,]  58.21173  207.426110
##  [9,]  72.70744  323.774418
## [10,]  92.36544  531.108538
## [11,] 147.23475 1499.129085
```

## 긴 형식으로 변환하면서 단위 추가하기 {#long-format}

NonCompart 패키지의 tblNCA()함수를 사용해서 비구획분석 결과를 내면 문자형식의 행렬이 생성되고 그 attr로 dimnames와 units를 갖는데 이를 long format의 tidy data로 변환하는 방법은 다음과 같습니다.


```r
ncares <- NonCompart::tblNCA(Theoph, key="Subject", dose=320, concUnit="mg/L")
str(ncares)
```

```
##  chr [1:12, 1:37] "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" ...
##  - attr(*, "dimnames")=List of 2
##   ..$ : NULL
##   ..$ : chr [1:37] "Subject" "b0" "CMAX" "CMAXD" ...
##  - attr(*, "units")= chr [1:37] "" "" "mg/L" "mg/L/mg" ...
```

```r
left_join(as_tibble(ncares) %>% tidyr::gather(PPTESTCD, PPORRES, -Subject),
          tibble(PPTESTCD = attr(ncares, 'dimnames')[[2]], UNIT = attr(ncares, 'units')),
          by = 'PPTESTCD') %>% 
  arrange(Subject, PPTESTCD) %>% 
  head(20)
```

```
## # A tibble: 20 x 4
##    Subject PPTESTCD           PPORRES      UNIT
##      <chr>    <chr>             <chr>     <chr>
##  1       1   AUCALL         148.92305    h*mg/L
##  2       1   AUCIFO  216.611933038226    h*mg/L
##  3       1  AUCIFOD 0.676912290744456 h*mg/L/mg
##  4       1   AUCIFP  216.614955803818    h*mg/L
##  5       1  AUCIFPD  0.67692173688693 h*mg/L/mg
##  6       1   AUCLST         148.92305    h*mg/L
##  7       1   AUCPEO  31.2489169404534         %
##  8       1   AUCPEP  31.2498763313113         %
##  9       1  AUMCIFO  4505.53481941065   h2*mg/L
## 10       1  AUMCIFP  4505.67086458209   h2*mg/L
## 11       1  AUMCLST      1459.0711035   h2*mg/L
## 12       1  AUMCPEO  67.6160286851172         %
## 13       1  AUMCPEP  67.6170064935417         %
## 14       1       b0  2.36878509420585          
## 15       1     CLFO  1.47729626669981       L/h
## 16       1     CLFP  1.47727565168591       L/h
## 17       1     CLST              3.28      mg/L
## 18       1    CLSTP  3.28014647414312      mg/L
## 19       1     CMAX              10.5      mg/L
## 20       1    CMAXD         0.0328125   mg/L/mg
```


<!--chapter:end:03-noncompartmental.Rmd-->


---
output: html_document
editor_options: 
  chunk_output_type: console
---

# R을 사용한 비구획분석 보고서 {#ncar}

## 이 장에서는 {#summary-ncar}

보고서를 일정한 형식으로 작성하여 다른 사람/기관과 공유하는 것은 중요합니다. 이를 `ncar` 패키지를 사용하여 좀더 쉽게 할 수 있습니다.
이 패키지를 통해서 약동학 파라이터를 보고서 형식의 text, pdf, rtf 파일로 저장할 수 있습니다.
이에 대해 좀더 자세히 알아보겠습니다.

`ncar`의 `DESCRIPTION` 파일을 보면 다음과 같이 설명하고 있습니다.

> Conduct a noncompartmental analysis as closely as possible to the most widely used commercial software for pharmacokinetic analysis, i.e. 'Phoenix(R) WinNonlin(R)' <https://www.certara.com/software/pkpd-modeling-and-simulation/phoenix-winnonlin/>.
             Some features are
             1) CDISC SDTM terms
             2) Automatic slope selection with the same criterion of WinNonlin(R)
             3) Supporting both 'linear-up linear-down' and 'linear-up log-down' method
             4) Interval(partial) AUCs with 'linear' or 'log' interpolation method
             5) Produce pdf, rtf, text report files.
             * Reference: Gabrielsson J, Weiner D. Pharmacokinetic and Pharmacodynamic Data Analysis - Concepts and Applications. 5th ed. 2016. (ISBN:9198299107).



```r
library(tidyverse)
library(ncar)
```

## ncar 사용법

우선 저장될 폴더를 확인하면 다음과 같습니다.


```r
getwd()
```

```
## [1] "C:/Users/mdlhs/asancpt/book-ncar"
```

저장될 폴더를 변경하고자 한다면 setwd("저장될 경로") 이렇게 설정하면 됩니다.

### txtNCA(): 한 대상자 보고서


```r
txtNCA(Theoph[Theoph$Subject=="1","Time"],
       Theoph[Theoph$Subject=="1","conc"], 
       dose=320, doseUnit="mg", concUnit="mg/L", timeUnit="h")
```

먼저, Theoph 자료의 약동학 파라미터 분석 결과는 아래와 같이 텍스트파일로 저장할 수 있습니다.


```r
writeLines(txtNCA(Theoph[Theoph$Subject=="1","Time"],
                  Theoph[Theoph$Subject=="1","conc"], 
                  dose=320, doseUnit="mg", concUnit="mg/L",
                  timeUnit="h"), 
           'Output-ncar/txtNCA-Theoph.txt')
```

저장된 파일 내용은 아래와 같습니다.


```r
                        NONCOMPARTMENTAL ANALYSIS REPORT
                       Package version 0.3.7 (2017-08-16 KST)
                          R version 3.4.2 (2017-09-28)

Date and Time: 2017-11-15 16:16:21 KST

Calculation Setting
-------------------
Drug Administration: Extravascular
Observation count excluding trailing zero: 11
Dose at time 0: 320 mg
AUC Calculation Method: Linear-up Linear-down
Weighting for lambda z: Uniform (Ordinary Least Square, OLS)
Lambda z selection criterion: Heighest adjusted R-squared value with precision=1e-4


Fitting, AUC, AUMC Result
-------------------------
      Time         Conc.      Pred.   Residual       AUC       AUMC
---------------------------------------------------------------------
     0.0000       0.7400                           0.0000     0.0000
     0.2500       2.8400                           0.4475     0.0888
     0.5700       6.5700                           1.9531     0.8015
     1.1200      10.5000                           6.6474     5.0654
     2.0200       9.6600                          15.7194    19.1383
     3.8200       8.5800                          32.1354    66.1982
     5.1000       8.3600                          42.9769   114.4617
     7.0300       7.4700                          58.2529   206.2815
     9.0500 *     6.8900     6.8912 -1.228e-03    72.7565   322.2988
    12.1200 *     5.9400     5.9387 +1.324e-03    92.4505   528.5219
    24.3700 *     3.2800     3.2801 -1.465e-04   148.9231  1459.0711

*: Used for the calculation of Lambda z.


Calculated Values
-----------------
CMAX       Max Conc                                       10.5000 mg/L
CMAXD      Max Conc Norm by Dose                           0.0328 mg/L/mg
TMAX       Time of CMAX                                    1.1200 h
TLAG       Time Until First Nonzero Conc                   0.0000 h
CLST       Last Nonzero Conc                               3.2800 mg/L
CLSTP      Last Nonzero Conc Pred                          3.2801 mg/L
TLST       Time of Last Nonzero Conc                      24.3700 h
LAMZHL     Half-Life Lambda z                             14.3044 h
LAMZ       Lambda z                                        0.0485 /h
LAMZLL     Lambda z Lower Limit                            9.0500 h
LAMZUL     Lambda z Upper Limit                           24.3700 h
LAMZNPT    Number of Points for Lambda z                   3
CORRXY     Correlation Between TimeX and Log ConcY        -1.0000 
R2         R Squared                                       1.0000 
R2ADJ      R Squared Adjusted                              1.0000 
AUCLST     AUC to Last Nonzero Conc                      148.9231 h*mg/L
AUCALL     AUC All                                       148.9231 h*mg/L
AUCIFO     AUC Infinity Obs                              216.6119 h*mg/L
AUCIFOD    AUC Infinity Obs Norm by Dose                   0.6769 h*mg/L/mg
AUCIFP     AUC Infinity Pred                             216.6150 h*mg/L
AUCIFPD    AUC Infinity Pred Norm by Dose                  0.6769 h*mg/L/mg
AUCPEO     AUC %Extrapolation Obs                         31.2489 %
AUCPEP     AUC %Extrapolation Pred                        31.2499 %
AUMCLST    AUMC to Last Nonzero Conc                    1459.0711 h2*mg/L
AUMCIFO    AUMC Infinity Obs                            4505.5348 h2*mg/L
AUMCIFP    AUMC Infinity Pred                           4505.6709 h2*mg/L
AUMCPEO    AUMC %Extrapolation Obs                        67.6160 %
AUMCPEP    AUMC % Extrapolation Pred                      67.6170 %
VZFO       Vz Obs by F                                    30.4867 L
VZFP       Vz Pred by F                                   30.4863 L
CLFO       Total CL Obs by F                               1.4773 L/h
CLFP       Total CL Pred by F                              1.4773 L/h
MRTEVLST   MRT Extravasc to Last Nonzero Conc              9.7975 h
MRTEVIFO   MRT Extravasc Infinity Obs                     20.8000 h
MRTEVIFP   MRT Extravasc Infinity Pred                    20.8004 h
```

### txtNCA2(): 여러 대상자 보고서

`txtNCA2()`를 다음과 같이 정의하면 여러 대상자에 대한 보고서를 작성 가능합니다.


```r
txtNCA2 <- function(dataset){
  dataset %>% 
    as_tibble() %>% 
    group_by(Subject) %>% 
    summarise(res = c(ID = glue::glue('ID={unique(Subject)}\n\n'),
                     txtNCA(Time, 
                           conc, 
                           dose=320, 
                           doseUnit="mg", 
                           concUnit="mg/L", 
                           timeUnit="h")) %>% paste(collapse = '\n')) %>%
    .$res %>%
    paste(collapse = '\n\n\n\n\n\n')
}
```


```r
txtNCA2(Theoph) %>% writeLines('Output-ncar/txtNCA-group-Theoph.txt')
```

저장된 파일 내용은 Theoph의 경우 Appendix \@ref(theophgroup) 에서 확인 가능합니다.

<!--Indometh의 경우 Appendix \@ref(indomethgroup)-->


<!--chapter:end:04-report.Rmd-->


---
output: html_document
editor_options: 
  chunk_output_type: console
---

# R을 사용한 비구획분석 시각화 {#pkr}

## 이 장에서는 {#summary-pkr}

비구획분석에 대한 다양한 시각화는 여러 유용한 정보를 제공해 줍니다. 이를 가능하게 해 주는 `pkr` 패키지[@R-pkr]에 대해서  자세히 알아보겠습니다.

`pkr`의 `DESCRIPTION` 파일을 보면 다음과 같이 설명하고 있습니다.

> Conduct a noncompartmental analysis as closely as possible to the most widely used commercial software for pharmacokinetic analysis, i.e. 'Phoenix(R) WinNonlin(R)' <https://www.certara.com/software/pkpd-modeling-and-simulation/phoenix-winnonlin/>.
             Some features are
             1) CDISC SDTM terms
             2) Automatic slope selection with the same criterion of WinNonlin(R)
             3) Supporting both 'linear-up linear-down' and 'linear-up log-down' method
             4) Interval(partial) AUCs with 'linear' or 'log' interpolation method
             * Reference: Gabrielsson J, Weiner D. Pharmacokinetic and Pharmacodynamic Data Analysis - Concepts and Applications. 5th ed. 2016. (ISBN:9198299107).


```r
library(tidyverse)
library(pkr)
```

## pkr 사용법

`pkr` 함수의 가장 핵심적인 기능은 `plotPK()` 함수에 있고 이 함수의 인자는 다음과 같습니다.


```r
args(plotPK)
```

```
## function (concData, id, Time, conc, unitTime = "hr", unitConc = "ng/mL", 
##     trt = "", fit = "Linear", dose = 0, adm = "Extravascular", 
##     dur = 0, outdir = "Output") 
## NULL
```

`Theoph` 자료를 갖고 그림을 그리는 명령어를 실행해 보겠습니다.


```r
plotPK(Theoph, "Subject", "Time", "conc", unitTime="hr", unitConc="mg/L", dose=320)
```

```
## pdf 
##   2
```

조금 기다린 후 `Output` 폴더를 확인해 보면 세개의 그림 파일이 생성된 것을 알 수 있습니다.

- ./Output/PK Profile Linear Scale for Theoph.tiff
- ./Output/PK Profile Log 10 Scale for Theoph.tiff
- ./Output/PK Profile with CI for Theoph.tiff 



\begin{figure}
\includegraphics[width=16.67in]{Output/PK_Profile_Linear_Scale_for_Theoph} \caption{평균 약동학 파라메터와 그룹 농도-시간 그림 (선형)}(\#fig:unnamed-chunk-6)
\end{figure}

\begin{figure}
\includegraphics[width=16.67in]{Output/PK_Profile_Log_10_Scale_for_Theoph} \caption{평균 약동학 파라메터와 그룹 농도-시간 그림 (로그)}(\#fig:unnamed-chunk-7)
\end{figure}

\begin{figure}
\includegraphics[width=13.89in]{Output/PK_Profile_with_CI_for_Theoph} \caption{평균 약동학 파라메터와 그룹 평균 농도-시간 그림 (로그)}(\#fig:unnamed-chunk-8)
\end{figure}

또한 개개인 별로 여러개의 그림이 담긴 두개의 PDF 파일이 생성되었습니다.

- ./Output/Individual PK Linear Scale for Theoph.pdf
- ./Output/Individual PK Log 10 Scale for Theoph.pdf 


\begin{figure}
\includegraphics[width=41.67in]{Output/Individual_PK_Linear_Scale_for_Theoph00} \caption{약동학 파라메터와 함께 표시되는 농도-시간 그림 (선형)}(\#fig:unnamed-chunk-9)
\end{figure}

\begin{figure}
\includegraphics[width=41.67in]{Output/Individual_PK_Log_10_Scale_for_Theoph00} \caption{약동학 파라메터와 함께 표시되는 농도-시간 그림 (로그)}(\#fig:unnamed-chunk-10)
\end{figure}

<!--chapter:end:05-visualization.Rmd-->


# R을 사용한 약동학 시뮬레이션 {#simulation}

## 이 장에서는 {#summary-simulation}

## 시뮬레이션에 대하여

TBD

`wnl` 패키지가 CRAN에 올라와 있습니다.

## 시뮬레이션 후 비구획분석

TBD

## 앱을 통해 살펴보는 시뮬레이션

샤이니 앱을 통해서 시뮬레이션을 구현할 수 있습니다. Shinyapp: PK Simulation - 1 Comp IV or Oral <https://asan.shinyapps.io/pk1c/>


```r
knitr::include_app("https://asan.shinyapps.io/pk1c/") #, height = "600px")
```

<iframe src="https://asan.shinyapps.io/pk1c/?showcase=0" width="100%" height="400px"></iframe>




### shiny 앱

웹브라우저를 통해 간단히 비구획분석을 할 수 있는 앱을 개발하였습니다.

- Han, S. (2017) pkrshiny: Noncompartmental Analysis using pkr R package Shiny application. URL: https://asan.shinyapps.io/pkrshiny

그 외 약동학과 관련된 몇가지 shiny 앱도 참고하세요.

- Han, S. (2017) Pharmacokinetic Simulation of one-compartment Models. URL: https://asan.shinyapps.io/pk1c/ 
- Han, S. (2017) caff: Monte Carlo Simulation of Caffeine Shiny application. URL: https://asan.shinyapps.io/caff
- Han, S. (2016) vtdm: Vancomycin TDM Shiny application. URL: https://asan.shinyapps.io/vtdm


<!--chapter:end:06-simulation.Rmd-->


# 통계처리 {#statistics}

## 이 장에서는 {#stat-intro}

생물학적 동등성, 용량 비례성을 확인하는 통계 처리 방법을 알아보겠습니다.


```r
library(tidyverse)
library(ncarbe)
library(broom)
```

## 기술통계량 구하기

앞서 \@ref(noncompart)장에서 구한 `TheophNca`를 갖고 기술 통계량 (평균, 표준편차, 최소값, 최대값, skewness, kurtosis)을 구해보겠습니다. `broom::tidy()` 함수를 사용하면 간단히 구할 수 있습니다. 다만 `NonCompart::tblNCA()` 후 `data.frame` 형태로 저장되어 입력으로 주어져야 합니다.




```r
descStatTheophNca <- tidy(as.data.frame(TheophNca, stringsAsFactors = FALSE)) %>% 
  select(column, n, mean, sd, min, max, skew, kurtosis)

knitr::kable(descStatTheophNca, digits = 2)
```


\begin{tabular}{l|r|r|r|r|r|r|r}
\hline
column & n & mean & sd & min & max & skew & kurtosis\\
\hline
Subject* & 12 & 6.50 & 3.61 & 1.00 & 12.00 & 0.00 & -1.50\\
\hline
b0* & 12 & 2.39 & 0.25 & 2.03 & 2.82 & 0.13 & -1.38\\
\hline
CMAX* & 12 & 8.76 & 1.47 & 6.44 & 11.40 & 0.21 & -1.19\\
\hline
CMAXD* & 12 & 0.03 & 0.00 & 0.02 & 0.04 & 0.21 & -1.19\\
\hline
TMAX* & 12 & 1.79 & 1.11 & 0.63 & 3.55 & 0.70 & -1.35\\
\hline
TLAG* & 12 & 0.00 & 0.00 & 0.00 & 0.00 & NaN & NaN\\
\hline
CLST* & 12 & 1.40 & 0.72 & 0.86 & 3.28 & 1.57 & 1.14\\
\hline
CLSTP* & 12 & 1.40 & 0.72 & 0.86 & 3.28 & 1.58 & 1.19\\
\hline
TLST* & 12 & 24.20 & 0.25 & 23.70 & 24.65 & -0.28 & -0.57\\
\hline
LAMZHL* & 12 & 8.18 & 2.12 & 6.29 & 14.30 & 1.90 & 2.97\\
\hline
LAMZ* & 12 & 0.09 & 0.02 & 0.05 & 0.11 & -0.92 & 0.40\\
\hline
LAMZLL* & 12 & 7.49 & 2.40 & 2.03 & 9.38 & -1.20 & -0.03\\
\hline
LAMZUL* & 12 & 24.20 & 0.25 & 23.70 & 24.65 & -0.28 & -0.57\\
\hline
LAMZNPT* & 12 & 3.83 & 1.34 & 3.00 & 7.00 & 1.32 & 0.28\\
\hline
CORRXY* & 12 & -1.00 & 0.00 & -1.00 & -1.00 & 2.20 & 3.87\\
\hline
R2* & 12 & 1.00 & 0.00 & 0.99 & 1.00 & -2.20 & 3.87\\
\hline
R2ADJ* & 12 & 1.00 & 0.00 & 0.99 & 1.00 & -2.05 & 3.39\\
\hline
AUCLST* & 12 & 103.81 & 23.65 & 73.78 & 148.92 & 0.56 & -1.12\\
\hline
AUCALL* & 12 & 103.81 & 23.65 & 73.78 & 148.92 & 0.56 & -1.12\\
\hline
AUCIFO* & 12 & 122.19 & 38.13 & 84.25 & 216.61 & 1.25 & 0.51\\
\hline
AUCIFOD* & 12 & 0.38 & 0.12 & 0.26 & 0.68 & 1.25 & 0.51\\
\hline
AUCIFP* & 12 & 122.18 & 38.11 & 84.50 & 216.61 & 1.26 & 0.52\\
\hline
AUCIFPD* & 12 & 0.38 & 0.12 & 0.26 & 0.68 & 1.26 & 0.52\\
\hline
AUCPEO* & 12 & 13.54 & 6.35 & 8.13 & 31.25 & 1.71 & 2.19\\
\hline
AUCPEP* & 12 & 13.54 & 6.34 & 8.16 & 31.25 & 1.72 & 2.23\\
\hline
AUMCLST* & 12 & 883.06 & 262.98 & 609.15 & 1459.07 & 0.92 & -0.42\\
\hline
AUMCIFO* & 12 & 1590.30 & 1006.57 & 928.56 & 4505.53 & 2.00 & 2.96\\
\hline
AUMCIFP* & 12 & 1589.85 & 1006.06 & 928.49 & 4505.67 & 2.01 & 2.97\\
\hline
AUMCPEO* & 12 & 38.72 & 11.10 & 26.50 & 67.62 & 1.29 & 1.10\\
\hline
AUMCPEP* & 12 & 38.72 & 11.07 & 26.59 & 67.62 & 1.30 & 1.14\\
\hline
VZFO* & 12 & 31.93 & 6.47 & 22.22 & 43.26 & 0.20 & -1.40\\
\hline
VZFP* & 12 & 31.92 & 6.46 & 22.22 & 43.14 & 0.19 & -1.41\\
\hline
CLFO* & 12 & 2.81 & 0.68 & 1.48 & 3.80 & -0.45 & -0.93\\
\hline
CLFP* & 12 & 2.81 & 0.68 & 1.48 & 3.79 & -0.46 & -0.93\\
\hline
MRTEVLST* & 12 & 8.41 & 0.59 & 7.71 & 9.80 & 0.99 & 0.12\\
\hline
MRTEVIFO* & 12 & 12.29 & 2.96 & 9.98 & 20.80 & 1.90 & 2.83\\
\hline
MRTEVIFP* & 12 & 12.29 & 2.95 & 9.95 & 20.80 & 1.91 & 2.84\\
\hline
\end{tabular}

## 생물학적 동등성 {#bioequivalence}

생물학적 동등성을 위한 가장 간단한 방법은 `ncarbe` 패키지[@R-ncarbe]를 쓰는 것입니다.  
Chow와 Liu의 책의 내용을 충실히 반영하였습니다. [@chow2009design]
생물학적 동등성을 위한 수학 식은 다음과 같습니다. \@ref(eq:be)

$$
\begin{align}
  0.8 < 90\%\ CI\ of\ \frac{GM(AUC_{last, test})}{GM(AUC_{last, ref})} < 1.25 \\
  0.8 < 90\%\ CI\ of\ \frac{GM(AUC_{last, test})}{GM(AUC_{last, ref})} < 1.25 (\#eq:be)
\end{align}
$$

현재로서는 2x2 디자인의 간단한 임상시험 디자인만을 지원하고 있습니다. (그림 \@ref(fig:twobytwo))
핵심이 되는 함수는 `beNCA()` 입니다. 


```r
knitr::include_graphics('assets/twobytwo.jpg')
```

\begin{figure}
\includegraphics[width=18.01in]{assets/twobytwo} \caption{전형적인 2x2 설계}(\#fig:twobytwo)
\end{figure}


```
## function (concData, SUBJ = "SUBJ", GRP = "GRP", PRD = "PRD", 
##     TRT = "TRT", ...) 
## NULL
```

다음과 같은 함수 인자를 설정해 주면 됩니다.

- SUBJ: Subject ID, any data type
- GRP: column name in which information of "RT" or "TR" exists.
- PRD: column name in which information of 1 or 2 exists.
- TRT: column name in which information of "R" or "T" exists.
- method: `kbe` by authors or `nlme` package uploaded on CRAN

ncarbe 패키지 내에 있는 자료를 사용할 것입니다. (Table \@ref(tab:beconcdata))


```r
file <- system.file('example', 'beConc.csv', package = 'ncarbe')
concData <- read_csv(file)
```

\begin{table}

\caption{(\#tab:beconcdata)A example dataset for the bioequivalence test.}
\centering
\begin{tabular}[t]{r|l|r|l|r|r|r}
\hline
SUBJ & GRP & PRD & TRT & nTIME & TIME & CONC\\
\hline
1 & RT & 1 & R & 0.00 & 0.02 & 63.42\\
\hline
1 & RT & 1 & R & 0.25 & 0.24 & 432.76\\
\hline
1 & RT & 1 & R & 0.50 & 0.51 & 622.88\\
\hline
1 & RT & 1 & R & 0.75 & 0.80 & 809.93\\
\hline
1 & RT & 1 & R & 1.00 & 1.02 & 824.34\\
\hline
1 & RT & 1 & R & 2.00 & 2.04 & 602.22\\
\hline
1 & RT & 1 & R & 3.00 & 2.96 & 512.28\\
\hline
1 & RT & 1 & R & 4.00 & 3.99 & 421.99\\
\hline
1 & RT & 1 & R & 6.00 & 6.04 & 302.73\\
\hline
1 & RT & 1 & R & 8.00 & 8.04 & 181.60\\
\hline
\end{tabular}
\end{table}



```r
beNCA(concData)
```

```
## 
## 
## [AUClast]
## 
## $`Analysis of Variance`
##                       SS DF         MS        F          p
## SUBJECT        2.8102897 35 0.08029399 2.049048 0.01947896
## GROUP          0.2811516  1 0.28115157 3.779609 0.06019307
## SUBJECT(GROUP) 2.5291381 34 0.07438642 1.898290 0.03291404
## PERIOD         0.2887407  1 0.28874073 7.368465 0.01035002
## DRUG           0.1186721  1 0.11867210 3.028430 0.09086256
## ERROR          1.3323243 34 0.03918601       NA         NA
## TOTAL          4.5500268 71         NA       NA         NA
## 
## $`Between and Within Subject Variability`
##                                 Between Subject Within Subject
## Variance Estimate                     0.0176002     0.03918601
## Coefficient of Variation, CV(%)      13.3251642    19.99097469
## 
## $`Least Square Means`
##                 Reference Drug Test Drug
## Geometric Means       5047.026  4648.063
## 
## $`90% Confidence Interval`
##                  Lower Limit Point Estimate Upper Limit
## 90% CI for Ratio   0.8501323       0.920951   0.9976692
## 
## $`Sample Size`
##                       True Ratio=1 True Ratio=Point Estimate
## 80% Power Sample Size            8                        13
## 
## 
## 
## [Cmax]
## 
## $`Analysis of Variance`
##                        SS DF         MS         F         p
## SUBJECT        2.85581816 35 0.08159480 0.9764709 0.5283290
## GROUP          0.08840271  1 0.08840271 1.0861008 0.3046908
## SUBJECT(GROUP) 2.76741545 34 0.08139457 0.9740747 0.5302983
## PERIOD         0.04931289  1 0.04931289 0.5901430 0.4476669
## DRUG           0.10908566  1 0.10908566 1.3054627 0.2612001
## ERROR          2.84107119 34 0.08356092        NA        NA
## TOTAL          5.85528790 71         NA        NA        NA
## 
## $`Between and Within Subject Variability`
##                                 Between Subject Within Subject
## Variance Estimate                  -0.001083173     0.08356092
## Coefficient of Variation, CV(%)             NaN    29.52142270
## 
## $`Least Square Means`
##                 Reference Drug Test Drug
## Geometric Means       791.1619     731.1
## 
## $`90% Confidence Interval`
##                  Lower Limit Point Estimate Upper Limit
## 90% CI for Ratio   0.8221796       0.924084    1.038619
## 
## $`Sample Size`
##                       True Ratio=1 True Ratio=Point Estimate
## 80% Power Sample Size           16                        26
## 
## 
## 
## [Tmax]
## 
## $`Wilcoxon Signed-Rank Test`
##   p-value 
## 0.3059991 
## 
## $`Hodges-Lehmann Estimate`
##                            Lower Limit Point Estimate Upper Limit
## 90% Confidence Interval       -0.10000         0.0300       0.405
## 90% Confidence Interval(%)    92.18517       102.3444     131.650
```


배균섭 교수님의 강의 자료에서 가져왔습니다.


```r
knitr::include_graphics('assets/fixed-random.jpg')
```

\begin{figure}
\includegraphics[width=16.86in]{assets/fixed-random} \caption{모수 인자와 변량 인자의 비교}(\#fig:fixedrandom)
\end{figure}


## Dose Proportionality {#dp}

DP 처리.



16명의 C~max~와 AUC~last~가 나온 표입니다. Table \@ref(tab:sad-pk)



```r
# setup ----

library(readxl)
library(tidyverse)
library(broom)

dp_data <- # Virtual data from 4 dose groups (N=16)
'Dose,Subject,Cmax,AUClast
50,101,860,2000
50,102,510,2300
50,103,620,2900
50,104,540,2400
100,201,1550,6600
100,202,1440,7400
100,203,2000,7300
100,204,1600,7000
200,301,4100,20400
200,302,2800,9500
200,303,3200,8000
200,304,2550,7070
400,401,4800,22000
400,402,5700,23000
400,403,5800,26700
400,404,5760,28884'

sad_indi_pk <- read_csv(dp_data)
knitr::kable(sad_indi_pk, caption = '16명의 C~max~, AUC~last~')
```

\begin{table}

\caption{(\#tab:sad-pk)16명의 C~max~, AUC~last~}
\centering
\begin{tabular}[t]{r|r|r|r}
\hline
Dose & Subject & Cmax & AUClast\\
\hline
50 & 101 & 860 & 2000\\
\hline
50 & 102 & 510 & 2300\\
\hline
50 & 103 & 620 & 2900\\
\hline
50 & 104 & 540 & 2400\\
\hline
100 & 201 & 1550 & 6600\\
\hline
100 & 202 & 1440 & 7400\\
\hline
100 & 203 & 2000 & 7300\\
\hline
100 & 204 & 1600 & 7000\\
\hline
200 & 301 & 4100 & 20400\\
\hline
200 & 302 & 2800 & 9500\\
\hline
200 & 303 & 3200 & 8000\\
\hline
200 & 304 & 2550 & 7070\\
\hline
400 & 401 & 4800 & 22000\\
\hline
400 & 402 & 5700 & 23000\\
\hline
400 & 403 & 5800 & 26700\\
\hline
400 & 404 & 5760 & 28884\\
\hline
\end{tabular}
\end{table}


그림을 살펴보겠습니다.


```r
sad_indi_pk_log <- sad_indi_pk %>% mutate_all(log)

figA <- ggplot(sad_indi_pk_log, aes(x=Dose, y=Cmax)) +
  geom_smooth(method = 'lm')+
  geom_boxplot(aes(group = Dose), 
               size = 1, 
               outlier.colour = "red", 
               outlier.shape = 1, 
               outlier.size = 3) +
  theme_bw() +
  scale_x_continuous(breaks = c(50, 100, 200, 400)) +
  labs(x = 'Dose (mg)', y = expression('C'[max]*' (ng/mL)'),
       title = expression('C'[max]))
figA
```

![](07-statistics_files/figure-latex/sad-indi-pk-log-1.pdf)<!-- --> 

```r
figB <- ggplot(sad_indi_pk_log, aes(x=Dose, y=AUClast)) +
  geom_smooth(method = 'lm')+
  geom_boxplot(aes(group = Dose), 
               size = 1, 
               outlier.colour = "red", 
               outlier.shape = 1, 
               outlier.size = 3) +
  theme_bw() +
  scale_x_continuous(breaks = c(50, 100, 200, 400)) +
  labs(x = 'Dose (mg)', y = expression('AUC'[(0-last)]*' (ng·hr/mL)'),
       title = expression('AUC'[(0-last)]))
figB
```

![](07-statistics_files/figure-latex/sad-indi-pk-log-2.pdf)<!-- --> 

lm() 함수를 써서 구할 수 있습니다.


```r
calc_dp <- function(param, fit) {
  bind_cols(fit %>% summary %>% tidy %>% filter(term == 'Dose'), 
            fit %>% confint(level = 0.95) %>% tidy %>% filter(.rownames == 'Dose'), 
            fit %>% summary %>% glance) %>% 
    filter(term == 'Dose') %>% 
    select(-.rownames, -term) %>% 
    mutate(parameters = param) %>% 
    mutate(est = sprintf('%0.2f (%0.2f)', estimate, std.error)) %>% 
    mutate(ci = sprintf('%0.2f-%0.2f', X2.5.., X97.5..)) %>% 
    select(parameters, est, ci, r.squared, p.value)
}

fit_cmax <- lm(formula = Cmax ~ Dose, data = sad_indi_pk_log)
fit_auclast <- lm(formula = AUClast ~ Dose, data = sad_indi_pk_log)

bind_rows(calc_dp(param = 'Cmax', fit = fit_cmax),
          calc_dp(param = 'AUClast', fit = fit_auclast))
```

```
##   parameters         est        ci r.squared      p.value
## 1       Cmax 1.04 (0.06) 0.90-1.18 0.9494890 1.797428e-10
## 2    AUClast 1.07 (0.09) 0.87-1.27 0.9053706 1.486278e-08
```

C~max~는 dose proportionality 기준을 만족하는데 반해 AUC~last~는 만족하지 않는 것을 알 수 있습니다.



<!--chapter:end:07-statistics.Rmd-->


# 결과 및 논의 {#result}

R을 통해서 NCA 를 구할 수 있도록 R 패키지를 구축하였습니다. 값비싼 상용소프트웨어를 사용하지 않고도 동일한 비구획분석이 가능한 것은 비용과 작업 효율 측면에서 큰 잇점을 가져올 것입니다.

현재 R에 기본적으로 내장되어 있는 PO 테오필린(theophylline)과 IV bolus 인도메타신(indomethacin)에 대해서 예가 잘 나와있습니다.
약물에 대한 자료를 고른 후 각 약물의 복용량, 감소 구간에서의 log 치환 여부, 복용방법, 정맥주사일 경우 투입 시간(정맥주사 이외의 값들 경우에는 infusion time은 내부 함수에 따라 값이 적용되지 않는다.)을 각각 설정할 경우 값을 도출할 수 있습니다.
 
Edison 내에서 실제 Theophylline의 용량에 따라 구현된 각각의 graph를 spaghetti plot형태로 Edison의 결과 가시화 tab을 이용하여 확인할 수 있으며, 그래프의 형태를 변형할 수 있게 설정하였다. 
Y축(농도)의 경우 linear plot과 semi-logarithmic plot을 모두 함께 확인할 수 있도록 하여 다양한 구간에서의 그래프의 추세를 선택적으로 확인할 수 있도록 하였다.
 
언급하였던 공식 이외에도 Pharmacokinetic and Pharmacodynamic Data Analysis 5th edition 에 언급된 공식을 적용하여 다음과 같이 값을 도출하였다.(figure 8) 

또한 결과 값이 모두 도출된 이후 실제 NCA program으로 가장 흔히 사용되고 있는 WinNonlin® (Version 7.0  Pharsight, CA, USA) software 와의 결과 비교에서도 모든 조건을 현재 Edison simulator에서 준 값과 동일하게 설정하여 프로그램을 실행할 경우, 모든 지표에서 같은 값이 계산됨을 확인하였다. (figure 8, figure 9)
 
현재 가장 간단한 분석 방식인 비구획 분석을 통해서 약동학 분석에 필수적인 지표들을 산출해 내었지만, 마찬가지로 수학적 원리를 반영하여 R script를 구성한다면 보다 고차원적적 약동학 분석 방법인 구획 분석(Compartmental analysis)과 비선형적 약동학(nonlinear mixed effect modeling) 분석 또한 실시할 수 있다. 

실제로 Edison 사이언스 엡에 추가한 ‘NONMEM(Nonlinear mixed effect modeling), method’라는 엡을 통해 현재 입력 되어있는 Theoph(theophylline)의 시간 농도 데이터를 가지고 FO(first-order method), FOCE(first-order conditional estimation method), LAPL(Laplace's method)의 방법을 이용하여 현재 사용하는 NONMEM software와 유사한 값들을 재현해 낼 수 있다. 

Figure 4 논문 내에서의 설정 값 

Figure 5. 앞서 설정한 Theophylline에 대한 linear spaghetti plot
 
Figure 6. 앞서 설정한 Theophylline에 대한 scatter plot
 
Figure 7. 앞서 설정한 Theophylline에 대한 semi-logarithmic spaghetti plot

Figure 8. 앞서 설정한 Theophylline에 대한 NCA 분석 결과
 
Figure 9. Theophylline에 대하여 같은 data와 설정값으로 계산한 WinNonlin® (Version 7.0  Pharsight, CA, USA) software의 결과

Figure 10. NONMEM(Nonlinear mixed effect modeling), method 엡에 입력되어 있는 theophylline data의 농도 시간 곡선
 
Figure 11. theophylline data에 대한 model
 
Figure 12. nonlinear mixed effect modeling First order method를 통해 도출된 parameter

# 결론 {#conclusion}

약물을 연구하고 개발하는데 있어서 약동학은 굉장히 필수적인 분야이며, 그 동안 이러한 약동학 지표들을 구하기 위해서 그러한 결론이 도출되는 과정을 고려하지 않고 일부 프로그램의 사용에만 의존하는 모습이 주를 이뤘습니다.

하지만 이번 Edison program과 다양한 수학적, 통계적 지식을 coding에 활용하여 실제 임상적으로도 활용 가능한 결과값을 도출해 낼 수 있음을 확인하였으며 앞으로도 약동학 분야에서 다양하게 활용할 수 있을 것으로 예측됩니다.


<!--chapter:end:08-conclusion.Rmd-->


\cleardoublepage

# (APPENDIX) 부록 {-}


<!--chapter:end:11-appendix.Rmd-->




\pagebreak

# tblNCA2()

This document may be temporarily meaningful because the functionality will be included in `NonCompart` [@R-NonCompart] package someday as Prof.Bae said. Until then, I hope that these tips can save several minutes (or hours) for a few people. 

One thing we should keep in mind is that the output of `tblNCA()` is a character matrix so we probably want to change it to **data.frame** (or **tibble**) for the further manipulation and the PK parameters should be converted to numeric by `as.numeric()` to find descriptive statistics.

These R packages are used.


```r
library(NonCompart) # for tblNCA(), IntAUC()
library(dplyr) # for data manipulation
library(tidyr) # for data manipulation
library(purrr) # for pmap_dbl()
library(knitr) # make pretty tables (can be ignored when we don't need them.)
```

\pagebreak

## How to include iAUC in the tblNCA

### Writing `tblNCA2()`

`tblNCA2()` is a wrapper function of `tblNCA()` to include iAUC. In the function, iAUC is calculated by `IntAUC()`. Data manipulation can be done in numerous ways but I prefer using Hadley's packages for functional programming [@R-purrr] and tidy data handling [@R-tidyr;@R-dplyr].


```r
tblNCA2 <- function(concData, key = "Subject", 
                    colTime = "Time", colConc = "conc", 
                    down = "linear", t1 = 0, t2 = 0, ...){
  # tblNCA() and data calculation
  input_tbl <- tblNCA(as.data.frame(concData), 
                      key, colTime, colConc, down = down, ...) %>% # calculation
    as_tibble() %>% mutate_all(as.character) %>% 
    left_join(concData %>% 
                as_tibble() %>% mutate_all(as.character) %>% 
                group_by_(.dots = key) %>% # grouping by keys (Subject)
                summarise_(x = sprintf('list(%s)', colTime), 
                           y = sprintf('list(%s)', colConc)))
  
  # calculation of IntAUC()
  output <- input_tbl %>% 
    mutate(Res = do.call(c, input_tbl %>% select(-x, -y) %>% apply(1, list))) %>% 
    mutate(iAUC = pmap_dbl(.l = list(x, y, Res), 
                           .f = ~IntAUC(x = as.numeric(..1), y = as.numeric(..2), 
                                        t1, t2, 
                                        Res = ..3, down = down))) %>% 
    select(-x, -y, -Res) %>% 
    mutate_at(vars(b0:iAUC), as.numeric) # character -> number
  return(output)
}
```

### Examples

#### Example 1: datasets::Theoph

Now we can use `tblNCA2()` to find NCA parameters and *interval AUC between 0-12 hours* of Theoph dataset internally available in R.


```r
Theoph_with_iAUC <- tblNCA2(Theoph, dose = 320, t1 = 0, t2 = 12) # 0-12h
Theoph_with_iAUC %>% 
  kable(caption = 'Entire PK parameters calculated by NonCompart', booktabs=TRUE, digits = 2)
```

\begin{table}

\caption{(\#tab:wide)Entire PK parameters calculated by NonCompart}
\centering
\begin{tabular}[t]{lrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr}
\toprule
Subject & b0 & CMAX & CMAXD & TMAX & TLAG & CLST & CLSTP & TLST & LAMZHL & LAMZ & LAMZLL & LAMZUL & LAMZNPT & CORRXY & R2 & R2ADJ & AUCLST & AUCALL & AUCIFO & AUCIFOD & AUCIFP & AUCIFPD & AUCPEO & AUCPEP & AUMCLST & AUMCIFO & AUMCIFP & AUMCPEO & AUMCPEP & VZFO & VZFP & CLFO & CLFP & MRTEVLST & MRTEVIFO & MRTEVIFP & iAUC\\
\midrule
1 & 2.37 & 10.50 & 0.03 & 1.12 & 0 & 3.28 & 3.28 & 24.37 & 14.30 & 0.05 & 9.05 & 24.37 & 3 & -1 & 1.00 & 1.00 & 148.92 & 148.92 & 216.61 & 0.68 & 216.61 & 0.68 & 31.25 & 31.25 & 1459.07 & 4505.53 & 4505.67 & 67.62 & 67.62 & 30486.75 & 30486.32 & 1477.30 & 1477.28 & 9.80 & 20.80 & 20.80 & 91.74\\
2 & 2.41 & 8.33 & 0.03 & 1.92 & 0 & 0.90 & 0.89 & 24.30 & 6.66 & 0.10 & 7.03 & 24.30 & 4 & -1 & 1.00 & 1.00 & 91.53 & 91.53 & 100.17 & 0.31 & 100.06 & 0.31 & 8.63 & 8.53 & 706.59 & 999.77 & 996.07 & 29.33 & 29.06 & 30690.44 & 30723.92 & 3194.46 & 3197.94 & 7.72 & 9.98 & 9.95 & 67.48\\
3 & 2.53 & 8.20 & 0.03 & 1.02 & 0 & 1.05 & 1.06 & 24.17 & 6.77 & 0.10 & 9.00 & 24.17 & 3 & -1 & 1.00 & 1.00 & 99.29 & 99.29 & 109.54 & 0.34 & 109.59 & 0.34 & 9.36 & 9.40 & 803.19 & 1150.96 & 1152.65 & 30.22 & 30.32 & 28517.10 & 28504.15 & 2921.41 & 2920.09 & 8.09 & 10.51 & 10.52 & 70.18\\
4 & 2.59 & 8.60 & 0.03 & 1.07 & 0 & 1.15 & 1.16 & 24.65 & 6.98 & 0.10 & 9.02 & 24.65 & 3 & -1 & 1.00 & 1.00 & 106.80 & 106.80 & 118.38 & 0.37 & 118.44 & 0.37 & 9.78 & 9.83 & 901.08 & 1303.25 & 1305.50 & 30.86 & 30.98 & 27225.96 & 27211.10 & 2703.18 & 2701.71 & 8.44 & 11.01 & 11.02 & 73.05\\
5 & 2.55 & 11.40 & 0.04 & 1.00 & 0 & 1.57 & 1.56 & 24.35 & 8.00 & 0.09 & 7.02 & 24.35 & 4 & -1 & 1.00 & 1.00 & 121.29 & 121.29 & 139.42 & 0.44 & 139.25 & 0.44 & 13.00 & 12.90 & 1017.11 & 1667.72 & 1661.79 & 39.01 & 38.79 & 26497.99 & 26529.42 & 2295.23 & 2297.95 & 8.39 & 11.96 & 11.93 & 84.61\\
\addlinespace
6 & 2.03 & 6.44 & 0.02 & 1.15 & 0 & 0.92 & 0.94 & 23.85 & 7.89 & 0.09 & 2.03 & 23.85 & 7 & -1 & 1.00 & 1.00 & 73.78 & 73.78 & 84.25 & 0.26 & 84.50 & 0.26 & 12.44 & 12.69 & 609.15 & 978.43 & 986.97 & 37.74 & 38.28 & 43259.73 & 43135.69 & 3798.02 & 3787.13 & 8.26 & 11.61 & 11.68 & 51.76\\
7 & 2.29 & 7.09 & 0.02 & 3.48 & 0 & 1.15 & 1.16 & 24.22 & 7.85 & 0.09 & 6.98 & 24.22 & 4 & -1 & 1.00 & 1.00 & 90.75 & 90.75 & 103.77 & 0.32 & 103.89 & 0.32 & 12.55 & 12.65 & 782.42 & 1245.10 & 1249.41 & 37.16 & 37.38 & 34908.44 & 34867.67 & 3083.69 & 3080.09 & 8.62 & 12.00 & 12.03 & 62.10\\
8 & 2.17 & 7.56 & 0.02 & 2.02 & 0 & 1.25 & 1.23 & 24.12 & 8.51 & 0.08 & 3.53 & 24.12 & 6 & -1 & 0.99 & 0.99 & 88.56 & 88.56 & 103.91 & 0.32 & 103.64 & 0.32 & 14.77 & 14.55 & 739.53 & 1298.12 & 1288.52 & 43.03 & 42.61 & 37810.51 & 37906.69 & 3079.69 & 3087.52 & 8.35 & 12.49 & 12.43 & 62.71\\
9 & 2.12 & 9.03 & 0.03 & 0.63 & 0 & 1.12 & 1.12 & 24.43 & 8.41 & 0.08 & 8.80 & 24.43 & 3 & -1 & 1.00 & 1.00 & 86.33 & 86.33 & 99.91 & 0.31 & 99.87 & 0.31 & 13.59 & 13.56 & 705.23 & 1201.77 & 1200.21 & 41.32 & 41.24 & 38842.79 & 38859.38 & 3202.92 & 3204.29 & 8.17 & 12.03 & 12.02 & 60.12\\
10 & 2.66 & 10.21 & 0.03 & 3.55 & 0 & 2.42 & 2.41 & 23.70 & 9.25 & 0.07 & 9.38 & 23.70 & 3 & -1 & 1.00 & 1.00 & 138.37 & 138.37 & 170.65 & 0.53 & 170.57 & 0.53 & 18.92 & 18.88 & 1278.18 & 2473.99 & 2470.88 & 48.34 & 48.27 & 25015.54 & 25027.88 & 1875.16 & 1876.09 & 9.24 & 14.50 & 14.49 & 90.82\\
\addlinespace
11 & 2.15 & 8.00 & 0.02 & 0.98 & 0 & 0.86 & 0.86 & 24.08 & 7.26 & 0.10 & 9.03 & 24.08 & 3 & -1 & 1.00 & 1.00 & 80.09 & 80.09 & 89.10 & 0.28 & 89.10 & 0.28 & 10.11 & 10.11 & 617.24 & 928.56 & 928.49 & 33.53 & 33.52 & 37622.19 & 37623.04 & 3591.36 & 3591.44 & 7.71 & 10.42 & 10.42 & 58.54\\
12 & 2.82 & 9.75 & 0.03 & 3.52 & 0 & 1.17 & 1.18 & 24.15 & 6.29 & 0.11 & 9.03 & 24.15 & 3 & -1 & 1.00 & 1.00 & 119.98 & 119.98 & 130.59 & 0.41 & 130.64 & 0.41 & 8.13 & 8.16 & 977.88 & 1330.38 & 1332.05 & 26.50 & 26.59 & 22224.29 & 22215.75 & 2450.44 & 2449.50 & 8.15 & 10.19 & 10.20 & 85.02\\
\bottomrule
\end{tabular}
\end{table}

Table \@ref(tab:wide) is so wide that we may want to focus on C~max~, T~max~, AUC~last~, AUC~inf~, and iAUC. Table \@ref(tab:pkparam) looks okay. We can compare the values with the concentration-time curves in Figure \@ref(fig:ggfig)


```r
Theoph_with_iAUC_selected <- Theoph_with_iAUC %>% 
  select(Subject, CMAX, TMAX, AUCLST, AUCIFO, iAUC) 

Theoph_with_iAUC_selected %>% 
  kable(caption = 'Selected PK parameters including iAUC', booktabs=TRUE, digits = 2)
```

\begin{table}

\caption{(\#tab:pkparam)Selected PK parameters including iAUC}
\centering
\begin{tabular}[t]{lrrrrr}
\toprule
Subject & CMAX & TMAX & AUCLST & AUCIFO & iAUC\\
\midrule
1 & 10.50 & 1.12 & 148.92 & 216.61 & 91.74\\
2 & 8.33 & 1.92 & 91.53 & 100.17 & 67.48\\
3 & 8.20 & 1.02 & 99.29 & 109.54 & 70.18\\
4 & 8.60 & 1.07 & 106.80 & 118.38 & 73.05\\
5 & 11.40 & 1.00 & 121.29 & 139.42 & 84.61\\
\addlinespace
6 & 6.44 & 1.15 & 73.78 & 84.25 & 51.76\\
7 & 7.09 & 3.48 & 90.75 & 103.77 & 62.10\\
8 & 7.56 & 2.02 & 88.56 & 103.91 & 62.71\\
9 & 9.03 & 0.63 & 86.33 & 99.91 & 60.12\\
10 & 10.21 & 3.55 & 138.37 & 170.65 & 90.82\\
\addlinespace
11 & 8.00 & 0.98 & 80.09 & 89.10 & 58.54\\
12 & 9.75 & 3.52 & 119.98 & 130.59 & 85.02\\
\bottomrule
\end{tabular}
\end{table}


```r
library(ggplot2)
ggplot(Theoph %>% left_join(Theoph_with_iAUC), aes(x = Time, y = conc)) +
  geom_line() + 
  geom_point(color = 'red') + 
  facet_wrap(~ sprintf('Subject %2s,Cmax %0.1f,\nAUClast %0.1f,iAUC %0.1f', 
                       Subject, CMAX, AUCLST, iAUC), ncol = 4) +
  scale_x_continuous(breaks = c(0, 6, 12, 24)) +
  theme_minimal()
```

![(\#fig:ggfig)Individual concentration-time curves](12-tblNCA2_files/figure-latex/ggfig-1.pdf) 

#### Example 2: PKPDdatasets::sd_oral_richpk

`PKPDdatasets` package [@R-PKPDdatasets] contains some interesting PK/PD datasets and I want to apply `tblNCA2()` to one of them. In this case, I'll add some more *keys* such as gender and race. Factors should be converted to characters and *strangely* the lower case should be avoided as a input of keys in `tblNCA()`. Table \@ref(tab:sdoral) shows the results and multiple keys are working fine.  Results of only 10 subjects are shown here out of total 50 subjects.


```r
sd_oral_richpk_char <- PKPDdatasets::sd_oral_richpk %>% 
  filter(ID <= 12) %>% 
  mutate_at(vars(ID, Gender, Race), function(x) toupper(as.character(x)))

tblNCA2(sd_oral_richpk_char, 
        key = c('ID', 'Gender', 'Race'), 'Time', 'Conc', dose = 5000, t1 = 0, t2 = 12) %>% 
  select(ID, Gender, Race, CMAX, TMAX, AUCLST, AUCIFO, iAUC) %>% 
  kable(caption = 'Selected PK parameters including iAUC of sd oral richpk', 
        booktabs=TRUE, digits = 2)
```

\begin{table}

\caption{(\#tab:sdoral)Selected PK parameters including iAUC of sd oral richpk}
\centering
\begin{tabular}[t]{lllrrrrr}
\toprule
ID & Gender & Race & CMAX & TMAX & AUCLST & AUCIFO & iAUC\\
\midrule
1 & MALE & HISPANIC & 34.01 & 1 & 385.58 & 449.44 & 280.59\\
2 & MALE & CAUCASIAN & 100.18 & 2 & 1203.49 & 2495.10 & 732.30\\
3 & MALE & OTHER & 53.86 & 3 & 466.31 & 481.99 & 389.24\\
4 & FEMALE & CAUCASIAN & 96.68 & 4 & 1219.64 & 1789.21 & 775.31\\
5 & FEMALE & CAUCASIAN & 51.63 & 2 & 487.57 & 516.44 & 385.18\\
\addlinespace
6 & MALE & HISPANIC & 27.94 & 4 & 295.25 & 342.57 & 208.93\\
7 & MALE & OTHER & 71.81 & 4 & 739.03 & 876.99 & 521.99\\
8 & MALE & ASIAN & 44.45 & 3 & 453.77 & 472.76 & 345.15\\
9 & FEMALE & OTHER & 48.47 & 4 & 698.99 & 817.67 & 435.38\\
10 & MALE & OTHER & 23.52 & 2 & 161.45 & 162.89 & 146.59\\
\addlinespace
11 & MALE & ASIAN & 68.10 & 6 & 962.56 & 1272.65 & 611.06\\
12 & MALE & OTHER & 83.63 & 2 & 721.85 & 768.82 & 550.52\\
\bottomrule
\end{tabular}
\end{table}

\pagebreak

## How to get descriptive statistics

You may want to use `psych::describe()` or `broom::tidy()` [@R-broom]. They returns basically the same results. One thing to be mentioned is that `broom::tidy()` returns the descriptive statistics when the input is data.frame so `as.data.frame()` should be first applied to the output of `tblNCA()`. (Table \@ref(tab:descstat-iauc))


```r
broom::tidy(as.data.frame(Theoph_with_iAUC_selected)) %>% 
  kable(caption = 'Descriptive statistics of selected PK parameters of Theoph',
        booktabs = TRUE, digits = 2)
```

\begin{table}

\caption{(\#tab:descstat-iauc)Descriptive statistics of selected PK parameters of Theoph}
\centering
\begin{tabular}[t]{lrrrrrrrrrrrr}
\toprule
column & n & mean & sd & median & trimmed & mad & min & max & range & skew & kurtosis & se\\
\midrule
Subject* & 12 & 6.50 & 3.61 & 6.50 & 6.50 & 4.45 & 1.00 & 12.00 & 11.00 & 0.00 & -1.50 & 1.04\\
CMAX & 12 & 8.76 & 1.47 & 8.46 & 8.73 & 1.62 & 6.44 & 11.40 & 4.96 & 0.21 & -1.19 & 0.43\\
TMAX & 12 & 1.79 & 1.11 & 1.14 & 1.73 & 0.49 & 0.63 & 3.55 & 2.92 & 0.70 & -1.35 & 0.32\\
AUCLST & 12 & 103.81 & 23.65 & 95.41 & 102.30 & 19.79 & 73.78 & 148.92 & 75.15 & 0.56 & -1.12 & 6.83\\
AUCIFO & 12 & 122.19 & 38.13 & 106.72 & 116.54 & 21.70 & 84.25 & 216.61 & 132.36 & 1.25 & 0.51 & 11.01\\
iAUC & 12 & 71.51 & 13.52 & 68.83 & 71.46 & 14.08 & 51.76 & 91.74 & 39.98 & 0.24 & -1.55 & 3.90\\
\bottomrule
\end{tabular}
\end{table}

### Write your own scripts

You can write some codes to customize the descriptive statistics.


```r
Theoph_tblNCA <- tblNCA(Theoph)

as_tibble(Theoph_tblNCA) %>% 
  gather(PPTESTCD, PPORRES, -Subject) %>% 
  left_join(tibble(PPTESTCD = attr(Theoph_tblNCA, 'dimnames')[[2]], 
                   UNIT = attr(Theoph_tblNCA, 'units')),
          by = 'PPTESTCD') %>% 
  mutate(PPORRES = as.numeric(PPORRES)) %>% 
  group_by(PPTESTCD, UNIT) %>% 
  summarise_at(vars(PPORRES), funs(n(), mean, sd, cv = sd/mean*100,
                                   geomean = PKNCA::geomean, 
                                   geosd = PKNCA::geosd, 
                                   geocv = PKNCA::geocv,
                                   median, min, max)) %>% 
  mutate(`Arithmetic mean ± SD (CV%)` = sprintf('%0.1f ± %0.1f (%0.1f%%)', mean, sd, cv)) %>% 
  mutate(`Geometric mean ± SD (CV%)` = sprintf('%0.1f ± %0.1f (%0.1f%%)', geomean, geosd, geocv)) %>% 
  mutate(`Median [range]` = sprintf('%0.1f [%0.1f-%0.1f]', median, min, max)) %>% 
  select(-mean, -sd, -cv, -geomean, -geosd, -geocv, -median, -min, -max) %>% 
  filter(PPTESTCD %in% c('CMAX', 'TMAX', 'AUCLST', 'AUCIFO')) %>% 
  kable(caption = 'Descriptive statistics of selected PK parameters manually calculated.', 
        booktabs = TRUE) 
```

\begin{table}

\caption{(\#tab:unnamed-chunk-2)Descriptive statistics of selected PK parameters manually calculated.}
\centering
\begin{tabular}[t]{llrlll}
\toprule
PPTESTCD & UNIT & n & Arithmetic mean ± SD (CV\%) & Geometric mean ± SD (CV\%) & Median [range]\\
\midrule
AUCIFO & h*ug/L & 12 & 122.2 ± 38.1 (31.2\%) & 117.7 ± 1.3 (28.0\%) & 106.7 [84.3-216.6]\\
AUCLST & h*ug/L & 12 & 103.8 ± 23.6 (22.8\%) & 101.5 ± 1.2 (22.3\%) & 95.4 [73.8-148.9]\\
CMAX & ug/L & 12 & 8.8 ± 1.5 (16.8\%) & 8.6 ± 1.2 (17.0\%) & 8.5 [6.4-11.4]\\
TMAX & h & 12 & 1.8 ± 1.1 (62.2\%) & 1.5 ± 1.8 (64.7\%) & 1.1 [0.6-3.5]\\
\bottomrule
\end{tabular}
\end{table}

Although there's an advantage of customization, the script is quite lengthy, so if you're not preparing a journal paper, I'll just use `broom::tidy()`.

\pagebreak




<!--chapter:end:12-tblNCA2.Rmd-->


# R에 내장된 자료의 비구획분석 보고서 {#groupreport}

## Theoph의 보고서 {#theophgroup}


```r
ID=6

                        NONCOMPARTMENTAL ANALYSIS REPORT
                       Package version 0.3.7 (2017-08-16 KST)
                          R version 3.4.2 (2017-09-28)

Date and Time: 2017-11-15 16:16:21 KST

Calculation Setting
-------------------
Drug Administration: Extravascular
Observation count excluding trailing zero: 11
Dose at time 0: 320 mg
AUC Calculation Method: Linear-up Linear-down
Weighting for lambda z: Uniform (Ordinary Least Square, OLS)
Lambda z selection criterion: Heighest adjusted R-squared value with precision=1e-4


Fitting, AUC, AUMC Result
-------------------------
      Time         Conc.      Pred.   Residual       AUC       AUMC
---------------------------------------------------------------------
     0.0000       0.0000                           0.0000     0.0000
     0.2700       1.2900                           0.1742     0.0470
     0.5800       3.0800                           0.8515     0.3779
     1.1500       6.4400                           3.5647     2.9977
     2.0300 *     6.3200     6.3928 -7.284e-02     9.1791    11.9014
     3.5700 *     5.5300     5.5844 -5.438e-02    18.3036    36.9816
     5.0000 *     4.9400     4.9255 +1.450e-02    25.7897    68.7577
     7.0000 *     4.0200     4.1323 -1.123e-01    34.7497   121.5977
     9.2200 *     3.4600     3.4005 +5.948e-02    43.0525   188.2434
    12.1000 *     2.7800     2.6408 +1.392e-01    52.0381   282.6199
    23.8500 *     0.9200     0.9413 -2.127e-02    73.7756   609.1524

*: Used for the calculation of Lambda z.


Calculated Values
-----------------
CMAX       Max Conc                                        6.4400 mg/L
CMAXD      Max Conc Norm by Dose                           0.0201 mg/L/mg
TMAX       Time of CMAX                                    1.1500 h
TLAG       Time Until First Nonzero Conc                   0.0000 h
CLST       Last Nonzero Conc                               0.9200 mg/L
CLSTP      Last Nonzero Conc Pred                          0.9413 mg/L
TLST       Time of Last Nonzero Conc                      23.8500 h
LAMZHL     Half-Life Lambda z                              7.8950 h
LAMZ       Lambda z                                        0.0878 /h
LAMZLL     Lambda z Lower Limit                            2.0300 h
LAMZUL     Lambda z Upper Limit                           23.8500 h
LAMZNPT    Number of Points for Lambda z                   7
CORRXY     Correlation Between TimeX and Log ConcY        -0.9991 
R2         R Squared                                       0.9982 
R2ADJ      R Squared Adjusted                              0.9979 
AUCLST     AUC to Last Nonzero Conc                       73.7756 h*mg/L
AUCALL     AUC All                                        73.7756 h*mg/L
AUCIFO     AUC Infinity Obs                               84.2544 h*mg/L
AUCIFOD    AUC Infinity Obs Norm by Dose                   0.2633 h*mg/L/mg
AUCIFP     AUC Infinity Pred                              84.4967 h*mg/L
AUCIFPD    AUC Infinity Pred Norm by Dose                  0.2641 h*mg/L/mg
AUCPEO     AUC %Extrapolation Obs                         12.4372 %
AUCPEP     AUC %Extrapolation Pred                        12.6882 %
AUMCLST    AUMC to Last Nonzero Conc                     609.1524 h2*mg/L
AUMCIFO    AUMC Infinity Obs                             978.4285 h2*mg/L
AUMCIFP    AUMC Infinity Pred                            986.9665 h2*mg/L
AUMCPEO    AUMC %Extrapolation Obs                        37.7418 %
AUMCPEP    AUMC % Extrapolation Pred                      38.2803 %
VZFO       Vz Obs by F                                    43.2597 L
VZFP       Vz Pred by F                                   43.1357 L
CLFO       Total CL Obs by F                               3.7980 L/h
CLFP       Total CL Pred by F                              3.7871 L/h
MRTEVLST   MRT Extravasc to Last Nonzero Conc              8.2568 h
MRTEVIFO   MRT Extravasc Infinity Obs                     11.6128 h
MRTEVIFP   MRT Extravasc Infinity Pred                    11.6805 h





ID=7

                        NONCOMPARTMENTAL ANALYSIS REPORT
                       Package version 0.3.7 (2017-08-16 KST)
                          R version 3.4.2 (2017-09-28)

Date and Time: 2017-11-15 16:16:21 KST

Calculation Setting
-------------------
Drug Administration: Extravascular
Observation count excluding trailing zero: 11
Dose at time 0: 320 mg
AUC Calculation Method: Linear-up Linear-down
Weighting for lambda z: Uniform (Ordinary Least Square, OLS)
Lambda z selection criterion: Heighest adjusted R-squared value with precision=1e-4


Fitting, AUC, AUMC Result
-------------------------
      Time         Conc.      Pred.   Residual       AUC       AUMC
---------------------------------------------------------------------
     0.0000       0.1500                           0.0000     0.0000
     0.2500       0.8500                           0.1250     0.0266
     0.5000       2.3500                           0.5250     0.2000
     1.0200       5.0200                           2.4412     1.8368
     2.0200       6.5800                           8.2412    11.0428
     3.4800       7.0900                          18.2203    38.7571
     5.0000       6.6600                          28.6703    82.8167
     6.9800 *     5.2500     5.3226 -7.260e-02    40.4612   152.0623
     9.0000 *     4.3900     4.4527 -6.275e-02    50.1976   228.9788
    12.0500 *     3.5300     3.4011 +1.289e-01    62.2756   354.0998
    24.2200 *     1.1500     1.1607 -1.072e-02    90.7534   782.4199

*: Used for the calculation of Lambda z.


Calculated Values
-----------------
CMAX       Max Conc                                        7.0900 mg/L
CMAXD      Max Conc Norm by Dose                           0.0222 mg/L/mg
TMAX       Time of CMAX                                    3.4800 h
TLAG       Time Until First Nonzero Conc                   0.0000 h
CLST       Last Nonzero Conc                               1.1500 mg/L
CLSTP      Last Nonzero Conc Pred                          1.1607 mg/L
TLST       Time of Last Nonzero Conc                      24.2200 h
LAMZHL     Half-Life Lambda z                              7.8467 h
LAMZ       Lambda z                                        0.0883 /h
LAMZLL     Lambda z Lower Limit                            6.9800 h
LAMZUL     Lambda z Upper Limit                           24.2200 h
LAMZNPT    Number of Points for Lambda z                   4
CORRXY     Correlation Between TimeX and Log ConcY        -0.9993 
R2         R Squared                                       0.9987 
R2ADJ      R Squared Adjusted                              0.9980 
AUCLST     AUC to Last Nonzero Conc                       90.7534 h*mg/L
AUCALL     AUC All                                        90.7534 h*mg/L
AUCIFO     AUC Infinity Obs                              103.7718 h*mg/L
AUCIFOD    AUC Infinity Obs Norm by Dose                   0.3243 h*mg/L/mg
AUCIFP     AUC Infinity Pred                             103.8931 h*mg/L
AUCIFPD    AUC Infinity Pred Norm by Dose                  0.3247 h*mg/L/mg
AUCPEO     AUC %Extrapolation Obs                         12.5452 %
AUCPEP     AUC %Extrapolation Pred                        12.6474 %
AUMCLST    AUMC to Last Nonzero Conc                     782.4199 h2*mg/L
AUMCIFO    AUMC Infinity Obs                            1245.0984 h2*mg/L
AUMCIFP    AUMC Infinity Pred                           1249.4111 h2*mg/L
AUMCPEO    AUMC %Extrapolation Obs                        37.1600 %
AUMCPEP    AUMC % Extrapolation Pred                      37.3769 %
VZFO       Vz Obs by F                                    34.9084 L
VZFP       Vz Pred by F                                   34.8677 L
CLFO       Total CL Obs by F                               3.0837 L/h
CLFP       Total CL Pred by F                              3.0801 L/h
MRTEVLST   MRT Extravasc to Last Nonzero Conc              8.6214 h
MRTEVIFO   MRT Extravasc Infinity Obs                     11.9984 h
MRTEVIFP   MRT Extravasc Infinity Pred                    12.0259 h





ID=8

                        NONCOMPARTMENTAL ANALYSIS REPORT
                       Package version 0.3.7 (2017-08-16 KST)
                          R version 3.4.2 (2017-09-28)

Date and Time: 2017-11-15 16:16:21 KST

Calculation Setting
-------------------
Drug Administration: Extravascular
Observation count excluding trailing zero: 11
Dose at time 0: 320 mg
AUC Calculation Method: Linear-up Linear-down
Weighting for lambda z: Uniform (Ordinary Least Square, OLS)
Lambda z selection criterion: Heighest adjusted R-squared value with precision=1e-4


Fitting, AUC, AUMC Result
-------------------------
      Time         Conc.      Pred.   Residual       AUC       AUMC
---------------------------------------------------------------------
     0.0000       0.0000                           0.0000     0.0000
     0.2500       3.0500                           0.3813     0.0953
     0.5200       3.0500                           1.2048     0.4124
     0.9800       7.3100                           3.5875     2.4248
     2.0200       7.5600                          11.3200    14.0910
     3.5300 *     6.5900     6.5724 +1.758e-02    22.0032    43.1841
     5.0500 *     5.8800     5.8071 +7.292e-02    31.4804    83.4312
     7.1500 *     4.7300     4.8941 -1.641e-01    42.6209   150.1204
     9.0700 *     4.5700     4.1856 +3.844e-01    51.5489   222.3790
    12.1000 *     3.0000     3.2702 -2.702e-01    63.0175   340.1701
    24.1200 *     1.2500     1.2285 +2.147e-02    88.5600   739.5346

*: Used for the calculation of Lambda z.


Calculated Values
-----------------
CMAX       Max Conc                                        7.5600 mg/L
CMAXD      Max Conc Norm by Dose                           0.0236 mg/L/mg
TMAX       Time of CMAX                                    2.0200 h
TLAG       Time Until First Nonzero Conc                   0.0000 h
CLST       Last Nonzero Conc                               1.2500 mg/L
CLSTP      Last Nonzero Conc Pred                          1.2285 mg/L
TLST       Time of Last Nonzero Conc                      24.1200 h
LAMZHL     Half-Life Lambda z                              8.5100 h
LAMZ       Lambda z                                        0.0815 /h
LAMZLL     Lambda z Lower Limit                            3.5300 h
LAMZUL     Lambda z Upper Limit                           24.1200 h
LAMZNPT    Number of Points for Lambda z                   6
CORRXY     Correlation Between TimeX and Log ConcY        -0.9955 
R2         R Squared                                       0.9910 
R2ADJ      R Squared Adjusted                              0.9888 
AUCLST     AUC to Last Nonzero Conc                       88.5600 h*mg/L
AUCALL     AUC All                                        88.5600 h*mg/L
AUCIFO     AUC Infinity Obs                              103.9067 h*mg/L
AUCIFOD    AUC Infinity Obs Norm by Dose                   0.3247 h*mg/L/mg
AUCIFP     AUC Infinity Pred                             103.6431 h*mg/L
AUCIFPD    AUC Infinity Pred Norm by Dose                  0.3239 h*mg/L/mg
AUCPEO     AUC %Extrapolation Obs                         14.7697 %
AUCPEP     AUC %Extrapolation Pred                        14.5529 %
AUMCLST    AUMC to Last Nonzero Conc                     739.5346 h2*mg/L
AUMCIFO    AUMC Infinity Obs                            1298.1158 h2*mg/L
AUMCIFP    AUMC Infinity Pred                           1288.5201 h2*mg/L
AUMCPEO    AUMC %Extrapolation Obs                        43.0302 %
AUMCPEP    AUMC % Extrapolation Pred                      42.6059 %
VZFO       Vz Obs by F                                    37.8105 L
VZFP       Vz Pred by F                                   37.9067 L
CLFO       Total CL Obs by F                               3.0797 L/h
CLFP       Total CL Pred by F                              3.0875 L/h
MRTEVLST   MRT Extravasc to Last Nonzero Conc              8.3507 h
MRTEVIFO   MRT Extravasc Infinity Obs                     12.4931 h
MRTEVIFP   MRT Extravasc Infinity Pred                    12.4323 h





ID=11

                        NONCOMPARTMENTAL ANALYSIS REPORT
                       Package version 0.3.7 (2017-08-16 KST)
                          R version 3.4.2 (2017-09-28)

Date and Time: 2017-11-15 16:16:21 KST

Calculation Setting
-------------------
Drug Administration: Extravascular
Observation count excluding trailing zero: 11
Dose at time 0: 320 mg
AUC Calculation Method: Linear-up Linear-down
Weighting for lambda z: Uniform (Ordinary Least Square, OLS)
Lambda z selection criterion: Heighest adjusted R-squared value with precision=1e-4


Fitting, AUC, AUMC Result
-------------------------
      Time         Conc.      Pred.   Residual       AUC       AUMC
---------------------------------------------------------------------
     0.0000       0.0000                           0.0000     0.0000
     0.2500       4.8600                           0.6075     0.1519
     0.5000       7.2400                           2.1200     0.7563
     0.9800       8.0000                           5.7776     3.5067
     1.9800       6.8100                          13.1826    14.1686
     3.6000       5.8700                          23.4534    42.2073
     5.0200       5.2200                          31.3273    75.8162
     7.0300       4.4500                          41.0457   133.5915
     9.0300 *     3.6200     3.6169 +3.150e-03    49.1156   197.5636
    12.1200 *     2.6900     2.6929 -2.948e-03    58.8646   298.4388
    24.0800 *     0.8600     0.8598 +1.934e-04    80.0936   617.2422

*: Used for the calculation of Lambda z.


Calculated Values
-----------------
CMAX       Max Conc                                        8.0000 mg/L
CMAXD      Max Conc Norm by Dose                           0.0250 mg/L/mg
TMAX       Time of CMAX                                    0.9800 h
TLAG       Time Until First Nonzero Conc                   0.0000 h
CLST       Last Nonzero Conc                               0.8600 mg/L
CLSTP      Last Nonzero Conc Pred                          0.8598 mg/L
TLST       Time of Last Nonzero Conc                      24.0800 h
LAMZHL     Half-Life Lambda z                              7.2612 h
LAMZ       Lambda z                                        0.0955 /h
LAMZLL     Lambda z Lower Limit                            9.0300 h
LAMZUL     Lambda z Upper Limit                           24.0800 h
LAMZNPT    Number of Points for Lambda z                   3
CORRXY     Correlation Between TimeX and Log ConcY        -1.0000 
R2         R Squared                                       1.0000 
R2ADJ      R Squared Adjusted                              1.0000 
AUCLST     AUC to Last Nonzero Conc                       80.0936 h*mg/L
AUCALL     AUC All                                        80.0936 h*mg/L
AUCIFO     AUC Infinity Obs                               89.1027 h*mg/L
AUCIFOD    AUC Infinity Obs Norm by Dose                   0.2784 h*mg/L/mg
AUCIFP     AUC Infinity Pred                              89.1007 h*mg/L
AUCIFPD    AUC Infinity Pred Norm by Dose                  0.2784 h*mg/L/mg
AUCPEO     AUC %Extrapolation Obs                         10.1110 %
AUCPEP     AUC %Extrapolation Pred                        10.1089 %
AUMCLST    AUMC to Last Nonzero Conc                     617.2422 h2*mg/L
AUMCIFO    AUMC Infinity Obs                             928.5600 h2*mg/L
AUMCIFP    AUMC Infinity Pred                            928.4900 h2*mg/L
AUMCPEO    AUMC %Extrapolation Obs                        33.5269 %
AUMCPEP    AUMC % Extrapolation Pred                      33.5219 %
VZFO       Vz Obs by F                                    37.6222 L
VZFP       Vz Pred by F                                   37.6230 L
CLFO       Total CL Obs by F                               3.5914 L/h
CLFP       Total CL Pred by F                              3.5914 L/h
MRTEVLST   MRT Extravasc to Last Nonzero Conc              7.7065 h
MRTEVIFO   MRT Extravasc Infinity Obs                     10.4212 h
MRTEVIFP   MRT Extravasc Infinity Pred                    10.4207 h





ID=3

                        NONCOMPARTMENTAL ANALYSIS REPORT
                       Package version 0.3.7 (2017-08-16 KST)
                          R version 3.4.2 (2017-09-28)

Date and Time: 2017-11-15 16:16:21 KST

Calculation Setting
-------------------
Drug Administration: Extravascular
Observation count excluding trailing zero: 11
Dose at time 0: 320 mg
AUC Calculation Method: Linear-up Linear-down
Weighting for lambda z: Uniform (Ordinary Least Square, OLS)
Lambda z selection criterion: Heighest adjusted R-squared value with precision=1e-4


Fitting, AUC, AUMC Result
-------------------------
      Time         Conc.      Pred.   Residual       AUC       AUMC
---------------------------------------------------------------------
     0.0000       0.0000                           0.0000     0.0000
     0.2700       4.4000                           0.5940     0.1604
     0.5800       6.9000                           2.3455     0.9648
     1.0200       8.2000                           5.6675     3.6854
     2.0200       7.8000                          13.6675    15.7453
     3.6200       7.5000                          25.9075    50.0702
     5.0800       6.2000                          35.9085    92.8817
     7.0700       5.3000                          47.3510   161.5039
     9.0000 *     4.9000     4.9914 -9.138e-02    57.1940   240.2199
    12.1500 *     3.7000     3.6147 +8.528e-02    70.7390   380.4815
    24.1700 *     1.0500     1.0551 -5.097e-03    99.2865   803.1859

*: Used for the calculation of Lambda z.


Calculated Values
-----------------
CMAX       Max Conc                                        8.2000 mg/L
CMAXD      Max Conc Norm by Dose                           0.0256 mg/L/mg
TMAX       Time of CMAX                                    1.0200 h
TLAG       Time Until First Nonzero Conc                   0.0000 h
CLST       Last Nonzero Conc                               1.0500 mg/L
CLSTP      Last Nonzero Conc Pred                          1.0551 mg/L
TLST       Time of Last Nonzero Conc                      24.1700 h
LAMZHL     Half-Life Lambda z                              6.7661 h
LAMZ       Lambda z                                        0.1024 /h
LAMZLL     Lambda z Lower Limit                            9.0000 h
LAMZUL     Lambda z Upper Limit                           24.1700 h
LAMZNPT    Number of Points for Lambda z                   3
CORRXY     Correlation Between TimeX and Log ConcY        -0.9997 
R2         R Squared                                       0.9993 
R2ADJ      R Squared Adjusted                              0.9986 
AUCLST     AUC to Last Nonzero Conc                       99.2865 h*mg/L
AUCALL     AUC All                                        99.2865 h*mg/L
AUCIFO     AUC Infinity Obs                              109.5360 h*mg/L
AUCIFOD    AUC Infinity Obs Norm by Dose                   0.3423 h*mg/L/mg
AUCIFP     AUC Infinity Pred                             109.5857 h*mg/L
AUCIFPD    AUC Infinity Pred Norm by Dose                  0.3425 h*mg/L/mg
AUCPEO     AUC %Extrapolation Obs                          9.3572 %
AUCPEP     AUC %Extrapolation Pred                         9.3983 %
AUMCLST    AUMC to Last Nonzero Conc                     803.1859 h2*mg/L
AUMCIFO    AUMC Infinity Obs                            1150.9648 h2*mg/L
AUMCIFP    AUMC Infinity Pred                           1152.6529 h2*mg/L
AUMCPEO    AUMC %Extrapolation Obs                        30.2163 %
AUMCPEP    AUMC % Extrapolation Pred                      30.3185 %
VZFO       Vz Obs by F                                    28.5171 L
VZFP       Vz Pred by F                                   28.5042 L
CLFO       Total CL Obs by F                               2.9214 L/h
CLFP       Total CL Pred by F                              2.9201 L/h
MRTEVLST   MRT Extravasc to Last Nonzero Conc              8.0896 h
MRTEVIFO   MRT Extravasc Infinity Obs                     10.5076 h
MRTEVIFP   MRT Extravasc Infinity Pred                    10.5183 h





ID=2

                        NONCOMPARTMENTAL ANALYSIS REPORT
                       Package version 0.3.7 (2017-08-16 KST)
                          R version 3.4.2 (2017-09-28)

Date and Time: 2017-11-15 16:16:21 KST

Calculation Setting
-------------------
Drug Administration: Extravascular
Observation count excluding trailing zero: 11
Dose at time 0: 320 mg
AUC Calculation Method: Linear-up Linear-down
Weighting for lambda z: Uniform (Ordinary Least Square, OLS)
Lambda z selection criterion: Heighest adjusted R-squared value with precision=1e-4


Fitting, AUC, AUMC Result
-------------------------
      Time         Conc.      Pred.   Residual       AUC       AUMC
---------------------------------------------------------------------
     0.0000       0.0000                           0.0000     0.0000
     0.2700       1.7200                           0.2322     0.0627
     0.5200       7.9100                           1.4360     0.6349
     1.0000       8.3100                           5.3287     3.6165
     1.9200       8.3300                          12.9832    14.7961
     3.5000       6.8500                          24.9754    46.3713
     5.0200       6.0800                          34.8022    87.7887
     7.0300 *     5.4000     5.3629 +3.707e-02    46.3396   156.6147
     9.0000 *     4.5500     4.3687 +1.813e-01    56.1403   234.3431
    12.0000 *     3.0100     3.1970 -1.870e-01    67.4803   349.9481
    24.3000 *     0.9000     0.8886 +1.136e-02    91.5268   706.5866

*: Used for the calculation of Lambda z.


Calculated Values
-----------------
CMAX       Max Conc                                        8.3300 mg/L
CMAXD      Max Conc Norm by Dose                           0.0260 mg/L/mg
TMAX       Time of CMAX                                    1.9200 h
TLAG       Time Until First Nonzero Conc                   0.0000 h
CLST       Last Nonzero Conc                               0.9000 mg/L
CLSTP      Last Nonzero Conc Pred                          0.8886 mg/L
TLST       Time of Last Nonzero Conc                      24.3000 h
LAMZHL     Half-Life Lambda z                              6.6593 h
LAMZ       Lambda z                                        0.1041 /h
LAMZLL     Lambda z Lower Limit                            7.0300 h
LAMZUL     Lambda z Upper Limit                           24.3000 h
LAMZNPT    Number of Points for Lambda z                   4
CORRXY     Correlation Between TimeX and Log ConcY        -0.9986 
R2         R Squared                                       0.9972 
R2ADJ      R Squared Adjusted                              0.9958 
AUCLST     AUC to Last Nonzero Conc                       91.5268 h*mg/L
AUCALL     AUC All                                        91.5268 h*mg/L
AUCIFO     AUC Infinity Obs                              100.1735 h*mg/L
AUCIFOD    AUC Infinity Obs Norm by Dose                   0.3130 h*mg/L/mg
AUCIFP     AUC Infinity Pred                             100.0643 h*mg/L
AUCIFPD    AUC Infinity Pred Norm by Dose                  0.3127 h*mg/L/mg
AUCPEO     AUC %Extrapolation Obs                          8.6317 %
AUCPEP     AUC %Extrapolation Pred                         8.5320 %
AUMCLST    AUMC to Last Nonzero Conc                     706.5866 h2*mg/L
AUMCIFO    AUMC Infinity Obs                             999.7723 h2*mg/L
AUMCIFP    AUMC Infinity Pred                            996.0716 h2*mg/L
AUMCPEO    AUMC %Extrapolation Obs                        29.3252 %
AUMCPEP    AUMC % Extrapolation Pred                      29.0627 %
VZFO       Vz Obs by F                                    30.6904 L
VZFP       Vz Pred by F                                   30.7239 L
CLFO       Total CL Obs by F                               3.1945 L/h
CLFP       Total CL Pred by F                              3.1979 L/h
MRTEVLST   MRT Extravasc to Last Nonzero Conc              7.7200 h
MRTEVIFO   MRT Extravasc Infinity Obs                      9.9804 h
MRTEVIFP   MRT Extravasc Infinity Pred                     9.9543 h





ID=4

                        NONCOMPARTMENTAL ANALYSIS REPORT
                       Package version 0.3.7 (2017-08-16 KST)
                          R version 3.4.2 (2017-09-28)

Date and Time: 2017-11-15 16:16:21 KST

Calculation Setting
-------------------
Drug Administration: Extravascular
Observation count excluding trailing zero: 11
Dose at time 0: 320 mg
AUC Calculation Method: Linear-up Linear-down
Weighting for lambda z: Uniform (Ordinary Least Square, OLS)
Lambda z selection criterion: Heighest adjusted R-squared value with precision=1e-4


Fitting, AUC, AUMC Result
-------------------------
      Time         Conc.      Pred.   Residual       AUC       AUMC
---------------------------------------------------------------------
     0.0000       0.0000                           0.0000     0.0000
     0.3500       1.8900                           0.3308     0.1158
     0.6000       4.6000                           1.1420     0.5435
     1.0700       8.6000                           4.2440     3.3545
     2.1300       8.3800                          13.2434    17.6918
     3.5000       7.5400                          24.1486    47.9958
     5.0200       6.8800                          35.1078    94.3007
     7.0200       5.7800                          47.7678   169.4139
     9.0200 *     5.3300     5.4586 -1.286e-01    58.8778   258.0661
    11.9800 *     4.1900     4.0686 +1.214e-01    72.9674   403.5099
    24.6500 *     1.1500     1.1564 -6.422e-03   106.7963   901.0842

*: Used for the calculation of Lambda z.


Calculated Values
-----------------
CMAX       Max Conc                                        8.6000 mg/L
CMAXD      Max Conc Norm by Dose                           0.0269 mg/L/mg
TMAX       Time of CMAX                                    1.0700 h
TLAG       Time Until First Nonzero Conc                   0.0000 h
CLST       Last Nonzero Conc                               1.1500 mg/L
CLSTP      Last Nonzero Conc Pred                          1.1564 mg/L
TLST       Time of Last Nonzero Conc                      24.6500 h
LAMZHL     Half-Life Lambda z                              6.9812 h
LAMZ       Lambda z                                        0.0993 /h
LAMZLL     Lambda z Lower Limit                            9.0200 h
LAMZUL     Lambda z Upper Limit                           24.6500 h
LAMZNPT    Number of Points for Lambda z                   3
CORRXY     Correlation Between TimeX and Log ConcY        -0.9995 
R2         R Squared                                       0.9989 
R2ADJ      R Squared Adjusted                              0.9978 
AUCLST     AUC to Last Nonzero Conc                      106.7963 h*mg/L
AUCALL     AUC All                                       106.7963 h*mg/L
AUCIFO     AUC Infinity Obs                              118.3789 h*mg/L
AUCIFOD    AUC Infinity Obs Norm by Dose                   0.3699 h*mg/L/mg
AUCIFP     AUC Infinity Pred                             118.4436 h*mg/L
AUCIFPD    AUC Infinity Pred Norm by Dose                  0.3701 h*mg/L/mg
AUCPEO     AUC %Extrapolation Obs                          9.7843 %
AUCPEP     AUC %Extrapolation Pred                         9.8336 %
AUMCLST    AUMC to Last Nonzero Conc                     901.0842 h2*mg/L
AUMCIFO    AUMC Infinity Obs                            1303.2524 h2*mg/L
AUMCIFP    AUMC Infinity Pred                           1305.4981 h2*mg/L
AUMCPEO    AUMC %Extrapolation Obs                        30.8588 %
AUMCPEP    AUMC % Extrapolation Pred                      30.9777 %
VZFO       Vz Obs by F                                    27.2260 L
VZFP       Vz Pred by F                                   27.2111 L
CLFO       Total CL Obs by F                               2.7032 L/h
CLFP       Total CL Pred by F                              2.7017 L/h
MRTEVLST   MRT Extravasc to Last Nonzero Conc              8.4374 h
MRTEVIFO   MRT Extravasc Infinity Obs                     11.0092 h
MRTEVIFP   MRT Extravasc Infinity Pred                    11.0221 h





ID=9

                        NONCOMPARTMENTAL ANALYSIS REPORT
                       Package version 0.3.7 (2017-08-16 KST)
                          R version 3.4.2 (2017-09-28)

Date and Time: 2017-11-15 16:16:21 KST

Calculation Setting
-------------------
Drug Administration: Extravascular
Observation count excluding trailing zero: 11
Dose at time 0: 320 mg
AUC Calculation Method: Linear-up Linear-down
Weighting for lambda z: Uniform (Ordinary Least Square, OLS)
Lambda z selection criterion: Heighest adjusted R-squared value with precision=1e-4


Fitting, AUC, AUMC Result
-------------------------
      Time         Conc.      Pred.   Residual       AUC       AUMC
---------------------------------------------------------------------
     0.0000       0.0000                           0.0000     0.0000
     0.3000       7.3700                           1.1055     0.3316
     0.6300       9.0300                           3.8115     1.6351
     1.0500       7.1400                           7.2072     4.4042
     2.0200       6.3300                          13.7402    14.2417
     3.5300       5.6600                          22.7926    38.9804
     5.0200       5.6700                          31.2335    75.0705
     7.1700       4.2400                          41.8867   138.3495
     8.8000 *     4.1100     4.0512 +5.880e-02    48.6920   192.6031
    11.6000 *     3.1600     3.2160 -5.597e-02    58.8700   294.5567
    24.4300 *     1.1200     1.1165 +3.517e-03    86.3262   705.2296

*: Used for the calculation of Lambda z.


Calculated Values
-----------------
CMAX       Max Conc                                        9.0300 mg/L
CMAXD      Max Conc Norm by Dose                           0.0282 mg/L/mg
TMAX       Time of CMAX                                    0.6300 h
TLAG       Time Until First Nonzero Conc                   0.0000 h
CLST       Last Nonzero Conc                               1.1200 mg/L
CLSTP      Last Nonzero Conc Pred                          1.1165 mg/L
TLST       Time of Last Nonzero Conc                      24.4300 h
LAMZHL     Half-Life Lambda z                              8.4060 h
LAMZ       Lambda z                                        0.0825 /h
LAMZLL     Lambda z Lower Limit                            8.8000 h
LAMZUL     Lambda z Upper Limit                           24.4300 h
LAMZNPT    Number of Points for Lambda z                   3
CORRXY     Correlation Between TimeX and Log ConcY        -0.9997 
R2         R Squared                                       0.9994 
R2ADJ      R Squared Adjusted                              0.9989 
AUCLST     AUC to Last Nonzero Conc                       86.3262 h*mg/L
AUCALL     AUC All                                        86.3262 h*mg/L
AUCIFO     AUC Infinity Obs                               99.9087 h*mg/L
AUCIFOD    AUC Infinity Obs Norm by Dose                   0.3122 h*mg/L/mg
AUCIFP     AUC Infinity Pred                              99.8661 h*mg/L
AUCIFPD    AUC Infinity Pred Norm by Dose                  0.3121 h*mg/L/mg
AUCPEO     AUC %Extrapolation Obs                         13.5950 %
AUCPEP     AUC %Extrapolation Pred                        13.5581 %
AUMCLST    AUMC to Last Nonzero Conc                     705.2296 h2*mg/L
AUMCIFO    AUMC Infinity Obs                            1201.7715 h2*mg/L
AUMCIFP    AUMC Infinity Pred                           1200.2124 h2*mg/L
AUMCPEO    AUMC %Extrapolation Obs                        41.3175 %
AUMCPEP    AUMC % Extrapolation Pred                      41.2413 %
VZFO       Vz Obs by F                                    38.8428 L
VZFP       Vz Pred by F                                   38.8594 L
CLFO       Total CL Obs by F                               3.2029 L/h
CLFP       Total CL Pred by F                              3.2043 L/h
MRTEVLST   MRT Extravasc to Last Nonzero Conc              8.1694 h
MRTEVIFO   MRT Extravasc Infinity Obs                     12.0287 h
MRTEVIFP   MRT Extravasc Infinity Pred                    12.0182 h





ID=12

                        NONCOMPARTMENTAL ANALYSIS REPORT
                       Package version 0.3.7 (2017-08-16 KST)
                          R version 3.4.2 (2017-09-28)

Date and Time: 2017-11-15 16:16:21 KST

Calculation Setting
-------------------
Drug Administration: Extravascular
Observation count excluding trailing zero: 11
Dose at time 0: 320 mg
AUC Calculation Method: Linear-up Linear-down
Weighting for lambda z: Uniform (Ordinary Least Square, OLS)
Lambda z selection criterion: Heighest adjusted R-squared value with precision=1e-4


Fitting, AUC, AUMC Result
-------------------------
      Time         Conc.      Pred.   Residual       AUC       AUMC
---------------------------------------------------------------------
     0.0000       0.0000                           0.0000     0.0000
     0.2500       1.2500                           0.1563     0.0391
     0.5000       3.9600                           0.8075     0.3256
     1.0000       7.8200                           3.7525     2.7756
     2.0000       9.7200                          12.5225    16.4056
     3.5200       9.7500                          27.3197    57.2632
     5.0700       8.5700                          41.5177   117.5349
     7.0700       6.5900                          56.6777   207.5761
     9.0300 *     6.1100     6.2267 -1.167e-01    69.1237   307.3054
    12.0500 *     4.5700     4.4632 +1.068e-01    85.2505   473.7705
    24.1500 *     1.1700     1.1755 -5.539e-03   119.9775   977.8807

*: Used for the calculation of Lambda z.


Calculated Values
-----------------
CMAX       Max Conc                                        9.7500 mg/L
CMAXD      Max Conc Norm by Dose                           0.0305 mg/L/mg
TMAX       Time of CMAX                                    3.5200 h
TLAG       Time Until First Nonzero Conc                   0.0000 h
CLST       Last Nonzero Conc                               1.1700 mg/L
CLSTP      Last Nonzero Conc Pred                          1.1755 mg/L
TLST       Time of Last Nonzero Conc                      24.1500 h
LAMZHL     Half-Life Lambda z                              6.2865 h
LAMZ       Lambda z                                        0.1103 /h
LAMZLL     Lambda z Lower Limit                            9.0300 h
LAMZUL     Lambda z Upper Limit                           24.1500 h
LAMZNPT    Number of Points for Lambda z                   3
CORRXY     Correlation Between TimeX and Log ConcY        -0.9997 
R2         R Squared                                       0.9994 
R2ADJ      R Squared Adjusted                              0.9988 
AUCLST     AUC to Last Nonzero Conc                      119.9775 h*mg/L
AUCALL     AUC All                                       119.9775 h*mg/L
AUCIFO     AUC Infinity Obs                              130.5888 h*mg/L
AUCIFOD    AUC Infinity Obs Norm by Dose                   0.4081 h*mg/L/mg
AUCIFP     AUC Infinity Pred                             130.6391 h*mg/L
AUCIFPD    AUC Infinity Pred Norm by Dose                  0.4082 h*mg/L/mg
AUCPEO     AUC %Extrapolation Obs                          8.1258 %
AUCPEP     AUC %Extrapolation Pred                         8.1611 %
AUMCLST    AUMC to Last Nonzero Conc                     977.8807 h2*mg/L
AUMCIFO    AUMC Infinity Obs                            1330.3840 h2*mg/L
AUMCIFP    AUMC Infinity Pred                           1332.0528 h2*mg/L
AUMCPEO    AUMC %Extrapolation Obs                        26.4964 %
AUMCPEP    AUMC % Extrapolation Pred                      26.5884 %
VZFO       Vz Obs by F                                    22.2243 L
VZFP       Vz Pred by F                                   22.2157 L
CLFO       Total CL Obs by F                               2.4504 L/h
CLFP       Total CL Pred by F                              2.4495 L/h
MRTEVLST   MRT Extravasc to Last Nonzero Conc              8.1505 h
MRTEVIFO   MRT Extravasc Infinity Obs                     10.1876 h
MRTEVIFP   MRT Extravasc Infinity Pred                    10.1964 h





ID=10

                        NONCOMPARTMENTAL ANALYSIS REPORT
                       Package version 0.3.7 (2017-08-16 KST)
                          R version 3.4.2 (2017-09-28)

Date and Time: 2017-11-15 16:16:21 KST

Calculation Setting
-------------------
Drug Administration: Extravascular
Observation count excluding trailing zero: 11
Dose at time 0: 320 mg
AUC Calculation Method: Linear-up Linear-down
Weighting for lambda z: Uniform (Ordinary Least Square, OLS)
Lambda z selection criterion: Heighest adjusted R-squared value with precision=1e-4


Fitting, AUC, AUMC Result
-------------------------
      Time         Conc.      Pred.   Residual       AUC       AUMC
---------------------------------------------------------------------
     0.0000       0.2400                           0.0000     0.0000
     0.3700       2.8900                           0.5790     0.1978
     0.7700       5.2200                           2.2011     1.2156
     1.0200       6.4100                           3.6548     2.5353
     2.0500       7.8300                          10.9884    14.1690
     3.5500      10.2100                          24.5184    53.3917
     5.0500       9.1800                          39.0609   115.3451
     7.0800       8.0200                          56.5189   220.0328
     9.3800 *     7.1400     7.0610 +7.903e-02    73.9529   362.3508
    12.1000 *     5.6800     5.7586 -7.858e-02    91.3881   546.9044
    23.7000 *     2.4200     2.4137 +6.308e-03   138.3681  1278.1800

*: Used for the calculation of Lambda z.


Calculated Values
-----------------
CMAX       Max Conc                                       10.2100 mg/L
CMAXD      Max Conc Norm by Dose                           0.0319 mg/L/mg
TMAX       Time of CMAX                                    3.5500 h
TLAG       Time Until First Nonzero Conc                   0.0000 h
CLST       Last Nonzero Conc                               2.4200 mg/L
CLSTP      Last Nonzero Conc Pred                          2.4137 mg/L
TLST       Time of Last Nonzero Conc                      23.7000 h
LAMZHL     Half-Life Lambda z                              9.2469 h
LAMZ       Lambda z                                        0.0750 /h
LAMZLL     Lambda z Lower Limit                            9.3800 h
LAMZUL     Lambda z Upper Limit                           23.7000 h
LAMZNPT    Number of Points for Lambda z                   3
CORRXY     Correlation Between TimeX and Log ConcY        -0.9998 
R2         R Squared                                       0.9995 
R2ADJ      R Squared Adjusted                              0.9990 
AUCLST     AUC to Last Nonzero Conc                      138.3681 h*mg/L
AUCALL     AUC All                                       138.3681 h*mg/L
AUCIFO     AUC Infinity Obs                              170.6521 h*mg/L
AUCIFOD    AUC Infinity Obs Norm by Dose                   0.5333 h*mg/L/mg
AUCIFP     AUC Infinity Pred                             170.5679 h*mg/L
AUCIFPD    AUC Infinity Pred Norm by Dose                  0.5330 h*mg/L/mg
AUCPEO     AUC %Extrapolation Obs                         18.9180 %
AUCPEP     AUC %Extrapolation Pred                        18.8780 %
AUMCLST    AUMC to Last Nonzero Conc                    1278.1800 h2*mg/L
AUMCIFO    AUMC Infinity Obs                            2473.9934 h2*mg/L
AUMCIFP    AUMC Infinity Pred                           2470.8765 h2*mg/L
AUMCPEO    AUMC %Extrapolation Obs                        48.3354 %
AUMCPEP    AUMC % Extrapolation Pred                      48.2702 %
VZFO       Vz Obs by F                                    25.0155 L
VZFP       Vz Pred by F                                   25.0279 L
CLFO       Total CL Obs by F                               1.8752 L/h
CLFP       Total CL Pred by F                              1.8761 L/h
MRTEVLST   MRT Extravasc to Last Nonzero Conc              9.2375 h
MRTEVIFO   MRT Extravasc Infinity Obs                     14.4973 h
MRTEVIFP   MRT Extravasc Infinity Pred                    14.4862 h





ID=1

                        NONCOMPARTMENTAL ANALYSIS REPORT
                       Package version 0.3.7 (2017-08-16 KST)
                          R version 3.4.2 (2017-09-28)

Date and Time: 2017-11-15 16:16:21 KST

Calculation Setting
-------------------
Drug Administration: Extravascular
Observation count excluding trailing zero: 11
Dose at time 0: 320 mg
AUC Calculation Method: Linear-up Linear-down
Weighting for lambda z: Uniform (Ordinary Least Square, OLS)
Lambda z selection criterion: Heighest adjusted R-squared value with precision=1e-4


Fitting, AUC, AUMC Result
-------------------------
      Time         Conc.      Pred.   Residual       AUC       AUMC
---------------------------------------------------------------------
     0.0000       0.7400                           0.0000     0.0000
     0.2500       2.8400                           0.4475     0.0888
     0.5700       6.5700                           1.9531     0.8015
     1.1200      10.5000                           6.6474     5.0654
     2.0200       9.6600                          15.7194    19.1383
     3.8200       8.5800                          32.1354    66.1982
     5.1000       8.3600                          42.9769   114.4617
     7.0300       7.4700                          58.2529   206.2815
     9.0500 *     6.8900     6.8912 -1.228e-03    72.7565   322.2988
    12.1200 *     5.9400     5.9387 +1.324e-03    92.4505   528.5219
    24.3700 *     3.2800     3.2801 -1.465e-04   148.9231  1459.0711

*: Used for the calculation of Lambda z.


Calculated Values
-----------------
CMAX       Max Conc                                       10.5000 mg/L
CMAXD      Max Conc Norm by Dose                           0.0328 mg/L/mg
TMAX       Time of CMAX                                    1.1200 h
TLAG       Time Until First Nonzero Conc                   0.0000 h
CLST       Last Nonzero Conc                               3.2800 mg/L
CLSTP      Last Nonzero Conc Pred                          3.2801 mg/L
TLST       Time of Last Nonzero Conc                      24.3700 h
LAMZHL     Half-Life Lambda z                             14.3044 h
LAMZ       Lambda z                                        0.0485 /h
LAMZLL     Lambda z Lower Limit                            9.0500 h
LAMZUL     Lambda z Upper Limit                           24.3700 h
LAMZNPT    Number of Points for Lambda z                   3
CORRXY     Correlation Between TimeX and Log ConcY        -1.0000 
R2         R Squared                                       1.0000 
R2ADJ      R Squared Adjusted                              1.0000 
AUCLST     AUC to Last Nonzero Conc                      148.9231 h*mg/L
AUCALL     AUC All                                       148.9231 h*mg/L
AUCIFO     AUC Infinity Obs                              216.6119 h*mg/L
AUCIFOD    AUC Infinity Obs Norm by Dose                   0.6769 h*mg/L/mg
AUCIFP     AUC Infinity Pred                             216.6150 h*mg/L
AUCIFPD    AUC Infinity Pred Norm by Dose                  0.6769 h*mg/L/mg
AUCPEO     AUC %Extrapolation Obs                         31.2489 %
AUCPEP     AUC %Extrapolation Pred                        31.2499 %
AUMCLST    AUMC to Last Nonzero Conc                    1459.0711 h2*mg/L
AUMCIFO    AUMC Infinity Obs                            4505.5348 h2*mg/L
AUMCIFP    AUMC Infinity Pred                           4505.6709 h2*mg/L
AUMCPEO    AUMC %Extrapolation Obs                        67.6160 %
AUMCPEP    AUMC % Extrapolation Pred                      67.6170 %
VZFO       Vz Obs by F                                    30.4867 L
VZFP       Vz Pred by F                                   30.4863 L
CLFO       Total CL Obs by F                               1.4773 L/h
CLFP       Total CL Pred by F                              1.4773 L/h
MRTEVLST   MRT Extravasc to Last Nonzero Conc              9.7975 h
MRTEVIFO   MRT Extravasc Infinity Obs                     20.8000 h
MRTEVIFP   MRT Extravasc Infinity Pred                    20.8004 h





ID=5

                        NONCOMPARTMENTAL ANALYSIS REPORT
                       Package version 0.3.7 (2017-08-16 KST)
                          R version 3.4.2 (2017-09-28)

Date and Time: 2017-11-15 16:16:21 KST

Calculation Setting
-------------------
Drug Administration: Extravascular
Observation count excluding trailing zero: 11
Dose at time 0: 320 mg
AUC Calculation Method: Linear-up Linear-down
Weighting for lambda z: Uniform (Ordinary Least Square, OLS)
Lambda z selection criterion: Heighest adjusted R-squared value with precision=1e-4


Fitting, AUC, AUMC Result
-------------------------
      Time         Conc.      Pred.   Residual       AUC       AUMC
---------------------------------------------------------------------
     0.0000       0.0000                           0.0000     0.0000
     0.3000       2.0200                           0.3030     0.0909
     0.5200       5.6300                           1.1445     0.4796
     1.0000      11.4000                           5.2317     3.9182
     2.0200       9.3300                          15.8040    19.3440
     3.5000       8.7400                          29.1758    55.9271
     5.0200       7.5600                          41.5638   108.0184
     7.0200 *     7.0900     6.9799 +1.101e-01    56.2138   195.7414
     9.1000 *     5.9000     5.8291 +7.091e-02    69.7234   303.3417
    12.0000 *     4.3700     4.5343 -1.643e-01    84.6149   457.2302
    24.3500 *     1.5700     1.5557 +1.430e-02   121.2944  1017.1143

*: Used for the calculation of Lambda z.


Calculated Values
-----------------
CMAX       Max Conc                                       11.4000 mg/L
CMAXD      Max Conc Norm by Dose                           0.0356 mg/L/mg
TMAX       Time of CMAX                                    1.0000 h
TLAG       Time Until First Nonzero Conc                   0.0000 h
CLST       Last Nonzero Conc                               1.5700 mg/L
CLSTP      Last Nonzero Conc Pred                          1.5557 mg/L
TLST       Time of Last Nonzero Conc                      24.3500 h
LAMZHL     Half-Life Lambda z                              8.0023 h
LAMZ       Lambda z                                        0.0866 /h
LAMZLL     Lambda z Lower Limit                            7.0200 h
LAMZUL     Lambda z Upper Limit                           24.3500 h
LAMZNPT    Number of Points for Lambda z                   4
CORRXY     Correlation Between TimeX and Log ConcY        -0.9993 
R2         R Squared                                       0.9986 
R2ADJ      R Squared Adjusted                              0.9980 
AUCLST     AUC to Last Nonzero Conc                      121.2944 h*mg/L
AUCALL     AUC All                                       121.2944 h*mg/L
AUCIFO     AUC Infinity Obs                              139.4198 h*mg/L
AUCIFOD    AUC Infinity Obs Norm by Dose                   0.4357 h*mg/L/mg
AUCIFP     AUC Infinity Pred                             139.2546 h*mg/L
AUCIFPD    AUC Infinity Pred Norm by Dose                  0.4352 h*mg/L/mg
AUCPEO     AUC %Extrapolation Obs                         13.0006 %
AUCPEP     AUC %Extrapolation Pred                        12.8974 %
AUMCLST    AUMC to Last Nonzero Conc                    1017.1143 h2*mg/L
AUMCIFO    AUMC Infinity Obs                            1667.7216 h2*mg/L
AUMCIFP    AUMC Infinity Pred                           1661.7937 h2*mg/L
AUMCPEO    AUMC %Extrapolation Obs                        39.0117 %
AUMCPEP    AUMC % Extrapolation Pred                      38.7942 %
VZFO       Vz Obs by F                                    26.4980 L
VZFP       Vz Pred by F                                   26.5294 L
CLFO       Total CL Obs by F                               2.2952 L/h
CLFP       Total CL Pred by F                              2.2979 L/h
MRTEVLST   MRT Extravasc to Last Nonzero Conc              8.3855 h
MRTEVIFO   MRT Extravasc Infinity Obs                     11.9619 h
MRTEVIFP   MRT Extravasc Infinity Pred                    11.9335 h
```

# 지원 {#support}

패키지와 관련한 모든 의문은 <shan@acp.kr> / 02-3010-4614 으로 연락 주시면 빠르게 도움 드리겠습니다.
혹은 StackOverflow^[https://stackoverflow.com]에 영어로 질문 올려주시고 링크를 보내주시면 더 좋습니다.

# 세션 정보 {#session-info}


```r
devtools::session_info()
```

```
##  setting  value                       
##  version  R version 3.4.2 (2017-09-28)
##  system   x86_64, mingw32             
##  ui       RTerm                       
##  language (EN)                        
##  collate  Korean_Korea.949            
##  tz       Asia/Seoul                  
##  date     2017-11-15                  
## 
##  package   * version date       source                           
##  backports   1.1.1   2017-09-25 CRAN (R 3.4.1)                   
##  base      * 3.4.2   2017-09-28 local                            
##  bookdown    0.5.9   2017-11-14 Github (rstudio/bookdown@83d914f)
##  compiler    3.4.2   2017-09-28 local                            
##  datasets  * 3.4.2   2017-09-28 local                            
##  devtools    1.13.4  2017-11-09 CRAN (R 3.4.2)                   
##  digest      0.6.12  2017-01-27 CRAN (R 3.4.0)                   
##  evaluate    0.10.1  2017-06-24 CRAN (R 3.4.1)                   
##  graphics  * 3.4.2   2017-09-28 local                            
##  grDevices * 3.4.2   2017-09-28 local                            
##  htmltools   0.3.6   2017-04-28 CRAN (R 3.4.0)                   
##  knitr       1.17.9  2017-11-15 Github (yihui/knitr@6f69c42)     
##  magrittr    1.5     2014-11-22 CRAN (R 3.4.0)                   
##  memoise     1.1.0   2017-04-21 CRAN (R 3.4.0)                   
##  methods     3.4.2   2017-09-28 local                            
##  Rcpp        0.12.13 2017-09-28 CRAN (R 3.4.2)                   
##  rmarkdown   1.7     2017-11-10 CRAN (R 3.4.2)                   
##  rprojroot   1.2     2017-01-16 CRAN (R 3.4.0)                   
##  stats     * 3.4.2   2017-09-28 local                            
##  stringi     1.1.5   2017-04-07 CRAN (R 3.4.0)                   
##  stringr     1.2.0   2017-02-18 CRAN (R 3.4.0)                   
##  tools       3.4.2   2017-09-28 local                            
##  utils     * 3.4.2   2017-09-28 local                            
##  withr       2.1.0   2017-11-01 CRAN (R 3.4.2)
```






<!--chapter:end:99-references.Rmd-->

