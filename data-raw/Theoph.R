write.csv(Theoph %>% rename(ID = Subject, TIME = Time, DV = conc), "Theoph.csv", row.names = FALSE)

sdtab_exvascsd <- read.csv("sdtab_exvascsd.csv", as.is = TRUE)
use_data(sdtab_exvascsd)
#* R command: 
ncappc(obsFile = 'sdtab_exvascsd.rda', psnOut = TRUE, method = 'linear', 
       evid = FALSE, studyName = 'extravascularsd_linear', outFileNm = 'extravascularsd-linear')


#** R command: 
ncappc(obsFile = 'sdtab_exvascsd', psnOut = TRUE, method = 'linear-log', evid = FALSE, studyName = 'extravascularsd_linear-log', outFileNm = 'extravascularsd-linear-log')

library(ncappc)
write.csv(Theoph %>% rename(ID = Subject, TIME = Time, DV = conc), "Theoph.csv", row.names = FALSE)
ncappc(obsFile="Theoph.csv", psnOut=FALSE, noPlot = TRUE, printOut=TRUE, method = "linear", evid = FALSE)
Theoph_ncappc <- read.delim("ncaOutput-.tsv", sep = "\t", check.names = FALSE)
Theoph_ncappc[ , c("Cmax (M.L^-3)", "AUCINF_obs (T*M.L^-3)")]
