% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/indicators.R
\name{wb_country_indicator}
\alias{wb_country_indicator}
\alias{wb_data}
\title{World Bank country indicator data}
\source{
\url{https://api.worldbank.org/v2/country/{country}/indicator/{indicator}}
}
\usage{
wb_country_indicator(
  indicator = "NY.GDP.MKTP.CD",
  country = NULL,
  lang = "en",
  start_date = NULL,
  end_date = NULL
)

wb_data(
  indicator = "NY.GDP.MKTP.CD",
  country = NULL,
  lang = "en",
  start_date = NULL,
  end_date = NULL
)
}
\arguments{
\item{indicator}{(\code{character()}) indicators to query.}

\item{country}{(\code{character()}) countries to query. Default \code{NULL}.
If \code{NULL}, all countries are returned.}

\item{lang}{(\code{character(1)}) language to query. Default \code{"en"}.}

\item{start_date}{(\code{character(1)} | \code{integer(1)}) start date to query.
Default \code{NULL}. Supported formats:
\itemize{
\item YYYY for yearly data (e.g. \code{2020} or \code{"2020"})
\item YYYYQ[1-4] for quarterly data (e.g. \code{"2020Q1"})
\item YYYYM[1-12] for monthly data (e.g. \code{"2020M02"})
}}

\item{end_date}{(\code{character(1)} | \code{integer(1)}) end date to query, in the same format
as start_date. Default \code{NULL}.}
}
\value{
A \code{data.frame()} with the available country indicators.
The columns are:
\item{date}{The date}
\item{indicator_id}{The indicator ID.}
\item{indicator_name}{The indicator name.}
\item{country_id}{The country ID.}
\item{country_name}{The country name.}
\item{country_code}{The country code.}
\item{value}{The indicator value.}
\item{unit}{The indicator unit.}
\item{obs_status}{The observation status.}
\item{decimal}{The decimal.}
}
\description{
List all country indicators supported by the World Bank API.
}
\examples{
ind <- wb_country_indicator("NY.GDP.MKTP.CD", "US")
head(ind)
ind <- wb_country_indicator(
  indicator = c("NY.GDP.MKTP.CD", "FP.CPI.TOTL.ZG"),
  country = c("US", "DE", "FR", "CH", "JP"),
  start_date = 2015, end_date = 2023
)
head(ind)
}
