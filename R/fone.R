#' Return Finance One Dataset Data
#'
#' @param dataset_id `character(1)` id of the associated dataset.
#' @param resource_id `character(1)` id of the associated resource.
#' @param ... Additional arguments passed to the request.
#' @returns A `data.frame()` with the requested dataset.
#' @source <https://financesone.worldbank.org/data>
#' @family Finances One
#' @export
#' @examples
#' \dontrun{
#' fone_dataset(dataset_id = "DS00005", resource_id = "RS00005")
#' }
fone_dataset <- function(dataset_id, resource_id, ...) {
  stopifnot(is_string(dataset_id), is_string(resource_id))
  fone(
    resource = "apiservice", datasetId = dataset_id, resourceId = resource_id, ...
  )
}

#' Return Finance One View Data
#'
#' @param view_id `character(1)` id of the view.
#' @param ... Additional arguments passed to the request.
#' @returns A `data.frame()` with the requested view.
#' @source <https://financesone.worldbank.org/data>
#' @family Finances One
#' @export
#' @examples
#' \dontrun{
#' fone_view("DS01538")
#' }
fone_view <- function(view_id, ...) {
  stopifnot(is_string(view_id))
  fone(resource = "view", viewId = view_id, ...)
}

fone <- function(resource, ...) {
  resp <- request("https://datacatalogapi.worldbank.org/dexapps/fone/api") |>
    req_user_agent("worldbank (https://m-muecke.github.io/worldbank)") |>
    req_error(body = \(resp) resp_body_string(resp)) |>
    req_url_path_append(resource) |>
    req_url_query(top = 1000L, type = "csv", ...) |>
    req_perform()

  body <- resp_body_string(resp)
  res <- utils::read.csv(textConnection(body, encoding = "UTF-8"))
  as_tibble(res)
}
