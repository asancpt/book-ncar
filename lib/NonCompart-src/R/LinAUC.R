LinAUC = function(x, y) # down="Linear"
{
# Author: Kyun-Seop Bae k@acr.kr
# Last modification: 2017.7.24
# Called by: IntAUC
# Calls: none except base
# INPUT
#    x: time or similar vector
#    y: concentration or similar vector
# RETURNS
  Result = c(AUC = NA_real_,  # AUC by linear down method
             AUMC = NA_real_) # AUMC by linear down method
# Input check
  n = length(x)
  if (n != length(y) | !is.numeric(x) | !is.numeric(y)) return(Result)

  Result["AUC"]  = sum((x[-1] - x[-n])*(y[-1] + y[-n]))/2
  Result["AUMC"] = sum((x[-1] - x[-n])*(x[-1]*y[-1] + x[-n]*y[-n]))/2
  return(Result)
}
