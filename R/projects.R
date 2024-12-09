wb_projects <- function() {
  if (!requireNamespace("readxl", quietly = TRUE)) {
    stop("readxl is required to read Excel files. Please install it.")
  }

  body <- request("https://search.worldbank.org/api/v3/projects/all.xlsx") |>
    req_user_agent("worldbank (https://m-muecke.github.io/worldbank)") |>
    req_perform() |>
    resp_body_raw()

  tf <- tempfile()
  on.exit(unlink(tf), add = TRUE)
  writeBin(body, tf)
  res <- readxl::read_xlsx(tf, skip = 2L, sheet = 1L)


  body <- request("https://search.worldbank.org/api/v3/projects") |>
    req_user_agent("worldbank (https://m-muecke.github.io/worldbank)") |>
    req_perform() |>
    resp_body_json()

  proj <- body$projects
  res <- data.frame(
    id = map_chr(proj, "id"),
    country_name = map_chr(proj, "countryshortname"),
    board_approval_date = map_chr(proj, "boardapprovaldate"),
    grant_amount = map_chr(proj, "grantamt"),
    region_name = map_chr(proj, "regionname"),
    lend_proj_cost = map_chr(proj, "lendprojectcost"),
    borrower = map_chr(proj, "borrower"),
    impagency = map_chr(proj, "impagency"),
    sector_code = map_chr(proj, "sectorcode"),
    check.names = FALSE
  )
  res
}
