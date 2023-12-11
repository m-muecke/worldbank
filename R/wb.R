#' World Bank available languages
#'
#' @export
#' @examples
#' \dontrun{
#' wb_lang()
#' }
wb_lang <- function() {
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
#' @param type character(1) lending type to query. Default is "all".
#' @param lang character(1) language to query. Default is "en".
#' @export
#' @examples
#' \dontrun{
#' wb_lending_type()
#' }
wb_lending_type <- function(type = "all", lang = "en") {
  stopifnot(is.character(type) && length(type) == 1)
  lang <- match.arg(lang, c("en", "fr", "es", "ar", "zh"))

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
#' @param income character(1) income level to query. Default is "all".
#' @param lang character(1) language to query. Default is "en".
#' @export
#' @examples
#' \dontrun{
#' wb_income_lvl()
#' }
wb_income_lvl <- function(income = "all", lang = "en") {
  stopifnot(is.character(income) && length(income) == 1)
  lang <- match.arg(lang, c("en", "fr", "es", "ar", "zh"))

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
#' @param source character(1) source to query. Default is "all".
#' @param lang character(1) language to query. Default is "en".
#' @export
#' @examples
#' \dontrun{
#' wb_source()
#' }
wb_source <- function(source = "all", lang = "en") {
  stopifnot(is.character(source) && length(source) == 1)
  lang <- match.arg(lang, c("en", "fr", "es", "ar", "zh"))

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
#' @param topic character(1) topic to query. Default is "all".
#' @param lang character(1) language to query. Default is "en".
#' @export
#' @examples
#' \dontrun{
#' wb_topic()
#' }
wb_topic <- function(topic = "all", lang = "en") {
  stopifnot(is.character(topic) && length(topic) == 1)
  lang <- match.arg(lang, c("en", "fr", "es", "ar", "zh"))

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
#' @param region character(1) region to query. Default is "all".
#' @param lang character(1) language to query. Default is "en".
#' @export
#' @examples
#' \dontrun{
#' wb_region()
#' }
wb_region <- function(region = "all", lang = "en") {
  stopifnot(is.character(region) && length(region) == 1)
  lang <- match.arg(lang, c("en", "fr", "es", "ar", "zh"))

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
#' @param country character(1) country to query.
#' @param lang character(1) language to query. Default is "en".
#' @export
#' @examples
#' \dontrun{
#' wb_country()
#' }
wb_country <- function(country = "all", lang = "en") {
  stopifnot(is.character(country) && length(country) == 1)
  lang <- match.arg(lang, c("en", "fr", "es", "ar", "zh"))
  stopifnot(is_page(page))

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
#' @param indicator character(1) indicator to query. Default is "all".
#' @param lang character(1) language to query. Default is "en".
#' @param page integer(1) page number to query. Default is NULL.
#' @export
#' @examples
#' \dontrun{
#' wb_indicator()
#' }
wb_indicator <- function(indicator = "all", lang = "en", page = NULL) {
  stopifnot(is.character(indicator) && length(indicator) == 1)
  lang <- match.arg(lang, c("en", "fr", "es", "ar", "zh"))
  stopifnot(is_page(page))

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
#' @param indicator character(1) indicator to query.
#' @param country character(1) country to query.
#' @param lang character(1) language to query. Default is "en".
#' @param page integer(1) page number to query. Default is NULL.
#' @export
#' @examples
#' \dontrun{
#' wb_country_indicator()
#' }
wb_country_indicator <- function(indicator = "NY.GDP.MKTP.CD",
                                 country = "US",
                                 lang = "en",
                                 page = NULL) {
  stopifnot(is.character(indicator) && length(indicator) == 1)
  stopifnot(
    is.character(country) && length(country) == 1 && nchar(country) %in% 2:3
  )
  lang <- match.arg(lang, c("en", "fr", "es", "ar", "zh"))
  stopifnot(is_page(page))

  resource <- sprintf("%s/country/%s/indicator/%s", lang, country, indicator)
  res <- worldbank(resource, \(resp) {
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
  }, page = page)
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
  is_invalid <- resp_body_json(resp)[[1]]$message[[1]]$key == "Invalid value"
  status == 200 && is_invalid
}

worldbank_page <- function(resource, resp_data, ..., page = 1, per_page = 500) {
  request("http://api.worldbank.org/v2") |>
    req_user_agent("worldbank (https://m-muecke.github.io/worldbank)") |>
    req_url_path_append(resource) |>
    req_url_query(..., format = "json", page = page, per_page = per_page) |>
    req_perform() |>
    resp_data()
}

worldbank_iter <- function(resource, resp_data, ..., per_page = 500) {
  req <- request("http://api.worldbank.org/v2") |>
    req_user_agent("worldbank (https://m-muecke.github.io/worldbank)") |>
    req_url_path_append(resource) |>
    req_url_query(..., format = "json", per_page = per_page)

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
