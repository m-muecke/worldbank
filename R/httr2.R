wb_user_agent <- function() {
  sprintf("worldbank/%s", utils::packageVersion("worldbank"))
}

wb_progress <- function() {
  isTRUE(getOption("worldbank.progress", TRUE))
}

req_wb_retry <- function(req) {
  req_retry(req, max_tries = 3L, is_transient = is_wb_transient)
}

is_wb_transient <- function(resp) {
  resp_status(resp) %in% c(429L, 500L, 502L, 503L, 504L)
}

wb_request <- function(url) {
  request(url) |>
    req_user_agent(wb_user_agent()) |>
    req_wb_retry() |>
    req_wb_cache()
}

resp_body_csv <- function(resp) {
  utils::read.csv(text = resp_body_string(resp, "UTF-8"), na.strings = character())
}

resp_total_pages <- function(resp, per_page) {
  total <- resp_body_json(resp)$total
  if (is.null(total)) {
    return()
  }
  max(ceiling(as.integer(total) / per_page), 1L)
}
