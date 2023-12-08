`%||%` <- function(x, y) {
  if (is.null(x)) y else x
}

fetch_wb <- function(country, indicator, page) {
  request("http://api.worldbank.org/v2") |>
    req_url_path_append("country", country, "indicator", indicator) |>
    req_url_query(format = "json", page = page) |>
    req_perform() |>
    resp_body_json()
}

fetch_indicators <- function(page = 1) {
  request("http://api.worldbank.org/v2") |>
    req_url_path_append("indicator") |>
    req_url_query(format = "json", page = page) |>
    req_perform() |>
    resp_body_json()
}

parse_indicator <- function(page = 1) {
  resp <- fetch_indicators()
  npages <- resp[[1]]$pages
  data <- lapply(resp[[2]], \(row) {
    list(
      id = row$id,
      name = row$name,
      unit = if (row$unit == "") NA else row$unit,
      source_id = row$source$id,
      source_value = row$source$value,
      source_unit = row$sourceUnit,
      source_organization = row$source_organization,
      topic_id = row$topics$id,
      topic_value = row$topics$value
    )
  }) |>
    bind_rows()
  list(page = page, npages = npages, data = data)
}

parse_indicator_page <- function(indicator, country = "US", page = 1) {
  resp <- fetch_wb(country, indicator, page)
  npages <- resp[[1]]$pages
  data <- lapply(resp[[2]], \(row) {
    if (is.null(row$value) || is.null(row$date)) {
      return()
    }
    list(
      year = row$date,
      country_code = country,
      indicator_code = indicator,
      value = row$value
    )
  }) |>
    bind_rows()
  list(page = page, npages = npages, data = data)
}

#' @export
wb_indicator <- function(indicator = "NY.GDP.MKTP.CD", country = "US") {
  resp <- parse_indicator_page(indicator, country, 1)
  npages <- resp$npages
  if (npages == 1) {
    return(resp$data)
  }
  lapply(seq(2, npages), \(page) {
    parse_indicator_page(indicator, country, page) |> _$data
  }) |>
    bind_rows(resp$data) |>
    arrange(year)
}

wb_list_indicators <- function(page = NULL) {
  resp <- parse_indicator(1)
  if (resp$npages == 1) {
    return(resp$data)
  }
  lapply(seq(2, resp$npage), \(page) {
    parse_indicator(page) |> _$data
  }) |>
    bind_rows(resp$data)
}
