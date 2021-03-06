% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/entrez_fetch_list.R
\name{entrez_fetch_list}
\alias{entrez_fetch_list}
\title{Process multiple NCBI accessions and output as list}
\usage{
entrez_fetch_list(db, id, rettype, ...)
}
\arguments{
\item{db}{Sequence database}

\item{id}{vector of sequence IDs (accessions)}

\item{rettype}{...}

\item{...}{Additional}
}
\description{
Wrapper for rentez::entrez_fetch
}
