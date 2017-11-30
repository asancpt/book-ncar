# Noncompartmental Analysis by R

진행 중인 작업.

docs-tcp : 김형섭 선생님과 논문 쓰는것을 참고로 영어로 변환.

``` r
make gitbook
```

- <https://ncar.netlify.com>
- <https://ncarhandbook.netlify.com>
- <https://ncarpaper.netlify.com>


이 아래로는 수정 중인 사항.


---------



# 서론 {#intro}

약동학 분야에서 가장 간단하고도 객관적이며 널리 쓰이는 방법은 비구획분석 (Non-compartmental analysis, NCA)입니다. 
*미국의 FDA (Food and Drug Administration)를 비롯한 대부분의 규제기관에서는 NCA하는 소프트웨어를 규정하고 있지 않아*, 상용 소프트웨어를 사용하지 않고 약동학적 지표를 구하는 것을 허용하고 있습니다.
따라서 무료로 누구나 사용할 수 있는 R 패키지를 사용하여 비구획분석을 통한 약동학적 주요 지표를 구할 수 있습니다.

- NonCompart [@R-NonCompart]
- ncar [@R-ncar]
- pkr [@R-pkr]

## 설치


# 패키지: NonCompart

## sNCA()

한명의 대상자에 대해 비구획 분석을 시행합니다.

```{r}
# For one subject
x = Theoph[Theoph$Subject=="1","Time"]
y = Theoph[Theoph$Subject=="1","conc"]

sNCA(x, y, dose=320, doseUnit="mg", concUnit="mg/L", timeUnit="h")
```

이때의 그림은 다음과 같습니다.  (Figure \@ref(fig:ggtheophindi))

```{r ggtheophindi, fig.cap = 'Individual concentration-time curves of oral administration of Theoph (Subject 1)', fig.width = 6, fig.height = 3.5}
ggplot(Theoph %>% dplyr::filter(Subject == 1), 
       aes(Time, conc, group = Subject, color = Subject)) +
  geom_point(size = 4) + geom_line(size = 1) +
  theme_minimal() +
  labs(title = 'Oral Administration of Theoph (320 mg) (Subject 1)',
       x = 'Time (hour)', y = 'Concentration (ng/mL)')
```

## tblNCA(): 전체 대상자 비구획 분석

가장 많이 쓰는 함수 입니다! 
NonCompart 패키지의 핵심적인 기능입니다.
아래의 코드를 R의 콘솔창에 넣어보세요. 
테오필린 경구 투여시의 비구획 분석입니다. 

```{r}
Theoph_tblNCA <- tblNCA(Theoph, key="Subject", dose=320, concUnit="mg/L")
```

결과는 matrix 형태인데 너무 길기 때문에 핵심적인 일부 파라메터 (C~max~, T~max~, AUC~last~)만 표시할 수도 있습니다.

```{r}
Theoph_tblNCA_selected <- Theoph_tblNCA[ , c('Subject', 'CMAX', 'TMAX', 'AUCLST')]
Theoph_tblNCA_selected
```

인도메타신 정맥 투여시의 비구획 분석입니다. 
함수인자 `adm`을 infusion으로 바꾼 것을 볼 수 있고 `dur`가 추가된 것을 볼 수 있습니다.

```{r}
Indometh_tblNCA <- tblNCA(Indometh, key="Subject", colTime="time", colConc="conc", dose=25, 
       adm="Infusion", dur=0.5, concUnit="mg/L")
```

역시 핵심적인 일부 파라메터 (C~max~, T~max~, AUC~last~)만 표시할 수도 있습니다.

```{r}
Indometh_tblNCA_selected <- Indometh_tblNCA[ , c('Subject', 'CMAX', 'TMAX', 'AUCLST')]
Indometh_tblNCA_selected
```

## 기술통계 (Descriptive statistics)

R에서는 필요에 따라서 자신만의 함수를 만들 수도 있습니다. 
아래 두줄을 실행하면 `desc_tblNCA()` 함수를 사용하여 기술통계량을 쉽게 구할 수 있습니다. (Table \@ref(tab:theodesc) and \@ref(tab:indodesc))

```{r}
desc_tblNCA <- function(tblNCA){as.data.frame(tblNCA) %>% 
    mutate_all(function(x) as.numeric(as.character(x))) %>% broom::tidy()}
```

```{r eval = FALSE}
desc_tblNCA(Theoph_tblNCA_selected)
desc_tblNCA(Indometh_tblNCA_selected)
```

```{r theodesc, echo = FALSE}
desc_tblNCA(Theoph_tblNCA_selected) %>% kable(booktabs = TRUE, caption = 'Descriptive statistics of selected PK parameters of Theoph oral administration')
```

```{r indodesc, echo = FALSE}
desc_tblNCA(Indometh_tblNCA_selected) %>% kable(booktabs = TRUE, caption = 'Descriptive statistics of selected PK parameters of Indometh IV infusion')
```

# 패키지: ncar

보고서를 만드는 패키지입니다. 현재 설정된 working directory에 결과 파일이 생성됩니다.


## pdfNCA()

pdfNCA()로 pdf로 결과를 볼 수 있습니다. 

```{r pdfNCA}
pdfNCA(fileName="Output-ncar/pdfNCA-Theoph.pdf", Theoph, colSubj="Subject", colTime="Time", 
       colConc="conc", dose=320, doseUnit="mg", timeUnit="h", concUnit="mg/L")
```

## rtfNCA()

마이크로소프트 워드에서 편집가능한 rtf파일을 만듭니다.

```{r eval = FALSE}
rtfNCA(fileName="rtfNCA-Theoph.rtf", Theoph, colSubj="Subject", colTime="Time", 
       colConc="conc", dose=320, doseUnit="mg", timeUnit="h", concUnit="mg/L")
```

# 패키지: pkr

## plotPK()

여러가지 기본적인 그림을 그려봅니다. Output 폴더 아래에 여러 파일이 생성됩니다.

```{r eval = TRUE}
pkr::plotPK(Theoph, "Subject", "Time", "conc", 
            unitTime = "hr", unitConc = "mg/L", dose = 320)
```



# 기타 사항
