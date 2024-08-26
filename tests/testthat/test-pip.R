test_that("pip_data basic checks", {
  skip_if_offline()
  skip_on_cran()
  skip_on_ci()

  res <- pip_data(c("ZAF", "ZMB"))
  expect_s3_class(res, "data.frame")
  expect_gt(nrow(res), 0L)
})

test_that("pip_group basic checks", {
  skip_if_offline()
  skip_on_cran()
  skip_on_ci()

  res <- pip_group(c("AFE", "LAC"))
  expect_s3_class(res, "data.frame")
  expect_gt(nrow(res), 0L)
})

test_that("pip_versions basic checks", {
  skip_if_offline()
  skip_on_cran()
  skip_on_ci()

  res <- pip_versions()
  expect_s3_class(res, "data.frame")
  expect_gt(nrow(res), 0L)
})

test_that("pip_citation basic checks", {
  skip_if_offline()
  skip_on_cran()
  skip_on_ci()

  res <- pip_citation()
  expect_s3_class(res, "data.frame")
  expect_identical(dim(res), c(1L, 3L))
})

test_that("pip_aux basic checks", {
  skip_if_offline()
  skip_on_cran()
  skip_on_ci()

  res <- pip_aux()
  expect_vector(res, ptype = character())

  res <- pip_aux("countries")
  expect_s3_class(res, "data.frame")
  expect_gt(nrow(res), 0L)
})

test_that("pip_valid_params basic checks", {
  skip_if_offline()
  skip_on_cran()
  skip_on_ci()

  res <- pip_valid_params()
  expect_s3_class(res, "data.frame")
  expect_gt(nrow(res), 0L)
})

test_that("pip_info basic checks", {
  skip_if_offline()
  skip_on_cran()
  skip_on_ci()

  res <- pip_info()
  expect_type(res, "list")
  expect_gt(length(res), 0L)
  expect_named(res)
})

test_that("pip_health_check basic checks", {
  skip_if_offline()
  skip_on_cran()
  skip_on_ci()

  res <- pip_health_check()
  expect_vector(res, ptype = character(), size = 1L)
})
