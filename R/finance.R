#' @examples
#' \dontrun{
#' wb_finances_data(dataset_id = "DS00005", resource_id = "RS00005")
#' }
wb_finances_data <- function(dataset_id, resource_id, ...) {
  stopifnot(is_string(dataset_id), is_string(resource_id))
  wb_finances(
    resource = "apiservice", datasetId = dataset_id, resourceId = resource_id, ...
  )
}

#' @examples
#' \dontrun{
#' wb_finances_view("DS01538")
#' }
wb_finances_view <- function(view_id, ...) {
  stopifnot(is_string(view_id))
  wb_finances(resource = "view", viewId = view_id, ...)
}

wb_finances <- function(resource, ...) {
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
