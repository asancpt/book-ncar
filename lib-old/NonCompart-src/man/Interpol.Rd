\name{Interpol}
\alias{Interpol}
\title{Interpolate y value}
\description{It interpolates y value when a corresponding x value (xnew) does not exist within x vector}
\usage{Interpol(x, y, xnew, Slope, b0, down = "Linear")}
\arguments{
  \item{x}{vector values of x-axis, usually time}
  \item{y}{vector values of y-axis, usually concentration}
  \item{xnew}{new x point to be interpolated, usually new time point}
  \item{Slope}{slope of regression log(y) ~ x}
  \item{b0}{y value of just left point of xnew}
  \item{down}{either of \code{"Linear"} or \code{"Log"} to indicate the way to interpolate}
}
\details{
This function interpolate y value, if xnew is not in x vector.
If xnew is in x vector, it just returns the given x and y vector.
This function usually is called by \code{IntAUC} function
Returned vector is sorted in the order of increasing x values.
}
\value{new x and y vector containing xnew and ynew point}
\author{Kyun-Seop Bae <k@acr.kr>}
\seealso{\code{\link{IntAUC}}}
\examples{
x = 10:1 + 0.1
y = -2*x + 40.2
Interpol(x, y, 1.5)
Interpol(x, y, 1.5, down="Log")
}
\keyword{interpolation}
\keyword{interval AUC}
\keyword{partial AUC}
