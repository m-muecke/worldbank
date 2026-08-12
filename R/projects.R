#' World Bank project data
#'
#' Query World Bank project data from the Projects API.
#'
#' @param id (`NULL` | `character()`)\cr
#'   Project ID(s) to query, e.g. `"P163868"` or `c("P163868", "P180429")`. Default `NULL`.
#'   If provided, other filters are ignored.
#' @param country (`NULL` | `character()`)\cr
#'   Two-character World Bank country code(s) to filter by, e.g. `"BR"` or `c("BR", "IN")`.
#'   Regional aggregates such as `"1W"` (World) or `"3A"` (Africa) are also accepted. Matching is
#'   case insensitive, and projects for any of the given codes are returned. Default `NULL`.
#' @param status (`NULL` | `character()`)\cr
#'   Project status(es) to filter by, each one of `"active"`, `"closed"`, `"dropped"`, or
#'   `"pipeline"`. Projects with any of the given statuses are returned. Default `NULL`.
#' @param region (`NULL` | `character()`)\cr
#'   Region name(s) to filter by, e.g. `"South Asia"`. Matching is case insensitive and by
#'   substring, so `"Africa"` also matches `"Eastern and Southern Africa"` and
#'   `"Middle East and North Africa"`. Projects matching any of the given names are returned.
#'   Default `NULL`.
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
#' wb_project(country = "BR", status = "active", search = "education")
#'
#' # active or pipeline projects across two countries
#' wb_project(country = c("BR", "IN"), status = c("active", "pipeline"))
#'
#' # look up specific projects
#' wb_project(id = c("P163868", "P180429"))
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
    is_character(id, null_ok = TRUE),
    is_character(country, null_ok = TRUE, n_chars = 2L),
    is_character(status, null_ok = TRUE),
    is.null(status) || all(tolower(status) %in% c("active", "closed", "dropped", "pipeline")),
    is_character(region, null_ok = TRUE),
    is_string(search, null_ok = TRUE),
    is_string(start_date, null_ok = TRUE, pattern = "^\\d{4}-\\d{2}-\\d{2}$"),
    is_string(end_date, null_ok = TRUE, pattern = "^\\d{4}-\\d{2}-\\d{2}$")
  )

  if (!is.null(id)) {
    data <- projects(id = collapse_or(id))
  } else {
    data <- projects(
      countrycode_exact = collapse_or(toupper(country)),
      status = collapse_or(tolower(status)),
      regionname = collapse_or(region),
      qterm = search,
      strdate = start_date,
      enddate = end_date
    )
  }
  parse_projects(data)
}

collapse_or <- function(x) {
  if (length(x) == 0L) {
    return()
  }
  paste0(x, collapse = "^")
}

projects <- function(..., per_page = 1000L) {
  req <- wb_request("https://search.worldbank.org/api/v2/projects") |>
    req_url_query(..., format = "json", rows = per_page)

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
    check.names = FALSE,
    row.names = NULL
  )
  res$approval_date <- as.Date(sub("T.*", "", res$approval_date))
  res$closing_date <- as.Date(res$closing_date, format = "%m/%d/%Y")
  clean_strings(res)
}
