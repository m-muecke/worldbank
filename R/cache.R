#' Get or manage the worldbank API cache
#'
#' `wb_cache_dir()` returns the path where cached API responses are stored.
#' `wb_cache_delete()` clears all cached responses.
#'
#' @details
#' The cache is only used when enabled with `options(worldbank.cache = TRUE)`.
#' Cached responses are stored for 1 day by default, but this can be customized with
#' `options(worldbank.cache_max_age = seconds)`.
#'
#' @name cache
#' @examples
#' \dontrun{
#' # enable caching
#' options(worldbank.cache = TRUE)
#'
#' # view cache location
#' wb_cache_dir()
#'
#' # clear the cache
#' wb_cache_delete()
#' }
NULL

#' @rdname cache
#' @export
wb_cache_dir <- function() {
  file.path(tools::R_user_dir("worldbank", "cache"), "httr2")
}

#' @rdname cache
#' @export
wb_cache_delete <- function() {
  cache_dir <- wb_cache_dir()
  if (dir.exists(cache_dir)) {
    unlink(dir(cache_dir, full.names = TRUE))
  }
}

req_wb_cache <- function(req) {
  if (isTRUE(getOption("worldbank.cache", FALSE))) {
    req <- req_cache(
      req,
      path = wb_cache_dir(),
      max_age = getOption("worldbank.cache_max_age", 86400L) # 1 day
    )
  }
  req
}
