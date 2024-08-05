#' Return main poverty and inequality statistics
#'
#' @source <https://pip.worldbank.org/api>
#' @export
pip_data <- function(country = NULL,
                     year = NULL,
                     povline = NULL,
                     popshare = NULL,
                     fill_gaps = FALSE,
                     welfare_type = c("all", "consumption", "income"),
                     reporting_level = c("all", "national", "rural", "urban"),
                     additional_ind = FALSE,
                     release_version = NULL,
                     ppp_version = NULL,
                     version = NULL) {
  welfare_type <- match.arg(welfare_type)
  reporting_level <- match.arg(reporting_level)
  if (!is.null(ppp_version)) {
    ppp_version <- as.character(ppp_version)
  }
  stopifnot(
    is.null(country) || is_character(country) && all(nchar(country) == 3L),
    is_bool(fill_gaps),
    is_string_or_null(release_version), grepl("[0-9]{8}", release_version),
    is_bool(additional_ind),
    is_string_or_null(ppp_version), grepl("[0-9]{4}", ppp_version),
    is_string_or_null(version)
  )
  res <- pip(
    resource = "pip",
    country = country,
    year = year,
    povline = povline,
    popshare = popshare,
    fill_gaps = fill_gaps,
    welfare_type = welfare_type,
    reporting_level = reporting_level,
    additional_ind = additional_ind,
    release_version = release_version,
    ppp_version = ppp_version,
    version = version,
    format = "csv",
    .multi = "comma"
  )
  as_tibble(res)
}

#' Return aggregation of PIP statistics
#'
#' @export
pip_summary <- function(country = NULL,
                        year = NULL,
                        povline = NULL,
                        popshare = NULL,
                        group_by = NULL,
                        fill_gaps = FALSE,
                        welfare_type = c("all", "consumption", "income"),
                        reporting_level = c("all", "national", "rural", "urban"),
                        additional_ind = FALSE,
                        release_version = NULL,
                        ppp_version = NULL,
                        version = NULL) {
  welfare_type <- match.arg(welfare_type)
  reporting_level <- match.arg(reporting_level)
  if (!is.null(ppp_version)) {
    ppp_version <- as.character(ppp_version)
  }
  stopifnot(
    is.null(country) || is_character(country) && all(nchar(country) == 3L),
    is_bool(fill_gaps),
    is_string_or_null(release_version), grepl("[0-9]{8}", release_version),
    is_bool(additional_ind),
    is_string_or_null(ppp_version), grepl("[0-9]{4}", ppp_version),
    is_string_or_null(version)
  )
  res <- pip(
    resource = "pip-grp",
    country = country,
    year = year,
    povline = povline,
    popshare = popshare,
    fill_gaps = fill_gaps,
    group_by = group_by,
    welfare_type = welfare_type,
    reporting_level = reporting_level,
    additional_ind = additional_ind,
    release_version = release_version,
    ppp_version = ppp_version,
    version = version,
    format = "csv",
    .multi = "comma"
  )
  as_tibble(res)
}

#' Return the available data versions
#'
#' @export
pip_versions <- function() {
  res <- pip("versions", format = "csv")
  as_tibble(res)
}

#' Return citation for a given version
#'
#' @export
pip_citation <- function(release_version = NULL,
                         ppp_version = NULL,
                         version = NULL) {
  if (!is.null(ppp_version)) {
    ppp_version <- as.character(ppp_version)
  }
  stopifnot(
    is_string_or_null(release_version), grepl("[0-9]{8}", release_version),
    is_string_or_null(ppp_version), grepl("[0-9]{4}", ppp_version),
    is_string_or_null(version)
  )
  res <- pip(
    resource = "citation",
    release_version = release_version,
    ppp_version = ppp_version,
    version = version,
    format = "json"
  )
  res <- data.frame(
    citation = res$citation[[1L]],
    version = res$version[[1L]],
    date_accessed = res$date_accessed[[1L]],
    check.names = FALSE
  )
  as_tibble(res)
}

#' Return auxiliary data tables
#'
#' @export
pip_aux <- function(table = NULL,
                    release_version = NULL,
                    ppp_version = NULL,
                    version = NULL) {
  if (!is.null(ppp_version)) {
    ppp_version <- as.character(ppp_version)
  }
  stopifnot(
    is_string_or_null(release_version), grepl("[0-9]{8}", release_version),
    is_string_or_null(ppp_version), grepl("[0-9]{4}", ppp_version),
    is_string_or_null(version)
  )
  res <- pip(
    resource = "aux",
    table = table,
    release_version = release_version,
    ppp_version = ppp_version,
    version = version,
    format = "json"
  )
  map_chr(res, "tables")
}

#' Return valid query parameters
#'
#' @export
pip_valid_params <- function(endpoint = c("all", "aux", "pip", "pip-grp", "pip-info", "valid-params"),
                             release_version = NULL,
                             ppp_version = NULL,
                             version = NULL) {
  if (!is.null(ppp_version)) {
    ppp_version <- as.character(ppp_version)
  }
  stopifnot(
    is_string_or_null(release_version), grepl("[0-9]{8}", release_version),
    is_string_or_null(ppp_version), grepl("[0-9]{4}", ppp_version),
    is_string_or_null(version)
  )
  endpoint <- match.arg(endpoint)
  res <- pip(
    resource = "valid-params",
    endpoint = endpoint,
    release_version = release_version,
    ppp_version = ppp_version,
    version = version,
    format = "csv"
  )
  res <- clean_strings(res)
  names(res) <- sub("^param_", "", names(res))
  as_tibble(res)
}

#' Return information about the API
#'
#' @export
pip_info <- function() {
  pip("pip-info", format = "json")
}

#' Determine if the API is running and listening as expected
#'
#' @export
pip_health_check <- function() {
  msg <- pip("health-check", format = "json")
  msg[[1L]]
}

pip_error_body <- function(resp) {
  body <- resp_body_json(resp)
  msg <- body$error[[1L]]
  details <- body$details$msg[[1L]]
  details <- gsub("\\s+", " ", details)
  c(msg, details)
}

pip <- function(resource, ..., format = c("json", "csv", "xml", "rds")) {
  format <- match.arg(format)
  resp <- request("https://api.worldbank.org/pip/v1") |>
    req_user_agent("worldbank (https://m-muecke.github.io/worldbank)") |>
    req_url_path_append(resource) |>
    req_error(body = pip_error_body) |>
    req_url_query(..., format = format) |>
    req_perform()
  body <- switch(format,
    json = resp_body_json(resp),
    csv = {
      body <- resp_body_string(resp)
      body <- utils::read.csv(textConnection(body, encoding = "UTF-8"))
    },
    xml = resp_body_xml(resp),
    rds = resp_body_raw(resp)
  )
  body
}
