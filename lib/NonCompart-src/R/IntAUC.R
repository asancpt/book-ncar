IntAUC = function(x, y, t1, t2, Res, down="Linear")
{
# Author: Kyun-Seop Bae k@acr.kr
# Last modification: 2017.7.24
# Called by: sNCA
# Calls: Interpol, LinAUC, LogAUC, UT
# INPUT
#    x: time
#    y: natural log of concentration
#   t1: time of start. This could be interpolated, if this is not included in x.
#   t2: time of end. This could be interpolated, if this is not included in x.
#  Res: result of sNCA
#  down: "Linear" or "Log" 
# RETURN
  Result = NA_real_ # Interval AUC

# Input check
  n = length(x)
  if (n != length(y) | !is.numeric(x) | !is.numeric(y)) return(Result)
  if (t1 > Res["TLST"]) return(Result)

  tL = Res["TLST"]
  if (t2 > tL & is.na(Res["LAMZ"])) return(Result)

  newSeries = Interpol(x, y, t1, Res["LAMZ"], Res["b0"], down=down)
  newSeries = Interpol(newSeries[[1]], newSeries[[2]], t2, Res["LAMZ"], Res["b0"], down=down)
  x = newSeries[[1]]
  y = newSeries[[2]]

  if (UT(down)=="LINEAR") {
    if (t2 <= tL) {
      Result = LinAUC(x[x>=t1 & x<=t2], y[x>=t1 & x<=t2])[[1]]
    } else {
      Result = LinAUC(x[x>=t1 & x<=tL], y[x>=t1 & x<=tL])[[1]] + LogAUC(x[x>=tL & x<=t2], y[x>=tL & x<=t2])[[1]]
    }
  } else if (UT(down)=="LOG") {
    Result = LogAUC(x[x>=t1 & x<=t2], y[x>=t1 & x<=t2])[[1]]
  } else {
    Result = NA_real_
  }

  return(Result)
}
