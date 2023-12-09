#' @export
wb_indicators <- function(page = NULL) {
  if (!is.null(page)) {
    resp <- worldbank("indicators", page = page)
    res <- parse_indicators(resp)
  } else {
    resp <- worldbank("indicators", page = 1)
    res_one <- parse_indicators(resp)
    npages <- resp[[1]]$pages
    if (npages > 1) {
      res <- lapply(seq(2, npages), \(page) {
        resp <- worldbank("indicators", page = page)
        parse_indicators(resp)
      })
      res <- do.call(rbind, res)
      res <- rbind(res, res_one)
    }
  }
  as_tibble(res)
}

#' @export
wb_country_indicator <- function(indicator = "NY.GDP.MKTP.CD",
                                 country = "US",
                                 page = NULL) {
  resource <- sprintf("country/%s/indicator/%s", country, indicator)
  if (!is.null(page)) {
    resp <- worldbank(resource, page = page)
    res <- parse_country_indicator(resp)
  } else {
    resp <- worldbank(resource, page = 1)
    res_one <- parse_country_indicator(resp)
    npages <- resp[[1]]$pages
    if (npages > 1) {
      res <- lapply(seq(2, npages), \(page) {
        resp <- worldbank(resource, page = page)
        parse_country_indicator(resp)
      })
      res <- do.call(rbind, res)
      res <- rbind(res, res_one)
    }
  }
  as_tibble(res)
}

parse_indicators <- function(resp) {
  data <- resp[[2]]
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
}

parse_indicators2 <- function(resp) {
  data <- resp[[2]]
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

parse_country_indicator <- function(resp) {
  data <- resp[[2]]
  data <- lapply(resp[[2]], \(x) {
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
      obs_status = x$obs_status,
      decimal = x$decimal
    )
  })
  do.call(rbind, data)
}

worldbank <- function(resource, ..., page = 1) {
  request("http://api.worldbank.org/v2") |>
    req_url_path_append(resource) |>
    req_url_query(..., format = "json", page = page) |>
    req_perform() |>
    resp_body_json()
}
