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
