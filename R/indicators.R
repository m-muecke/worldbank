#' World Bank available languages
#'
#' List all languages supported by the World Bank API.
#'
#' @returns A `data.frame()` with the available languages. The columns are:
#' * `code`: The language code.
#' * `name`: The language name.
#' * `native_form`: The native form of the language name.
#' @source <https://api.worldbank.org/v2/languages>
#' @family indicators data
#' @export
#' @examplesIf httr2::is_online()
#' \donttest{
#' wb_language()
#' }
wb_language <- function() {
  data <- worldbank(resource = "languages")
  res <- data.frame(
    code = map_chr(data, "code"),
    name = map_chr(data, "name"),
    native_form = map_chr(data, "nativeForm"),
    check.names = FALSE
  )
  clean_strings(res)
}

#' World Bank lending type data
#'
#' List all lending types supported by the World Bank API.
#'
#' @param type (`NULL` | `character()`)\cr
#'   Lending type to query. Default `NULL`. If `NULL`, all types are returned.
#' @param lang (`character(1)`)\cr
#'   Language to query. Default `"en"`.
#' @returns A `data.frame()` with the available lending types. The columns are:
#' * `id`: The lending type ID.
#' * `iso2code`: The ISO 2 code of the lending type.
#' * `value`: The lending type value.
#' @source <https://api.worldbank.org/v2/lendingTypes>
#' @family indicators data
#' @export
#' @examplesIf httr2::is_online()
#' \donttest{
#' wb_lending_type()
#' }
wb_lending_type <- function(type = NULL, lang = "en") {
  stopifnot(is_character(type, null_ok = TRUE, n_chars = 3L))
  type <- format_param(type)

  resource <- sprintf("lendingType/%s", type)
  data <- worldbank(resource = resource, lang = lang)
  res <- data.frame(
    id = map_chr(data, "id"),
    iso2code = map_chr(data, "iso2code"),
    value = map_chr(data, "value"),
    check.names = FALSE
  )
  clean_strings(res)
}

#' World Bank income level data
#'
#' List all income levels supported by the World Bank API.
#'
#' @param income (`NULL` | `character()`)\cr
#'   Income level to query. Default `NULL`. If `NULL`, all levels are returned.
#' @param lang (`character(1)`)\cr
#'   Language to query. Default `"en"`.
#' @returns A `data.frame()` with the available income levels. The columns are:
#' * `id`: The income level ID.
#' * `iso2code`: The ISO 2 code of the income level.
#' * `value`: The income level value.
#' @source <https://api.worldbank.org/v2/incomeLevels>
#' @family indicators data
#' @export
#' @examplesIf httr2::is_online()
#' \donttest{
#' wb_income_level()
#' }
wb_income_level <- function(income = NULL, lang = "en") {
  stopifnot(is_character(income, null_ok = TRUE, n_chars = 3L))
  income <- format_param(income)

  resource <- sprintf("incomeLevel/%s", income)
  data <- worldbank(resource = resource, lang = lang)
  res <- data.frame(
    id = map_chr(data, "id"),
    iso2code = map_chr(data, "iso2code"),
    value = map_chr(data, "value"),
    check.names = FALSE
  )
  clean_strings(res)
}

#' World Bank source data
#'
#' List all sources supported by the World Bank API.
#'
#' @param source (`NULL` | `character()`)\cr
#'   Source to query. Default `NULL`. If `NULL`, all sources are returned.
#' @param lang (`character(1)`)\cr
#'   Language to query. Default `"en"`.
#' @returns A `data.frame()` with the available sources. The columns are:
#' * `id`: The source ID.
#' * `last_updated`: The date the source was last updated.
#' * `name`: The source name.
#' * `code`: The source code.
#' * `description`: The source description.
#' * `url`: The source URL.
#' * `data_availability`: Whether the source has data available.
#' * `metadata_availability`: Whether the source has metadata available.
#' * `concepts`: The concepts associated with the source.
#' @source <https://api.worldbank.org/v2/sources>
#' @family indicators data
#' @export
#' @examplesIf httr2::is_online()
#' \donttest{
#' src <- wb_source()
#' head(src)
#' }
wb_source <- function(source = NULL, lang = "en") {
  stopifnot(is_character(source, null_ok = TRUE))
  source <- format_param(source)

  resource <- sprintf("source/%s", source)
  data <- worldbank(resource = resource, lang = lang)
  res <- data.frame(
    id = as.integer(map_chr(data, "id")),
    last_updated = as.Date(map_chr(data, "lastupdated")),
    name = map_chr(data, "name"),
    code = map_chr(data, "code"),
    description = map_chr(data, "description"),
    url = map_chr(data, "url"),
    data_availability = to_logical(map_chr(data, "dataavailability")),
    metadata_availability = to_logical(map_chr(data, "metadataavailability")),
    concepts = as.integer(map_chr(data, "concepts")),
    check.names = FALSE
  )
  clean_strings(res)
}

#' World Bank topic data
#'
#' List all topics supported by the World Bank API.
#'
#' @param topic (`NULL` | `character()`)\cr
#'   Topic to query. Default `NULL`. If `NULL`, all topics are returned.
#' @param lang (`character(1)`)\cr
#'   Language to query. Default `"en"`.
#' @returns A `data.frame()` with the available topics. The columns are:
#' * `id`: The topic ID.
#' * `value`: The topic value.
#' * `source_note`: The source note.
#' @source <https://api.worldbank.org/v2/topics>
#' @family indicators data
#' @export
#' @examplesIf httr2::is_online()
#' \donttest{
#' topic <- wb_topic()
#' head(topic)
#' }
wb_topic <- function(topic = NULL, lang = "en") {
  stopifnot(is_character(topic, null_ok = TRUE))
  topic <- format_param(topic)

  resource <- sprintf("topic/%s", topic)
  data <- worldbank(resource = resource, lang = lang)
  res <- data.frame(
    id = as.integer(map_chr(data, "id")),
    value = map_chr(data, "value"),
    source_note = map_chr(data, "sourceNote"),
    check.names = FALSE
  )
  clean_strings(res)
}

#' World Bank region data
#'
#' List all regions supported by the World Bank API.
#'
#' @param region (`NULL` | `character()`)\cr
#'   Region to query. Default `NULL`. If `NULL`, all regions are returned.
#' @param lang (`character(1)`)\cr
#'   Language to query. Default `"en"`.
#' @returns A `data.frame()` with the available regions. The columns are:
#' * `id`: The region ID.
#' * `code`: The region code.
#' * `iso2code`: The ISO 2 code of the region.
#' * `name`: The region name.
#' @source <https://api.worldbank.org/v2/region>
#' @family indicators data
#' @export
#' @examplesIf httr2::is_online()
#' \donttest{
#' region <- wb_region()
#' head(region)
#' }
wb_region <- function(region = NULL, lang = "en") {
  stopifnot(
    is_character(region, null_ok = TRUE),
    is_string(lang, n_chars = 2L)
  )
  region <- format_param(region)

  resource <- sprintf("%s/region/%s", lang, region)
  data <- worldbank(resource = resource)
  res <- data.frame(
    id = as.integer(na_if_empty(map_chr(data, "id"))),
    code = map_chr(data, "code"),
    iso2code = map_chr(data, "iso2code"),
    name = map_chr(data, "name"),
    check.names = FALSE
  )
  clean_strings(res)
}

#' World Bank country data
#'
#' List all countries supported by the World Bank API.
#'
#' @param country (`NULL` | `character()`)\cr
#'   Country to query. Default `NULL`. If `NULL`, all countries are returned.
#' @param lang (`character(1)`)\cr
#'   Language to query. Default `"en"`.
#' @returns A `data.frame()` with the available countries. The columns are:
#' * `country_id`: The country ID.
#' * `country_code`: The country code.
#' * `country_name`: The country name.
#' * `region_id`: The region ID.
#' * `region_code`: The region code.
#' * `region_value`: The region value.
#' * `admin_region_id`: The admin region ID.
#' * `admin_region_code`: The admin region code.
#' * `admin_region_value`: The admin region value.
#' * `income_level_id`: The income level ID.
#' * `income_level_code`: The income level code.
#' * `income_level_value`: The income level value.
#' * `lending_type_id`: The lending type ID.
#' * `lending_type_code`: The lending type code.
#' * `lending_type_value`: The lending type value.
#' * `capital_city`: The capital city.
#' * `longitude`: The longitude.
#' * `latitude`: The latitude.
#' @source <https://api.worldbank.org/v2/country>
#' @family indicators data
#' @export
#' @examplesIf httr2::is_online()
#' \donttest{
#' country <- wb_country()
#' head(country)
#' }
wb_country <- function(country = NULL, lang = "en") {
  stopifnot(
    is_character(country, null_ok = TRUE, n_chars = 2:3),
    is_string(lang, n_chars = 2L)
  )
  country <- tolower(format_param(country))

  resource <- sprintf("%s/country/%s", lang, country)
  data <- worldbank(resource = resource)
  res <- data.frame(
    country_id = map_chr(data, "id"),
    country_code = map_chr(data, "iso2Code"),
    country_name = map_chr(data, "name"),
    region_id = map_chr(data, \(x) x$region$id),
    region_code = map_chr(data, \(x) x$region$iso2code),
    region_value = map_chr(data, \(x) x$region$value),
    admin_region_id = map_chr(data, \(x) x$adminregion$id),
    admin_region_code = map_chr(data, \(x) x$adminregion$iso2code),
    admin_region_value = map_chr(data, \(x) x$adminregion$value),
    income_level_id = map_chr(data, \(x) x$incomeLevel$id),
    income_level_code = map_chr(data, \(x) x$incomeLevel$iso2code),
    income_level_value = map_chr(data, \(x) x$incomeLevel$value),
    lending_type_id = map_chr(data, \(x) x$lendingType$id),
    lending_type_code = map_chr(data, \(x) x$lendingType$iso2code),
    lending_type_value = map_chr(data, \(x) x$lendingType$value),
    capital_city = map_chr(data, "capitalCity"),
    longitude = as.numeric(na_if_empty(map_chr(data, "longitude"))),
    latitude = as.numeric(na_if_empty(map_chr(data, "latitude"))),
    check.names = FALSE
  )
  clean_strings(res)
}

#' World Bank indicator data
#'
#' List all indicators supported by the World Bank API.
#'
#' @param indicator (`NULL` | `character(1)`)\cr
#'   Indicator to query. Default `NULL`. If `NULL`, all indicators are returned.
#' @param lang (`character(1)`)\cr
#'   Language to query. Default `"en"`.
#' @returns A `data.frame()` with the available indicators. The columns are:
#' * `id`: The indicator ID.
#' * `name`: The indicator name.
#' * `unit`: The indicator unit.
#' * `source_id`: The source ID.
#' * `source_value`: The source value.
#' * `source_note`: The source note.
#' * `source_organization`: The source organization.
#' * `topic_id`: The topic ID.
#' * `topic_value`: The topic value.
#' @source <https://api.worldbank.org/v2/indicator>
#' @family indicators data
#' @export
#' @examplesIf httr2::is_online()
#' \donttest{
#' wb_indicator("NY.GDP.MKTP.CD")
#' }
wb_indicator <- function(indicator = NULL, lang = "en") {
  stopifnot(is_string(indicator, null_ok = TRUE))
  indicator <- indicator %||% "all"

  resource <- sprintf("indicator/%s", indicator)
  data <- worldbank(resource = resource, lang = lang)
  res <- data.frame(
    id = map_chr(data, "id"),
    name = map_chr(data, "name"),
    unit = map_chr(data, "unit"),
    source_id = as.integer(map_chr(data, \(x) x$source$id)),
    source_value = map_chr(data, \(x) x$source$value),
    source_note = map_chr(data, "sourceNote"),
    source_organization = map_chr(data, "sourceOrganization"),
    topic_id = as.integer(map_chr(data, \(x) x$topics[1L][[1L]]$id %||% NA_character_)),
    topic_value = map_chr(data, \(x) x$topics[1L][[1L]]$value %||% NA_character_),
    check.names = FALSE
  )
  clean_strings(res)
}

#' Search World Bank indicators
#'
#' Search the indicator catalog returned by [wb_indicator()] for a regular expression
#' pattern across one or more text fields. By default the match is case insensitive.
#'
#' @param pattern (`character(1)`)\cr
#'   Regular expression to match.
#' @param fields (`character()`)\cr
#'   Columns of the indicator catalog to search. Default `c("id", "name", "source_note")`.
#' @param catalog (`NULL` | `data.frame()`)\cr
#'   Optional pre-fetched indicator catalog. If `NULL` (default), [wb_indicator()] is called.
#' @param lang (`character(1)`)\cr
#'   Language to query. Only used when `catalog` is `NULL`. Default `"en"`.
#' @param ignore.case (`logical(1)`)\cr
#'   Whether the match should be case insensitive. Default `TRUE`.
#' @param ... (`any`)\cr
#'   Additional arguments passed to [grepl()].
#' @returns A `data.frame()` with the matching rows of the indicator catalog.
#' @source <https://api.worldbank.org/v2/indicator>
#' @family indicators data
#' @export
#' @examplesIf httr2::is_online()
#' \donttest{
#' # search for indicators related to GDP
#' wb_search("GDP")
#'
#' # restrict the search to the indicator name
#' wb_search("unemployment", fields = "name")
#'
#' # case-sensitive fixed-string match
#' wb_search("GDP", ignore.case = FALSE, fixed = TRUE)
#' }
wb_search <- function(
  pattern,
  fields = c("id", "name", "source_note"),
  catalog = NULL,
  lang = "en",
  ignore.case = TRUE,
  ...
) {
  stopifnot(
    is_string(pattern),
    is_character(fields),
    is.null(catalog) || is.data.frame(catalog),
    is_flag(ignore.case)
  )
  catalog <- catalog %||% wb_indicator(lang = lang)
  missing_fields <- setdiff(fields, names(catalog))
  if (length(missing_fields) > 0L) {
    stop(
      sprintf("`fields` not found in catalog: %s.", toString(missing_fields)),
      call. = FALSE
    )
  }
  hit <- lapply(fields, function(x) {
    m <- grepl(pattern, catalog[[x]], ignore.case = ignore.case, ...)
    m & !is.na(m)
  })
  hit <- Reduce(`|`, hit)
  catalog[hit, , drop = FALSE]
}

#' World Bank WDI bulk download
#'
#' Download the entire World Development Indicators dataset as a single zip and return its
#' contents as a list of data frames. Useful for full-dataset analyses where paginating
#' through [wb_data()] would be slow, and for accessing footnote and series-time metadata
#' that the API does not expose.
#'
#' The download is roughly 280 MB compressed and may take a minute or more.
#'
#' @param timeout (`integer(1)`)\cr
#'   Maximum download time in seconds. Default `600`.
#' @returns A named `list` of `data.frame()`s:
#' * `data`: indicator values in long format with columns `country_name`, `country_code`,
#'   `indicator_name`, `indicator_code`, `year`, `value`.
#' * `country`: country metadata.
#' * `series`: series (indicator) metadata.
#' * `country_series`: country-series-specific notes.
#' * `series_time`: series-year-specific notes.
#' * `footnote`: footnotes per country, series, and year.
#' @source <https://databank.worldbank.org/data/download/WDI_CSV.zip>
#' @family indicators data
#' @export
#' @examplesIf httr2::is_online()
#' \dontrun{
#' wdi <- wb_bulk()
#' head(wdi$data)
#' }
wb_bulk <- function(timeout = 600L) {
  stopifnot(is_count(timeout))

  td <- tempfile()
  on.exit(unlink(td, recursive = TRUE), add = TRUE)
  dir.create(td)
  tf <- file.path(td, "WDI_CSV.zip")

  wb_request("https://databank.worldbank.org/data/download/WDI_CSV.zip") |>
    req_timeout(timeout) |>
    req_perform(path = tf)

  utils::unzip(tf, exdir = td)

  read_csv <- function(name) {
    df <- utils::read.csv(file.path(td, name), fileEncoding = "UTF-8-BOM")
    names(df) <- to_snake_case(names(df))
    df
  }

  # disambiguate the 2-letter ISO/WB codes from `country_code` (3-letter ISO).
  country <- read_csv("WDICountry.csv")
  names(country)[names(country) == "x2_alpha_code"] <- "iso2_code"
  names(country)[names(country) == "wb_2_code"] <- "wb_iso2_code"

  list(
    data = wdi_pivot_long(read_csv("WDICSV.csv")),
    country = country,
    series = read_csv("WDISeries.csv"),
    country_series = read_csv("WDIcountry-series.csv"),
    series_time = read_csv("WDIseries-time.csv"),
    footnote = read_csv("WDIfootnote.csv")
  )
}

#' World Bank country indicator data
#'
#' List all country indicators supported by the World Bank API.
#'
#' @param indicator (`character()`)\cr
#'   Indicators to query.
#' @param country (`NULL` | `character()`)\cr
#'   Countries to query. Default `NULL`. If `NULL`, all countries are returned.
#' @param lang (`character(1)`)\cr
#'   Language to query. Default `"en"`.
#' @param start_date (`NULL` | `character(1)` | `integer(1)`)\cr
#'   Start date to query. Default `NULL`. Supported formats:
#'   * YYYY for yearly data (e.g. `2020` or `"2020"`)
#'   * YYYYQ\[1-4\] for quarterly data (e.g. `"2020Q1"`)
#'   * YYYYM\[1-12\] for monthly data (e.g. `"2020M02"`)
#' @param end_date (`NULL` | `character(1)` | `integer(1)`)\cr
#'   End date to query, in the same format as start_date. Default `NULL`.
#' @param mrv (`NULL` | `integer(1)`)\cr
#'   Most recent values to return. An alternative to `start_date`/`end_date`. Default `NULL`.
#' @param gapfill (`logical(1)`)\cr
#'   Whether to fill missing values by carrying forward the last available value. Only used when
#'   `mrv` is set. Default `FALSE`.
#' @returns A `data.frame()` with the available country indicators.
#'   The columns are:
#' * `date`: The date
#' * `indicator_id`: The indicator ID.
#' * `indicator_name`: The indicator name.
#' * `country_id`: The country ID.
#' * `country_name`: The country name.
#' * `country_code`: The country code.
#' * `value`: The indicator value.
#' * `unit`: The indicator unit.
#' * `obs_status`: The observation status.
#' * `decimal`: The decimal.
#' @source <https://api.worldbank.org/v2/country/{country}/indicator/{indicator}>
#' @family indicators data
#' @export
#' @examplesIf httr2::is_online()
#' \donttest{
#' # single indicator for a single country (all available years)
#' ind <- wb_data("NY.GDP.MKTP.CD", "US")
#' head(ind)
#'
#' # multiple indicators for multiple countries (2015-2023)
#' ind <- wb_data(
#'   indicator = c("NY.GDP.MKTP.CD", "FP.CPI.TOTL.ZG"),
#'   country = c("US", "DE", "FR", "CH", "JP"),
#'   start_date = 2015, end_date = 2023
#' )
#' head(ind)
#' }
wb_data <- function(
  indicator = "NY.GDP.MKTP.CD",
  country = NULL,
  lang = "en",
  start_date = NULL,
  end_date = NULL,
  mrv = NULL,
  gapfill = FALSE
) {
  stopifnot(
    is_character(indicator),
    is_character(country, null_ok = TRUE, n_chars = 2:3),
    is_dateish(start_date, null_ok = TRUE),
    is_dateish(end_date, null_ok = TRUE),
    is_count(mrv, null_ok = TRUE),
    is_flag(gapfill)
  )
  has_start_date <- !is.null(start_date)
  has_end_date <- !is.null(end_date)
  if (has_start_date && has_end_date && start_date > end_date) {
    stop("`start_date` must be earlier than `end_date`.", call. = FALSE)
  }
  if (!is.null(mrv) && (has_start_date || has_end_date)) {
    stop("`mrv` cannot be used together with `start_date`/`end_date`.", call. = FALSE)
  }
  if (gapfill && is.null(mrv)) {
    stop("`gapfill = TRUE` requires `mrv` to be set.", call. = FALSE)
  }
  indicator <- toupper(indicator)
  country <- tolower(format_param(country))
  date <- format_date(start_date, end_date)
  gapfill <- if (gapfill) "Y" else NULL

  resource <- sprintf("country/%s/indicator/%s", country, indicator)
  if (length(resource) == 1L) {
    res <- worldbank(resource = resource, lang = lang, date = date, mrv = mrv, gapfill = gapfill)
    res <- parse_country_indicator(res)
  } else {
    res <- worldbank_seq(
      resource = resource,
      lang = lang,
      date = date,
      mrv = mrv,
      gapfill = gapfill
    )
    res <- map(res, parse_country_indicator)
    res <- do.call(rbind, res)
  }
  if (nrow(res) == 0L) {
    return(res)
  }
  if (nchar(res[1L, "date"]) == 4L) {
    res$date <- as.integer(res$date)
  }
  clean_strings(res)
}

#' @rdname wb_data
#' @export
wb_country_indicator <- wb_data

parse_country_indicator <- function(data) {
  res <- map(data, function(x) {
    if (is.null(x$value) || is.null(x$date)) {
      return()
    }
    data.frame(
      date = x$date,
      indicator_id = x$indicator$id,
      indicator_name = x$indicator$value,
      country_id = x$country$id,
      country_name = x$country$value,
      country_code = x$countryiso3code,
      value = x$value,
      unit = x$unit,
      obs_status = x$obs_status,
      decimal = x$decimal,
      check.names = FALSE
    )
  })
  do.call(rbind, res)
}

wdi_pivot_long <- function(data) {
  data$x <- NULL
  year_cols <- grep("^x[0-9]+$", names(data), value = TRUE)
  years <- as.integer(sub("^x", "", year_cols))
  n_years <- length(years)
  n_rows <- nrow(data)
  data.frame(
    country_name = rep(data$country_name, n_years),
    country_code = rep(data$country_code, n_years),
    indicator_name = rep(data$indicator_name, n_years),
    indicator_code = rep(data$indicator_code, n_years),
    year = rep(years, each = n_rows),
    value = unlist(data[, year_cols], use.names = FALSE),
    check.names = FALSE
  )
}

worldbank <- function(resource, ..., lang = NULL, per_page = 32500L) {
  stopifnot(is_string(lang, null_ok = TRUE, n_chars = 2L))
  json <- wb_request("https://api.worldbank.org/v2") |>
    req_url_path_append(lang, resource) |>
    req_url_query(..., format = "json", per_page = per_page) |>
    req_error(is_error = is_wb_error, body = wb_error_body) |>
    req_perform() |>
    resp_body_json()
  json[[2L]]
}

worldbank_seq <- function(resource, ..., lang = NULL, per_page = 32500L) {
  stopifnot(is_string(lang, null_ok = TRUE, n_chars = 2L))
  req <- wb_request("https://api.worldbank.org/v2") |>
    req_url_query(..., format = "json", per_page = per_page) |>
    req_error(is_error = is_wb_error, body = wb_error_body)

  resource |>
    map(\(x) req_url_path_append(req, lang, x)) |>
    req_perform_sequential() |>
    map(\(x) resp_body_json(x)[[2L]])
}

is_wb_error <- function(resp) {
  status <- resp_status(resp)
  if (status >= 400L) {
    return(TRUE)
  }
  json <- resp_body_json(resp)
  if (length(json) == 1L && length(json[[1L]]$message) == 1L) {
    return(TRUE)
  }
  FALSE
}

wb_error_body <- function(resp) {
  content_type <- resp_content_type(resp)
  if (identical(content_type, "application/json")) {
    json <- resp_body_json(resp)
    msg <- json[[1L]]$message[[1L]]
    error_code <- paste("Error code:", msg$id)
    docs <- "Read more at <https://datahelpdesk.worldbank.org/knowledgebase/articles/898620-api-error-codes>" # nolint
    c(error_code, msg$value, docs)
  }
}
