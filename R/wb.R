#' World Bank lending type data
#'
#' @param type character(1) lending type to query. Default is "all".
#' @export
#' @examples
#' \dontrun{
#' wb_lending_type()
#' }
wb_lending_type <- function(type = "all") {
  stopifnot(is.character(type) && length(type) == 1)

  resource <- sprintf("lendingType/%s", type)
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
#' @export
#' @examples
#' \dontrun{
#' wb_income_lvl()
#' }
wb_income_lvl <- function(income = "all") {
  stopifnot(is.character(income) && length(income) == 1)

  resource <- sprintf("incomeLevel/%s", income)
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
#' @param page integer(1) page number to query. Default is NULL.
#' @export
#' @examples
#' \dontrun{
#' wb_source()
#' }
wb_source <- function(source = "all", page = NULL) {
  stopifnot(is.character(source) && length(source) == 1)
  stopifnot(is_page(page))

  resource <- sprintf("source/%s", source)
  res <- worldbank(resource, \(resp) {
    data <- resp_body_json(resp)[[2]]
    data.frame(
      id = map_chr(data, "id"),
      last_updated = map_chr(data, "lastupdated"),
      name = map_chr(data, "name"),
      code = map_chr(data, "code"),
      description = map_chr(data, "description"),
      url = map_chr(data, "url"),
      data_availability = map_chr(data, "dataavailability"),
      metadata_availability = map_chr(data, "metadataavailability"),
      concepts = map_chr(data, "concepts")
    )
  }, page = page)
  as_tibble(res)
}

#' World Bank topic data
#'
#' @param topic character(1) topic to query. Default is "all".
#' @param page integer(1) page number to query. Default is NULL.
#' @export
#' @examples
#' \dontrun{
#' wb_topic()
#' }
wb_topic <- function(topic = "all", page = NULL) {
  stopifnot(is.character(topic) && length(topic) == 1)
  stopifnot(is_page(page))

  resource <- sprintf("topic/%s", topic)
  res <- worldbank(resource, \(resp) {
    data <- resp_body_json(resp)[[2]]
    data.frame(
      id = map_chr(data, "id"),
      value = map_chr(data, "value"),
      source_note = map_chr(data, "sourceNote")
    )
  }, page = page)
  as_tibble(res)
}

#' World Bank region data
#'
#' @param region character(1) region to query. Default is "all".
#' @param page integer(1) page number to query. Default is NULL.
#' @export
#' @examples
#' \dontrun{
#' wb_region()
#' }
wb_region <- function(region = "all", page = NULL) {
  stopifnot(is.character(region) && length(region) == 1)
  stopifnot(is_page(page))

  resource <- sprintf("region/%s", region)
  res <- worldbank(resource, \(resp) {
    data <- resp_body_json(resp)[[2]]
    data.frame(
      id = map_chr(data, "id"),
      code = map_chr(data, "code"),
      iso2code = map_chr(data, "iso2code"),
      name = map_chr(data, "name")
    )
  }, page = page)
  as_tibble(res)
}

#' World Bank country data
#'
#' @param country character(1) country to query.
#' @param page integer(1) page number to query. Default is NULL.
#' @export
#' @examples
#' \dontrun{
#' wb_country()
#' }
wb_country <- function(country = "all", page = NULL) {
  stopifnot(is.character(country) && length(country) == 1)
  stopifnot(is_page(page))

  resource <- sprintf("country/%s", country)
  res <- worldbank(resource, \(resp) {
    data <- resp_body_json(resp)[[2]]
    data.frame(
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
      longitude = map_chr(data, "longitude"),
      latitude = map_chr(data, "latitude")
    )
  }, page = page)
  as_tibble(res)
}

#' World Bank indicator data
#'
#' @param indicator character(1) indicator to query. Default is "all".
#' @param page integer(1) page number to query. Default is NULL.
#' @export
#' @examples
#' \dontrun{
#' wb_indicator()
#' }
wb_indicator <- function(indicator = "all", page = NULL) {
  stopifnot(is.character(indicator) && length(indicator) == 1)
  stopifnot(is_page(page))

  resource <- sprintf("indicator/%s", indicator)
  res <- worldbank(resource, \(resp) {
    data <- resp_body_json(resp)[[2]]
    data <- lapply(data, \(x) {
      if (length(x$topics) > 0 && length(x$topics[[1]]) > 0) {
        topic_id <- x$topics[[1]]$id
        topic_value <- x$topics[[1]]$value
      } else {
        topic_id <- NA_character_
        topic_value <- NA_character_
      }
      data.frame(
        id = x$id,
        name = x$name,
        unit = x$unit,
        source_id = x$source$id,
        source_value = x$source$value,
        source_note = x$sourceNote,
        source_organization = x$sourceOrganization,
        topic_id = topic_id,
        topic_value = topic_value
      )
    })
    do.call(rbind, data)
  }, page = page)
  as_tibble(res)
}

#' World Bank country indicator data
#'
#' @param indicator character(1) indicator to query.
#' @param country character(1) country to query.
#' @param page integer(1) page number to query. Default is NULL.
#' @export
#' @examples
#' \dontrun{
#' wb_country_indicator()
#' }
wb_country_indicator <- function(indicator = "NY.GDP.MKTP.CD",
                                 country = "US",
                                 page = NULL) {
  stopifnot(is.character(indicator) && length(indicator) == 1)
  stopifnot(
    is.character(country) && length(country) == 1 && nchar(country) %in% 2:3
  )
  stopifnot(is_page(page))

  resource <- sprintf("country/%s/indicator/%s", country, indicator)
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
    do.call(rbind, data)
  }, page = page)
  as_tibble(res)
}

parse_indicators2 <- function(data) {
  id <- map_chr(data, "id")
  name <- map_chr(data, "name")
  unit <- map_chr(data, "unit")
  source_id <- map_chr(data, \(x) x$source$id)
  source_value <- map_chr(data, \(x) x$source$value)
  source_note <- map_chr(data, "sourceNote")
  source_organization <- map_chr(data, "sourceOrganization")
  topic_id <- map_chr(data, \(x) {
    if (length(x$topics) > 0 && length(x$topics[[1]]) > 0) {
      x$topics[[1]]$id
    } else {
      NA_character_
    }
  })
  topic_value <- map_chr(data, \(x) {
    if (length(x$topics) > 0 && length(x$topics[[1]]) > 0) {
      x$topics[[1]]$value
    } else {
      NA_character_
    }
  })

  data.frame(
    id = id,
    name = name,
    unit = unit,
    source_id = source_id,
    source_value = source_value,
    source_note = source_note,
    source_organization = source_organization,
    topic_id = topic_id,
    topic_value = topic_value
  )
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
  is_invalid <- resp_body_json(resp)[[1]]$message[[1]]$key == "Invalid value"
  status == 200 && is_invalid
}

worldbank_page <- function(resource, resp_data, ..., page = 1) {
  request("http://api.worldbank.org/v2") |>
    req_user_agent("worldbank (https://m-muecke.github.io/worldbank)") |>
    req_url_path_append(resource) |>
    req_url_query(..., format = "json", page = page) |>
    req_error(is_error = is_wb_error) |>
    req_perform() |>
    resp_data()
}

worldbank_iter <- function(resource, resp_data, ...) {
  req <- request("http://api.worldbank.org/v2") |>
    req_user_agent("worldbank (https://m-muecke.github.io/worldbank)") |>
    req_url_path_append(resource) |>
    req_url_query(..., format = "json") |>
    req_error(is_error = is_wb_error)

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
