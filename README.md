# R을 사용한 비구획분석

[<img src="assets/cover.jpg" style="max-width:20%;min-width:80px;float:right;margin: 10px 10px 5px 5px" alt="Github repo" />](https://github.com/asancpt/book-ncar)

이 책은 R을 사용하여 비구획분석을 수행할 수 있도록 소개할 것입니다. 
값비싼 상용 소프트웨어와 동일한 결과를 얻을 수 있음을 실제 임상시험 자료를 통해 반복적으로 확인하였습니다. 
숫자 계산 뿐만 아니라 시각화도 가능하여 농도-시간 곡선, 용량군 별 파라메터의 forest plot 등의 유용한 그림도 쉽게 그릴 수 있습니다.
CDISC SDTM 표준을 따르는 용어를 사용한 것도 큰 장점입니다.

한번 익혀두면 속도와 연속성 측면에서 커다란 잇점이 있음을 것을 발견할 수 있을 것입니다. 
또한 재현가능한 연구를 보다 수월하게 구현할 수 있습니다.
무엇보다 무료로 사용할 수 있는 R기반의 공개 소프트웨어라는 점에서 학교, 연구소, 정부기관, 제약회사 등에서 라이센스 등의 제약 없이 손쉽게 설치하고 실행할 수 있으리라 생각됩니다.
책에 대한 피드백, 오탈자 신고 등은 [깃허브 저장소](https://github.com/asancpt/book-ncar/issues)에 남겨주십시오.

감사합니다.

`r Sys.Date()`  
서울아산병원 임상약리학과, 울산대학교 임상약리학교실  
교수 배균섭,  
전공의 한성필, 윤석규, 조용순, 김형섭

![Creative Commons License](assets/cc.png)  
이 저작물은 [크리에이티브 커먼즈 저작자표시-비영리-동일조건변경허락 4.0 국제 라이선스](http://creativecommons.org/licenses/by-nc-sa/4.0/) 에 따라 이용할 수 있습니다.

- <https://ncar.netlify.com>
- <https://ncarhandbook.netlify.com>
- <https://ncarpaper.netlify.com>

**출판**

```bash
make publish
```

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
