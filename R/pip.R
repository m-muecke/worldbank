#' Return main poverty and inequality statistics
#'
#' @param country (`character()`) countries for which statistics are to be computed,
#'   specified as ISO3 codes. Default `NULL`.
#' @param year (`character()` | `numeric()`) year(s) for which statistics are to be
#'   computed, specified as YYYY. Default `NULL`.
#' @param povline (`numeric(1)`) poverty line to be used to compute poverty mesures.
#'   Poverty lines are only accepted up to 3 decimals. Default `2.15`.
#' @param popshare (`numeric(1)`) proportion of the population living below the poverty
#'   line. Will be ignored if povline is specified. Default `NULL`.
#' @param fill_gaps (`logical(1)`) whether to fill gaps in the data. Default `FALSE`.
#' @param welfare_type (`character(1)`) type of welfare measure to be used.
#'   Default `"all"`.
#' @param reporting_level (`character(1)`) level of reporting for the statistics.
#'   Default `"all"`.
#' @param additional_ind (`logical(1)`) whether to include additional indicators.
#'   Default `FALSE`.
#' @param release_version (`character(1)`) version of the data release in YYYYMMDD
#'   format. Default `NULL`.
#' @param ppp_version (`character(1)` | `numeric(1)`) version of the data.
#'   Default `NULL`.
#' @param version (`character(1)`) version of the data. Default `NULL`.
#' @returns A `data.frame()` with the requested statistics.
#' @source <https://pip.worldbank.org/api>
#' @family poverty and inequality statistics
#' @export
#' @examples
#' \donttest{
#' pip_data(c("ZAF", "ZMB"))
#' }
pip_data <- function(country = NULL,
                     year = NULL,
                     povline = 2.15,
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
  if (!is.null(year)) {
    year <- as.character(year)
  }
  if (!is.null(ppp_version)) {
    ppp_version <- as.character(ppp_version)
  }
  stopifnot(
    is.null(country) || is_character(country) && all(nchar(country) == 3L),
    is.null(year) || is_character(year) && all(grepl("[0-9]{4}", year)),
    is_bool(fill_gaps),
    is_string_or_null(release_version, "[0-9]{8}"),
    is_bool(additional_ind),
    is_string_or_null(ppp_version, "[0-9]{4}"),
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
  res
}

#' Return aggregation of PIP statistics
#'
#' @inheritParams pip_data
#' @param group_by (`character(1)`) aggregate results by pre-defined sub-groups.
#'   Default `"wb"`.
#' @returns A `data.frame()` with the requested statistics.
#' @inherit pip_data source
#' @family poverty and inequality statistics
#' @export
#' @examples
#' \donttest{
#' pip_group(c("AFE", "LAC"))
#' }
pip_group <- function(country = NULL,
                      year = NULL,
                      povline = 2.15,
                      popshare = NULL,
                      group_by = c("wb", "none"),
                      fill_gaps = FALSE,
                      welfare_type = c("all", "consumption", "income"),
                      reporting_level = c("all", "national", "rural", "urban"),
                      additional_ind = FALSE,
                      release_version = NULL,
                      ppp_version = NULL,
                      version = NULL) {
  group_by <- match.arg(group_by)
  welfare_type <- match.arg(welfare_type)
  reporting_level <- match.arg(reporting_level)
  if (!is.null(year)) {
    year <- as.character(year)
  }
  if (!is.null(ppp_version)) {
    ppp_version <- as.character(ppp_version)
  }
  stopifnot(
    is.null(country) || is_character(country) && all(nchar(country) == 3L),
    is.null(year) || is_character(year) && all(grepl("[0-9]{4}", year)),
    is_bool(fill_gaps),
    is_string_or_null(release_version, "[0-9]{8}"),
    is_bool(additional_ind),
    is_string_or_null(ppp_version, "[0-9]{4}"),
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
  res
}

#' Return the available data versions
#'
#' @returns A `data.frame()` with the available versions.
#' @inherit pip_data source
#' @family poverty and inequality statistics
#' @export
#' @examples
#' \donttest{
#' pip_versions()
#' }
pip_versions <- function() {
  res <- pip("versions", format = "csv")
  res
}

#' Return citation for a given version
#'
#' @inheritParams pip_data
#' @returns A `data.frame()` with the citation.
#' @inherit pip_data source
#' @family poverty and inequality statistics
#' @export
#' @examples
#' \donttest{
#' pip_citation()
#' }
pip_citation <- function(release_version = NULL,
                         ppp_version = NULL,
                         version = NULL) {
  if (!is.null(ppp_version)) {
    ppp_version <- as.character(ppp_version)
  }
  stopifnot(
    is_string_or_null(release_version, "[0-9]{8}"),
    is_string_or_null(ppp_version, "[0-9]{4}"),
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
  res
}

#' Return auxiliary data tables
#'
#' @inheritParams pip_data
#' @param table (`character(1)`) table to be returned. Default `NULL`.
#' @returns A `character()` with the available tables or a `data.frame()` containing the
#'   table data.
#' @inherit pip_data source
#' @family poverty and inequality statistics
#' @export
#' @examples
#' \donttest{
#' # get a list of available tables
#' pip_aux()
#'
#' # get countries
#' pip_aux("countries")
#'
#' # get GDP
#' pip_aux("gdp")
#'
#' # get CPI
#' pip_aux("cpi")
#' }
pip_aux <- function(table = NULL,
                    release_version = NULL,
                    ppp_version = NULL,
                    version = NULL) {
  if (!is.null(ppp_version)) {
    ppp_version <- as.character(ppp_version)
  }
  stopifnot(
    is_string_or_null(table),
    is_string_or_null(release_version, "[0-9]{8}"),
    is_string_or_null(ppp_version, "[0-9]{4}"),
    is_string_or_null(version)
  )
  if (is.null(table)) {
    res <- pip(
      resource = "aux",
      table = table,
      release_version = release_version,
      ppp_version = ppp_version,
      version = version,
      format = "json"
    )
    map_chr(res, "tables")
  } else {
    res <- pip(
      resource = "aux",
      table = table,
      release_version = release_version,
      ppp_version = ppp_version,
      version = version,
      format = "csv"
    )
    res <- clean_strings(res)
    res
  }
}

#' Return valid query parameters
#'
#' @inheritParams pip_data
#' @param endpoint (`character(1)`) endpoint for which valid parameters are to be
#'   returned. Default `"all"`.
#' @returns A `data.frame()` with the valid parameters.
#' @inherit pip_data source
#' @family poverty and inequality statistics
#' @export
#' @examples
#' \donttest{
#' pip_valid_params()
#' }
pip_valid_params <- function(endpoint = c("all", "aux", "pip", "pip-grp", "pip-info", "valid-params"), # nolint
                             release_version = NULL,
                             ppp_version = NULL,
                             version = NULL) {
  if (!is.null(ppp_version)) {
    ppp_version <- as.character(ppp_version)
  }
  stopifnot(
    is_string_or_null(release_version, "[0-9]{8}"),
    is_string_or_null(ppp_version, "[0-9]{4}"),
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
  res
}

#' Return information about the API
#'
#' @returns A `data.frame()` with the API information.
#' @inherit pip_data source
#' @family poverty and inequality statistics
#' @export
#' @examples
#' \donttest{
#' pip_info()
#' }
pip_info <- function() {
  pip("pip-info", format = "json")
}

#' Determine if the API is running and listening as expected
#'
#' @returns A `character(1)` with the health check message.
#' @inherit pip_data source
#' @family poverty and inequality statistics
#' @export
#' @examples
#' \donttest{
#' pip_health_check()
#' }
pip_health_check <- function() {
  msg <- pip("health-check", format = "json")
  msg[[1L]]
}

pip_error_body <- function(resp) {
  content_type <- resp_content_type(resp)
  if (identical(content_type, "application/json")) {
    body <- resp_body_json(resp)
    msg <- body$error[[1L]]
    details <- body$details$msg[[1L]]
    details <- gsub("\\s+", " ", details)
    c(msg, details)
  }
}

pip <- function(resource, ..., format = c("json", "csv", "xml", "rds")) {
  format <- match.arg(format)
  resp <- request("https://api.worldbank.org/pip/v1") |>
    req_user_agent("worldbank (https://m-muecke.github.io/worldbank)") |>
    req_url_path_append(resource) |>
    req_error(body = pip_error_body) |>
    req_url_query(format = format, ...) |>
    req_perform()
  body <- switch(format,
    json = resp_body_json(resp),
    csv = {
      body <- resp_body_string(resp, "UTF-8")
      utils::read.csv(textConnection(body, encoding = "UTF-8"))
    },
    xml = resp_body_xml(resp),
    rds = resp_body_raw(resp)
  )
  body
}
