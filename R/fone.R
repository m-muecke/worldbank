#' Return Finances One API Data
#' @param dataset_id (`character(1)`) id of the associated dataset.
#'
#' @param resource_id (`character(1)`) id of the associated resource.
#' @param view_id (`character(1)`) id of the view.
#' @param ... (`any`) additional arguments passed to the request.
#' @param limit (`integer(1)`) the maximum number of rows to return. Default is `NULL`.
#'   If `NULL`, all rows are returned.
#' @returns A `data.frame()` with the requested dataset.
#' @source <https://financesone.worldbank.org/data>
#' @export
#' @rdname fone
#' @examples
#' \dontrun{
#' fone_dataset(dataset_id = "DS00047", resource_id = "RS00005")
#' fone_view(view_id = "DS01538")
#' }
fone_dataset <- function(dataset_id, resource_id, ..., limit = NULL) {
  stopifnot(
    is_string(dataset_id),
    is_string(resource_id),
    is_count_or_null(limit)
  )
  fone(
    resource = "apiservice",
    datasetId = dataset_id,
    resourceId = resource_id,
    ...,
    limit = limit
  )
}

#' @rdname fone
#' @export
fone_view <- function(view_id, ..., limit = NULL) {
  stopifnot(is_string(view_id), is_count_or_null(limit))
  fone(resource = "view", viewId = view_id, ..., limit = limit)
}

fone <- function(resource, ..., limit = NULL) {
  max_reqs <- if (!is.null(limit)) ceiling(limit / 1000L) else Inf

  req <- request("https://datacatalogapi.worldbank.org/dexapps/fone/api") |>
    req_user_agent("worldbank (https://m-muecke.github.io/worldbank)") |>
    req_error(body = \(resp) resp_body_string(resp, "UTF-8")) |>
    req_url_path_append(resource) |>
    req_url_query(top = limit, type = "csv", ...)

  resps <- req_perform_iterative(
    req,
    next_req = iterate_with_offset(
      "skip",
      start = 0L,
      offset = 1000L,
      resp_complete = \(resp) length(resp$body) == 0L
    ),
    max_reqs = max_reqs
  )

  res <- resps_data(resps, function(resp) {
    if (length(resp$body) > 0L) {
      body <- resp_body_string(resp, "UTF-8")
      utils::read.csv(textConnection(body, encoding = "UTF-8"))
    }
  })
  res
}
