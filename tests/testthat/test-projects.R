test_that("wb_project", {
  local_mocked_bindings(
    wb_projects_api = function(...) readRDS(test_path("fixtures", "wb-project.rds"))
  )
  actual <- wb_project(country = "BR", status = "Active")
  expect_s3_class(actual, "data.frame")
  expect_shape(actual, dim = c(3L, 15L))
  expect_true(is.numeric(actual$total_commitment))
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
  expect_error(wb_project(status = 1L))
  expect_error(wb_project(status = TRUE))
  expect_error(wb_project(region = 1L))
  expect_error(wb_project(search = 1L))
  expect_error(wb_project(start_date = "2024"))
  expect_error(wb_project(start_date = "not-a-date"))
  expect_error(wb_project(end_date = "2024"))
})
