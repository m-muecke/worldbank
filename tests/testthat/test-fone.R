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
