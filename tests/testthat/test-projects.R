test_that("wb_project", {
  local_mocked_bindings(
    projects = function(...) readRDS(test_path("fixtures", "wb-project.rds"))
  )
  actual <- wb_project(country = "BR", status = "active")
  expect_s3_class(actual, "data.frame")
  expect_shape(actual, dim = c(3L, 15L))
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

test_that("wb_project rejects unknown status", {
  expect_snapshot(error = TRUE, {
    wb_project(status = "invalid")
    wb_project(status = "act")
  })
})
