fetch_wb <- function(country, indicator, page) {
  request("http://api.worldbank.org/v2") |>
    req_url_path_append("country", country, "indicator", indicator) |>
    req_url_query(format = "json", page = page) |>
    req_perform() |>
    resp_body_json()
}

wb_page <- function(indicator, country = "US", page = 1) {
  resp <- fetch_wb(country, indicator, page)
  npages <- resp[[1]]$pages
  data <- lapply(resp[[2]], \(row) {
    if (is.null(row$value) || is.null(row$date)) {
      return()
    }
    tibble(
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
  resp <- wb_page(indicator, country, 1)
  if (resp$npages == 1) {
    return(resp$data)
  }
  lapply(seq(2, resp$npage), \(page) {
    wb_page(indicator, country, page)$data
  }) |>
    bind_rows(resp$data) |>
    arrange(year)
}
