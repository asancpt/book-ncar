LogAUC = function(x, y) # down="Log" means Linear-Up Log-Down
{
# Author: Kyun-Seop Bae k@acr.kr
# Last modification: 2017.7.24
# Called by: IntAUC
# Calls: none except base
# INPUT
#    x: time or similar vector
#    y: concentration or similar vector
# RETURNS
  Result = c(AUC = NA_real_,  # AUC by log down method
             AUMC = NA_real_) # AUMC by log down method
# Input check             
  n = length(x)
  if (n != length(y) | !is.numeric(x) | !is.numeric(y)) return(Result)

  auc = 0
  aumc = 0
  for (i in 2:n) {
    if (y[i] < y[i-1] & y[i] > 0) {
      k = (log(y[i-1]) - log(y[i]))/(x[i] - x[i-1]) # -k slope in y-log scale
      auc = auc + (y[i-1] - y[i])/k
      aumc = aumc + (x[i-1]*y[i-1] - x[i]*y[i])/k + (y[i-1] - y[i])/k/k
    } else {
      auc = auc + (x[i] - x[i-1])*(y[i] + y[i-1])/2
      aumc = aumc + (x[i] - x[i-1])*(y[i]*x[i] + y[i-1]*x[i-1])/2
    }
  }
  Result["AUC"]  = auc
  Result["AUMC"] = aumc
  return(Result)
}
