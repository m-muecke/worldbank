test_that("fone_dataset basic checks", {
  skip_if_offline()
  skip_on_cran()
  skip_on_ci()

  res <- fone_dataset(dataset_id = "DS00047", resource_id = "RS00005")
  expect_s3_class(res, "data.frame")
  expect_gt(nrow(res), 100L)

  res <- fone_dataset(dataset_id = "DS00047", resource_id = "RS00005", limit = 10L)
  expect_s3_class(res, "data.frame")
  expect_shape(res, dim = c(10L, 33L))
})

test_that("fone_view basic checks", {
  skip_if_offline()
  skip_on_cran()
  skip_on_ci()

  res <- fone_view(view_id = "DS01538")
  expect_s3_class(res, "data.frame")
  expect_gt(nrow(res), 100L)

  res <- fone_view(view_id = "DS01538", limit = 10L)
  expect_s3_class(res, "data.frame")
  expect_shape(res, dim = c(10L, 6L))
})

test_that("fone limit caps results across pages", {
  urls <- character()
  page <- paste0("id\n", paste(seq_len(1000L), collapse = "\n"), "\n")
  httr2::local_mocked_responses(function(req) {
    urls <<- c(urls, req$url)
    httr2::response(
      status_code = 200L,
      url = req$url,
      headers = list("content-type" = "text/csv"),
      body = charToRaw(page)
    )
  })

  res <- fone_view("view-id", limit = 1500L)

  expect_shape(res, dim = c(1500L, 1L))
  expect_length(urls, 2L)
  expect_match(urls, "top=1000", all = TRUE, fixed = TRUE)
  expect_match(urls[[2L]], "skip=1000", fixed = TRUE)
})
