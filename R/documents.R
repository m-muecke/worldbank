#' World Bank document data
#'
#' Search the World Bank Documents & Reports archive from the Documents & Reports API.
#'
#' @param search (`NULL` | `character(1)`)\cr
#'   Free-text search term. Default `NULL`.
#' @param country (`NULL` | `character()`)\cr
#'   Two-character World Bank country code(s) to filter by, e.g. `"BR"` or `c("BR", "IN")`.
#'   Matching is case insensitive, and documents for any of the given codes are returned.
#'   Default `NULL`.
#' @param type (`NULL` | `character()`)\cr
#'   Document type(s) to filter by, e.g. `"Report"` or `"Project Appraisal Document"`. Documents
#'   of any of the given types are returned. Default `NULL`.
#' @param project (`NULL` | `character()`)\cr
#'   Project ID(s) to filter by, e.g. `"P180429"`. Documents for any of the given projects are
#'   returned. Default `NULL`.
#' @param start_date (`NULL` | `character(1)`)\cr
#'   Document start date in `"YYYY-MM-DD"` format. Default `NULL`.
#' @param end_date (`NULL` | `character(1)`)\cr
#'   Document end date in `"YYYY-MM-DD"` format. Default `NULL`.
#' @param id (`NULL` | `character()`)\cr
#'   Document ID(s) to filter by, as returned in the `id` column. Default `NULL`.
#' @param limit (`NULL` | `integer(1)`)\cr
#'   The maximum number of documents to return. Default `NULL`. If `NULL`, all matching documents
#'   are returned, which can take many requests for broad queries.
#' @returns A `data.frame()` with World Bank document data. The columns are:
#' * `id`: The document ID.
#' * `title`: The document title.
#' * `type`: The document type.
#' * `major_type`: The major document type.
#' * `country_code`: The ISO country code.
#' * `country`: The country name.
#' * `region`: The administrative region name.
#' * `language`: The document language.
#' * `date`: The document date.
#' * `report_number`: The report number.
#' * `project_id`: The ID of the associated project, or `NA` if there is none.
#' * `url`: The document URL.
#' * `pdf_url`: The PDF URL.
#' * `abstract`: The abstract.
#' @source <https://search.worldbank.org/api/v3/wds>
#' @family documents data
#' @export
#' @examplesIf httr2::is_online()
#' \donttest{
#' # project appraisal documents for Brazil published in 2024
#' wb_document(
#'   country = "BR",
#'   type = "Project Appraisal Document",
#'   start_date = "2024-01-01",
#'   end_date = "2024-12-31"
#' )
#'
#' # all documents belonging to a project
#' wb_document(project = "P180429")
#'
#' # the first 100 documents mentioning climate
#' wb_document(search = "climate", limit = 100)
#' }
wb_document <- function(
  search = NULL,
  country = NULL,
  type = NULL,
  project = NULL,
  start_date = NULL,
  end_date = NULL,
  id = NULL,
  limit = NULL
) {
  stopifnot(
    is_string(search, null_ok = TRUE),
    is_character(country, null_ok = TRUE, n_chars = 2L),
    is_character(type, null_ok = TRUE),
    is_character(project, null_ok = TRUE),
    is_string(start_date, null_ok = TRUE, pattern = "^\\d{4}-\\d{2}-\\d{2}$"),
    is_string(end_date, null_ok = TRUE, pattern = "^\\d{4}-\\d{2}-\\d{2}$"),
    is_character(id, null_ok = TRUE),
    is_count(limit, null_ok = TRUE)
  )

  if (!is.null(start_date) && !is.null(end_date) && start_date > end_date) {
    stop("`start_date` must be earlier than `end_date`.", call. = FALSE)
  }

  data <- documents(
    qterm = search,
    countrycode_exact = collapse_or(toupper(country)),
    docty_exact = collapse_or(type),
    proid = collapse_or(toupper(project)),
    strdate = start_date,
    enddate = end_date,
    id = collapse_or(id),
    limit = limit
  )
  parse_documents(data)
}

documents <- function(..., limit = NULL) {
  per_page <- min(limit %||% 1000L, 1000L)
  max_reqs <- if (!is.null(limit)) ceiling(limit / per_page) else Inf

  fields <- c(
    "display_title",
    "docty",
    "majdocty",
    "countrycode",
    "count",
    "admreg",
    "lang",
    "docdt",
    "repnb",
    "projn",
    "url",
    "pdfurl",
    "abstracts"
  )
  req <- wb_request("https://search.worldbank.org/api/v3/wds") |>
    req_url_query(..., format = "json", rows = per_page, fl = fields, .multi = "comma")

  resps <- req_perform_iterative(
    req,
    next_req = iterate_with_offset(
      "os",
      start = 0L,
      offset = per_page,
      resp_pages = \(resp) resp_total_pages(resp, per_page),
      resp_complete = \(resp) length(resp_documents(resp)) == 0L
    ),
    max_reqs = max_reqs
  )

  data <- resps_data(resps, resp_documents)
  if (!is.null(limit)) {
    data <- utils::head(data, limit)
  }
  data
}

resp_documents <- function(resp) {
  docs <- resp_body_json(resp)$documents
  docs$facets <- NULL
  unname(docs)
}

parse_documents <- function(data) {
  res <- data.frame(
    id = map_chr(data, \(x) x$id %||% NA_character_),
    title = map_chr(data, \(x) x$display_title %||% NA_character_),
    type = map_chr(data, \(x) x$docty %||% NA_character_),
    major_type = map_chr(data, \(x) x$majdocty %||% NA_character_),
    country_code = map_chr(data, \(x) x$countrycode %||% NA_character_),
    country = map_chr(data, \(x) x$count %||% NA_character_),
    region = map_chr(data, \(x) x$admreg %||% NA_character_),
    language = map_chr(data, \(x) x$lang %||% NA_character_),
    date = map_chr(data, \(x) x$docdt %||% NA_character_),
    report_number = map_chr(data, \(x) x$repnb %||% NA_character_),
    project_id = map_chr(data, \(x) x$projn %||% NA_character_),
    url = map_chr(data, \(x) x$url %||% NA_character_),
    pdf_url = map_chr(data, \(x) x$pdfurl %||% NA_character_),
    abstract = map_chr(data, \(x) x$abstracts[["cdata!"]] %||% NA_character_),
    check.names = FALSE
  )
  res$date <- as.Date(sub("T.*", "", res$date))
  # the project ID is only available as a suffix of the project name, e.g. "BR-Name -- P180429"
  has_project_id <- grepl(" -- P\\d+$", res$project_id)
  res$project_id <- sub(".* -- ", "", res$project_id)
  res$project_id[!has_project_id] <- NA_character_
  clean_strings(res)
}
