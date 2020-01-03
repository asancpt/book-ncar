
---
#documentclass: book
#papersize: A4
#fontsize: 10pt
#documentclass: krantz
#geometry: "margin=4in"               
#geometry: "a4paper,left=1.5in,right=1.5in,top=1in,bottom=1in"
#geometry: "a4paper, nohead, nomarginpar, left=1.5in,right=1.5in,top=5in,bottom=3in,foot=1in"
#geometry: "a4paper, nohead, nomarginpar"
#geometry: "total={6.5in,8.75in}, top=1.2in, left=0.9in, includefoot"
#geometry: "a4paper, nohead, nomarginpar, left=1.5in,right=1.5in,top=1in,bottom=1in, includeheadfoot"
title: "R을 사용한 비구획분석"
author: "배균섭, 한성필, 윤석규, 조용순, 김형섭"
description: "이 책은 R 패키지를 사용하여 비구획분석을 쉽게 따라할 수 있도록 쓰여졌습니다.  값비싼 상용소프트웨어와 동일한 결과를 얻으면서, 한번 익혀두면 속도와 연속성 측면에서 잇점이 많은 것을 발견할 수 있을 것입니다.  무엇보다 무료로 사용할 수 있는 R기반의 공개 소프트웨어라는 점에서 많은 연구자 혹은 기관에서 손쉽게 설치하고 실행할 수 있으리라 생각됩니다."
date: "2020-01-03"
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





# Preface {-}

[<img src="assets/cover.jpg" style="max-width:20%;min-width:80px;float:right;margin: 10px 10px 5px 5px" alt="Github repo" />](https://github.com/asancpt/book-ncar)

이 책은 R을 사용하여 비구획분석을 수행할 수 있도록 소개할 것입니다. 
값비싼 상용 소프트웨어와 동일한 결과를 얻을 수 있음을 실제 임상시험 자료를 통해 반복적으로 확인하였습니다. 
숫자 계산 뿐만 아니라 시각화도 가능하여 농도-시간 곡선, 용량군 별 파라메터의 forest plot 등의 유용한 그림도 쉽게 그릴 수 있습니다.
CDISC SDTM 표준을 따르는 용어를 사용한 것도 큰 장점입니다.
비구획분석 후 생물학적동등성을 평가할 수 있는 패키지도 함께 개발되었습니다.

한번 익혀두면 속도와 연속성 측면에서 커다란 잇점이 있음을 것을 발견할 수 있을 것입니다. 
또한 재현가능한 연구를 보다 수월하게 구현할 수 있습니다.
무엇보다 무료로 사용할 수 있는 R기반의 공개 소프트웨어라는 점에서 학교, 연구소, 정부기관, 제약회사 등에서 라이센스 등의 제약 없이 손쉽게 설치하고 실행할 수 있으리라 생각됩니다.
책에 대한 피드백, 오탈자 신고 등은 [깃허브 저장소](https://github.com/asancpt/book-ncar/issues)에 남겨주십시오.

감사합니다.

2020-01-03  
서울아산병원 임상약리학과, 울산대학교 임상약리학교실  
교수 배균섭,  
한성필, 윤석규, 조용순, 김형섭

*배균섭*  
서울아산병원 임상약리학과 과장, 울산대학교 의과대학 임상약리학교실 교수입니다. 수십편의 논문을 저술하였고 20년 이상의 프로그래밍 경력을 갖고 있습니다.

*한성필*  
가톨릭의대 약리학교실 연구강사입니다. 부산대학교 의학전문대학원을 졸업하였습니다.

*윤석규*  
서울아산병원 임상약리학과 전공의입니다. 연세대학교 원주캠퍼스 의과대학을 졸업하였습니다.

*조용순*  
인제의대 약리학교실 조교수입니다. 중앙대학교 의학전문대학원을 졸업하였습니다.

*김형섭*  
서울아산병원 임상약리학과 전공의입니다. 고려대학교 의학전문대학원을 졸업하였습니다.

![Creative Commons License](assets/cc.png)  
이 저작물은 [크리에이티브 커먼즈 저작자표시-비영리-동일조건변경허락 4.0 국제 라이선스](http://creativecommons.org/licenses/by-nc-sa/4.0/) 에 따라 이용할 수 있습니다.

<!-- https://creativecommons.org/choose/?lang=ko -->

**감사의 글**

본 출판물은 2016-2020년도 정부(미래창조과학부)의 재원으로 한국연구재단 첨단 사이언스·교육 허브 개발 사업의 지원을 받아 수행된 연구입니다 (NRF-2016-936606).

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

이 방식을 계속 이용하여 각각의 구간 값의 합을 모두 더한 값으로 AUC~last~(처음 농도를 측정하기 시작한 구간부터 마지막 농도를 측정한 구간까지 linear trapezoidal method를 통해서 값을 계산한 방식), AUMC~last~(처음 농도를 측정하기 시작한 구간부터 마지막 농도를 측정한 구간까지 linear trapezoidal method를 통해서 값을 계산한 방식)를 측정해 주게 됩니다. (그림 \@ref(fig:trapezoid))


```r
knitr::include_graphics('assets/trapezoidal.png')
```

\begin{figure}
\includegraphics[width=1\linewidth]{assets/trapezoidal} \caption{Linear trapezoidal method}(\#fig:trapezoid)
\end{figure}

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

**C0**  
C0 is the initial concentration at the dosing time. It is the observed concentration at the dosing time, if available. Otherwise it is approximated using the following rules. For iv-bolus data, log-linear back-extrapolation (*see "backExtrap" argument*) is performed from the first two observations to estimate C0, provided the local slope is negative. However, if the slope is >=0 or at least one of the first two concentrations is 0, the first non-zero concentration is used as C0. For other types of administration, C0 is equal to 0 for non steady-state data and for steady-state data the minimum value observed between the dosing intervals is used to estimate C0, provided the "backExtrap" argument is set to "yes".

**Cmax, Tmax and Cmax_D**  
Cmax and Tmax are the value and the time of maximum observed concentration, respectively. If the maximum concentration is not unique, the first maximum is used. For steady state data, The maximum value between the dosing intervals is considered. Cmax_D is the dose normalized maximum observed concentration.

**Clast and Tlast**  
Clast and Tlast are the last measurable positive concentration and the corresponding time, respectively.

**AUClast**  
The area under the concentration vs. time curve from the first observed to last measurable concentration.

**AUMClast**  
The area under the first moment of the concentration vs. time curve from the first observed to last measurable concentration.

**MRTlast**  
Mean residence time from the first observed to last measurable concentration. For non-infusion models,  
$MRTlast = \frac{AUMClast}{AUClast}$  
For infusion models,  
$MRTlast = \frac{AUMClast}{AUClast}-\frac{TI}{2}$  
where TI is the infusion duration.

**No_points_Lambda_z**  
No_points_Lambda_z is the number of observed data points used to determine the best fitting regression line in the elimination phase.

**AUC_pBack_Ext_obs and AUC_pBack_Ext_pred**  
The percentage of AUC that is contributed by the back extrapolation to estimate C0. The rules to to estimate C0 is given above.

**AUClower_upper**  
The AUC under the concentration-time profile within the user-specified window of time provided as the "AUCTimeRange" argument. In case of empty "AUCTimeRange" argument, AUClower_upper is equal to the AUClast.

**Rsq, Rsq_adjusted and Corr_XY**  
Regression coefficient of the regression line used to estimate the elimination rate constant. Rsq_adjusted is the adjusted value of Rsq given by the following relation.  
$Rsq\_adjusted = 1-\frac{(1-Rsq^2)*(n-1)}{n-2}$  
where *n* is the number of points in the regression line. Corr_XY is the square root of Rsq.

**Lambda_z**  
Elimination rate constant estimated from the regression line representing the terminal phase of the concentration-time profile. The relation between the slope of the regression line and Lambda_z is:  
$Lambda\_z = -(slope)$

**Lambda_lower and Lambda_upper**  
Lower and upper limit of the time values from the concentration-time profile used to estimate Lambda_z, respectively, in case the "LambdaTimeRange" is used to specify the time range.

**HL_Lambda_z**  
Terminal half-life of the drug:  
$HL\_Lambda\_z = \frac{ln2}{\lambda_z}$

**AUCINF_obs and AUCINF_obs_D**  
AUC estimated from the first sampled data extrapolated to ${\infty}$. The extrapolation in the terminal phase is based on the last observed concentration (${Clast_obs}$). The equation used for the estimation is given below.  
$AUCINF\_obs = AUClast+\frac{Clast\_obs}{\lambda_z}$  
AUCINF_obs_D is the dose normalized AUCINF_obs.

**AUC_pExtrap_obs**  
Percentage of the AUCINF_obs that is contributed by the extrapolation from the last sampling time to ${\infty}$.  
$AUC\_pExtrap\_obs = \frac{AUCINF\_obs-AUClast}{AUCINF\_obs}*100\%$

**AUMCINF_obs**  
AUMC estimated from the first sampled data extrapolated to ${\infty}$. The extrapolation in the terminal phase is based on the last observed concentration. The equation used for the estimation is given below.  
$AUMCINF\_obs = AUMClast+\frac{Tlast*Clast\_obs}{\lambda_z}+\frac{Clast\_obs}{\lambda_{z}^2}$

**AUMC_pExtrap_obs**  
Percentage of the AUMCINF_obs that is contributed by the extrapolation from the last sampling time to ${\infty}$.  
$AUMC\_pExtrap\_obs = \frac{AUMCINF\_obs-AUMClast}{AUMCINF\_obs}*100\%$

**Vz_obs**  
Volume of distribution estimated based on total AUC using the following equation.  
$Vz\_obs = \frac{Dose}{\lambda_z*AUCINF\_obs}$

**Cl_obs**  
Total body clearance.
$Cl\_obs = \frac{Dose}{AUCINF\_obs}$

**AUCINF_pred and AUCINF_pred_D**  
AUC from the first sampled data extrapolated to ${\infty}$. The extrapolation in the terminal phase is based on the last predicted concentration obtained from the regression line used to estimate Lambda_z (${Clast\_pred}$). The equation used for the estimation is given below.  
$AUCINF\_pred = AUClast+\frac{Clast\_pred}{\lambda_z}$  
AUCINF_pred_D is the dose normalized AUCINF_pred.

**AUC_pExtrap_pred**  
Percentage of the AUCINF_pred that is contributed by the extrapolation from the last sampling time to ${\infty}$.  
$AUC\_pExtrap\_pred = \frac{AUCINF\_pred-AUClast}{AUCINF\_pred}*100\%$

**AUMCINF_pred**  
AUMC estimated from the first sampled data extrapolated to ${\infty}$. The extrapolation in the terminal phase is based on the last predicted concentration obtained from the regression line used to estimate Lambda_z (${Clast\_pred}$). The equation used for the estimation is given below.  

$AUMCINF\_pred = AUMClast+\frac{Tlast*Clast\_pred}{\lambda_z}+\frac{Clast\_pred}{\lambda_{z}^2}$  

**AUMC_pExtrap_pred**  
Percentage of the AUMCINF_pred that is contributed by the extrapolation from the last sampling time to ${\infty}$.  
$AUMC\_pExtrap\_pred = \frac{AUMCINF\_pred-AUMClast}{AUMCINF\_pred}*100\%$  

**Vz_pred**  
Volume of distribution estimated based on total AUC using the following equation.  
$Vz\_pred = \frac{Dose}{\lambda_z*AUCINF\_pred}$  

**Cl_pred**  
Total body clearance.  
$Cl\_pred = \frac{Dose}{AUCINF\_pred}$

**MRTINF_obs**  
Mean residence time from the first sampled time extrapolated to ${\infty}$ based on the last observed concentration (${Clast\_obs}$).  
For non-infusion non steady-state data:  
$MRTINF\_obs = \frac{AUMCINF\_obs}{AUCINF\_obs}$  
For infusion non steady-state data:  
$MRTINF\_obs = \frac{AUMCINF\_obs}{AUCINF\_obs}-\frac{TI}{2}$  
where ${TI}$ is the infusion duration. For non-infusion steady-state data:  
$MRTINF\_obs = \frac{AUMCINF\_obs|_{0}^{\tau}+\tau*(AUCINF\_obs-AUC|_{0}^{\tau})}{AUCINF\_obs|_{0}^{\tau}}$  
For infusion steady-state data:  
$MRTINF\_obs = \frac{AUMCINF\_obs|_{0}^{\tau}+\tau*(AUCINF\_obs-AUC|_{0}^{\tau})}{AUCINF\_obs|_{0}^{\tau}}-\frac{TI}{2}$  
For steady-state data ${\tau}$ represents the dosing interval.

**MRTINF_pred**  
Mean residence time from the first sampled time extrapolated to ${\infty}$ based on the last predicted concentration obtained from the regression line used to estimate Lambda_z (${Clast\_pred}$).  
For non-infusion non steady-state data:  
$MRTINF\_pred = \frac{AUMCINF\_pred}{AUCINF\_pred}$  
For infusion non steady-state data:  
$MRTINF\_pred = \frac{AUMCINF\_pred}{AUCINF\_pred}-\frac{TI}{2}$  
where ${TI}$ is the infusion duration.  
For non-infusion steady-state data:  
$MRTINF\_pred = \frac{AUMCINF\_pred|_{0}^{\tau}+\tau*(AUCINF\_pred-AUC|_{0}^{\tau})}{AUCINF\_pred|_{0}^{\tau}}$  
For infusion steady-state data:  
$MRTINF\_pred = \frac{AUMCINF\_pred|_{0}^{\tau}+\tau*(AUCINF\_pred-AUC|_{0}^{\tau})}{AUCINF\_pred|_{0}^{\tau}}-\frac{TI}{2}$  
For steady-state data ${\tau}$ represents the dosing interval.

**Vss_obs and Vss_pred**  
An estimate of the volume of distribution at steady-state.  
$Vss\_obs = MRTINF\_obs*Cl\_obs$  
$Vss\_pred = MRTINF\_pred*Cl\_pred$  

**Tau**  
The dosing interval for steady-state data. This value is assumed to be the same over multiple doses.

**Cmin and Tmin**  
Cmin is the minimum concentration between 0 and Tau and Tmin is the corresponding time for steady-state data.

**Cavg**  
The average concentration between 0 and Tau for steady-state data.  
$Cavg = \frac{AUC|_{0}^{Tau}}{Tau}$

**p_Fluctuation**  
Percentage of the fluctuation of the concentration between 0 and Tau for steady-state data.  
$p\_Fluctuation = \frac{Cmax-Cmin}{Cavg}*100\%$

**Accumulation_Index**  
$Accumulation\_Index = \frac{1}{1-e^{-\lambda_{z}*\tau}}$  

**Clss**  
An estimate of the total body clearance for steady-state data.  
$Clss = \frac{Dose}{AUC|_{0}^{\tau}}$




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

## 기타 설치 {#otherinstall}

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

자료 분석을 위해 몇가지 도구가 필요한데 `tidyverse`[@R-tidyverse]를 설치하면 다수의 편리한 패키지 `tidyr` [@R-tidyr], `dplyr` [@R-dplyr], `tibble` [@R-tibble], `ggplot2` [@R-ggplot2], `purrr` [@R-purrr], `readr` [@R-readr]의 설치와 불러오기 과정을 쉽게 끝낼 수 있습니다. 

다만 비구획분석을 위한 함수의 입력을 위해 `tibble` 형식은 `as.data.frame()`을 통하여 데이타프레임으로 자료 형식을 변환하는 것이 좋습니다.
마찬가지로 `readr` 패키지의 `read_csv()` 명령어를 쓸 경우 `tibble`로 읽혀지기 때문에 `as.data.frame()`으로 바꿔주거나 처음부터 `read.csv()`를 쓰는 것을 고려할 수 있습니다. 


```r
install.packages('devtools')
devtools::install_github('tidyverse/tidyverse') 
# or `install.packages('tidyverse')`
library(tidyverse)
```

# 기본 자료 {#datasets}

## 이 장에서는 {#introdatasets}

R에는 theophylline과 Indomethacin의 약동학 데이터가 내장되어 있습니다.

- `Theoph`: theophylline의 약동학 데이터, 12명, 320mg PO 단회투여, 0~24시간 채혈, NONMEM 의 run 폴더의 THEOPP 데이터와 동일합니다.
- `Indometh`: Indomethacin의 약동학 데이터, 6명, 25mg IV bolus 단회투여, 0~8시간 채혈(0, 0.25, 0.5, 0.75, 1, 1.25, 2, 3, 4, 5, 6, 8 h)

먼저 데이터를 살펴보겠습니다. 


```r
library(ggplot2)
library(dplyr)
```

## 데이타에 대해 {#TheophData}

Theoph 자료의 첫 10개 (Table \@ref(tab:head)) 혹은 마지막 10개 관찰값만 보고 싶으면 다음을 입력합니다. 
데이터가 Subject, weight, Dose, Time, Concentration 으로 구성되었음을 알 수 있습니다. 대상자 번호가 첫 열에 나와있고 시간 순서대로 혈장에서 측정한 테오필린의 농도가 나와있습니다. 

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

\begin{figure}
\includegraphics[width=1\linewidth]{02-packages_files/figure-latex/ggtheoph-1} \caption{Concentration-time curves of oral administration of Theoph (N = 12)}(\#fig:ggtheoph)
\end{figure}





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

> Conduct a noncompartmental analysis with industrial strength.
             Some features are
             1) Use of CDISC SDTM terms
             2) Automatic or manual slope selection
             3) Supporting both 'linear-up linear-down' and 'linear-up log-down' method
             4) Interval(partial) AUCs with 'linear' or 'log' interpolation method
             * Reference: Gabrielsson J, Weiner D. Pharmacokinetic and Pharmacodynamic Data Analysis - Concepts and Applications. 5th ed. 2016. (ISBN:9198299107).


```r
library(tidyverse)
library(NonCompart)
```

## NonCompart 사용법 {#how-to-use}

tblNCA의 사용법은 다음과 같습니다.


```
## function (concData, key = "Subject", colTime = "Time", colConc = "conc", 
##     dose = 0, adm = "Extravascular", dur = 0, doseUnit = "mg", 
##     timeUnit = "h", concUnit = "ug/L", down = "Linear", R2ADJ = 0.9, 
##     MW = 0) 
## NULL
```

<!---
```r
tblNCA(concData, key = "Subject", colTime = "Time", colConc = "conc", dose = 0, 
       adm = "Extravascular", dur = 0, doseUnit = "mg", timeUnit = "h", 
       concUnit = "ug/L", down = "Linear", R2ADJ = 0.7, MW = 0) # args(NonCompart::tblNCA)
```
--->

`concData`는 데이터셋 이름을 설정합니다. 참고로 `tibble` 형식은 지원하지 않으며 `as.data.frame()` 함수 등을 사용해서 통상적인 `data.frame` 형식이어야 합니다.
`key`는 subject ID의 컬럼명 혹은 treatment code의 컬럼명 (교차시험 등에서)을 벡터 형태로 지정할 수 있습니다. 
`colTime`은 time의 컬럼명, `colConc`는 concentration의 컬럼명 등을 함수 인자로 갖습니다. 그 외 인자들에 대해서 살펴보자면 다음과 같습니다. 

1. `down`
    - AUC와 AUMC를 구하는 trapezoidal method 설정이며, 기본값은 `Linear`입니다.
    - `Linear`와 `Log` 중 선택 가능하며 각각 linear trapezoidal method와 linear-up and log-down method를 의미합니다.
1. `dose`
    - 투여량에 대한 설정입니다. 단위에 주의해야 합니다.  벡터값을 줌으로서 각 대상자별 용량을 다르게 할 수 있습니다.
1. `adm`
    - 투여경로에 대한 설정, 기본값은 "Extravascular"으로 경구 투여 등을 의미합니다.
    - Bolus, Infusion, Extravascular 중에서 선택 가능하다.
1. `dur`
    - 주입하는 기간(infusion duration)을 설정합니다. 기본값은 0입니다.
1. `R2ADJ`
    - `R2ADJ` 값이 설정값 이하인 경우 `DetSlope()`함수에 의해 terminal slope를 수동으로 interactive하게 고를 수 있게됩니다.

이제 약동학 파라미터를 산출하기 위해서는 아래와 같이 하면 됩니다.
우선 Theophylline 의 약동학 파라미터를 구해보겠습니다.


```r
Theoph_nca <- tblNCA(Theoph, "Subject", "Time", "conc", 
                     dose=320, concUnit="mg/L")
Theoph_nca
```

```
##    Subject       b0  CMAX      CMAXD TMAX TLAG CLST     CLSTP  TLST    LAMZHL
## 1        1 2.368785 10.50 0.03281250 1.12    0 3.28 3.2801465 24.37 14.304378
## 2        2 2.411237  8.33 0.02603125 1.92    0 0.90 0.8886398 24.30  6.659342
## 3        3 2.529712  8.20 0.02562500 1.02    0 1.05 1.0550967 24.17  6.766087
## 4        4 2.592755  8.60 0.02687500 1.07    0 1.15 1.1564216 24.65  6.981247
## 5        5 2.551092 11.40 0.03562500 1.00    0 1.57 1.5556951 24.35  8.002264
## 6        6 2.033404  6.44 0.02012500 1.15    0 0.92 0.9412712 23.85  7.894998
## 7        7 2.288550  7.09 0.02215625 3.48    0 1.15 1.1607192 24.22  7.846668
## 8        8 2.170403  7.56 0.02362500 2.02    0 1.25 1.2285268 24.12  8.510038
## 9        9 2.124648  9.03 0.02821875 0.63    0 1.12 1.1164831 24.43  8.405999
## 10      10 2.657705 10.21 0.03190625 3.55    0 2.42 2.4136923 23.70  9.246916
## 11      11 2.147594  8.00 0.02500000 0.98    0 0.86 0.8598066 24.08  7.261237
## 12      12 2.824493  9.75 0.03046875 3.52    0 1.17 1.1755390 24.15  6.286508
##          LAMZ LAMZLL LAMZUL LAMZNPT     CORRXY        R2     R2ADJ    AUCLST
## 1  0.04845700   9.05  24.37       3 -0.9999999 0.9999997 0.9999995 148.92305
## 2  0.10408644   7.03  24.30       4 -0.9985967 0.9971954 0.9957931  91.52680
## 3  0.10244431   9.00  24.17       3 -0.9996624 0.9993250 0.9986499  99.28650
## 4  0.09928702   9.02  24.65       3 -0.9994619 0.9989241 0.9978483 106.79630
## 5  0.08661888   7.02  24.35       4 -0.9993234 0.9986472 0.9979708 121.29440
## 6  0.08779574   2.03  23.85       7 -0.9991203 0.9982413 0.9978896  73.77555
## 7  0.08833650   6.98  24.22       4 -0.9993349 0.9986702 0.9980053  90.75340
## 8  0.08145054   3.53  24.12       6 -0.9954961 0.9910124 0.9887655  88.55995
## 9  0.08245863   8.80  24.43       3 -0.9997218 0.9994437 0.9988873  86.32615
## 10 0.07495982   9.38  23.70       3 -0.9997543 0.9995087 0.9990174 138.36810
## 11 0.09545856   9.03  24.08       3 -0.9999991 0.9999983 0.9999965  80.09360
## 12 0.11025949   9.03  24.15       3 -0.9996984 0.9993968 0.9987936 119.97750
##       AUCALL    AUCIFO   AUCIFOD    AUCIFP   AUCIFPD    AUCPEO    AUCPEP
## 1  148.92305 216.61193 0.6769123 216.61496 0.6769217 31.248917 31.249876
## 2   91.52680 100.17346 0.3130421 100.06432 0.3127010  8.631687  8.532030
## 3   99.28650 109.53597 0.3422999 109.58572 0.3424554  9.357173  9.398325
## 4  106.79630 118.37888 0.3699340 118.44356 0.3701361  9.784331  9.833594
## 5  121.29440 139.41978 0.4356868 139.25463 0.4351707 13.000579 12.897403
## 6   73.77555  84.25442 0.2632951  84.49670 0.2640522 12.437174 12.688246
## 7   90.75340 103.77180 0.3242869 103.89315 0.3246661 12.545221 12.647366
## 8   88.55995 103.90669 0.3247084 103.64305 0.3238845 14.769730 14.552931
## 9   86.32615  99.90872 0.3122147  99.86607 0.3120815 13.594978 13.558076
## 10 138.36810 170.65206 0.5332877 170.56791 0.5330247 18.918002 18.878001
## 11  80.09360  89.10274 0.2784461  89.10072 0.2784397 10.110962 10.108918
## 12 119.97750 130.58883 0.4080901 130.63907 0.4082471  8.125757  8.161087
##      AUMCLST   AUMCIFO   AUMCIFP  AUMCPEO  AUMCPEP     VZFO     VZFP     CLFO
## 1  1459.0711 4505.5348 4505.6709 67.61603 67.61701 30.48675 30.48632 1.477296
## 2   706.5866  999.7723  996.0716 29.32525 29.06267 30.69044 30.72392 3.194459
## 3   803.1859 1150.9648 1152.6529 30.21629 30.31850 28.51710 28.50415 2.921415
## 4   901.0842 1303.2524 1305.4981 30.85881 30.97775 27.22596 27.21110 2.703185
## 5  1017.1143 1667.7216 1661.7937 39.01174 38.79419 26.49799 26.52942 2.295227
## 6   609.1524  978.4285  986.9665 37.74176 38.28034 43.25973 43.13569 3.798020
## 7   782.4199 1245.0984 1249.4111 37.16000 37.37691 34.90844 34.86767 3.083689
## 8   739.5346 1298.1158 1288.5201 43.03015 42.60589 37.81051 37.90669 3.079686
## 9   705.2296 1201.7715 1200.2124 41.31750 41.24126 38.84279 38.85938 3.202924
## 10 1278.1800 2473.9934 2470.8765 48.33535 48.27018 25.01554 25.02788 1.875160
## 11  617.2422  928.5600  928.4900 33.52694 33.52193 37.62219 37.62304 3.591360
## 12  977.8807 1330.3840 1332.0528 26.49636 26.58844 22.22429 22.21575 2.450439
##        CLFP MRTEVLST  MRTEVIFO  MRTEVIFP
## 1  1.477276 9.797483 20.800031 20.800368
## 2  3.197943 7.719996  9.980411  9.954313
## 3  2.920088 8.089578 10.507642 10.518276
## 4  2.701709 8.437410 11.009163 11.022112
## 5  2.297949 8.385501 11.961873 11.933490
## 6  3.787130 8.256833 11.612785 11.680533
## 7  3.080088 8.621383 11.998427 12.025924
## 8  3.087520 8.350666 12.493092 12.432287
## 9  3.204292 8.169363 12.028695 12.018220
## 10 1.876086 9.237534 14.497296 14.486174
## 11 3.591441 7.706511 10.421227 10.420679
## 12 2.449497 8.150534 10.187579 10.196436
```

여기서 `dose=320`으로 되었다는 것은 아미노필린 400mg 투여시 테오필린 320mg이 경구로 투여되었음을 의미합니다.



이는 문자(character)로 구성된 matrix로 구성된 결과물과 단위 정보가 담긴 attribute를 포함하고 있습니다.

다음으로 Indomethacin 의 약동학 파라미터를 구해보겠습니다. 
이는 IV bolus 이므로 `adm="bolus"` 인자를 정의해야 합니다. 


```r
Indometh_nca <- tblNCA(Indometh, "Subject", "time", "conc", 
                       dose=25, adm="Bolus", dur=0.5, concUnit="mg/L", R2ADJ=0.5)
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

## 함수 살펴보기 {#functions}

NonCompart 패키지 내의 여러가지 함수를 살펴보겠습니다. AUC(), BestSlope(), DetSlope(), IntAUC(), Interpol(), LinAUC(), LogAUC(), Slope(), sNCA(), tblNCA(), Unit(), UnitUrine(), UT()라는 함수가 있습니다.

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

NonCompart 패키지의 tblNCA()함수를 사용해서 비구획분석 결과를 내면 attr로 names와 units를 등일 갖게 됩니다. 이를 long format의 tidy data로 변환하는 방법은 다음과 같습니다.


```r
left_join(as_tibble(Theoph_nca) %>% 
            gather(PPTESTCD, PPORRES, -Subject),
          tibble(PPTESTCD = attributes(Theoph_nca)$names,
                 UNIT = attributes(Theoph_nca)$units)) %>% 
  arrange(PPTESTCD)
```

```
## # A tibble: 432 x 4
##    Subject PPTESTCD PPORRES UNIT  
##    <ord>   <chr>      <dbl> <chr> 
##  1 1       AUCALL     149.  h*mg/L
##  2 2       AUCALL      91.5 h*mg/L
##  3 3       AUCALL      99.3 h*mg/L
##  4 4       AUCALL     107.  h*mg/L
##  5 5       AUCALL     121.  h*mg/L
##  6 6       AUCALL      73.8 h*mg/L
##  7 7       AUCALL      90.8 h*mg/L
##  8 8       AUCALL      88.6 h*mg/L
##  9 9       AUCALL      86.3 h*mg/L
## 10 10      AUCALL     138.  h*mg/L
## # … with 422 more rows
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

> Conduct a noncompartmental analysis with industrial strength.
             Some features are
             1) CDISC SDTM terms
             2) Automatic or manual slope selection
             3) Supporting both 'linear-up linear-down' and 'linear-up log-down' method
             4) Interval(partial) AUCs with 'linear' or 'log' interpolation method
             5) Produce pdf, rtf, text report files.
             * Reference: Gabrielsson J, Weiner D. Pharmacokinetic and Pharmacodynamic Data Analysis - Concepts and Applications. 5th ed. 2016. (ISBN:9198299107).



```r
library(tidyverse)
library(ncar)
```

## txtNCA()

우선 저장될 폴더를 확인하면 다음과 같습니다.


```r
getwd()
```

```
## [1] "/Users/Sungpil/asancpt/book-ncar"
```

저장될 폴더를 변경하고자 한다면 setwd("저장될 경로") 이렇게 설정하면 됩니다.

`txtNCA()` 함수를 사용하여 한 대상자에 대한 plain text 보고서를 작성할 수 있습니다.


```r
txtNCA(Theoph[Theoph$Subject=="1","Time"],
       Theoph[Theoph$Subject=="1","conc"], 
       dose=320, doseUnit="mg", concUnit="mg/L", timeUnit="h")
```

또한, Theoph 자료의 약동학 파라미터 분석 결과는 아래와 같이 텍스트파일로 저장할 수 있습니다.


```r
writeLines(txtNCA(Theoph[Theoph$Subject=="1","Time"],
                  Theoph[Theoph$Subject=="1","conc"], 
                  dose=320, doseUnit="mg", concUnit="mg/L",
                  timeUnit="h"), 
           'Output-ncar/txtNCA-Theoph.txt')
```

저장된 파일 내용은 아래와 같습니다.


```bash
                        NONCOMPARTMENTAL ANALYSIS REPORT
                       Package version 0.4.2 (2019-09-27 KST)
                          R version 3.6.2 (2019-12-12)

Date and Time: 2020-01-03 15:20:38 Asia/Seoul

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

한편 `txtNCA2()`를 다음과 같이 정의하면 여러 대상자에 대한 보고서를 작성 가능합니다.


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

저장된 파일 내용은 Appendix \@ref(theophgroup) 에서 확인 가능합니다.

<!--Indometh의 경우 Appendix \@ref(indomethgroup)-->

## pdfNCA()

pdfNCA()로 pdf로 결과를 볼 수 있습니다. (Figure \@ref(fig:pdfnca-output))


```r
ncar::pdfNCA(fileName="Output-ncar/pdfNCA-Theoph.pdf", Theoph, key="Subject", 
             colTime="Time",  colConc="conc", dose=320, doseUnit="mg", 
             timeUnit="h", concUnit="mg/L")
```

```
## pdf 
##   2
```


```bash
magick -density 150 Output-ncar/pdfNCA-Theoph.pdf Output-ncar/pdfNCA-Theoph-%02d.png
magick montage Output-ncar/pdfNCA-Theoph-01.png Output-ncar/pdfNCA-Theoph-02.png Output-ncar/montage.png
```

\begin{figure}
\includegraphics[width=1\linewidth]{Output-ncar/montage} \caption{pdfNCA() output}(\#fig:pdfnca-output)
\end{figure}

## rtfNCA()

마이크로소프트 워드에서 편집가능한 rtf파일을 만듭니다.


```r
ncar::rtfNCA(fileName="rtfNCA-Theoph.rtf", Theoph, key="Subject", 
             colTime="Time", colConc="conc", dose=320, doseUnit="mg", 
             timeUnit="h", concUnit="mg/L")
```


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

## pkr 사용법 {#pkr-manual}

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

- ./Output//PK Profile Linear Scale for Theoph.tiff
- ./Output//PK Profile Log 10 Scale for Theoph.tiff
- ./Output//PK Profile with CI for Theoph.tiff 



\begin{figure}
\includegraphics[width=1\linewidth]{Output/PK_Profile_Linear_Scale_for_Theoph} \caption{평균 약동학 파라메터와 그룹 농도-시간 그림 (선형)}(\#fig:unnamed-chunk-6)
\end{figure}

\begin{figure}
\includegraphics[width=1\linewidth]{Output/PK_Profile_Log_10_Scale_for_Theoph} \caption{평균 약동학 파라메터와 그룹 농도-시간 그림 (로그)}(\#fig:unnamed-chunk-7)
\end{figure}

\begin{figure}
\includegraphics[width=1\linewidth]{Output/PK_Profile_with_CI_for_Theoph} \caption{평균 약동학 파라메터와 그룹 평균 농도-시간 그림 (로그)}(\#fig:unnamed-chunk-8)
\end{figure}

또한 개개인 별로 여러개의 그림이 담긴 두개의 PDF 파일이 생성되었습니다.

- ./Output//Individual PK Linear Scale for Theoph.pdf
- ./Output//Individual PK Log 10 Scale for Theoph.pdf 


\begin{figure}
\includegraphics[width=1\linewidth]{Output/Individual_PK_Linear_Scale_for_Theoph00} \caption{약동학 파라메터와 함께 표시되는 농도-시간 그림 (선형)}(\#fig:unnamed-chunk-9)
\end{figure}

\begin{figure}
\includegraphics[width=1\linewidth]{Output/Individual_PK_Log_10_Scale_for_Theoph00} \caption{약동학 파라메터와 함께 표시되는 농도-시간 그림 (로그)}(\#fig:unnamed-chunk-10)
\end{figure}

<!--chapter:end:05-visualization.Rmd-->


# R을 사용한 약동학 시뮬레이션 {#rsimulation}

## 이 장에서는 {#summary-simulation}

## 시뮬레이션에 대하여 {#sim-about}

TBD

`wnl` 패키지가 CRAN에 올라와 있습니다.

## 시뮬레이션 후 비구획분석 {#sim-nca}

TBD

## 앱을 통해 살펴보는 시뮬레이션 {#sim-app}

샤이니 앱을 통해서 시뮬레이션을 구현할 수 있습니다. Shinyapp: PK Simulation - 1 Comp IV or Oral <https://asan.shinyapps.io/pk1c/>


```r
knitr::include_app("https://asan.shinyapps.io/pk1c/") #, height = "600px")
```

<iframe src="https://asan.shinyapps.io/pk1c/?showcase=0" width="1\linewidth" height="400px"></iframe>

### shiny 앱 {#shiny}

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
library(BE)
library(psych)
```

## 기술통계량 구하기 {#stat-desc}

앞서 \@ref(noncompart)장에서 구한 `Theoph_nca`를 갖고 기술 통계량 (평균, 표준편차, 최소값, 최대값, skewness, kurtosis)을 구해보겠습니다. `psych::describe()` 함수를 사용하면 간단히 구할 수 있습니다. 




```r
desc_stat_Theoph_nca <- describe(Theoph_nca) %>% 
  select(n, mean, sd, min, max, skew, kurtosis)

knitr::kable(desc_stat_Theoph_nca, digits = 2)
```


\begin{tabular}{l|r|r|r|r|r|r|r}
\hline
  & n & mean & sd & min & max & skew & kurtosis\\
\hline
Subject* & 12 & 6.50 & 3.61 & 1.00 & 12.00 & 0.00 & -1.50\\
\hline
b0 & 12 & 2.39 & 0.25 & 2.03 & 2.82 & 0.13 & -1.38\\
\hline
CMAX & 12 & 8.76 & 1.47 & 6.44 & 11.40 & 0.21 & -1.19\\
\hline
CMAXD & 12 & 0.03 & 0.00 & 0.02 & 0.04 & 0.21 & -1.19\\
\hline
TMAX & 12 & 1.79 & 1.11 & 0.63 & 3.55 & 0.70 & -1.35\\
\hline
TLAG & 12 & 0.00 & 0.00 & 0.00 & 0.00 & NaN & NaN\\
\hline
CLST & 12 & 1.40 & 0.72 & 0.86 & 3.28 & 1.57 & 1.14\\
\hline
CLSTP & 12 & 1.40 & 0.72 & 0.86 & 3.28 & 1.58 & 1.19\\
\hline
TLST & 12 & 24.20 & 0.25 & 23.70 & 24.65 & -0.28 & -0.57\\
\hline
LAMZHL & 12 & 8.18 & 2.12 & 6.29 & 14.30 & 1.90 & 2.97\\
\hline
LAMZ & 12 & 0.09 & 0.02 & 0.05 & 0.11 & -0.92 & 0.40\\
\hline
LAMZLL & 12 & 7.49 & 2.40 & 2.03 & 9.38 & -1.20 & -0.03\\
\hline
LAMZUL & 12 & 24.20 & 0.25 & 23.70 & 24.65 & -0.28 & -0.57\\
\hline
LAMZNPT & 12 & 3.83 & 1.34 & 3.00 & 7.00 & 1.32 & 0.28\\
\hline
CORRXY & 12 & -1.00 & 0.00 & -1.00 & -1.00 & 2.20 & 3.87\\
\hline
R2 & 12 & 1.00 & 0.00 & 0.99 & 1.00 & -2.20 & 3.87\\
\hline
R2ADJ & 12 & 1.00 & 0.00 & 0.99 & 1.00 & -2.05 & 3.39\\
\hline
AUCLST & 12 & 103.81 & 23.65 & 73.78 & 148.92 & 0.56 & -1.12\\
\hline
AUCALL & 12 & 103.81 & 23.65 & 73.78 & 148.92 & 0.56 & -1.12\\
\hline
AUCIFO & 12 & 122.19 & 38.13 & 84.25 & 216.61 & 1.25 & 0.51\\
\hline
AUCIFOD & 12 & 0.38 & 0.12 & 0.26 & 0.68 & 1.25 & 0.51\\
\hline
AUCIFP & 12 & 122.18 & 38.11 & 84.50 & 216.61 & 1.26 & 0.52\\
\hline
AUCIFPD & 12 & 0.38 & 0.12 & 0.26 & 0.68 & 1.26 & 0.52\\
\hline
AUCPEO & 12 & 13.54 & 6.35 & 8.13 & 31.25 & 1.71 & 2.19\\
\hline
AUCPEP & 12 & 13.54 & 6.34 & 8.16 & 31.25 & 1.72 & 2.23\\
\hline
AUMCLST & 12 & 883.06 & 262.98 & 609.15 & 1459.07 & 0.92 & -0.42\\
\hline
AUMCIFO & 12 & 1590.30 & 1006.57 & 928.56 & 4505.53 & 2.00 & 2.96\\
\hline
AUMCIFP & 12 & 1589.85 & 1006.06 & 928.49 & 4505.67 & 2.01 & 2.97\\
\hline
AUMCPEO & 12 & 38.72 & 11.10 & 26.50 & 67.62 & 1.29 & 1.10\\
\hline
AUMCPEP & 12 & 38.72 & 11.07 & 26.59 & 67.62 & 1.30 & 1.14\\
\hline
VZFO & 12 & 31.93 & 6.47 & 22.22 & 43.26 & 0.20 & -1.40\\
\hline
VZFP & 12 & 31.92 & 6.46 & 22.22 & 43.14 & 0.19 & -1.41\\
\hline
CLFO & 12 & 2.81 & 0.68 & 1.48 & 3.80 & -0.45 & -0.93\\
\hline
CLFP & 12 & 2.81 & 0.68 & 1.48 & 3.79 & -0.46 & -0.93\\
\hline
MRTEVLST & 12 & 8.41 & 0.59 & 7.71 & 9.80 & 0.99 & 0.12\\
\hline
MRTEVIFO & 12 & 12.29 & 2.96 & 9.98 & 20.80 & 1.90 & 2.83\\
\hline
MRTEVIFP & 12 & 12.29 & 2.95 & 9.95 & 20.80 & 1.91 & 2.84\\
\hline
\end{tabular}

## 생물학적 동등성 {#bioequivalence}

생물학적 동등성을 위한 가장 간단한 방법은 `BE` 패키지[@R-BE]를 쓰는 것입니다.  

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
\includegraphics[width=1\linewidth]{assets/twobytwo} \caption{전형적인 2x2 설계}(\#fig:twobytwo)
\end{figure}


```
## function (Data, Columns = c("AUClast", "Cmax", "Tmax"), rtfName = "") 
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
SUBJ & GRP & PRD & TRT & AUClast & Cmax & Tmax\\
\hline
1 & RT & 1 & R & 5018.927 & 1043.13 & 1.04\\
\hline
1 & RT & 2 & T & 6737.507 & 894.21 & 1.03\\
\hline
2 & TR & 1 & T & 4373.970 & 447.26 & 1.01\\
\hline
2 & TR & 2 & R & 6164.276 & 783.92 & 1.98\\
\hline
4 & TR & 1 & T & 5592.993 & 824.42 & 1.97\\
\hline
4 & TR & 2 & R & 5958.160 & 646.31 & 0.97\\
\hline
5 & TR & 1 & T & 3902.590 & 803.70 & 0.80\\
\hline
5 & TR & 2 & R & 4620.156 & 955.30 & 0.74\\
\hline
6 & RT & 1 & R & 3735.274 & 995.34 & 1.02\\
\hline
6 & RT & 2 & T & 4257.802 & 816.33 & 1.00\\
\hline
7 & RT & 1 & R & 4314.993 & 608.99 & 0.95\\
\hline
7 & RT & 2 & T & 5030.372 & 806.57 & 0.74\\
\hline
8 & RT & 1 & R & 6053.098 & 1283.67 & 0.72\\
\hline
8 & RT & 2 & T & 5790.067 & 822.95 & 1.03\\
\hline
9 & RT & 1 & R & 4602.582 & 679.39 & 0.74\\
\hline
9 & RT & 2 & T & 6042.462 & 556.55 & 0.98\\
\hline
10 & RT & 1 & R & 8848.988 & 1136.91 & 1.03\\
\hline
10 & RT & 2 & T & 7349.822 & 1082.79 & 0.97\\
\hline
11 & TR & 1 & T & 3054.096 & 547.73 & 2.02\\
\hline
11 & TR & 2 & R & 4719.175 & 984.69 & 0.54\\
\hline
13 & RT & 1 & R & 4828.682 & 615.17 & 1.00\\
\hline
13 & RT & 2 & T & 4175.434 & 692.26 & 0.97\\
\hline
14 & RT & 1 & R & 4566.275 & 864.56 & 1.03\\
\hline
14 & RT & 2 & T & 5042.649 & 1122.75 & 0.75\\
\hline
15 & TR & 1 & T & 4950.980 & 719.40 & 0.97\\
\hline
15 & TR & 2 & R & 4959.554 & 660.17 & 0.96\\
\hline
16 & RT & 1 & R & 4577.432 & 609.64 & 3.01\\
\hline
16 & RT & 2 & T & 4773.723 & 807.65 & 1.01\\
\hline
17 & RT & 1 & R & 6462.652 & 861.56 & 2.02\\
\hline
17 & RT & 2 & T & 5246.032 & 1187.75 & 0.73\\
\hline
18 & TR & 1 & T & 4754.625 & 919.87 & 0.77\\
\hline
18 & TR & 2 & R & 3214.809 & 1042.84 & 0.53\\
\hline
19 & TR & 1 & T & 7619.304 & 1089.84 & 3.00\\
\hline
19 & TR & 2 & R & 5210.569 & 1127.94 & 2.04\\
\hline
20 & TR & 1 & T & 5063.471 & 1191.46 & 0.71\\
\hline
20 & TR & 2 & R & 6406.634 & 1069.19 & 1.00\\
\hline
21 & RT & 1 & R & 5580.289 & 742.67 & 0.97\\
\hline
21 & RT & 2 & T & 6304.119 & 447.85 & 0.99\\
\hline
22 & RT & 1 & R & 4398.887 & 682.73 & 2.02\\
\hline
22 & RT & 2 & T & 3760.359 & 669.01 & 1.04\\
\hline
23 & TR & 1 & T & 5141.165 & 937.02 & 0.51\\
\hline
23 & TR & 2 & R & 5835.275 & 894.72 & 1.04\\
\hline
24 & TR & 1 & T & 4343.439 & 713.57 & 1.03\\
\hline
24 & TR & 2 & R & 2848.448 & 811.83 & 0.71\\
\hline
25 & TR & 1 & T & 3983.260 & 1160.32 & 0.73\\
\hline
25 & TR & 2 & R & 3476.389 & 769.63 & 0.78\\
\hline
27 & TR & 1 & T & 5772.972 & 1219.56 & 0.99\\
\hline
27 & TR & 2 & R & 7673.260 & 1063.29 & 1.03\\
\hline
28 & RT & 1 & R & 5679.039 & 650.24 & 1.00\\
\hline
28 & RT & 2 & T & 5160.875 & 891.63 & 1.05\\
\hline
29 & TR & 1 & T & 4800.455 & 770.63 & 2.02\\
\hline
29 & TR & 2 & R & 5772.925 & 738.17 & 1.04\\
\hline
30 & RT & 1 & R & 4722.324 & 1034.11 & 0.77\\
\hline
30 & RT & 2 & T & 2896.939 & 569.22 & 1.03\\
\hline
31 & RT & 1 & R & 8032.393 & 1043.82 & 1.98\\
\hline
31 & RT & 2 & T & 6076.359 & 1141.43 & 0.96\\
\hline
32 & TR & 1 & T & 4245.372 & 608.93 & 2.97\\
\hline
32 & TR & 2 & R & 4745.770 & 539.66 & 2.04\\
\hline
33 & TR & 1 & T & 3648.195 & 856.18 & 0.76\\
\hline
33 & TR & 2 & R & 3356.777 & 647.95 & 0.98\\
\hline
34 & TR & 1 & T & 5015.499 & 739.42 & 0.96\\
\hline
34 & TR & 2 & R & 6325.746 & 682.41 & 1.99\\
\hline
35 & RT & 1 & R & 6259.347 & 1020.55 & 1.96\\
\hline
35 & RT & 2 & T & 5802.468 & 835.87 & 2.04\\
\hline
36 & RT & 1 & R & 4669.384 & 682.87 & 3.01\\
\hline
36 & RT & 2 & T & 3783.584 & 729.63 & 1.00\\
\hline
\end{tabular}
\end{table}

배균섭 교수님의 강의 자료에서 가져왔습니다.


```r
print(be2x2(NCAResult4BE, c("AUClast", "Cmax", "Tmax")), na.print="") 
```

```
## $AUClast
## $AUClast$`Analysis of Variance (log scale)`
##                          SS DF           MS           F            p
## SUBJECT        2.875497e+00 32 8.985928e-02 3.183942248 0.0008742828
## GROUP          1.024607e-01  1 1.024607e-01 1.145416548 0.2927731856
## SUBJECT(GROUP) 2.773036e+00 31 8.945279e-02 3.169539016 0.0009544080
## PERIOD         3.027399e-05  1 3.027399e-05 0.001072684 0.9740824428
## DRUG           3.643467e-02  1 3.643467e-02 1.290972690 0.2645764201
## ERROR          8.749021e-01 31 2.822265e-02                         
## TOTAL          3.786834e+00 65                                      
## 
## $AUClast$`Between and Within Subject Variability`
##                                 Between Subject Within Subject
## Variance Estimate                    0.03061507     0.02822265
## Coefficient of Variation, CV(%)     17.63193968    16.91883011
## 
## $AUClast$`Least Square Means (geometric mean)`
##                 Reference Drug Test Drug
## Geometric Means       5092.098  4858.245
## 
## $AUClast$`90% Confidence Interval of Geometric Mean Ratio (T/R)`
##                  Lower Limit Point Estimate Upper Limit
## 90% CI for Ratio    0.889436      0.9540753    1.023412
## 
## $AUClast$`Sample Size`
##                       True Ratio=1 True Ratio=Point Estimate
## 80% Power Sample Size            6                         7
## 
## 
## $Cmax
## $Cmax$`Analysis of Variance (log scale)`
##                          SS DF           MS           F          p
## SUBJECT        2.861492e+00 32 8.942162e-02 2.237604579 0.01367095
## GROUP          9.735789e-05  1 9.735789e-05 0.001054764 0.97429977
## SUBJECT(GROUP) 2.861394e+00 31 9.230304e-02 2.309706785 0.01131826
## PERIOD         4.717497e-03  1 4.717497e-03 0.118046317 0.73348258
## DRUG           6.837756e-03  1 6.837756e-03 0.171101730 0.68198228
## ERROR          1.238856e+00 31 3.996310e-02                       
## TOTAL          4.112258e+00 65                                    
## 
## $Cmax$`Between and Within Subject Variability`
##                                 Between Subject Within Subject
## Variance Estimate                    0.02616997      0.0399631
## Coefficient of Variation, CV(%)     16.28355371     20.1921690
## 
## $Cmax$`Least Square Means (geometric mean)`
##                 Reference Drug Test Drug
## Geometric Means       825.5206  808.8778
## 
## $Cmax$`90% Confidence Interval of Geometric Mean Ratio (T/R)`
##                  Lower Limit Point Estimate Upper Limit
## 90% CI for Ratio   0.9013625      0.9798396    1.065149
## 
## $Cmax$`Sample Size`
##                       True Ratio=1 True Ratio=Point Estimate
## 80% Power Sample Size            8                         8
## 
## 
## $Tmax
## $Tmax$`Wilcoxon Signed-Rank Test`
##   p-value 
## 0.2326894 
## 
## $Tmax$`Hodges-Lehmann Estimate`
##                            Lower Limit Point Estimate Upper Limit
## 90% Confidence Interval       -0.33000       -0.03500      0.1050
## 90% Confidence Interval(%)    74.37661       97.28237    108.1529
```




```r
knitr::include_graphics('assets/fixed-random.jpg')
```

\begin{figure}
\includegraphics[width=1\linewidth]{assets/fixed-random} \caption{모수 인자와 변량 인자의 비교}(\#fig:fixedrandom)
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


\includegraphics[width=1\linewidth]{07-statistics_files/figure-latex/sad-indi-pk-log-1} 

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


\includegraphics[width=1\linewidth]{07-statistics_files/figure-latex/sad-indi-pk-log-2} 

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
## # A tibble: 2 x 5
##   parameters est         ci        r.squared  p.value
##   <chr>      <chr>       <chr>         <dbl>    <dbl>
## 1 Cmax       1.04 (0.06) 0.90-1.18     0.949 1.80e-10
## 2 AUClast    1.07 (0.09) 0.87-1.27     0.905 1.49e- 8
```

C~max~는 dose proportionality 기준을 만족하는데 반해 AUC~last~는 만족하지 않는 것을 알 수 있습니다.



<!--chapter:end:07-statistics.Rmd-->


# 결론 {#conclusion}

R을 통해서 NCA 를 구할 수 있도록 R 패키지를 구축하였습니다. 값비싼 상용소프트웨어를 사용하지 않고도 동일한 비구획분석이 가능한 것은 비용과 작업 효율 측면에서 큰 잇점을 가져올 것입니다.

현재 R에 기본적으로 내장되어 있는 PO 테오필린(theophylline)과 IV bolus 인도메타신(indomethacin)에 대해서 예가 잘 나와있습니다.
약물에 대한 자료를 고른 후 각 약물의 복용량, 감소 구간에서의 log 치환 여부, 복용방법, 정맥주사일 경우 투입 시간(정맥주사 이외의 값들 경우에는 infusion time은 내부 함수에 따라 값이 적용되지 않는다.)을 각각 설정할 경우 값을 도출할 수 있습니다.
 
Edison 내에서 실제 Theophylline의 용량에 따라 구현된 각각의 graph를 spaghetti plot형태로 Edison의 결과 가시화 tab을 이용하여 확인할 수 있으며, 그래프의 형태를 변형할 수 있게 설정하였다. 
Y축(농도)의 경우 linear plot과 semi-logarithmic plot을 모두 함께 확인할 수 있도록 하여 다양한 구간에서의 그래프의 추세를 선택적으로 확인할 수 있도록 하였다.
 
언급하였던 공식 이외에도 Pharmacokinetic and Pharmacodynamic Data Analysis 5th edition 에 언급된 공식을 적용하여 다음과 같이 값을 도출하였다.(figure 8) 

또한 결과 값이 모두 도출된 이후 실제 NCA program으로 가장 흔히 사용되고 있는 WinNonlin® (Version 7.0  Pharsight, CA, USA) software 와의 결과 비교에서도 모든 조건을 현재 Edison simulator에서 준 값과 동일하게 설정하여 프로그램을 실행할 경우, 모든 지표에서 같은 값이 계산됨을 확인하였다. (figure 8, figure 9)
 
현재 가장 간단한 분석 방식인 비구획 분석을 통해서 약동학 분석에 필수적인 지표들을 산출해 내었지만, 마찬가지로 수학적 원리를 반영하여 R script를 구성한다면 보다 고차원적적 약동학 분석 방법인 구획 분석(Compartmental analysis)과 비선형적 약동학(nonlinear mixed effect modeling) 분석 또한 실시할 수 있다. 

실제로 Edison 사이언스 엡에 추가한 'NONMEM(Nonlinear mixed effect modeling), method' 라는 엡을 통해 현재 입력 되어있는 Theoph(theophylline)의 시간 농도 데이터를 가지고 FO(first-order method), FOCE(first-order conditional estimation method), LAPL(Laplace's method)의 방법을 이용하여 현재 사용하는 NONMEM software와 유사한 값들을 재현해 낼 수 있다. 

<!--
Figure 4 논문 내에서의 설정 값 

Figure 5. 앞서 설정한 Theophylline에 대한 linear spaghetti plot
 
Figure 6. 앞서 설정한 Theophylline에 대한 scatter plot
 
Figure 7. 앞서 설정한 Theophylline에 대한 semi-logarithmic spaghetti plot

Figure 8. 앞서 설정한 Theophylline에 대한 NCA 분석 결과
 
Figure 9. Theophylline에 대하여 같은 data와 설정값으로 계산한 WinNonlin® (Version 7.0  Pharsight, CA, USA) software의 결과

Figure 10. NONMEM(Nonlinear mixed effect modeling), method 엡에 입력되어 있는 theophylline data의 농도 시간 곡선
 
Figure 11. theophylline data에 대한 model
 
Figure 12. nonlinear mixed effect modeling First order method를 통해 도출된 parameter
-->

---

약물을 연구하고 개발하는데 있어서 약동학은 굉장히 필수적인 분야이며, 그 동안 이러한 약동학 지표들을 구하기 위해서 그러한 결론이 도출되는 과정을 고려하지 않고 일부 프로그램의 사용에만 의존하는 모습이 주를 이뤘습니다.

하지만 이번 Edison program과 다양한 수학적, 통계적 지식을 coding에 활용하여 실제 임상적으로도 활용 가능한 결과값을 도출해 낼 수 있음을 확인하였으며 앞으로도 약동학 분야에서 다양하게 활용할 수 있을 것으로 예측됩니다.

R 내에서 자료 프렙, 비구획분석, 보고서 작성, 및 그림까지 그릴 수 있으므로 빠르고 효과적임. 만약 자료의 오류나 변화가 생겼을 때 수정이 쉽다. 계산 방식의 변경이 있을때  (Linear에서 Log로 변경 원할 때) 역시 마찬가지이다.
SDTM의 PPTESTCD를 사용하므로 PP도메인 구성하기 쉽다. 변경할 때 추가적인 비용이 안든다. 현재 practice는 Winnonlin에서 나온 것을 일일히 변경해야 하는데 이 작업은 약동학자라도 SDTM에 대한 이해가 없이는 이 작업이 쉽지 않다. R을 통해 NCA를 해주는 패키지가 많지만 SDTM 자료 형태로 결과를 계산하거나, pkr처럼 인풋으로 받을 수 있는 패키지는 없다. 상용 소프트웨어도 마찬가지 이다.
모든 것이 무료이고 소스코드가 공개되어 있으므로 약동학을 공부할 수 있다. 추가적으로 소프트웨어가 확장할 여지가 크다. (확장성이 좋다. 실제로 ncarbe 패키지처럼 BE 처리 해주는 것도 쉽게 개발할 수 있다.) 


<!--chapter:end:08-conclusion.Rmd-->


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
## Error in if (abs((R - W)/W) > Tol) {: missing value where TRUE/FALSE needed
```

```r
Wres4 = read.csv("data-raw/Final_Parameters_Pivoted_Indometh_Log.csv")
Rres4 = tblNCA(Indometh, "Subject", "time", "conc", dose=25, adm="Bolus", 
               down="Log", concUnit="mg/L")
Equal(Wres4, Rres4)
```

```
## Error in if (abs((R - W)/W) > Tol) {: missing value where TRUE/FALSE needed
```

```r
Wres5 = read.csv("data-raw/Final_Parameters_Pivoted_Indometh_Linear_Infusion.csv")
Rres5 = tblNCA(Indometh, "Subject", "time", "conc", dose=25, adm="Infusion", 
               dur=0.25, concUnit="mg/L")
Equal(Wres5, Rres5)
```

```
## Error in if (abs((R - W)/W) > Tol) {: missing value where TRUE/FALSE needed
```

```r
Wres6 = read.csv("data-raw/Final_Parameters_Pivoted_Indometh_Log_Infusion.csv")
Rres6 = tblNCA(Indometh, "Subject", "time", "conc", dose=25, adm="Infusion", 
               dur=0.25, down="Log", concUnit="mg/L")
Equal(Wres6, Rres6)
```

```
## Error in if (abs((R - W)/W) > Tol) {: missing value where TRUE/FALSE needed
```

```r
Wres7 = read.csv("data-raw/Final_Parameters_Pivoted_Indometh_Linear_Wrong_Extravascular.csv")
Rres7 = tblNCA(Indometh, "Subject", "time", "conc", dose=25, concUnit="mg/L")
Equal(Wres7, Rres7)
```

```
## Error in if (abs((R - W)/W) > Tol) {: missing value where TRUE/FALSE needed
```

```r
Wres8 = read.csv("data-raw/Final_Parameters_Pivoted_Indometh_Log_Wrong_Extravascular.csv")
Rres8 = tblNCA(Indometh, "Subject", "time", "conc", dose=25, down="Log", 
               concUnit="mg/L")
Equal(Wres8, Rres8)
```

```
## Error in if (abs((R - W)/W) > Tol) {: missing value where TRUE/FALSE needed
```

```r
devtools::session_info()
```

```
## ─ Session info ───────────────────────────────────────────────────────────────
##  setting  value                       
##  version  R version 3.6.2 (2019-12-12)
##  os       macOS High Sierra 10.13.6   
##  system   x86_64, darwin17.7.0        
##  ui       unknown                     
##  language (EN)                        
##  collate  en_US.UTF-8                 
##  ctype    en_US.UTF-8                 
##  tz       Asia/Seoul                  
##  date     2020-01-03                  
## 
## ─ Packages ───────────────────────────────────────────────────────────────────
##  package     * version date       lib source        
##  assertthat    0.2.1   2019-03-21 [1] CRAN (R 3.6.2)
##  backports     1.1.5   2019-10-02 [1] CRAN (R 3.6.2)
##  bookdown      0.16    2019-11-22 [1] CRAN (R 3.6.2)
##  callr         3.4.0   2019-12-09 [1] CRAN (R 3.6.2)
##  cli           2.0.0   2019-12-09 [1] CRAN (R 3.6.2)
##  crayon        1.3.4   2017-09-16 [1] CRAN (R 3.6.2)
##  desc          1.2.0   2018-05-01 [1] CRAN (R 3.6.2)
##  devtools      2.2.1   2019-09-24 [1] CRAN (R 3.6.2)
##  digest        0.6.23  2019-11-23 [1] CRAN (R 3.6.2)
##  ellipsis      0.3.0   2019-09-20 [1] CRAN (R 3.6.2)
##  evaluate      0.14    2019-05-28 [1] CRAN (R 3.6.2)
##  fansi         0.4.0   2018-10-05 [1] CRAN (R 3.6.2)
##  fs            1.3.1   2019-05-06 [1] CRAN (R 3.6.2)
##  glue          1.3.1   2019-03-12 [1] CRAN (R 3.6.2)
##  highr         0.8     2019-03-20 [1] CRAN (R 3.6.2)
##  hms           0.5.2   2019-10-30 [1] CRAN (R 3.6.2)
##  htmltools     0.4.0   2019-10-04 [1] CRAN (R 3.6.2)
##  knitr         1.26    2019-11-12 [1] CRAN (R 3.6.2)
##  magrittr      1.5     2014-11-22 [1] CRAN (R 3.6.2)
##  memoise       1.1.0   2017-04-21 [1] CRAN (R 3.6.2)
##  NonCompart  * 0.4.5   2019-09-27 [1] CRAN (R 3.6.2)
##  pillar        1.4.3   2019-12-20 [1] CRAN (R 3.6.2)
##  pkgbuild      1.0.6   2019-10-09 [1] CRAN (R 3.6.2)
##  pkgconfig     2.0.3   2019-09-22 [1] CRAN (R 3.6.2)
##  pkgload       1.0.2   2018-10-29 [1] CRAN (R 3.6.2)
##  prettyunits   1.0.2   2015-07-13 [1] CRAN (R 3.6.2)
##  processx      3.4.1   2019-07-18 [1] CRAN (R 3.6.2)
##  ps            1.3.0   2018-12-21 [1] CRAN (R 3.6.2)
##  R6            2.4.1   2019-11-12 [1] CRAN (R 3.6.2)
##  Rcpp          1.0.3   2019-11-08 [1] CRAN (R 3.6.2)
##  readr         1.3.1   2018-12-21 [1] CRAN (R 3.6.2)
##  remotes       2.1.0   2019-06-24 [1] CRAN (R 3.6.2)
##  rlang         0.4.2   2019-11-23 [1] CRAN (R 3.6.2)
##  rmarkdown     2.0     2019-12-12 [1] CRAN (R 3.6.2)
##  rprojroot     1.3-2   2018-01-03 [1] CRAN (R 3.6.2)
##  sessioninfo   1.1.1   2018-11-05 [1] CRAN (R 3.6.2)
##  stringi       1.4.3   2019-03-12 [1] CRAN (R 3.6.2)
##  stringr       1.4.0   2019-02-10 [1] CRAN (R 3.6.2)
##  testthat      2.3.1   2019-12-01 [1] CRAN (R 3.6.2)
##  tibble        2.1.3   2019-06-06 [1] CRAN (R 3.6.2)
##  usethis       1.5.1   2019-07-04 [1] CRAN (R 3.6.2)
##  vctrs         0.2.1   2019-12-17 [1] CRAN (R 3.6.2)
##  withr         2.1.2   2018-03-15 [1] CRAN (R 3.6.2)
##  xfun          0.11    2019-11-12 [1] CRAN (R 3.6.2)
##  zeallot       0.1.0   2018-01-28 [1] CRAN (R 3.6.2)
## 
## [1] /Users/Sungpil/Rlib
## [2] /usr/local/Cellar/r/3.6.2/lib/R/library
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


<!--chapter:end:11-appendix.Rmd-->


# 기타 비구획분석 소프트웨어 {#softwares}

## 이 장에서는 {#detailschapter}

이 장에서는 몇가지 NCA 용 소프트웨어(상용 소프웨어, R 패키지)를 비교하고 분석하여 그 결과와 사용법의 공통점과 차이점을 알아볼 것입니다.
특별히 Theoph 데이타셋에서 C~max~, AUC~inf~가 동일하게 나오는지 초점을 맞추어 실펴보겠습니다.


```r
library(tidyverse)
```

## Certara Phoenix WinNonLin

<https://www.certara.com/software/pkpd-modeling-and-simulation/phoenix-winnonlin/>

### Pros

- Validated for several years
- Industry standard
- Versatile unit setting
- Easy using by GUI 
- Generating plots supported

### Cons

- Expansive (~several thousand dollars)
- Not suitable for reproducible research
- CDISC SDTM not compatible (input and output)

## R package: PKNCA

Automation of Noncompartmental Analysis in R <https://github.com/billdenney/pknca>

### ISoP Pharmacometrics Study Group Presentation
* 강의 동영상 https://www.youtube.com/watch?v=WCmFrheYtcc
* 프로젝트 https://github.com/billdenney/pknca
* Package https://cran.r-project.org/web/packages/PKNCA/ 
    * 예제 R Markdown 파일 : https://github.com/billdenney/pknca/tree/master/vignettes
* PPT 파일 
* PKNCA 패키지란 무엇인가?  * Pharmacokinetic(PK) data를 위한 모든 noncompartmental analysis (NCA) 계산이 가능한 R용 패키지

```
library(devtools)
install_github("billdenney/pknca")
```

### 오픈소스 NCA - 지금이 적기이다. {#opennca}

* Data standards 가 점점 많아짐
* CDISC/SDTM가 FDA requirement
* CDISC ADaM working group is standardizing NCA data set (ADNCA) | 
    * CDISC SDTM pharmacokinetic concentration (PC) and pharmacokinetic parameter (PP) domains have been standardized 
* 우리도 R로 NCA?
    * Organizes concentration/time and dose/time data
* Predicts what you most likely need from NCA parameters from the concentration and dosing data.
* Allows user control of all NCA parameter and summary calculations
* Calculates all (standard) NCA parameters (Targeting the SDTM PK 파라메터)
* 한계 
    * 그래픽 못그림
    * 파라메터의 statistics 못구함 (곧 기능 추가할듯)
* NCA 파라메터 계산가능 (Cmax, Tmax, AUClast, AUCinf, AUMC, half-life, …)
* NCA-related calculations (Superposition, Concentration interpolation/extrapolation (with AUC methods), Time to steady-state)
* SDTM PP-READY OUTPUT 가능
* 인풋에서 아웃풋까지 TRACK가능하다.
* 800개 넘는 테스트 케이스가 있음.
* Github에서 모두 다운로드 가능
* CRAN에 package올라왔다. (0.7) https://cran.r-project.org/web/packages/PKNCA/ 
    * wdenney@humanpredictions.com 으로 메일 보내라
* 모든게 오픈이기 때문에 Github에서 기여 환영
* RStudio를 사용한 Hands-on 실습
* Example-theophylline.Rmd
    * Theophylline 농도를 가지고 PK Parameter 구하는 법
    * https://raw.githubusercontent.com/billdenney/pknca/master/vignettes/Example-theophylline.Rmd 
    * 이 파일을 RStudio에서 실행해본다.
    * 이후 article에서 분석할 것입니다.
* Superposition.Rmd
    * https://raw.githubusercontent.com/billdenney/pknca/master/vignettes/Superposition.Rmd
    * 이 파일을 RStudio에서 실행해본다.
* PKNCA.options() 모든 옵션을 볼 수 있다.

### Pros

- Open source and free of charge
- CDISC SDTM semi compatible (output)
- Calculate partial(interval) AUC with 'linear' or 'log' interpolation method but in a cumbersome way

### Cons

- CDISC SDTM not compatible (input)
- More tests required
- Experience with R language required
- Generating plots not supported for now (To be supported soon)


```r
library(PKNCA)
```

```
## Error in library(PKNCA): there is no package called 'PKNCA'
```

```r
my.conc <- PKNCAconc(as.data.frame(Theoph), conc~Time|Subject)
```

```
## Error in PKNCAconc(as.data.frame(Theoph), conc ~ Time | Subject): could not find function "PKNCAconc"
```

```r
d.dose <- unique(datasets::Theoph[datasets::Theoph$Time == 0,
                                  c("Dose", "Time", "Subject")])
my.dose <- PKNCAdose(d.dose, Dose~Time|Subject)
```

```
## Error in PKNCAdose(d.dose, Dose ~ Time | Subject): could not find function "PKNCAdose"
```

```r
my.data.automatic <- PKNCAdata(my.conc, my.dose)
```

```
## Error in PKNCAdata(my.conc, my.dose): could not find function "PKNCAdata"
```

```r
my.results.automatic <- pk.nca(my.data.automatic)
```

```
## Error in pk.nca(my.data.automatic): could not find function "pk.nca"
```

```r
my.results.automatic$result %>% filter(grepl(pattern = "cmax|aucinf", PPTESTCD)) %>% 
    arrange(PPTESTCD)
```

```
## Error in eval(lhs, parent, parent): object 'my.results.automatic' not found
```

```r
summary(my.results.automatic)
```

```
## Error in summary(my.results.automatic): object 'my.results.automatic' not found
```

## R package: ncappc

NCA Calculation and Population PK Model Diagnosis [@Acharya201683]

<https://cran.r-project.org/web/packages/ncappc/index.html>
<https://www.ncbi.nlm.nih.gov/pubmed/27000291>


```r
#install.packages("ncappc")
library(ncappc)
```

```
## Error in library(ncappc): there is no package called 'ncappc'
```


```r
Theoph %>% 
  rename(ID = Subject,
         TIME = Time,
         DV = conc) %>% 
  write_csv('Theoph_ncappc.csv')

Theoph_ncappc_results <- ncappc(obsFile = 'Theoph_ncappc.csv',
       onlyNCA = TRUE,
       extrapolate = TRUE,
       printOut = FALSE,
       evid = FALSE,
       psnOut=FALSE)
```

```
## Error in ncappc(obsFile = "Theoph_ncappc.csv", onlyNCA = TRUE, extrapolate = TRUE, : could not find function "ncappc"
```

## R package: PK

Basic Non-Compartmental Pharmacokinetics

<https://cran.r-project.org/web/packages/PK/index.html>



```r
#install.packages("PK")
library(PK)
```

```
## Error in library(PK): there is no package called 'PK'
```

## Kinetica

## Scientist

## PKSolver

## Summary






<!--chapter:end:13-others.Rmd-->


# R에 내장된 자료의 비구획분석 보고서 {#groupreport}

## Theoph의 보고서 {#theophgroup}


```r
ID=6

                        NONCOMPARTMENTAL ANALYSIS REPORT
                       Package version 0.4.2 (2019-09-27 KST)
                          R version 3.6.2 (2019-12-12)

Date and Time: 2020-01-03 15:20:38 Asia/Seoul

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
                       Package version 0.4.2 (2019-09-27 KST)
                          R version 3.6.2 (2019-12-12)

Date and Time: 2020-01-03 15:20:38 Asia/Seoul

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
                       Package version 0.4.2 (2019-09-27 KST)
                          R version 3.6.2 (2019-12-12)

Date and Time: 2020-01-03 15:20:38 Asia/Seoul

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
                       Package version 0.4.2 (2019-09-27 KST)
                          R version 3.6.2 (2019-12-12)

Date and Time: 2020-01-03 15:20:38 Asia/Seoul

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
                       Package version 0.4.2 (2019-09-27 KST)
                          R version 3.6.2 (2019-12-12)

Date and Time: 2020-01-03 15:20:38 Asia/Seoul

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
                       Package version 0.4.2 (2019-09-27 KST)
                          R version 3.6.2 (2019-12-12)

Date and Time: 2020-01-03 15:20:38 Asia/Seoul

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
                       Package version 0.4.2 (2019-09-27 KST)
                          R version 3.6.2 (2019-12-12)

Date and Time: 2020-01-03 15:20:38 Asia/Seoul

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
                       Package version 0.4.2 (2019-09-27 KST)
                          R version 3.6.2 (2019-12-12)

Date and Time: 2020-01-03 15:20:38 Asia/Seoul

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
                       Package version 0.4.2 (2019-09-27 KST)
                          R version 3.6.2 (2019-12-12)

Date and Time: 2020-01-03 15:20:38 Asia/Seoul

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
                       Package version 0.4.2 (2019-09-27 KST)
                          R version 3.6.2 (2019-12-12)

Date and Time: 2020-01-03 15:20:38 Asia/Seoul

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
                       Package version 0.4.2 (2019-09-27 KST)
                          R version 3.6.2 (2019-12-12)

Date and Time: 2020-01-03 15:20:39 Asia/Seoul

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
                       Package version 0.4.2 (2019-09-27 KST)
                          R version 3.6.2 (2019-12-12)

Date and Time: 2020-01-03 15:20:39 Asia/Seoul

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

패키지와 관련한 모든 의문은 <shan@acp.kr> / +82-2-3010-4614 으로 연락 주시면 빠르게 도움 드리겠습니다.
혹은 StackOverflow^[https://stackoverflow.com]에 영어로 질문 올려주시고 링크를 보내주시면 더 좋습니다.

# 세션 정보 {#session-info}


```r
devtools::session_info()
```

```
## ─ Session info ───────────────────────────────────────────────────────────────
##  setting  value                       
##  version  R version 3.6.2 (2019-12-12)
##  os       macOS High Sierra 10.13.6   
##  system   x86_64, darwin17.7.0        
##  ui       unknown                     
##  language (EN)                        
##  collate  en_US.UTF-8                 
##  ctype    en_US.UTF-8                 
##  tz       Asia/Seoul                  
##  date     2020-01-03                  
## 
## ─ Packages ───────────────────────────────────────────────────────────────────
##  package     * version date       lib source        
##  assertthat    0.2.1   2019-03-21 [1] CRAN (R 3.6.2)
##  backports     1.1.5   2019-10-02 [1] CRAN (R 3.6.2)
##  bookdown      0.16    2019-11-22 [1] CRAN (R 3.6.2)
##  callr         3.4.0   2019-12-09 [1] CRAN (R 3.6.2)
##  cli           2.0.0   2019-12-09 [1] CRAN (R 3.6.2)
##  crayon        1.3.4   2017-09-16 [1] CRAN (R 3.6.2)
##  desc          1.2.0   2018-05-01 [1] CRAN (R 3.6.2)
##  devtools      2.2.1   2019-09-24 [1] CRAN (R 3.6.2)
##  digest        0.6.23  2019-11-23 [1] CRAN (R 3.6.2)
##  ellipsis      0.3.0   2019-09-20 [1] CRAN (R 3.6.2)
##  evaluate      0.14    2019-05-28 [1] CRAN (R 3.6.2)
##  fansi         0.4.0   2018-10-05 [1] CRAN (R 3.6.2)
##  fs            1.3.1   2019-05-06 [1] CRAN (R 3.6.2)
##  glue          1.3.1   2019-03-12 [1] CRAN (R 3.6.2)
##  htmltools     0.4.0   2019-10-04 [1] CRAN (R 3.6.2)
##  knitr         1.26    2019-11-12 [1] CRAN (R 3.6.2)
##  magrittr      1.5     2014-11-22 [1] CRAN (R 3.6.2)
##  memoise       1.1.0   2017-04-21 [1] CRAN (R 3.6.2)
##  pkgbuild      1.0.6   2019-10-09 [1] CRAN (R 3.6.2)
##  pkgload       1.0.2   2018-10-29 [1] CRAN (R 3.6.2)
##  prettyunits   1.0.2   2015-07-13 [1] CRAN (R 3.6.2)
##  processx      3.4.1   2019-07-18 [1] CRAN (R 3.6.2)
##  ps            1.3.0   2018-12-21 [1] CRAN (R 3.6.2)
##  R6            2.4.1   2019-11-12 [1] CRAN (R 3.6.2)
##  Rcpp          1.0.3   2019-11-08 [1] CRAN (R 3.6.2)
##  remotes       2.1.0   2019-06-24 [1] CRAN (R 3.6.2)
##  rlang         0.4.2   2019-11-23 [1] CRAN (R 3.6.2)
##  rmarkdown     2.0     2019-12-12 [1] CRAN (R 3.6.2)
##  rprojroot     1.3-2   2018-01-03 [1] CRAN (R 3.6.2)
##  sessioninfo   1.1.1   2018-11-05 [1] CRAN (R 3.6.2)
##  stringi       1.4.3   2019-03-12 [1] CRAN (R 3.6.2)
##  stringr       1.4.0   2019-02-10 [1] CRAN (R 3.6.2)
##  testthat      2.3.1   2019-12-01 [1] CRAN (R 3.6.2)
##  usethis       1.5.1   2019-07-04 [1] CRAN (R 3.6.2)
##  withr         2.1.2   2018-03-15 [1] CRAN (R 3.6.2)
##  xfun          0.11    2019-11-12 [1] CRAN (R 3.6.2)
## 
## [1] /Users/Sungpil/Rlib
## [2] /usr/local/Cellar/r/3.6.2/lib/R/library
```






<!--chapter:end:99-references.Rmd-->

