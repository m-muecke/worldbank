test_that("wb_document", {
  local_mocked_bindings(
    documents = \(...) readRDS(test_path("fixtures", "wb-document.rds"))
  )
  actual <- wb_document(country = "BR")
  expect_s3_class(actual, "data.frame")
  expect_shape(actual, dim = c(3L, 14L))
  expect_s3_class(actual$date, "Date")
  expect_identical(actual$project_id, c(NA, NA, "P180429"))
  for (x in actual) {
    if (is.character(x)) {
      expect_all_true(is.na(x) | nzchar(x))
      expect_false(has_ws(x))
    }
  }
})

test_that("wb_document returns an empty data.frame when nothing matches", {
  local_mocked_bindings(documents = \(...) list())
  expect_shape(wb_document(search = "nothing"), dim = c(0L, 14L))
})

test_that("wb_document joins multi-value filters with the API separator", {
  captured <- NULL
  local_mocked_bindings(
    documents = function(...) {
      captured <<- list(...)
      readRDS(test_path("fixtures", "wb-document.rds"))
    }
  )
  wb_document(
    search = "climate",
    country = c("br", "IN"),
    type = c("Report", "Brief"),
    project = "p180429",
    start_date = "2024-01-01"
  )
  expect_identical(captured$qterm, "climate")
  expect_identical(captured$countrycode_exact, "BR^IN")
  expect_identical(captured$docty_exact, "Report^Brief")
  expect_identical(captured$proid, "P180429")
  expect_identical(captured$strdate, "2024-01-01")
  expect_null(captured$enddate)

  wb_document(id = c("1", "2"))
  expect_identical(captured$id, "1^2")
})

test_that("wb_document input validation works", {
  expect_error(wb_document(id = 1L))
  expect_error(wb_document(search = c("a", "b")))
  expect_error(wb_document(country = "BRA"))
  expect_error(wb_document(country = NA))
  expect_error(wb_document(type = 1L))
  expect_error(wb_document(project = TRUE))
  expect_error(wb_document(start_date = "2024"))
  expect_error(wb_document(end_date = "not-a-date"))
})
