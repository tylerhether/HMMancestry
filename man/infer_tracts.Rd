% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/infer-recom.R
\name{infer_tracts}
\alias{infer_tracts}
\title{Identify crossover, non-crossover, and gene conversion tracts}
\usage{
infer_tracts(dat, threshold_size = 2500)
}
\arguments{
\item{\code{data}}{A data.frame with 7 columns:
 \enumerate{
     \item{c("Tetrad", "Chr", "Snp", "one", "two", "three", "four")}
     \item{\code{Tetrad} specifying the tetrad ID}
     \item{\code{Chr} giving the chromosome name}
     \item{\code{Snp} a vector of snp locations (in bps)}
     \item{\code{one} the inferred states for spore 1}
     \item{\code{two} the inferred states for spore 2}
     \item{\code{three} the inferred states for spore 3}
     \item{\code{four} the inferred states for spore 4}
}}

\item{\code{threshold_size}}{The size (in bps) of the threshold (see details)}
}
\value{
A data.frame containing the following columns:
\enumerate{
     \item{type}{ The type of inferred tract}
     \item{start_snp}{ The starting snp position in base pairs}
     \item{end_snp}{ The ending snp position in base pairs}
     \item{extent}{ The size of the tract. For COnoGC, this extent is the s
           spanning region between flanking CO events.}
     }
}
\description{
Infers different types of tracts (crossover, non-crossover, and gene conversion) along a
chromosome
}
\details{
Uses the 3 step classification scheme described in Hether et al. (in review)
to identify the location of these specific CO, NCO, and telomeric gene conversion tracts.
Specifically, \code{infer_tracts} attempts to identify the following tracts:
     \itemize{
         \item{2_2}{ a tract with 2:2 segregation}
         \item{COyesGC}{ a region of gene conversion that was associated with a crossover event}
         \item{COnoGC}{ a region between a crossover event that did not have a detectable gene conversion}
         \item{NCO}{ a non-crossover; a gene conversion tract without crossing}
         \item{GC_tel}{ a gene conversion tract located at the chromosome end}
     }
}
\examples{
set.seed(1234567)        # For reproducibility
n_tetrads <- 3           # number of tetrads
l <- 1000                # number of snps to simulate
c <- 3e-05               # recombination rate between snps (Morgan/bp)
snps <- c(1:l)*250       # snps are evenly spaced 250 bp apart
p_a <- 0.95              # assignment probability
coverage <- 1            # mean coverage
# simulate tetrads
tetrad <- sim_tetrad(n.tetrads=n_tetrads, scale=c, snps=snps,
 p.assign=p_a, mu.rate=1e-03, f.cross=0.6, f.convert=0.8,
 length.conversion=2e3, coverage=coverage)
#' # Example 1 -- infer tracts directly from simulated data
inf_tracts_sim <- infer_tracts(tetrad)
inf_tracts_sim
#' # Example 2 -- infer tracts from inferred data
inf_states <- ddply(tetrad, .(Tetrad, Spore, Chr),
    function(x){
    return(fb_haploid(snp_locations=x$Snp, p0=x$p0,
    p1=x$p1, p_assign=p_a, scale=c))})
inf_tracts_inf_states <- infer_tracts(inf_states)
inf_tracts_inf_states
}
\author{
Tyler D. Hether
}
\references{
Hether, T.D., C. G. Wiench1, and P.A. Hohenlohe (in review). 2015. Novel molecular and analytical tools
for efficient estimation of rates of meiotic crossover, non-crossover and gene conversion
}

