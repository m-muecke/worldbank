#' World Bank available languages
#'
#' @description
#' List all languages supported by the World Bank API.
#'
#' @returns A data.frame with the available languages. The columns are:
#' \item{code}{The language code.}
#' \item{name}{The language name.}
#' \item{native_form}{The native form of the language name.}
#' @references <http://api.worldbank.org/v2/languages>
#' @export
#' @examples
#' wb_languages()
wb_languages <- function() {
  res <- worldbank("languages", \(resp) {
    data <- resp_body_json(resp)[[2]]
    data.frame(
      code = map_chr(data, "code"),
      name = map_chr(data, "name") |> trimws(),
      native_form = map_chr(data, "nativeForm")
    )
  }, page = 1)
  as_tibble(res)
}

#' World Bank lending type data
#'
#' @description
#' List all lending types supported by the World Bank API.
#'
#' @param type character() lending type to query. Default is `NULL`.
#'   If `NULL`, all types are returned.
#' @param lang character(1) language to query. Default is "en".
#' @returns A data.frame with the available lending types. The columns are:
#' \item{id}{The lending type ID.}
#' \item{iso2code}{The ISO 2 code of the lending type.}
#' \item{value}{The lending type value.}
#' @references <http://api.worldbank.org/v2/lendingTypes>
#' @export
#' @examples
#' wb_lending_type()
wb_lending_type <- function(type = NULL, lang = "en") {
  if (!is.null(type) && !is_id_code(type)) {
    stop("type must be a character vector of three-letter codes")
  }
  if (!is_lang_code(lang)) {
    stop("lang must be a two-letter language code")
  }
  type <- format_param(type)

  resource <- sprintf("%s/lendingType/%s", lang, type)
  res <- worldbank(resource, \(resp) {
    data <- resp_body_json(resp)[[2]]
    data.frame(
      id = map_chr(data, "id"),
      iso2code = map_chr(data, "iso2code"),
      value = map_chr(data, "value")
    )
  }, page = 1)
  as_tibble(res)
}

#' World Bank income level data
#'
#' @description
#' List all income levels supported by the World Bank API.
#'
#' @param income character() income level to query. Default is `NULL`.
#'   If `NULL`, all levels are returned.
#' @param lang character(1) language to query. Default is "en".
#' @returns A data.frame with the available income levels. The columns are:
#' \item{id}{The income level ID.}
#' \item{iso2code}{The ISO 2 code of the income level.}
#' \item{value}{The income level value.}
#' @references <http://api.worldbank.org/v2/incomeLevels>
#' @export
#' @examples
#' wb_income_level()
wb_income_level <- function(income = NULL, lang = "en") {
  if (!is.null(income) && !is_id_code(income)) {
    stop("income must be a character vector of three-letter codes")
  }
  if (!is_lang_code(lang)) {
    stop("lang must be a two-letter language code")
  }
  income <- format_param(income)

  resource <- sprintf("%s/incomeLevel/%s", lang, income)
  res <- worldbank(resource, \(resp) {
    data <- resp_body_json(resp)[[2]]
    data.frame(
      id = map_chr(data, "id"),
      iso2code = map_chr(data, "iso2code"),
      value = map_chr(data, "value")
    )
  }, page = 1)
  as_tibble(res)
}

#' World Bank source data
#'
#' @description
#' List all sources supported by the World Bank API.
#'
#' @param source character() source to query. Default is `NULL`.
#'   If `NULL`, all sources are returned.
#' @param lang character(1) language to query. Default is "en".
#' @returns A data.frame with the available sources. The columns are:
#' \item{id}{The source ID.}
#' \item{last_updated}{The date the source was last updated.}
#' \item{name}{The source name.}
#' \item{code}{The source code.}
#' \item{description}{The source description.}
#' \item{url}{The source URL.}
#' \item{data_availability}{Whether the source has data available.}
#' \item{metadata_availability}{Whether the source has metadata available.}
#' \item{concepts}{The concepts associated with the source.}
#' @references <http://api.worldbank.org/v2/sources>
#' @export
#' @examples
#' wb_source()
wb_source <- function(source = NULL, lang = "en") {
  if (!is.null(source) && !(is.character(source) && length(source) > 0)) {
    stop("source must be a character vector")
  }
  if (!is_lang_code(lang)) {
    stop("lang must be a two-letter language code")
  }
  source <- format_param(source)

  resource <- sprintf("%s/source/%s", lang, source)
  res <- worldbank(resource, \(resp) {
    data <- resp_body_json(resp)[[2]]
    data.frame(
      id = map_chr(data, "id") |> as.integer(),
      last_updated = map_chr(data, "lastupdated") |> as.Date(),
      name = map_chr(data, "name") |> na_if_empty(),
      code = map_chr(data, "code"),
      description = map_chr(data, "description") |> na_if_empty(),
      url = map_chr(data, "url") |> na_if_empty(),
      data_availability = map_chr(data, "dataavailability") |> to_logical(),
      metadata_availability = map_chr(data, "metadataavailability") |>
        to_logical(),
      concepts = map_chr(data, "concepts") |> as.integer()
    )
  }, page = 1)
  as_tibble(res)
}

#' World Bank topic data
#'
#' @description
#' List all topics supported by the World Bank API.
#'
#' @param topic character() topic to query. Default is `NULL`.
#'   If `NULL`, all topics are returned.
#' @param lang character(1) language to query. Default is "en".
#' @returns A data.frame with the available topics. The columns are:
#' \item{id}{The topic ID.}
#' \item{value}{The topic value.}
#' \item{source_note}{The source note.}
#' @references <http://api.worldbank.org/v2/topics>
#' @export
#' @examples
#' wb_topic()
wb_topic <- function(topic = NULL, lang = "en") {
  if (!is.null(topic) && !(is.character(topic) && length(topic) > 0)) {
    stop("topic must be a character vector")
  }
  if (!is_lang_code(lang)) {
    stop("lang must be a two-letter language code")
  }
  topic <- format_param(topic)

  resource <- sprintf("%s/topic/%s", lang, topic)
  res <- worldbank(resource, \(resp) {
    data <- resp_body_json(resp)[[2]]
    data.frame(
      id = map_chr(data, "id") |> as.integer(),
      value = map_chr(data, "value"),
      source_note = map_chr(data, "sourceNote")
    )
  }, page = 1)
  as_tibble(res)
}

#' World Bank region data
#'
#' @description
#' List all regions supported by the World Bank API.
#'
#' @param region character() region to query. Default is `NULL`.
#'   If `NULL`, all regions are returned
#' @param lang character(1) language to query. Default is "en".
#' @returns A data.frame with the available regions. The columns are:
#' \item{id}{The region ID.}
#' \item{code}{The region code.}
#' \item{iso2code}{The ISO 2 code of the region.}
#' \item{name}{The region name.}
#' @references <http://api.worldbank.org/v2/region>
#' @export
#' @examples
#' wb_region()
wb_region <- function(region = NULL, lang = "en") {
  if (!is.null(region) && !(is.character(region) && length(region) > 0)) {
    stop("region must be a character vector")
  }
  if (!is_lang_code(lang)) {
    stop("lang must be a two-letter language code")
  }
  region <- format_param(region)

  resource <- sprintf("%s/region/%s", lang, region)
  res <- worldbank(resource, \(resp) {
    data <- resp_body_json(resp)[[2]]
    data.frame(
      id = map_chr(data, "id") |> na_if_empty(),
      code = map_chr(data, "code"),
      iso2code = map_chr(data, "iso2code"),
      name = map_chr(data, "name") |> na_if_empty() |> trimws()
    )
  }, page = 1)
  as_tibble(res)
}

#' World Bank country data
#'
#' @description
#' List all countries supported by the World Bank API.
#'
#' @param country character() country to query. Default is `NULL`.
#'   If `NULL`, all countries are returned.
#' @param lang character(1) language to query. Default is "en".
#' @returns A data.frame with the available countries. The columns are:
#' \item{country_id}{The country ID.}
#' \item{country_code}{The country code.}
#' \item{country_name}{The country name.}
#' \item{region_id}{The region ID.}
#' \item{region_code}{The region code.}
#' \item{region_value}{The region value.}
#' \item{admin_region_id}{The admin region ID.}
#' \item{admin_region_code}{The admin region code.}
#' \item{admin_region_value}{The admin region value.}
#' \item{income_level_id}{The income level ID.}
#' \item{income_level_code}{The income level code.}
#' \item{income_level_value}{The income level value.}
#' \item{lending_type_id}{The lending type ID.}
#' \item{lending_type_code}{The lending type code.}
#' \item{lending_type_value}{The lending type value.}
#' \item{capital_city}{The capital city.}
#' \item{longitude}{The longitude.}
#' \item{latitude}{The latitude.}
#' @references <http://api.worldbank.org/v2/country>
#' @export
#' @examples
#' wb_country()
wb_country <- function(country = NULL, lang = "en") {
  if (!is.null(country) && !is_country_code(country)) {
    stop("country must be a character vector of ISO 2 or 3 codes")
  }
  if (!is_lang_code(lang)) {
    stop("lang must be a two-letter language code")
  }
  country <- tolower(format_param(country))

  resource <- sprintf("%s/country/%s", lang, country)
  res <- worldbank(resource, \(resp) {
    data <- resp_body_json(resp)[[2]]
    data.frame(
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
  }, page = 1)
  as_tibble(res)
}

#' World Bank indicator data
#'
#' @description
#' List all indicators supported by the World Bank API.
#'
#' @param indicator character(1) indicator to query. Default is `NULL`.
#'   If `NULL`, all indicators are returned.
#' @param lang character(1) language to query. Default is "en".
#' @param page integer(1) page number to query. Default is NULL.
#' @returns A data.frame with the available indicators. The columns are:
#' \item{id}{The indicator ID.}
#' \item{name}{The indicator name.}
#' \item{unit}{The indicator unit.}
#' \item{source_id}{The source ID.}
#' \item{source_value}{The source value.}
#' \item{source_note}{The source note.}
#' \item{source_organization}{The source organization.}
#' \item{topic_id}{The topic ID.}
#' \item{topic_value}{The topic value.}
#' @references <http://api.worldbank.org/v2/indicator>
#' @export
#' @examples
#' wb_indicator("NY.GDP.MKTP.CD")
wb_indicator <- function(indicator = NULL, lang = "en", page = NULL) {
  if (!is.null(indicator) && !is_string(indicator)) {
    stop("indicator must be a character vector of length 1")
  }
  if (!is_lang_code(lang)) {
    stop("lang must be a two-letter language code")
  }
  indicator <- indicator %||% "all"

  resource <- sprintf("%s/indicator/%s", lang, indicator)
  res <- worldbank(resource, \(resp) {
    data <- resp_body_json(resp)[[2]]
    data.frame(
      id = map_chr(data, "id"),
      name = map_chr(data, "name"),
      unit = map_chr(data, "unit") |> na_if_empty(),
      source_id = map_chr(data, \(x) x$source$id),
      source_value = map_chr(data, \(x) x$source$value),
      source_note = map_chr(data, "sourceNote"),
      source_organization = map_chr(data, "sourceOrganization"),
      topic_id = map_chr(data, \(x) {
        if (length(x$topics) > 0 && length(x$topics[[1]]) > 0) {
          x$topics[[1]]$id
        } else {
          NA_character_
        }
      }),
      topic_value = map_chr(data, \(x) {
        if (length(x$topics) > 0 && length(x$topics[[1]]) > 0) {
          x$topics[[1]]$value
        } else {
          NA_character_
        }
      }) |>
        trimws()
    )
  }, page = page)
  as_tibble(res)
}

#' World Bank country indicator data
#'
#' @description
#' List all country indicators supported by the World Bank API.
#'
#' @param indicator character(1) indicator to query.
#' @param country character() country to query. Default is `NULL`.
#'   If `NULL`, all countries are returned
#' @param lang character(1) language to query. Default is "en".
#' @returns A data.frame with the available country indicators. The columns are:
#' \item{year}{The year.}
#' \item{indicator_id}{The indicator ID.}
#' \item{indicator_name}{The indicator name.}
#' \item{country_id}{The country ID.}
#' \item{country_name}{The country name.}
#' \item{country_code}{The country code.}
#' \item{value}{The indicator value.}
#' \item{unit}{The indicator unit.}
#' \item{obs_status}{The observation status.}
#' \item{decimal}{The decimal.}
#' @references <http://api.worldbank.org/v2/country/{country}/indicator/{indicator}>
#' @export
#' @examples
#' wb_country_indicator("NY.GDP.MKTP.CD", "US")
wb_country_indicator <- function(indicator = "NY.GDP.MKTP.CD",
                                 country = NULL,
                                 frequency = "yearly",
                                 lang = "en") {
  if (!is_string(indicator)) {
    stop("indicator must be a character vector of length 1")
  }
  if (!is.null(country) && !is_country_code(country)) {
    stop("country must be a character vector of ISO 2 or 3 codes")
  }
  country <- tolower(format_param(country))

  resource <- sprintf("%s/country/%s/indicator/%s", lang, country, indicator)
  res <- worldbank(resource, frequency = frequency, \(resp) {
    data <- resp_body_json(resp)[[2]]
    data <- lapply(data, \(x) {
      if (is.null(x$value) || is.null(x$date)) {
        return()
      }
      data.frame(
        year = x$date,
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
    data <- do.call(rbind, data)
    data$year <- as.integer(data$year)
    data$unit <- na_if_empty(data$unit)
    data$obs_status <- na_if_empty(data$obs_status)
    data
  })
  as_tibble(res)
}

worldbank <- function(resource, resp_data, ..., page = NULL) {
  if (is.null(page)) {
    worldbank_iter(resource, resp_data, ...)
  } else {
    worldbank_page(resource, resp_data, ..., page = page)
  }
}

is_wb_error <- function(resp) {
  status <- resp_status(resp)
  if (status >= 400) {
    return(TRUE)
  }
  body <- resp_body_json(resp)
  if (length(body) == 1 && length(body[[1]]$message) == 1) {
    return(TRUE)
  }
  FALSE
}

wb_error_body <- function(resp) {
  body <- resp_body_json(resp)
  message <- body[[1]]$message[[1]]
  error_code <- paste0("Error code: ", message$id)
  docs <- "See docs at <https://datahelpdesk.worldbank.org/knowledgebase/articles/898620-api-error-codes>" # nolint
  c(error_code, message$value, docs)
}

worldbank_page <- function(resource, resp_data, ..., page = 1, per_page = 500) {
  request("http://api.worldbank.org/v2") |>
    req_user_agent("worldbank (https://m-muecke.github.io/worldbank)") |>
    req_url_path_append(resource) |>
    req_url_query(..., format = "json", page = page, per_page = per_page) |>
    req_error(is_error = is_wb_error, body = wb_error_body) |>
    req_perform() |>
    resp_data()
}

worldbank_iter <- function(resource, resp_data, ..., per_page = 500) {
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
