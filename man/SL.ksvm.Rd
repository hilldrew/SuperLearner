% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/SL.ksvm.R
\encoding{utf-8}
\name{SL.ksvm}
\alias{SL.ksvm}
\title{Wrapper for Kernlab's SVM algorithm}
\usage{
SL.ksvm(Y, X, newX, family, type = NULL, kernel = "rbfdot",
  kpar = "automatic", scaled = T, C = 1, nu = 0.2, epsilon = 0.1,
  cross = 0, prob.model = family$family == "binomial",
  class.weights = NULL, cache = 40, tol = 0.001, shrinking = T, ...)
}
\arguments{
\item{Y}{Outcome variable}

\item{X}{Training dataframe}

\item{newX}{Test dataframe}

\item{family}{Gaussian or binomial}

\item{type}{ksvm can be used for classification , for regression, or for
novelty detection. Depending on whether y is a factor or not, the default
setting for type is C-svc or eps-svr, respectively, but can be overwritten
by setting an explicit value. See ?ksvm for more details.}

\item{kernel}{the kernel function used in training and predicting. This
parameter can be set to any function, of class kernel, which computes the
inner product in feature space between two vector arguments. See ?ksvm for
more details.}

\item{kpar}{the list of hyper-parameters (kernel parameters). This is a list
which contains the parameters to be used with the kernel function. See
?ksvm for more details.}

\item{scaled}{A logical vector indicating the variables to be scaled. If
scaled is of length 1, the value is recycled as many times as needed and
all non-binary variables are scaled. Per default, data are scaled
internally (both x and y variables) to zero mean and unit variance. The
center and scale values are returned and used for later predictions.}

\item{C}{cost of constraints violation (default: 1) this is the ‘C’-constant
of the regularization term in the Lagrange formulation.}

\item{nu}{parameter needed for nu-svc, one-svc, and nu-svr. The nu parameter
sets the upper bound on the training error and the lower bound on the
fraction of data points to become Support Vectors (default: 0.2).}

\item{epsilon}{epsilon in the insensitive-loss function used for eps-svr,
nu-svr and eps-bsvm (default: 0.1)}

\item{cross}{if a integer value k>0 is specified, a k-fold cross validation
on the training data is performed to assess the quality of the model: the
accuracy rate for classification and the Mean Squared Error for regression}

\item{prob.model}{if set to TRUE builds a model for calculating class
probabilities or in case of regression, calculates the scaling parameter of
the Laplacian distribution fitted on the residuals. Fitting is done on
output data created by performing a 3-fold cross-validation on the training
data. (default: FALSE)}

\item{class.weights}{a named vector of weights for the different classes,
used for asymmetric class sizes. Not all factor levels have to be supplied
(default weight: 1). All components have to be named.}

\item{cache}{cache memory in MB (default 40)}

\item{tol}{tolerance of termination criterion (default: 0.001)}

\item{shrinking}{option whether to use the shrinking-heuristics (default: TRUE)}

\item{...}{Any additional parameters, not currently passed through.}
}
\value{
List with predictions and the original training data &
  hyperparameters.
}
\description{
Wrapper for Kernlab's support vector machine algorithm.
}
\examples{

data(Boston, package = "MASS")
Y = Boston$medv
# Remove outcome from covariate dataframe.
X = Boston[, -14]

set.seed(1)

sl = SuperLearner(Y, X, family = gaussian(),
                 SL.library = c("SL.mean", "SL.ksvm"))
sl

pred = predict(sl, X)
summary(pred$pred)

}
\references{
Hsu, C. W., Chang, C. C., & Lin, C. J. (2016). A practical guide to support
vector classification. \url{http://www.csie.ntu.edu.tw/~cjlin/papers/guide/guide.pdf}

Scholkopf, B., & Smola, A. J. (2001). Learning with kernels: support vector
machines, regularization, optimization, and beyond. MIT press.

Vapnik, V. N. (1998). Statistical learning theory (Vol. 1). New York: Wiley.

Zeileis, A., Hornik, K., Smola, A., & Karatzoglou, A. (2004). kernlab-an S4
package for kernel methods in R. Journal of statistical software, 11(9),
1-20.
}
\seealso{
\code{\link{predict.SL.ksvm}} \code{\link[kernlab]{ksvm}}
  \code{\link[kernlab]{predict.ksvm}}
}
