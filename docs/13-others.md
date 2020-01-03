
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





