wb_user_agent <- function() {
  sprintf("worldbank/%s", utils::packageVersion("worldbank"))
}

req_wb_retry <- function(req) {
  req_retry(req, max_tries = 3L, is_transient = \(resp) resp_status(resp) %in% c(429L, 500L, 503L))
}

wb_request <- function(url) {
  request(url) |>
    req_user_agent(wb_user_agent()) |>
    req_wb_retry() |>
    req_wb_cache()
}
