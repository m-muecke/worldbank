test_that("wb_project", {
  local_mocked_bindings(
    projects = \(...) readRDS(test_path("fixtures", "wb-project.rds"))
  )
  actual <- wb_project(country = "BR", status = "active")
  expect_s3_class(actual, "data.frame")
  expect_shape(actual, dim = c(3L, 15L))
  expect_identical(rownames(actual), c("1", "2", "3"))
  expect_type(actual$total_commitment, "double")
  expect_s3_class(actual$approval_date, "Date")
  expect_s3_class(actual$closing_date, "Date")
  for (x in actual) {
    if (is.character(x)) {
      expect_all_true(nzchar(x))
      expect_false(has_ws(x))
    }
  }
})

test_that("project_fields covers every field parse_projects reads", {
  data <- readRDS(test_path("fixtures", "wb-project.rds"))
  restricted <- lapply(data, \(x) x[intersect(names(x), project_fields)])
  expect_identical(parse_projects(restricted), parse_projects(data))
})


test_that("projects stops paging once the total is reached", {
  urls <- character()
  httr2::local_mocked_responses(function(req) {
    urls <<- c(urls, req$url)
    data <- if (length(urls) <= 2L) list(P1 = list(id = "P1")) else list()
    httr2::response_json(body = list(total = "2", projects = data))
  })
  expect_length(projects(per_page = 1L), 2L)
  expect_length(urls, 2L)
})

test_that("wb_project input validation works", {
  expect_error(wb_project(id = 1L))
  expect_error(wb_project(id = TRUE))
  expect_error(wb_project(country = 1L))
  expect_error(wb_project(country = NA))
  expect_error(wb_project(country = "B"))
  expect_error(wb_project(country = "BRA"))
  expect_error(wb_project(country = c("BR", "IND")))
  expect_error(wb_project(status = 1L))
  expect_error(wb_project(status = TRUE))
  expect_error(wb_project(region = 1L))
  expect_error(wb_project(search = 1L))
  expect_error(wb_project(start_date = "2024"))
  expect_error(wb_project(start_date = "not-a-date"))
  expect_error(wb_project(end_date = "2024"))
})

test_that("wb_project rejects start_date after end_date", {
  expect_snapshot(wb_project(start_date = "2024-12-31", end_date = "2024-01-01"), error = TRUE)
})

test_that("wb_project forwards status", {
  captured <- NULL
  local_mocked_bindings(
    projects = function(...) {
      captured <<- list(...)$status
      readRDS(test_path("fixtures", "wb-project.rds"))
    }
  )
  for (status in c("active", "closed", "dropped", "pipeline")) {
    wb_project(status = status)
    expect_equal(captured, status)
  }
  for (status in c("Active", "CLOSED", "Pipeline")) {
    wb_project(status = status)
    expect_equal(captured, tolower(status))
  }
  wb_project()
  expect_null(captured)
})

test_that("wb_project joins country codes the way the API expects", {
  captured <- NULL
  local_mocked_bindings(
    projects = function(...) {
      captured <<- list(...)$countrycode_exact
      readRDS(test_path("fixtures", "wb-project.rds"))
    }
  )
  wb_project(country = "br")
  expect_equal(captured, "BR")
  wb_project(country = c("BR", "in"))
  expect_equal(captured, "BR^IN")
  wb_project()
  expect_null(captured)
})

test_that("wb_project joins multi-value filters with the API separator", {
  captured <- NULL
  local_mocked_bindings(
    projects = function(...) {
      captured <<- list(...)
      readRDS(test_path("fixtures", "wb-project.rds"))
    }
  )
  wb_project(
    status = c("Active", "pipeline"),
    region = c("South Asia", "Africa")
  )
  expect_equal(captured$status, "active^pipeline")
  expect_equal(captured$regionname, "South Asia^Africa")

  wb_project(id = c("P163868", "P180429"))
  expect_equal(captured$id, "P163868^P180429")
})

test_that("wb_project rejects unknown status", {
  expect_snapshot(error = TRUE, {
    wb_project(status = "invalid")
    wb_project(status = "act")
    wb_project(status = c("active", "invalid"))
  })
})
