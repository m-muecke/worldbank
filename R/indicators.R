#' World Bank available languages
#'
#' @description
#' List all languages supported by the World Bank API.
#'
#' @returns A `data.frame()` with the available languages. The columns are:
#'   \item{code}{The language code.}
#'   \item{name}{The language name.}
#'   \item{native_form}{The native form of the language name.}
#' @source <https://api.worldbank.org/v2/languages>
#' @family indicators data
#' @export
#' @examples
#' wb_language()
wb_language <- function() {
  data <- worldbank(resource = "languages")
  res <- data.frame(
    code = map_chr(data, "code"),
    name = map_chr(data, "name"),
    native_form = map_chr(data, "nativeForm"),
    check.names = FALSE
  )
  res <- clean_strings(res)
  res
}

#' World Bank lending type data
#'
#' @description
#' List all lending types supported by the World Bank API.
#'
#' @param type (`character()`) lending type to query. Default `NULL`.
#'   If `NULL`, all types are returned.
#' @param lang (`character(1)`) language to query. Default `"en"`.
#' @returns A `data.frame()` with the available lending types. The columns are:
#'   \item{id}{The lending type ID.}
#'   \item{iso2code}{The ISO 2 code of the lending type.}
#'   \item{value}{The lending type value.}
#' @source <https://api.worldbank.org/v2/lendingTypes>
#' @family indicators data
#' @export
#' @examples
#' wb_lending_type()
wb_lending_type <- function(type = NULL, lang = "en") {
  stopifnot(is_character_or_null(type), nchar(type) == 3L)
  type <- format_param(type)

  resource <- sprintf("lendingType/%s", type)
  data <- worldbank(resource = resource, lang = lang)
  res <- data.frame(
    id = map_chr(data, "id"),
    iso2code = map_chr(data, "iso2code"),
    value = map_chr(data, "value"),
    check.names = FALSE
  )
  res <- clean_strings(res)
  res
}

#' World Bank income level data
#'
#' @description
#' List all income levels supported by the World Bank API.
#'
#' @param income (`character()`) income level to query. Default `NULL`.
#'   If `NULL`, all levels are returned.
#' @param lang (`character(1)`) language to query. Default `"en"`.
#' @returns A `data.frame()` with the available income levels. The columns are:
#'   \item{id}{The income level ID.}
#'   \item{iso2code}{The ISO 2 code of the income level.}
#'   \item{value}{The income level value.}
#' @source <https://api.worldbank.org/v2/incomeLevels>
#' @family indicators data
#' @export
#' @examples
#' wb_income_level()
wb_income_level <- function(income = NULL, lang = "en") {
  stopifnot(is_character_or_null(income), nchar(income) == 3L)
  income <- format_param(income)

  resource <- sprintf("incomeLevel/%s", income)
  data <- worldbank(resource = resource, lang = lang)
  res <- data.frame(
    id = map_chr(data, "id"),
    iso2code = map_chr(data, "iso2code"),
    value = map_chr(data, "value"),
    check.names = FALSE
  )
  res <- clean_strings(res)
  res
}

#' World Bank source data
#'
#' @description
#' List all sources supported by the World Bank API.
#'
#' @param source (`character()`) source to query. Default `NULL`.
#'   If `NULL`, all sources are returned.
#' @param lang (`character(1)`) language to query. Default `"en"`.
#' @returns A `data.frame()` with the available sources. The columns are:
#'   \item{id}{The source ID.}
#'   \item{last_updated}{The date the source was last updated.}
#'   \item{name}{The source name.}
#'   \item{code}{The source code.}
#'   \item{description}{The source description.}
#'   \item{url}{The source URL.}
#'   \item{data_availability}{Whether the source has data available.}
#'   \item{metadata_availability}{Whether the source has metadata available.}
#'   \item{concepts}{The concepts associated with the source.}
#' @source <https://api.worldbank.org/v2/sources>
#' @family indicators data
#' @export
#' @examples
#' wb_source()
wb_source <- function(source = NULL, lang = "en") {
  stopifnot(is_character_or_null(source))
  source <- format_param(source)

  resource <- sprintf("source/%s", source)
  data <- worldbank(resource = resource, lang = lang)
  res <- data.frame(
    id = map_chr(data, "id") |> as.integer(),
    last_updated = map_chr(data, "lastupdated") |> as.Date(),
    name = map_chr(data, "name"),
    code = map_chr(data, "code"),
    description = map_chr(data, "description"),
    url = map_chr(data, "url"),
    data_availability = map_chr(data, "dataavailability") |> to_logical(),
    metadata_availability = map_chr(data, "metadataavailability") |> to_logical(),
    concepts = map_chr(data, "concepts") |> as.integer(),
    check.names = FALSE
  )
  res <- clean_strings(res)
  res
}

#' World Bank topic data
#'
#' @description
#' List all topics supported by the World Bank API.
#'
#' @param topic (`character()`) topic to query. Default `NULL`.
#'   If `NULL`, all topics are returned.
#' @param lang (`character(1)`) language to query. Default `"en"`.
#' @returns A `data.frame()` with the available topics. The columns are:
#'   \item{id}{The topic ID.}
#'   \item{value}{The topic value.}
#'   \item{source_note}{The source note.}
#' @source <https://api.worldbank.org/v2/topics>
#' @family indicators data
#' @export
#' @examples
#' wb_topic()
wb_topic <- function(topic = NULL, lang = "en") {
  stopifnot(is_character_or_null(topic))
  topic <- format_param(topic)

  resource <- sprintf("topic/%s", topic)
  data <- worldbank(resource = resource, lang = lang)
  res <- data.frame(
    id = map_chr(data, "id") |> as.integer(),
    value = map_chr(data, "value"),
    source_note = map_chr(data, "sourceNote"),
    check.names = FALSE
  )
  res <- clean_strings(res)
  res
}

#' World Bank region data
#'
#' @description
#' List all regions supported by the World Bank API.
#'
#' @param region (`character()`) region to query. Default `NULL`.
#'   If `NULL`, all regions are returned
#' @param lang (`character(1)`) language to query. Default `"en"`.
#' @returns A `data.frame()` with the available regions. The columns are:
#'   \item{id}{The region ID.}
#'   \item{code}{The region code.}
#'   \item{iso2code}{The ISO 2 code of the region.}
#'   \item{name}{The region name.}
#' @source <https://api.worldbank.org/v2/region>
#' @family indicators data
#' @export
#' @examples
#' wb_region()
wb_region <- function(region = NULL, lang = "en") {
  stopifnot(
    is_character_or_null(region),
    is_string(lang),
    nchar(lang) == 2L
  )
  region <- format_param(region)

  resource <- sprintf("%s/region/%s", lang, region)
  data <- worldbank(resource = resource)
  res <- data.frame(
    id = map_chr(data, "id") |> na_if_empty() |> as.integer(),
    code = map_chr(data, "code"),
    iso2code = map_chr(data, "iso2code"),
    name = map_chr(data, "name"),
    check.names = FALSE
  )
  res <- clean_strings(res)
  res
}

#' World Bank country data
#'
#' @description
#' List all countries supported by the World Bank API.
#'
#' @param country (`character()`) country to query. Default `NULL`.
#'   If `NULL`, all countries are returned.
#' @param lang (`character(1)`) language to query. Default `"en"`.
#' @returns A `data.frame()` with the available countries. The columns are:
#'   \item{country_id}{The country ID.}
#'   \item{country_code}{The country code.}
#'   \item{country_name}{The country name.}
#'   \item{region_id}{The region ID.}
#'   \item{region_code}{The region code.}
#'   \item{region_value}{The region value.}
#'   \item{admin_region_id}{The admin region ID.}
#'   \item{admin_region_code}{The admin region code.}
#'   \item{admin_region_value}{The admin region value.}
#'   \item{income_level_id}{The income level ID.}
#'   \item{income_level_code}{The income level code.}
#'   \item{income_level_value}{The income level value.}
#'   \item{lending_type_id}{The lending type ID.}
#'   \item{lending_type_code}{The lending type code.}
#'   \item{lending_type_value}{The lending type value.}
#'   \item{capital_city}{The capital city.}
#'   \item{longitude}{The longitude.}
#'   \item{latitude}{The latitude.}
#' @source <https://api.worldbank.org/v2/country>
#' @family indicators data
#' @export
#' @examples
#' wb_country()
wb_country <- function(country = NULL, lang = "en") {
  stopifnot(
    is_character_or_null(country),
    nchar(country) %in% 2:3,
    is_string(lang),
    nchar(lang) == 2L
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
    longitude = map_chr(data, "longitude") |> na_if_empty() |> as.numeric(),
    latitude = map_chr(data, "latitude") |> na_if_empty() |> as.numeric(),
    check.names = FALSE
  )
  res <- clean_strings(res)
  res
}

#' World Bank indicator data
#'
#' @description
#' List all indicators supported by the World Bank API.
#'
#' @param indicator (`character(1)`) indicator to query. Default `NULL`.
#'   If `NULL`, all indicators are returned.
#' @param lang (`character(1)`) language to query. Default `"en"`.
#' @returns A `data.frame()` with the available indicators. The columns are:
#'   \item{id}{The indicator ID.}
#'   \item{name}{The indicator name.}
#'   \item{unit}{The indicator unit.}
#'   \item{source_id}{The source ID.}
#'   \item{source_value}{The source value.}
#'   \item{source_note}{The source note.}
#'   \item{source_organization}{The source organization.}
#'   \item{topic_id}{The topic ID.}
#'   \item{topic_value}{The topic value.}
#' @source <https://api.worldbank.org/v2/indicator>
#' @family indicators data
#' @export
#' @examples
#' wb_indicator("NY.GDP.MKTP.CD")
wb_indicator <- function(indicator = NULL, lang = "en") {
  stopifnot(is_string_or_null(indicator))
  indicator <- indicator %||% "all"

  resource <- sprintf("indicator/%s", indicator)
  data <- worldbank(resource = resource, lang = lang)
  res <- data.frame(
    id = map_chr(data, "id"),
    name = map_chr(data, "name"),
    unit = map_chr(data, "unit"),
    source_id = map_chr(data, \(x) x$source$id) |> as.integer(),
    source_value = map_chr(data, \(x) x$source$value),
    source_note = map_chr(data, "sourceNote"),
    source_organization = map_chr(data, "sourceOrganization"),
    topic_id = map_chr(data, function(x) {
      if (length(x$topics) > 0L && length(x$topics[[1L]]) > 0L) {
        x$topics[[1L]]$id
      } else {
        NA_character_
      }
    }) |>
      as.integer(),
    topic_value = map_chr(data, function(x) {
      if (length(x$topics) > 0L && length(x$topics[[1L]]) > 0L) {
        x$topics[[1L]]$value
      } else {
        NA_character_
      }
    }),
    check.names = FALSE
  )
  res <- clean_strings(res)
  res
}

#' World Bank country indicator data
#'
#' @description
#' List all country indicators supported by the World Bank API.
#'
#' @param indicator (`character()`) indicators to query.
#' @param country (`character()`) countries to query. Default `NULL`.
#'   If `NULL`, all countries are returned.
#' @param lang (`character(1)`) language to query. Default `"en"`.
#' @param start_date (`character(1)` | `integer(1)`) start date to query.
#'   Default `NULL`. Supported formats:
#'   * YYYY for yearly data (e.g. `2020` or `"2020"`)
#'   * YYYYQ\[1-4\] for quarterly data (e.g. `"2020Q1"`)
#'   * YYYYM\[1-12\] for monthly data (e.g. `"2020M02"`)
#' @param end_date (`character(1)` | `integer(1)`) end date to query, in the same format
#'   as start_date. Default `NULL`.
#' @returns A `data.frame()` with the available country indicators.
#'   The columns are:
#'   \item{date}{The date}
#'   \item{indicator_id}{The indicator ID.}
#'   \item{indicator_name}{The indicator name.}
#'   \item{country_id}{The country ID.}
#'   \item{country_name}{The country name.}
#'   \item{country_code}{The country code.}
#'   \item{value}{The indicator value.}
#'   \item{unit}{The indicator unit.}
#'   \item{obs_status}{The observation status.}
#'   \item{decimal}{The decimal.}
#' @source <https://api.worldbank.org/v2/country/{country}/indicator/{indicator}>
#' @export
#' @examples
#' ind <- wb_country_indicator("NY.GDP.MKTP.CD", "US")
#' head(ind)
#' ind <- wb_country_indicator(
#'   indicator = c("NY.GDP.MKTP.CD", "FP.CPI.TOTL.ZG"),
#'   country = c("US", "DE", "FR", "CH", "JP"),
#'   start_date = 2015, end_date = 2023
#' )
#' head(ind)
wb_country_indicator <- function(
    indicator = "NY.GDP.MKTP.CD",
    country = NULL,
    lang = "en",
    start_date = NULL,
    end_date = NULL) {
  stopifnot(
    is_character(indicator),
    is_character_or_null(country),
    nchar(country) %in% 2:3,
    is_dateish_or_null(start_date),
    is_dateish_or_null(end_date)
  )
  has_start_date <- !is.null(start_date)
  has_end_date <- !is.null(end_date)
  if (has_start_date && has_end_date && start_date > end_date) {
    stop("`start_date` must be earlier than `end_date`.", call. = FALSE)
  }
  indicator <- toupper(indicator)
  country <- tolower(format_param(country))
  date <- format_date(start_date, end_date)

  resource <- sprintf("country/%s/indicator/%s", country, indicator)
  if (length(resource) == 1L) {
    res <- worldbank(resource = resource, lang = lang, date = date)
    res <- parse_country_indicator(res)
  } else {
    res <- worldbank_seq(resource = resource, lang = lang, date = date)
    res <- map(res, parse_country_indicator)
    res <- do.call(rbind, res)
  }
  if (nrow(res) == 0L) {
    return(res)
  }
  if (nchar(res[1L, "date"]) == 4L) {
    res$date <- as.integer(res$date)
  }
  res <- clean_strings(res)
  res
}

#' @rdname wb_country_indicator
#' @export
wb_data <- wb_country_indicator

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

is_wb_error <- function(resp) {
  status <- resp_status(resp)
  if (status >= 400L) {
    return(TRUE)
  }
  body <- resp_body_json(resp)
  if (length(body) == 1L && length(body[[1L]]$message) == 1L) {
    return(TRUE)
  }
  FALSE
}

wb_error_body <- function(resp) {
  content_type <- resp_content_type(resp)
  if (identical(content_type, "application/json")) {
    body <- resp_body_json(resp)
    msg <- body[[1L]]$message[[1L]]
    error_code <- paste("Error code:", msg$id)
    docs <- "Read more at <https://datahelpdesk.worldbank.org/knowledgebase/articles/898620-api-error-codes>" # nolint
    c(error_code, msg$value, docs)
  }
}

worldbank <- function(resource, ..., lang = NULL, per_page = 32500L) {
  stopifnot(is_string_or_null(lang), nchar(lang) == 2L)
  body <- request("https://api.worldbank.org/v2") |>
    req_user_agent("worldbank (https://m-muecke.github.io/worldbank)") |>
    req_url_path_append(lang, resource) |>
    req_url_query(..., format = "json", per_page = per_page) |>
    req_error(is_error = is_wb_error, body = wb_error_body) |>
    req_perform() |>
    resp_body_json()
  body[[2L]]
}

worldbank_seq <- function(resource, resp_data, ..., lang = NULL, per_page = 32500L) {
  stopifnot(is_string_or_null(lang), nchar(lang) == 2L)
  req <- request("https://api.worldbank.org/v2") |>
    req_user_agent("worldbank (https://m-muecke.github.io/worldbank)") |>
    req_url_query(..., format = "json", per_page = per_page) |>
    req_error(is_error = is_wb_error, body = wb_error_body)

  res <- resource |>
    map(\(x) req_url_path_append(req, lang, x)) |>
    req_perform_sequential() |>
    map(\(x) resp_body_json(x)[[2L]])
  res
}
