#' World Bank available languages
#'
#' @description
#' List all languages supported by the World Bank API.
#'
#' @returns A `data.frame()` with the available languages. The columns are:
#'   \item{code}{The language code.}
#'   \item{name}{The language name.}
#'   \item{native_form}{The native form of the language name.}
#' @source <http://api.worldbank.org/v2/languages>
#' @export
#' @examples
#' wb_language()
wb_language <- function() {
  data <- worldbank("languages")
  res <- data.frame(
    code = map_chr(data, "code"),
    name = map_chr(data, "name") |> trimws(),
    native_form = map_chr(data, "nativeForm")
  )
  as_tibble(res)
}

#' World Bank lending type data
#'
#' @description
#' List all lending types supported by the World Bank API.
#'
#' @param type `character()` lending type to query. Default `NULL`.
#'   If `NULL`, all types are returned.
#' @param lang `character(1)` language to query. Default `"en"`.
#' @returns A `data.frame()` with the available lending types. The columns are:
#'   \item{id}{The lending type ID.}
#'   \item{iso2code}{The ISO 2 code of the lending type.}
#'   \item{value}{The lending type value.}
#' @source <http://api.worldbank.org/v2/lendingTypes>
#' @export
#' @examples
#' wb_lending_type()
wb_lending_type <- function(type = NULL, lang = "en") {
  stopifnot(is_character_or_null(type), nchar(type) == 3L)
  type <- format_param(type)

  resource <- sprintf("lendingType/%s", type)
  data <- worldbank(resource, lang = lang)
  res <- data.frame(
    id = map_chr(data, "id"),
    iso2code = map_chr(data, "iso2code"),
    value = map_chr(data, "value") |> na_if_empty()
  )
  as_tibble(res)
}

#' World Bank income level data
#'
#' @description
#' List all income levels supported by the World Bank API.
#'
#' @param income `character()` income level to query. Default `NULL`.
#'   If `NULL`, all levels are returned.
#' @param lang `character(1)` language to query. Default `"en"`.
#' @returns A `data.frame()` with the available income levels. The columns are:
#'   \item{id}{The income level ID.}
#'   \item{iso2code}{The ISO 2 code of the income level.}
#'   \item{value}{The income level value.}
#' @source <http://api.worldbank.org/v2/incomeLevels>
#' @export
#' @examples
#' wb_income_level()
wb_income_level <- function(income = NULL, lang = "en") {
  stopifnot(is_character_or_null(income), nchar(income) == 3L)
  income <- format_param(income)

  resource <- sprintf("incomeLevel/%s", income)
  data <- worldbank(resource, lang = lang)
  res <- data.frame(
    id = map_chr(data, "id"),
    iso2code = map_chr(data, "iso2code"),
    value = map_chr(data, "value") |> na_if_empty()
  )
  as_tibble(res)
}

#' World Bank source data
#'
#' @description
#' List all sources supported by the World Bank API.
#'
#' @param source `character()` source to query. Default `NULL`.
#'   If `NULL`, all sources are returned.
#' @param lang `character(1)` language to query. Default `"en"`.
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
#' @source <http://api.worldbank.org/v2/sources>
#' @export
#' @examples
#' wb_source()
wb_source <- function(source = NULL, lang = "en") {
  stopifnot(is_character_or_null(source))
  source <- format_param(source)

  resource <- sprintf("source/%s", source)
  data <- worldbank(resource, lang = lang)
  res <- data.frame(
    id = map_chr(data, "id") |> as.integer(),
    last_updated = map_chr(data, "lastupdated") |> as.Date(),
    name = map_chr(data, "name") |> trimws() |> na_if_empty(),
    code = map_chr(data, "code"),
    description = map_chr(data, "description") |> na_if_empty(),
    url = map_chr(data, "url") |> na_if_empty(),
    data_availability = map_chr(data, "dataavailability") |> to_logical(),
    metadata_availability = map_chr(data, "metadataavailability") |>
      to_logical(),
    concepts = map_chr(data, "concepts") |> as.integer()
  )
  as_tibble(res)
}

#' World Bank topic data
#'
#' @description
#' List all topics supported by the World Bank API.
#'
#' @param topic `character()` topic to query. Default `NULL`.
#'   If `NULL`, all topics are returned.
#' @param lang `character(1)` language to query. Default `"en"`.
#' @returns A `data.frame()` with the available topics. The columns are:
#'   \item{id}{The topic ID.}
#'   \item{value}{The topic value.}
#'   \item{source_note}{The source note.}
#' @source <http://api.worldbank.org/v2/topics>
#' @export
#' @examples
#' wb_topic()
wb_topic <- function(topic = NULL, lang = "en") {
  stopifnot(is_character_or_null(topic))
  topic <- format_param(topic)

  resource <- sprintf("topic/%s", topic)
  data <- worldbank(resource, lang = lang)
  res <- data.frame(
    id = map_chr(data, "id") |> as.integer(),
    value = map_chr(data, "value") |> na_if_empty(),
    source_note = map_chr(data, "sourceNote") |> trimws() |> na_if_empty()
  )
  as_tibble(res)
}

#' World Bank region data
#'
#' @description
#' List all regions supported by the World Bank API.
#'
#' @param region `character()` region to query. Default `NULL`.
#'   If `NULL`, all regions are returned
#' @param lang `character(1)` language to query. Default `"en"`.
#' @returns A `data.frame()` with the available regions. The columns are:
#'   \item{id}{The region ID.}
#'   \item{code}{The region code.}
#'   \item{iso2code}{The ISO 2 code of the region.}
#'   \item{name}{The region name.}
#' @source <http://api.worldbank.org/v2/region>
#' @export
#' @examples
#' wb_region()
wb_region <- function(region = NULL, lang = "en") {
  stopifnot(
    is_character_or_null(region),
    is_string(lang), nchar(lang) == 2L
  )
  region <- format_param(region)

  resource <- sprintf("%s/region/%s", lang, region)
  data <- worldbank(resource)
  res <- data.frame(
    id = map_chr(data, "id") |> na_if_empty() |> as.integer(),
    code = map_chr(data, "code"),
    iso2code = map_chr(data, "iso2code"),
    name = map_chr(data, "name") |> trimws() |> na_if_empty()
  )
  as_tibble(res)
}

#' World Bank country data
#'
#' @description
#' List all countries supported by the World Bank API.
#'
#' @param country `character()` country to query. Default `NULL`.
#'   If `NULL`, all countries are returned.
#' @param lang `character(1)` language to query. Default `"en"`.
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
#' @source <http://api.worldbank.org/v2/country>
#' @export
#' @examples
#' wb_country()
wb_country <- function(country = NULL, lang = "en") {
  stopifnot(
    is_character_or_null(country), nchar(country) %in% 2:3,
    is_string(lang), nchar(lang) == 2L
  )
  country <- tolower(format_param(country))

  resource <- sprintf("%s/country/%s", lang, country)
  data <- worldbank(resource)
  res <- data.frame(
    country_id = map_chr(data, "id"),
    country_code = map_chr(data, "iso2Code"),
    country_name = map_chr(data, "name") |> na_if_empty(),
    region_id = map_chr(data, \(x) x$region$id),
    region_code = map_chr(data, \(x) x$region$iso2code),
    region_value = map_chr(data, \(x) x$region$value) |>
      trimws() |>
      na_if_empty(),
    admin_region_id = map_chr(data, \(x) x$adminregion$id) |> na_if_empty(),
    admin_region_code = map_chr(data, \(x) x$adminregion$iso2code) |>
      na_if_empty(),
    admin_region_value = map_chr(data, \(x) x$adminregion$value) |>
      na_if_empty(),
    income_level_id = map_chr(data, \(x) x$incomeLevel$id),
    income_level_code = map_chr(data, \(x) x$incomeLevel$iso2code),
    income_level_value = map_chr(data, \(x) x$incomeLevel$value),
    lending_type_id = map_chr(data, \(x) x$lendingType$id) |> na_if_empty(),
    lending_type_code = map_chr(data, \(x) x$lendingType$iso2code) |>
      na_if_empty(),
    lending_type_value = map_chr(data, \(x) x$lendingType$value) |>
      na_if_empty(),
    capital_city = map_chr(data, "capitalCity") |> na_if_empty(),
    longitude = map_chr(data, "longitude") |> na_if_empty() |> as.numeric(),
    latitude = map_chr(data, "latitude") |> na_if_empty() |> as.numeric()
  )
  as_tibble(res)
}

#' World Bank indicator data
#'
#' @description
#' List all indicators supported by the World Bank API.
#'
#' @param indicator `character(1)` indicator to query. Default `NULL`.
#'   If `NULL`, all indicators are returned.
#' @param lang `character(1)` language to query. Default `"en"`.
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
#' @source <http://api.worldbank.org/v2/indicator>
#' @export
#' @examples
#' wb_indicator("NY.GDP.MKTP.CD")
wb_indicator <- function(indicator = NULL, lang = "en") {
  stopifnot(is_string_or_null(indicator))
  indicator <- indicator %||% "all"

  resource <- sprintf("indicator/%s", indicator)
  data <- worldbank(resource, lang = lang)
  res <- data.frame(
    id = map_chr(data, "id"),
    name = map_chr(data, "name") |> trimws(),
    unit = map_chr(data, "unit") |> na_if_empty(),
    source_id = map_chr(data, \(x) x$source$id),
    source_value = map_chr(data, \(x) x$source$value) |> trimws(),
    source_note = map_chr(data, "sourceNote") |> trimws() |> na_if_empty(),
    source_organization = map_chr(data, "sourceOrganization") |> na_if_empty(),
    topic_id = map_chr(data, \(x) {
      if (length(x$topics) > 0L && length(x$topics[[1L]]) > 0L) {
        x$topics[[1L]]$id
      } else {
        NA_character_
      }
    }),
    topic_value = map_chr(data, \(x) {
      if (length(x$topics) > 0L && length(x$topics[[1L]]) > 0L) {
        x$topics[[1L]]$value
      } else {
        NA_character_
      }
    }) |>
      trimws()
  )
  as_tibble(res)
}

#' World Bank country indicator data
#' @description
#'
#' List all country indicators supported by the World Bank API.
#'
#' @param indicator `character(1)` indicator to query.
#' @param country `character()` country to query. Default `NULL`.
#'   If `NULL`, all countries are returned.
#' @param lang `character(1)` language to query. Default `"en"`.
#' @param start_year `integer(1)` start year to query. Default `NULL`.
#' @param end_year `integer(1)` end year to query. Default `NULL`.
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
#' @source <http://api.worldbank.org/v2/country/{country}/indicator/{indicator}>
#' @export
#' @examples
#' wb_country_indicator("NY.GDP.MKTP.CD", "US")
wb_country_indicator <- function(indicator = "NY.GDP.MKTP.CD",
                                 country = NULL,
                                 lang = "en",
                                 start_year = NULL,
                                 end_year = NULL) {
  stopifnot(
    is_string(indicator),
    is_character_or_null(country), nchar(country) %in% 2:3
  )
  has_start_year <- !is.null(start_year)
  has_end_year <- !is.null(end_year)
  if (has_start_year) {
    stopifnot(is_count(start_year))
  }
  if (has_end_year) {
    stopifnot(is_count(end_year))
  }
  if (has_start_year && has_end_year) {
    stopifnot(start_year <= end_year)
  }
  indicator <- toupper(indicator)
  country <- tolower(format_param(country))
  date <- format_date(start_year, end_year)

  resource <- sprintf("country/%s/indicator/%s", country, indicator)
  data <- worldbank(resource, lang = lang, date = date)
  res <- map(data, \(x) {
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
      decimal = x$decimal
    )
  })
  res <- do.call(rbind, res)
  res$date <- as.integer(res$date)
  res$country_name <- na_if_empty(res$country_name)
  res$unit <- na_if_empty(res$unit)
  res$obs_status <- na_if_empty(res$obs_status)
  as_tibble(res)
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
  body <- resp_body_json(resp)
  message <- body[[1L]]$message[[1L]]
  error_code <- paste("Error code:", message$id)
  docs <- "See docs at <https://datahelpdesk.worldbank.org/knowledgebase/articles/898620-api-error-codes>" # nolint
  c(error_code, message$value, docs)
}

worldbank <- function(resource, ..., lang = NULL, per_page = 32500L) {
  stopifnot(is_string_or_null(lang), nchar(lang) == 2L)
  body <- request("http://api.worldbank.org/v2") |>
    req_user_agent("worldbank (https://m-muecke.github.io/worldbank)") |>
    req_url_path_append(lang, resource) |>
    req_url_query(..., format = "json", per_page = per_page) |>
    req_error(is_error = is_wb_error, body = wb_error_body) |>
    req_perform() |>
    resp_body_json()
  body[[2L]]
}

worldbank_iter <- function(resource, resp_data, ..., per_page = 32500L) {
  req <- request("http://api.worldbank.org/v2") |>
    req_user_agent("worldbank (https://m-muecke.github.io/worldbank)") |>
    req_url_path_append(resource) |>
    req_url_query(..., format = "json", per_page = per_page) |>
    req_error(is_error = is_wb_error, body = wb_error_body)

  data <- req |>
    req_perform_iterative(
      next_req = iterate_with_offset(
        "page",
        resp_pages = \(resp) as.numeric(resp_body_json(resp)[[1]]$pages)
      ),
      max_reqs = Inf
    ) |>
    resps_data(resp_data)
  data
}
