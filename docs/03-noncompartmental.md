
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
##    Subject       b0  CMAX      CMAXD TMAX TLAG CLST     CLSTP  TLST
## 1        1 2.368785 10.50 0.03281250 1.12    0 3.28 3.2801465 24.37
## 2        2 2.411237  8.33 0.02603125 1.92    0 0.90 0.8886398 24.30
## 3        3 2.529712  8.20 0.02562500 1.02    0 1.05 1.0550967 24.17
## 4        4 2.592755  8.60 0.02687500 1.07    0 1.15 1.1564216 24.65
## 5        5 2.551092 11.40 0.03562500 1.00    0 1.57 1.5556951 24.35
## 6        6 2.033404  6.44 0.02012500 1.15    0 0.92 0.9412712 23.85
## 7        7 2.288550  7.09 0.02215625 3.48    0 1.15 1.1607192 24.22
## 8        8 2.170403  7.56 0.02362500 2.02    0 1.25 1.2285268 24.12
## 9        9 2.124648  9.03 0.02821875 0.63    0 1.12 1.1164831 24.43
## 10      10 2.657705 10.21 0.03190625 3.55    0 2.42 2.4136923 23.70
## 11      11 2.147594  8.00 0.02500000 0.98    0 0.86 0.8598066 24.08
## 12      12 2.824493  9.75 0.03046875 3.52    0 1.17 1.1755390 24.15
##       LAMZHL       LAMZ LAMZLL LAMZUL LAMZNPT     CORRXY        R2
## 1  14.304378 0.04845700   9.05  24.37       3 -0.9999999 0.9999997
## 2   6.659342 0.10408644   7.03  24.30       4 -0.9985967 0.9971954
## 3   6.766087 0.10244431   9.00  24.17       3 -0.9996624 0.9993250
## 4   6.981247 0.09928702   9.02  24.65       3 -0.9994619 0.9989241
## 5   8.002264 0.08661888   7.02  24.35       4 -0.9993234 0.9986472
## 6   7.894998 0.08779574   2.03  23.85       7 -0.9991203 0.9982413
## 7   7.846668 0.08833650   6.98  24.22       4 -0.9993349 0.9986702
## 8   8.510038 0.08145054   3.53  24.12       6 -0.9954961 0.9910124
## 9   8.405999 0.08245863   8.80  24.43       3 -0.9997218 0.9994437
## 10  9.246916 0.07495982   9.38  23.70       3 -0.9997543 0.9995087
## 11  7.261237 0.09545856   9.03  24.08       3 -0.9999991 0.9999983
## 12  6.286508 0.11025949   9.03  24.15       3 -0.9996984 0.9993968
##        R2ADJ    AUCLST    AUCALL    AUCIFO   AUCIFOD    AUCIFP   AUCIFPD
## 1  0.9999995 148.92305 148.92305 216.61193 0.6769123 216.61496 0.6769217
## 2  0.9957931  91.52680  91.52680 100.17346 0.3130421 100.06432 0.3127010
## 3  0.9986499  99.28650  99.28650 109.53597 0.3422999 109.58572 0.3424554
## 4  0.9978483 106.79630 106.79630 118.37888 0.3699340 118.44356 0.3701361
## 5  0.9979708 121.29440 121.29440 139.41978 0.4356868 139.25463 0.4351707
## 6  0.9978896  73.77555  73.77555  84.25442 0.2632951  84.49670 0.2640522
## 7  0.9980053  90.75340  90.75340 103.77180 0.3242869 103.89315 0.3246661
## 8  0.9887655  88.55995  88.55995 103.90669 0.3247084 103.64305 0.3238845
## 9  0.9988873  86.32615  86.32615  99.90872 0.3122147  99.86607 0.3120815
## 10 0.9990174 138.36810 138.36810 170.65206 0.5332877 170.56791 0.5330247
## 11 0.9999965  80.09360  80.09360  89.10274 0.2784461  89.10072 0.2784397
## 12 0.9987936 119.97750 119.97750 130.58883 0.4080901 130.63907 0.4082471
##       AUCPEO    AUCPEP   AUMCLST   AUMCIFO   AUMCIFP  AUMCPEO  AUMCPEP
## 1  31.248917 31.249876 1459.0711 4505.5348 4505.6709 67.61603 67.61701
## 2   8.631687  8.532030  706.5866  999.7723  996.0716 29.32525 29.06267
## 3   9.357173  9.398325  803.1859 1150.9648 1152.6529 30.21629 30.31850
## 4   9.784331  9.833594  901.0842 1303.2524 1305.4981 30.85881 30.97775
## 5  13.000579 12.897403 1017.1143 1667.7216 1661.7937 39.01174 38.79419
## 6  12.437174 12.688246  609.1524  978.4285  986.9665 37.74176 38.28034
## 7  12.545221 12.647366  782.4199 1245.0984 1249.4111 37.16000 37.37691
## 8  14.769730 14.552931  739.5346 1298.1158 1288.5201 43.03015 42.60589
## 9  13.594978 13.558076  705.2296 1201.7715 1200.2124 41.31750 41.24126
## 10 18.918002 18.878001 1278.1800 2473.9934 2470.8765 48.33535 48.27018
## 11 10.110962 10.108918  617.2422  928.5600  928.4900 33.52694 33.52193
## 12  8.125757  8.161087  977.8807 1330.3840 1332.0528 26.49636 26.58844
##        VZFO     VZFP     CLFO     CLFP MRTEVLST  MRTEVIFO  MRTEVIFP
## 1  30.48675 30.48632 1.477296 1.477276 9.797483 20.800031 20.800368
## 2  30.69044 30.72392 3.194459 3.197943 7.719996  9.980411  9.954313
## 3  28.51710 28.50415 2.921415 2.920088 8.089578 10.507642 10.518276
## 4  27.22596 27.21110 2.703185 2.701709 8.437410 11.009163 11.022112
## 5  26.49799 26.52942 2.295227 2.297949 8.385501 11.961873 11.933490
## 6  43.25973 43.13569 3.798020 3.787130 8.256833 11.612785 11.680533
## 7  34.90844 34.86767 3.083689 3.080088 8.621383 11.998427 12.025924
## 8  37.81051 37.90669 3.079686 3.087520 8.350666 12.493092 12.432287
## 9  38.84279 38.85938 3.202924 3.204292 8.169363 12.028695 12.018220
## 10 25.01554 25.02788 1.875160 1.876086 9.237534 14.497296 14.486174
## 11 37.62219 37.62304 3.591360 3.591441 7.706511 10.421227 10.420679
## 12 22.22429 22.21575 2.450439 2.449497 8.150534 10.187579 10.196436
```

여기서 `dose=320`으로 되었다는 것은 아미노필린 400mg 투여시 테오필린 320mg이 경구로 투여되었음을 의미합니다.



이는 문자(character)로 구성된 matrix로 구성된 결과물과 단위 정보가 담긴 attribute를 포함하고 있습니다.

다음으로 Indomethacin 의 약동학 파라미터를 구해보겠습니다. 
이는 IV bolus 이므로 `adm="bolus"` 인자를 정의해야 합니다. 


```r
Indometh_nca <- tblNCA(Indometh, "Subject", "time", "conc", 
                       dose=25, adm="Bolus", dur=0.5, concUnit="mg/L")
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
left_join(as.tibble(Theoph_nca) %>% 
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
## # ... with 422 more rows
```
