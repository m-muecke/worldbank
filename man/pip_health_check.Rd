% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pip.R
\name{pip_health_check}
\alias{pip_health_check}
\title{Determine if the API is running and listening as expected}
\source{
\url{https://pip.worldbank.org/api}
}
\usage{
pip_health_check()
}
\value{
A \code{character(1)} with the health check message.
}
\description{
Determine if the API is running and listening as expected
}
\examples{
\donttest{
pip_health_check()
}
}
\seealso{
Other poverty and inequality statistics: 
\code{\link{pip_aux}()},
\code{\link{pip_citation}()},
\code{\link{pip_data}()},
\code{\link{pip_group}()},
\code{\link{pip_info}()},
\code{\link{pip_valid_params}()},
\code{\link{pip_versions}()}
}
\concept{poverty and inequality statistics}
