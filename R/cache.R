#' Get or manage the worldbank API cache
#'
#' `wb_cache_dir()` returns the path where cached API responses are stored.
#' `wb_cache_clear()` clears all cached responses.
#'
#' @details
#' The cache is only used when enabled with `options(worldbank.cache = TRUE)`.
#'
#' Each API's caching headers decide whether and for how long a cached response is reused, so the
#' cache helps more with some APIs than others. Indicators API responses are reused for up to a
#' day. Projects and Documents & Reports API responses are checked with the API on every call, which
#' only saves downloading them again. Finances One and PIP API responses are never cached.
#'
#' Cached responses older than 1 day are deleted. Change this with
#' `options(worldbank.cache_max_age = seconds)`. A higher value doesn't make responses be reused
#' for longer than the API allows.
#'
#' @name cache
#' @returns
#' `wb_cache_dir()` returns a string with the path to the cache directory.
#'
#' `wb_cache_clear()` is called for its side effect of clearing the cached
#' responses and returns `NULL` invisibly.
#' @examples
#' \dontrun{
#' # enable caching
#' options(worldbank.cache = TRUE)
#'
#' # view cache location
#' wb_cache_dir()
#'
#' # clear the cache
#' wb_cache_clear()
#' }
NULL

#' @rdname cache
#' @export
wb_cache_dir <- function() {
  file.path(tools::R_user_dir("worldbank", "cache"), "httr2")
}

#' @rdname cache
#' @export
wb_cache_clear <- function() {
  cache_dir <- wb_cache_dir()
  if (dir.exists(cache_dir)) {
    unlink(dir(cache_dir, full.names = TRUE))
  }
  invisible()
}

#' @rdname cache
#' @export
wb_cache_delete <- function() {
  .Defunct("wb_cache_clear")
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
