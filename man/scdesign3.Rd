% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/scdesign3.R
\name{scdesign3}
\alias{scdesign3}
\title{The wrapper for the whole scDesign3 pipeline}
\usage{
scdesign3(
  sce,
  assay_use = "counts",
  covariate_use = "celltype",
  celltype = "cell_type",
  pseudotime = "pseudotime",
  spatial = c("spatial1", "spatial2"),
  other_covariates = c("batch", "condition"),
  ncell = dim(sce)[2],
  predictor = "gene",
  mu_formula = "s(pseudotime, k = 10, bs = 'cr')",
  sigma_formula = "1",
  family = "nb",
  n_cores = 2,
  usebam = FALSE,
  cor_formula = "cell_type",
  copula = "vine",
  DT = TRUE,
  pseudo_obs = FALSE,
  family_set = c("gaussian", "indep")
)
}
\arguments{
\item{sce}{A \code{SingleCellExperiment} object.}

\item{assay_use}{A string which indicates the assay you will use in the sce. Default is 'counts'.}

\item{covariate_use}{A string of the primary covariate.
Must be one of 'celltype', 'pseudotime' or 'spatial'.}

\item{celltype}{A string of the name of cell type variable in the \code{colData} of the sce. Default is 'cee_type'.}

\item{pseudotime}{A string or a string vector of the name of pseudotime and (if exist)
multiple lineages. Default is NULL.}

\item{spatial}{A length two string vector of the names of spatial coordinates. Defualt is NULL.}

\item{other_covariates}{A string or a string vector of the other covaraites you want to include in the data.}

\item{ncell}{The number of cell you want to simulate. Default is \code{dim(sce)[2]} (the same number as the input data).}

\item{predictor}{Default is gene. ## Fix later}

\item{mu_formula}{A string of the mu parameter formula}

\item{sigma_formula}{A string of the sigma parameter formula}

\item{family}{A string of the marginal distribution.
Must be one of 'poisson', 'nb', 'zip', 'zinb' or 'gaussian'.}

\item{n_cores}{An integer. The number of cores to use.}

\item{usebam}{A logic variable. If use \code{\link[mgcv]{bam}} for acceleration.}

\item{cor_formula}{A string of the correlation structure.}

\item{copula}{A string of the copula choice. Must be one of 'gaussian' or 'vine'. Default is 'vine'.}

\item{DT}{A logic variable. If TRUE, perform the distributional transformation
to make the discrete data 'continuous'. This is useful for discrete distributions (e.g., Poisson, NB).
Default is TRUE.}

\item{pseudo_obs}{A logic variable. If TRUE, use the empirical quantiles instead of theoretical quantiles for fitting copula.
Default is FALSE.}

\item{family_set}{A string or a string vector of the bivariate copula families. Default is c("gaussian", "indep").}
}
\value{
A list with the components:
\describe{
  \item{\code{new_count}}{A matrix of the new simulated count (expression) matrix.}
  \item{\code{new_covariate}}{A data.frame of the new covariate matrix.}
}
}
\description{
\code{scdesign3} takes the input data, fits the model and
}