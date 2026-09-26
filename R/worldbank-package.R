#' @section Options:
#' * `worldbank.cache`: Cache API responses on disk. Default `FALSE`. See [wb_cache_dir()].
#' * `worldbank.cache_max_age`: Maximum age of cached responses in seconds. Default `86400` (1
#'   day).
#' * `worldbank.progress`: Show a progress bar for paginated requests that take longer than a few
#'   seconds. Default `TRUE`. Set to `FALSE` to hide it.
#'
#' @keywords internal
#' @importFrom httr2 iterate_with_offset
#' @importFrom httr2 req_cache
#' @importFrom httr2 req_error
#' @importFrom httr2 req_perform
#' @importFrom httr2 req_perform_iterative
#' @importFrom httr2 req_retry
#' @importFrom httr2 req_timeout
#' @importFrom httr2 req_url_path_append
#' @importFrom httr2 req_url_query
#' @importFrom httr2 req_user_agent
#' @importFrom httr2 request
#' @importFrom httr2 resp_body_json
#' @importFrom httr2 resp_body_string
#' @importFrom httr2 resp_content_type
#' @importFrom httr2 resp_has_body
#' @importFrom httr2 resp_status
#' @importFrom httr2 resps_data
"_PACKAGE"
