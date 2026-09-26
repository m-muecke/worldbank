test_that("resp_body_csv keeps `NA` country codes", {
  resp <- httr2::response(
    status_code = 200L,
    headers = list("content-type" = "text/csv"),
    body = charToRaw("country,country_code,amount\nNamibia,NA,1.5\nBrazil,BR,\n")
  )
  res <- resp_body_csv(resp)
  expect_equal(res$country_code, c("NA", "BR"))
  expect_equal(res$amount, c(1.5, NA))
})

test_that("is_wb_transient retries gateway and server errors", {
  transient <- map_lgl(c(429L, 500L, 502L, 503L, 504L), \(x) is_wb_transient(httr2::response(x)))
  permanent <- map_lgl(c(200L, 400L, 404L), \(x) is_wb_transient(httr2::response(x)))
  expect_all_true(transient)
  expect_all_false(permanent)
})

test_that("resp_total_pages derives the page count from the total", {
  resp <- \(total) httr2::response_json(body = list(total = total))
  expect_identical(resp_total_pages(resp("2500"), 1000L), 3)
  expect_identical(resp_total_pages(resp(1000L), 1000L), 1)
  expect_identical(resp_total_pages(resp(0L), 1000L), 1)
  expect_null(resp_total_pages(httr2::response_json(body = list()), 1000L))
})

test_that("wb_progress respects the worldbank.progress option", {
  expect_identical(wb_progress(), TRUE)
  withr::local_options(worldbank.progress = FALSE)
  expect_identical(wb_progress(), FALSE)
  withr::local_options(worldbank.progress = NA)
  expect_identical(wb_progress(), FALSE)
})
