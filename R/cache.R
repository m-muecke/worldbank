#' Get the worldbank cache directory path
#'
#' @export
#' @examples
#' \dontrun{
#' wb_cache_dir()
#' }
wb_cache_dir <- function() {
  file.path(tools::R_user_dir("worldbank", "cache"), "httr2")
}

#' Clear the worldbank API cache
#'
#' @export
#' @examples
#' \dontrun{
#' wb_cache_delete()
#' }
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
