\name{AUC}
\alias{AUC}
\title{Calculate Area Under the Curve (AUC) and Area Under the first Moment Curve (AUMC) in a table format}
\description{
Calculate Area Under the Curve(AUC) and the first Moment Curve(AUMC) in two ways; 'linear trapezoidal method' or 'linear-up and log-down' method.
Return a table of cumulative values.
}
\usage{AUC(x, y, down = "Linear")}
\arguments{
  \item{x}{vector values of independent variable, usually time}
  \item{y}{vector values of dependent variable, usually concentration}
  \item{down}{either of \code{"Linear"} or \code{"Log"} to indicate the way to calculate AUC and AUMC}
}
\details{
  \code{down="Linear"} means linear trapezoidal rule with linear interpolation.
  \code{down="Log"} means linear-up and log-down method.
}
\value{
  Table with two columns, \code{AUC} and \code{AUMC}; the first column values are cumulative AUCs and the second column values cumulative AUMCs.
}
\references{Rowland M, Tozer TN. Clinical Pharmacokinetics and Pharmacodynamics - Concepts and Applications. 4th ed. pp687-689. 2011.}
\author{Kyun-Seop Bae <k@acr.kr>}
\seealso{\code{\link{LinAUC}}, \code{\link{LogAUC}}}
\examples{
AUC(Theoph[Theoph$Subject==1, "Time"], Theoph[Theoph$Subject==1, "conc"])
AUC(Theoph[Theoph$Subject==1, "Time"], Theoph[Theoph$Subject==1, "conc"], down="Log")
}
\keyword{AUC}
