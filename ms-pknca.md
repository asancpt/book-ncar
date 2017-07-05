
Automation of Noncompartmental Analysis in R 

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

### 오픈소스 NCA - 지금이 적기이다.

* Data standards 가 점점 많아짐
* CDISC/SDTM가 FDA requirement
* CDISC ADaM working group is standardizing NCA data set (ADNCA) | 
    * CDISC SDTM pharmacokinetic concentration (PC) and pharmacokinetic parameter (PP) domains have been standardized 
* 우리도 R로 NCA?
    
    ### 할수 있는 것
    
    * Organizes concentration/time and dose/time data
* Predicts what you most likely need from NCA parameters from the concentration and dosing data.
* Allows user control of all NCA parameter and summary calculations
* Calculates all (standard) NCA parameters (Targeting the SDTM PK 파라메터)
* Summarizes the parameters 

### 한계 
* 그래픽 못그림
* 파라메터의 statistics 못구함 (곧 기능 추가할듯)

### PKNCA 현재는 0.7
* NCA 파라메터 계산가능 (Cmax, Tmax, AUClast, AUCinf, AUMC, half-life, …)
* NCA-related calculations (Superposition, Concentration interpolation/extrapolation (with AUC methods), Time to steady-state)
* SDTM PP-READY OUTPUT 가능
* 인풋에서 아웃풋까지 TRACK가능하다.
* 800개 넘는 테스트 케이스가 있음.

### PKNCA 곧 1.0이 나올것이다.
* Improved prediction of desired parameters (정확도 accuracy, number 등)

### 참고사항
* Github에서 모두 다운로드 가능
* CRAN에 package올라왔다. (0.7) https://cran.r-project.org/web/packages/PKNCA/ 
    * wdenney@humanpredictions.com 으로 메일 보내라
* 모든게 오픈이기 때문에 Github에서 기여 환영

### RStudio를 사용한 Hands-on 실습
#### Example-theophylline.Rmd
* Theophylline 농도를 가지고 PK Parameter 구하는 법
* https://raw.githubusercontent.com/billdenney/pknca/master/vignettes/Example-theophylline.Rmd 
* 이 파일을 RStudio에서 실행해본다.
* 이후 article에서 분석할 것입니다.

#### Superposition.Rmd
* https://raw.githubusercontent.com/billdenney/pknca/master/vignettes/Superposition.Rmd
* 이 파일을 RStudio에서 실행해본다.

### Closing
* PKNCA.options() 모든 옵션을 볼 수 있다.

### 결론
* 써보고 feedback주고 contribute해라.
