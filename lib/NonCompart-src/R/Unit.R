Unit = function(code="", timeUnit="h", concUnit="ng/mL", doseUnit="mg", MW=0)
{
# Author: Kyun-Seop Bae k@acr.kr
# Last modification: 2017.7.25
# Called by:
# Calls:
# INPUT
#    code: SDTM PPTESTCD
#    timeUnit: time unit
#    concUnit: concentration unit
#    doseUnit: dose unit, this should not be amount per kg (BWT) or per m2 (BSA)
#    MW: molecular weight
# RETURNS
  Result = c(Unit = NA_character_, # unit of SDTM PPTESTCD like AUCLST, CMAX, CMAXD, ...
             Factor = NA_real_) # conversion factor used internally 
# Input check
  if (length(strsplit(doseUnit, "/")[[1]]) != 1) return(Result)
  if (!is.numeric(MW)) return(Result)
  if (MW < 0) return(Result)
#
  rGram = c(1, 1e3, 1e6, 1e9, 1e12)
  names(rGram) = c("g", "mg", "ug", "ng", "pg")

  rMol = c(1, 1e3, 1e6, 1e9, 1e12)
  names(rMol) = c("mol", "mmol", "umol", "nmol", "pmol")

  doseUnit = tolower(doseUnit)
  timeUnit = tolower(timeUnit)

  if (toupper(concUnit) == toupper("mg/mL")) concUnit = "g/L"
  if (toupper(concUnit) == toupper("ug/mL")) concUnit = "mg/L"
  if (toupper(concUnit) == toupper("ng/mL")) concUnit = "ug/L"
  if (toupper(concUnit) == toupper("pg/mL")) concUnit = "ng/L"

  if (toupper(concUnit) == toupper("mmol/mL")) concUnit = "mol/L"
  if (toupper(concUnit) == toupper("umul/mL")) concUnit = "mmol/L"
  if (toupper(concUnit) == toupper("nmol/mL")) concUnit = "umol/L"
  if (toupper(concUnit) == toupper("pmol/mL")) concUnit = "nmol/L"

  tConc = strsplit(concUnit, "/")[[1]]
  uAmt = tConc[1]
  uVol = tConc[2]

  if ((uAmt %in% names(rMol) & doseUnit %in% names(rGram)) | (uAmt %in% names(rGram) & doseUnit %in% names(rMol))) {
    if (is.na(MW)) warning("Molecular weight should be given for more informative results!")
    if (MW <= 0) warning("Molecular weight should be given for more informative results!")
  }

  TestCD = c("b0", "CMAX", "CMAXD", "TMAX", "TLAG", "CLST", "CLSTP", "TLST", "LAMZHL", "LAMZ",
             "LAMZLL", "LAMZUL", "LAMZNPT", "CORRXY", "R2", "R2ADJ", "C0", "AUCLST", "AUCALL",
             "AUCIFO", "AUCIFOD", "AUCIFP", "AUCIFPD", "AUCPEO", "AUCPEP", "AUCPBEO", "AUCPBEP",
             "AUMCLST", "AUMCIFO", "AUMCIFP", "AUMCPEO", "AUMCPEP",
             "MRTIVLST", "MRTIVIFO", "MRTIVIFP", "MRTEVLST", "MRTEVIFO", "MRTEVIFP",
             "VZO", "VZP", "VZFO", "VZFP", "CLO", "CLP", "CLFO", "CLFP", "VSSO", "VSSP")
  nTestCD = length(TestCD)
  Res = data.frame(Unit=rep("",nTestCD), Factor=rep(1,nTestCD), stringsAsFactors = FALSE)
  rownames(Res) = TestCD

  for (i in 1:nTestCD) {
    Code = TestCD[i]

    if (Code %in% c("CMAX", "CLST", "CLSTP", "C0")) Res[i, 1] = concUnit
    if (Code == "CMAXD") Res[i, 1] = paste0(concUnit,"/",doseUnit)

    if (Code %in% c("TMAX", "TLAG", "TLST", "LAMZHL", "LAMZLL", "LAMZUL", "MRTIVLST",
                    "MRTIVIFO", "MRTIVIFP", "MRTEVLST", "MRTEVIFO", "MRTEVIFP")) Res[i, 1] = timeUnit

    if (Code == "LAMZ") Res[i, 1] = paste0("/",timeUnit)
    if (Code %in% c("b0", "LAMZNPT", "CORRXY", "R2", "R2ADJ")) Res[i, 1] = ""
    if (Code %in% c("AUCLST", "AUCALL", "AUCIFO", "AUCIFP")) Res[i, 1] = paste0(timeUnit,"*",concUnit)
    if (Code %in% c("AUCIFOD", "AUCIFPD")) Res[i, 1] = paste0(timeUnit,"*",concUnit,"/",doseUnit)
    if (Code %in% c("AUCPEO", "AUCPEP", "AUCPBEO", "AUCPBEP", "AUMCPEO", "AUMCPEP")) Res[i, 1] = "%"
    if (Code %in% c("AUMCLST", "AUMCIFO", "AUMCIFP")) Res[i, 1] = paste0(timeUnit,"2*",concUnit)

    if (Code %in% c("VZO", "VZP", "VZFO", "VZFP", "VSSO", "VSSP")) {
      if (uAmt %in% names(rMol) & doseUnit %in% names(rGram)) Res[i, ] = c(uVol, rMol[uAmt]/rGram[doseUnit] / MW)
      else if (uAmt %in% names(rGram) & doseUnit %in% names(rMol)) Res[i, ] = c(uVol, rGram[uAmt]/rMol[doseUnit] * MW)
      else if (uAmt %in% names(rGram) & doseUnit %in% names(rGram)) Res[i, ] = Res[i, ] = c(uVol, rGram[uAmt]/rGram[doseUnit])
      else Res[i, ] = c(uVol, rMol[uAmt]/rMol[doseUnit])
    }
    if (Code %in% c("CLO", "CLP", "CLFO", "CLFP")) {
      if (uAmt %in% names(rMol) & doseUnit %in% names(rGram)) Res[i, ] = c(paste0(uVol,"/",timeUnit), rMol[uAmt]/rGram[doseUnit] / MW)
      else if (uAmt %in% names(rGram) & doseUnit %in% names(rMol)) Res[i, ] = c(paste0(uVol,"/",timeUnit), rGram[uAmt]/rMol[doseUnit] * MW)
      else if (uAmt %in% names(rGram) & doseUnit %in% names(rGram)) Res[i, ] = Res[i, ] = c(paste0(uVol,"/",timeUnit), rGram[uAmt]/rGram[doseUnit])
      else Res[i, ] = c(paste0(uVol,"/",timeUnit), rMol[uAmt]/rMol[doseUnit])
    }
  }

  Res[,2] = as.numeric(Res[,2])
  Res[Res[,2] == 0 | Res[,2] == Inf, 2] = NA

  if (code == "") Result = Res # return all codes
  else return(Result = Res[code,]) # return only specific codes
  
  return(Result)
}
