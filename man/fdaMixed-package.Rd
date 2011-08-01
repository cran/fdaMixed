\name{fdaMixed-package}
\alias{fdaMixed}
\docType{package}
\title{Functional data analysis in a mixed model framework}
\description{Likelihood based analysis of 1-dimension functional data in
  a mixed-effets model framework. The methodology is designed for
  equidistantly sampled high frequency data, where the needed matrix
  computation may be approximated by semi-explicit operator
  equivalents with linear computational complexity. Extensions exist for
  non-equidistantly sampled data, but these have not been implemented. 
} 
\details{
\tabular{ll}{
Package: \tab fdaMixed\cr
Type: \tab Package\cr
Version: \tab 0.1\cr
Date: \tab 2011-08-01\cr
License: \tab GPL-2\cr
LazyLoad: \tab yes\cr
}
}
\author{
Bo Markussen <bomar@life.ku.dk>
}
\references{
Bo Markussen, "Functional data analysis in an operator based mixed model
framework", accepted, Bernoulli, 2011.

Conrad Sanderson, "Armadillo: An open source C++ linear algebra library
for fast prototyping and computationally intensive experiments", NICTA
technical report, 2010.

Dirk Eddelbuettel, Ramain Francois, "Rcpp: Seamless R and C++
integration", submitted article currently under review, 2010.
}
\keyword{
  package
  models
}
\seealso{
  Implementation done using the package \code{RcppArmadillo}.
  For penalized likelihood analysis of functional data see the packages
  \code{fda} and \code{fda.usc}.
}
\examples{
x <- seq(0,2*pi,length.out=200)
y.true <- sin(x)+x
y.obs <- y.true + rnorm(200)
est0 <- fdaLm(y.obs~0,Fright="open",right=2*pi)
est1 <- fdaLm(y.obs~0+x,Fright="open",right=2*pi)
plot(x,y.obs,main="Estimating the sum of a line and a curve")
lines(x,y.true,lty=2)
lines(x,est0$xBLUP[,1,1],col=2)
lines(x,est1$betaHat*x+est1$xBLUP[,1,1],col=3)
legend("topleft",c("True curve","Smooth","Line + smooth"),col=1:3,lty=c(2,1,1))
}
