UnitUrine = function(conU="ng/mL", volU="mL", amtU="mg", MW=0)
{
# Author: Kyun-Seop Bae k@acr.kr
# Last modification: 2017.8.14
# Called by:
# Calls:
# INPUT
#    conU: concentration unit
#    volU: volume unit
#    amtU: amount unit, upper and lower case should match
#    durU: duration unit, "h" fixed
#    rateU: rate unit, amtU/durU
#    MW: molecular weight
# RETURNS conversion factor for the mulplication: conc * vol * factor = amount in the given unit
  Result = 0  # default value to return
# Input check
  if (!is.numeric(MW)) return (Result)
  if (MW < 0) return (Result)
#
  rGram = c(1, 1e3, 1e6, 1e9, 1e12)
  names(rGram) = c("g", "mg", "ug", "ng", "pg")

  rVol = c(1, 1e1, 1e3, 1e6)
  names(rVol) = c("L", "dL", "mL", "uL")

  rMol = c(1, 1e3, 1e6, 1e9, 1e12)
  names(rMol) = c("mol", "mmol", "umol", "nmol", "pmol")

  amtU = tolower(amtU)

  if (toupper(conU) == toupper("mg/mL")) conU = "g/L"
  if (toupper(conU) == toupper("ug/mL")) conU = "mg/L"
  if (toupper(conU) == toupper("ng/mL")) conU = "ug/L"
  if (toupper(conU) == toupper("pg/mL")) conU = "ng/L"

  if (toupper(conU) == toupper("mmol/mL")) conU = "mol/L"
  if (toupper(conU) == toupper("umul/mL")) conU = "mmol/L"
  if (toupper(conU) == toupper("nmol/mL")) conU = "umol/L"
  if (toupper(conU) == toupper("pmol/mL")) conU = "nmol/L"

  amtU1 = strsplit(conU, "/")[[1]][1]

  if ((amtU1 %in% names(rMol) & amtU %in% names(rGram)) | (amtU1 %in% names(rGram) & amtU %in% names(rMol))) {
    if (MW <= 0) {
      warning("Molecular weight should be given!")
      return (Result)
    }
  }

  if (amtU %in% names(rMol) & amtU1 %in% names(rGram)) Result = rMol[amtU]/rGram[amtU1] / rVol[volU] / MW
  else if (amtU %in% names(rGram) & amtU1 %in% names(rMol)) Result = rGram[amtU]/rMol[amtU1] / rVol[volU] * MW
  else if (amtU %in% names(rGram) & amtU1 %in% names(rGram)) Result = rGram[amtU]/rGram[amtU1] / rVol[volU]
  else if (amtU %in% names(rMol) & amtU1 %in% names(rMol)) Result = rMol[amtU]/rMol[amtU1] / rVol[volU]
  else {Result = 0}

  return (Result)
}


## CDISC TERMS PPTESTCD
# RCAMLST (recovery amount last)
# RCPCLST (recovery percent last) FracExcr Fraction excreted unchanged
# ERINT (excretion rate interval)
# LSTURINE: Last urine collection time from PCENDTC
# RENALCL (renal clearance) = RCAMLST/AUC[0-LSTURINE]
