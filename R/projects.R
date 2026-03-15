#' World Bank project data
#'
#' Query World Bank project data from the Projects API.
#'
#' @param id (`NULL` | `character(1)`)\cr
#'   Project ID to query, e.g. `"P163868"`. Default `NULL`.
#'   If provided, other filters are ignored.
#' @param country (`NULL` | `character()`)\cr
#'   ISO country code(s) to filter by, e.g. `"BR"` or `c("BR", "IN")`. Default `NULL`.
#' @param status (`NULL` | `character(1)`)\cr
#'   Project status to filter by. One of `"Active"`, `"Closed"`, `"Dropped"`, or `"Pipeline"`.
#'   Default `NULL`.
#' @param region (`NULL` | `character(1)`)\cr
#'   Region name to filter by, e.g. `"South Asia"`. Default `NULL`.
#' @param search (`NULL` | `character(1)`)\cr
#'   Free-text search term. Default `NULL`.
#' @param start_date (`NULL` | `character(1)`)\cr
#'   Board approval start date in `"YYYY-MM-DD"` format. Default `NULL`.
#' @param end_date (`NULL` | `character(1)`)\cr
#'   Board approval end date in `"YYYY-MM-DD"` format. Default `NULL`.
#' @returns A `data.frame()` with World Bank project data. The columns are:
#' * `id`: The project ID.
#' * `project_name`: The project name.
#' * `status`: The project status.
#' * `approval_date`: The board approval date.
#' * `closing_date`: The closing date.
#' * `country_code`: The ISO country code.
#' * `country`: The country name.
#' * `region`: The region name.
#' * `total_commitment`: The total commitment amount in millions USD.
#' * `ibrd_commitment`: The IBRD commitment amount in millions USD.
#' * `ida_commitment`: The IDA commitment amount in millions USD.
#' * `lending_instrument`: The lending instrument type.
#' * `borrower`: The borrower name.
#' * `implementing_agency`: The implementing agency name.
#' * `url`: The project URL.
#' @source <https://search.worldbank.org/api/v2/projects>
#' @family projects data
#' @export
#' @examplesIf httr2::is_online()
#' \donttest{
#' # active projects in Brazil related to education
#' wb_project(country = "BR", status = "Active", search = "education")
#'
#' # look up a specific project
#' wb_project(id = "P163868")
#' }
wb_project <- function(
  id = NULL,
  country = NULL,
  status = NULL,
  region = NULL,
  search = NULL,
  start_date = NULL,
  end_date = NULL
) {
  stopifnot(
    is_string(id, null_ok = TRUE),
    is_character(country, null_ok = TRUE),
    is_string(status, null_ok = TRUE),
    is_string(region, null_ok = TRUE),
    is_string(search, null_ok = TRUE),
    is_string(start_date, null_ok = TRUE, pattern = "^\\d{4}-\\d{2}-\\d{2}$"),
    is_string(end_date, null_ok = TRUE, pattern = "^\\d{4}-\\d{2}-\\d{2}$")
  )

  if (!is.null(id)) {
    data <- projects(id = id)
  } else {
    country_param <- if (!is.null(country)) paste0(country, collapse = ";") else NULL
    data <- projects(
      countrycode_exact = country_param,
      status = status,
      regionname = region,
      qterm = search,
      strdate = start_date,
      enddate = end_date
    )
  }
  parse_projects(data)
}

projects <- function(..., per_page = 1000L) {
  req <- request("https://search.worldbank.org/api/v2/projects") |>
    req_user_agent(wb_user_agent()) |>
    req_url_query(..., format = "json", rows = per_page) |>
    req_wb_cache()

  resps <- req_perform_iterative(
    req,
    next_req = iterate_with_offset(
      "os",
      start = 0L,
      offset = per_page,
      resp_complete = \(resp) length(resp_body_json(resp)$projects) == 0L
    ),
    max_reqs = Inf
  )

  resps_data(resps, \(resp) resp_body_json(resp)$projects)
}

parse_projects <- function(data) {
  res <- data.frame(
    id = map_chr(data, \(x) x$id %||% NA_character_),
    project_name = map_chr(data, \(x) x$project_name %||% NA_character_),
    status = map_chr(data, \(x) x$status %||% NA_character_),
    approval_date = map_chr(data, \(x) x$boardapprovaldate %||% NA_character_),
    closing_date = map_chr(data, \(x) x$closingdate %||% NA_character_),
    country_code = map_chr(data, function(x) {
      cc <- x$countrycode
      if (is.null(cc)) NA_character_ else paste0(cc, collapse = ";")
    }),
    country = map_chr(data, \(x) x$countryshortname %||% NA_character_),
    region = map_chr(data, \(x) x$regionname %||% NA_character_),
    total_commitment = as.numeric(map_chr(data, \(x) x$curr_total_commitment %||% NA_character_)),
    ibrd_commitment = as.numeric(map_chr(data, \(x) x$curr_ibrd_commitment %||% NA_character_)),
    ida_commitment = as.numeric(map_chr(data, \(x) x$curr_ida_commitment %||% NA_character_)),
    lending_instrument = map_chr(data, \(x) x$lendinginstr %||% NA_character_),
    borrower = map_chr(data, \(x) x$borrower %||% NA_character_),
    implementing_agency = map_chr(data, \(x) x$impagency %||% NA_character_),
    url = map_chr(data, \(x) x$url %||% NA_character_),
    check.names = FALSE
  )
  res$approval_date <- as.Date(sub("T.*", "", res$approval_date))
  res$closing_date <- as.Date(res$closing_date, format = "%m/%d/%Y")
  clean_strings(res)
}
