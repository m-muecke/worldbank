fetch_worldbank <- function(country_code, indicator_code, page) {
  request("http://api.worldbank.org/v2") |>
    req_url_path_append("country", country_code, "indicator", indicator_code) |>
    req_url_query(format = "json", page = page) |>
    req_perform() |>
    resp_body_json()
}

worldbank_page <- function(indicator_code, country_code = "US", page = 1) {
  resp <- fetch_worldbank(country_code, indicator_code, page)
  npages <- resp[[1]]$pages
  data <- lapply(resp[[2]], \(row) {
    if (is.null(row$value) || is.null(row$date)) {
      return()
    }
    tibble(
      year = row$date,
      country_code = country_code,
      indicator_code = indicator_code,
      value = row$value
    )
  }) |>
    bind_rows()

  list(page = page, npages = npages, data = data)
}

worldbank_indicator <- function(indicator_code = "NY.GDP.MKTP.CD",
                                country_code = "US") {
  resp <- worldbank_page(indicator_code, country_code, 1)
  if (resp$npages == 1) {
    return(resp$data)
  }
  lapply(seq(2, resp$npage), \(page) {
    worldbank_page(indicator_code, country_code, page)$data
  }) |>
    bind_rows(resp$data) |>
    arrange(year)
}
