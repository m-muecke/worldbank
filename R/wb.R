worldbank <- function(resource, ..., page = 1) {
  request("http://api.worldbank.org/v2") |>
    req_url_path_append(resource) |>
    req_url_query(..., format = "json", page = page) |>
    req_perform() |>
    resp_body_json()
}

parse_indicator <- function(page = 1) {
  resp <- worldbank("indicator")
  npages <- resp[[1]]$pages
  data <- lapply(resp[[2]], \(row) {
    if (length(row$topics) > 0 && length(row$topics[[1]]) > 0) {
      topic_id <- row$topics[[1]]$id
      topic_value <- row$topics[[1]]$value
    } else {
      topic_id <- NA
      topic_value <- NA
    }
    unit <- if (row$unit == "") NA else row$unit
    data.frame(
      id = row$id,
      name = row$name,
      unit = unit,
      source_id = row$source$id,
      source_value = row$source$value,
      sourceNote = row$sourceNote,
      source_organization = row$sourceOrganization,
      topic_id = topic_id,
      topic_value = topic_value
    )
  })
  data <- do.call(rbind, data)
  list(page = page, npages = npages, data = data)
}

parse_indicator_page <- function(indicator, country = "US", page = 1) {
  resource <- sprintf("country/%s/indicator/%s", country, indicator)
  resp <- worldbank(resource)
  npages <- resp[[1]]$pages
  data <- lapply(resp[[2]], \(row) {
    if (is.null(row$value) || is.null(row$date)) {
      return()
    }
    data.frame(
      year = row$date,
      indicator_id = row$indicator$id,
      indicator_name = row$indicator$value,
      country_id = row$country$id,
      country_name = row$country$value,
      country_code = row$countryiso3code,
      value = row$value
    )
  })
  data <- do.call(rbind, data)
  list(page = page, npages = npages, data = data)
}

#' @export
wb_indicator <- function(indicator = "NY.GDP.MKTP.CD", country = "US") {
  resp <- parse_indicator_page(indicator, country, 1)
  npages <- resp$npages
  if (npages == 1) {
    return(resp$data)
  }
  res <- lapply(seq(2, npages), \(page) {
    parse_indicator_page(indicator, country, page) |> _$data
  })
  res <- do.call(rbind, res)
  res <- rbind(resp$data, res)
  as_tibble(res)
}

wb_list_indicators <- function(page = NULL) {
  resp <- parse_indicator(1)
  if (resp$npages == 1) {
    return(resp$data)
  }
  res <- lapply(seq(2, resp$npage), \(page) {
    parse_indicator(page) |> _$data
  })
  res <- do.call(rbind, res)
  res <- rbind(resp$data, res)
  as_tibble(res)
}
