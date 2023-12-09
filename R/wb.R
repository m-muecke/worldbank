wb_country <- function() {
  request("http://api.worldbank.org/v2") |>
    req_url_path_append("country/US") |>
    req_url_query(format = "json", page = 1) |>
    req_perform() |>
    resp_body_json()
}

#' @export
wb_indicator <- function(indicator = "all", page = NULL) {
  stopifnot(is.character(indicator) && length(indicator) == 1)
  stopifnot(is.null(page) || is.numeric(page) && length(page) == 1)

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
        unit = if (x$unit == "") NA_character_ else x$unit,
        source_id = x$source$id,
        source_value = x$source$value,
        source_note = if (x$sourceNote == "") NA_character_ else x$sourceNote,
        source_organization = x$sourceOrganization,
        topic_id = topic_id,
        topic_value = topic_value
      )
    })
    do.call(rbind, data)
  }, page = page)
  as_tibble(res)
}

#' @export
wb_country_indicator <- function(indicator = "NY.GDP.MKTP.CD",
                                 country = "US",
                                 page = NULL) {
  stopifnot(is.character(indicator) && length(indicator) == 1)
  stopifnot(
    is.character(country) && length(country) == 1 && nchar(country) %in% 2:3
  )
  stopifnot(is.null(page) || is.numeric(page) && length(page) == 1)

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
        unit = if (x$unit == "") NA_character_ else x$unit,
        obs_status = if (x$obs_status == "") NA_character_ else x$obs_status,
        decimal = x$decimal
      )
    })
    do.call(rbind, data)
  }, page = page)
  as_tibble(res)
}

parse_indicators2 <- function(data) {
  id <- vapply(data, \(x) x$id, character(1))
  name <- vapply(data, \(x) x$id, character(1))
  unit <- vapply(data, \(x) {
    if (x$unit == "") NA_character_ else x$unit
  }, character(1))
  source_id <- vapply(data, \(x) x$source$id, character(1))
  source_value <- vapply(data, \(x) x$source$value, character(1))
  source_note <- vapply(data, \(x) {
    if (x$sourceNote == "") NA_character_ else x$sourceNote
  }, character(1))
  source_organization <- vapply(data, \(x) x$sourceOrganization, character(1))
  topic_id <- vapply(data, \(x) {
    if (length(x$topics) > 0 && length(x$topics[[1]]) > 0) {
      x$topics[[1]]$id
    } else {
      NA_character_
    }
  }, character(1))
  topic_value <- vapply(data, \(x) {
    if (length(x$topics) > 0 && length(x$topics[[1]]) > 0) {
      x$topics[[1]]$value
    } else {
      NA_character_
    }
  }, character(1))

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

worldbank_iter <- function(resource, resp_data, ...) {
  req <- request("http://api.worldbank.org/v2") |>
    req_url_path_append(resource) |>
    req_url_query(..., format = "json")

  data <- req |>
    req_perform_iterative(
      next_req = iterate_with_offset(
        "page",
        resp_pages = \(resp) resp_body_json(resp)[[1]]$pages
      ),
      max_reqs = Inf
    ) |>
    resps_data(resp_data)
  data
}
