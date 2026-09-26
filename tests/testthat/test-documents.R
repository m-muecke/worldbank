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

test_that("parse_documents separates multiple country codes and project IDs with `;`", {
  actual <- parse_documents(list(list(countrycode = "1W,MK", projectid = "P163618,P156362")))
  expect_identical(actual$country_code, "1W;MK")
  expect_identical(actual$project_id, "P163618;P156362")
})

test_that("wb_document returns an empty data.frame when nothing matches", {
  local_mocked_bindings(documents = \(...) list())
  actual <- wb_document(search = "nothing")
  expect_shape(actual, dim = c(0L, 14L))
  expect_type(actual$project_id, "character")
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

test_that("wb_document limit caps results across pages", {
  urls <- character()
  docs <- lapply(seq_len(1000L), \(i) list(id = as.character(i)))
  names(docs) <- paste0("D", seq_len(1000L))
  httr2::local_mocked_responses(function(req) {
    urls <<- c(urls, req$url)
    httr2::response_json(body = list(documents = docs))
  })

  actual <- wb_document(search = "climate", limit = 1500L)

  expect_shape(actual, nrow = 1500L)
  expect_length(urls, 2L)
  expect_match(urls, "rows=1000", all = TRUE, fixed = TRUE)
  expect_match(urls[[2L]], "os=1000", fixed = TRUE)

  urls <- character()
  actual <- wb_document(search = "climate", limit = 10L)
  expect_shape(actual, nrow = 10L)
  expect_length(urls, 1L)
  expect_match(urls, "rows=10", fixed = TRUE)
})

test_that("documents stops paging once the total is reached", {
  urls <- character()
  httr2::local_mocked_responses(function(req) {
    urls <<- c(urls, req$url)
    data <- if (length(urls) == 1L) list(D1 = list(id = "D1")) else list()
    httr2::response_json(body = list(total = 5L, documents = data))
  })
  expect_length(documents(), 1L)
  expect_length(urls, 1L)
})

test_that("wb_document input validation works", {
  expect_snapshot(wb_document(id = 1L), error = TRUE)
  expect_snapshot(wb_document(search = c("a", "b")), error = TRUE)
  expect_snapshot(wb_document(country = "BRA"), error = TRUE)
  expect_snapshot(wb_document(country = NA), error = TRUE)
  expect_snapshot(wb_document(type = 1L), error = TRUE)
  expect_snapshot(wb_document(project = TRUE), error = TRUE)
  expect_snapshot(wb_document(start_date = "2024"), error = TRUE)
  expect_snapshot(wb_document(end_date = "not-a-date"), error = TRUE)
  expect_snapshot(wb_document(limit = 0L), error = TRUE)
  expect_snapshot(wb_document(limit = 1.5), error = TRUE)
})

test_that("wb_document rejects start_date after end_date", {
  expect_snapshot(wb_document(start_date = "2024-12-31", end_date = "2024-01-01"), error = TRUE)
})
