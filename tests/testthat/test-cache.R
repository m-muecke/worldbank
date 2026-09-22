test_that("wb_cache_delete is defunct", {
  expect_snapshot(wb_cache_delete(), error = TRUE)
})
