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
<img src="03-data_files/figure-epub3/ggtheoph-1.png" alt="Concentration-time curves of oral administration of Theoph (N = 12)" width="100%" />
<p class="caption">(\#fig:ggtheoph)Concentration-time curves of oral administration of Theoph (N = 12)</p>
</div>




