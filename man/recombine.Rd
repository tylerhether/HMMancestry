% Generated by roxygen2 (4.1.0): do not edit by hand
% Please edit documentation in R/simulate.R
\name{recombine}
\alias{recombine}
\title{Simulate recombination}
\usage{
recombine(parents, r.index, mu.rate = 0, f.cross = 0.5, f.convert = 0,
  length.conversion = 20)
}
\arguments{
\item{parents}{an object of class \code{parent.genomes} specifying the parental genotypes
at each simulated snp.}

\item{r.index}{a vector of length \code{L-1} specifying whether a recombination is to be
simulated (1) or not (0) in between two adjacent snps.}

\item{mu.rate}{a numeric between 0 and 1 (inclusive) specifying the per snp mutation rate.}

\item{f.cross}{a numeric between 0 and 1 (inclusive) giving the frequency of recombination
events that result in crossing over. This is same as 1 minus the frequenc of non-crossovers.}

\item{f.convert}{a numeric between 0 and 1 (inclusive) that gives the frequency of gene conversion
during recombination.}

\item{length.conversion}{an integer specifying the mean (and variance) of a given gene conversion
tract.}
}
\value{
an object of class \code{recombine} that contains the following data:
\describe{
	\item{parents}{input data}
	\item{r.index}{input data}
	\item{m.rate}{input data}
	\item{f.cross}{input data}
	\item{f.convert}{input data}
	\item{length.conversion}{input data}
	\item{chromatids.mutated_snps}{a list giving the genotypes of 4 chromatids (two pairs of sister chromatids) following mutation}
	\item{chromatids.recombined}{a list giving the genotypes of 4 chromatids following recombination}
}
}
\description{
This function simulates recombination between two parent genomes of class
\code{parent.genomes}.
}
\details{
(to do)
}
\examples{
set.seed(1234567) # For reproducability
l <- 50 # number of loci to simulate
rec <- 0.02 # recombination rate between each snp
r <- recombine_index(rep(rec, l-1)) # recombination rate between each snp (vector form)
p_a <- .999 # probability of correct sequencing assignment (1-sequence error rate)
p <- make_parents(l) # make the parent
recomb_sim <- recombine(parents=p, r.index=r, mu.rate=0, f.cross=.5, f.convert=1, length.conversion=10) # recombine parents
recomb_sim
}
\author{
Tyler D. Hether
}
\references{
(to do: refernce a crossover vs non-crossover paper)
}
\seealso{
\code{\link{parent_genomes}}, \code{\link{recombine_index}}
}
