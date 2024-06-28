test_that("clean_strings", {
  data <- data.frame(
    a = c("  hello  ", " world", " ", "", "!"),
    b = c(" test ", "data", "", "  ", "."),
    c = 1:5
  )
  actual <- clean_strings(data)
  expected <- data.frame(
    a = c("hello", "world", NA, NA, "!"),
    b = c("test", "data", NA, NA, "."),
    c = 1:5
  )
  expect_identical(actual, expected)
})
