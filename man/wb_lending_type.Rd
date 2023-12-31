% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/wb.R
\name{wb_lending_type}
\alias{wb_lending_type}
\title{World Bank lending type data}
\usage{
wb_lending_type(type = NULL, lang = "en")
}
\arguments{
\item{type}{character() lending type to query. Default is \code{NULL}.
If \code{NULL}, all types are returned.}

\item{lang}{character(1) language to query. Default is "en".}
}
\value{
A data.frame with the available lending types. The columns are:
\item{id}{The lending type ID.}
\item{iso2code}{The ISO 2 code of the lending type.}
\item{value}{The lending type value.}
}
\description{
List all lending types supported by the World Bank API.
}
\examples{
wb_lending_type()
}
\references{
\url{http://api.worldbank.org/v2/lendingTypes}
}
