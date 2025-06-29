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

test_that("format_date works", {
  # both dates provided
  expect_identical(format_date("2024", "2025"), "2024:2025")
  expect_identical(format_date("2024M01", "2025Q1"), "2024M01:2025Q1")
  # only start date provided
  expect_identical(format_date("2024", NULL), "2024")
  expect_identical(format_date("2024M01", NULL), "2024M01")
  # only end date provided
  expect_identical(format_date(NULL, "2025"), "2025")
  expect_identical(format_date(NULL, "2025Q1"), "2025Q1")
  # neither date provided
  expect_null(format_date(NULL, NULL))
  # different types of inputs
  expect_identical(format_date(2024L, 2025L), "2024:2025")
  expect_identical(format_date(2024L, NULL), 2024L)
  expect_identical(format_date(NULL, 2025L), 2025L)
  # Test for edge cases with empty strings
  expect_identical(format_date("", ""), ":")
  expect_identical(format_date("2024", ""), "2024:")
  expect_identical(format_date("", "2025"), ":2025")
})

test_that("is_dateish works", {
  # NULL input
  expect_true(is_dateish(NULL, null_ok = TRUE))
  # valid year
  expect_true(is_dateish(2024))
  expect_true(is_dateish("2024"))
  # valid year with month
  expect_true(is_dateish("2024M01"))
  expect_true(is_dateish("2024M12"))
  # valid year with quarter
  expect_true(is_dateish("2024Q1"))
  expect_true(is_dateish("2024Q4"))
  # invalid lengths
  expect_false(is_dateish(c("2024", "2025")))
  expect_false(is_dateish(c("2024M01", "2024Q1")))
  # invalid formats
  expect_false(is_dateish("202"))
  expect_false(is_dateish("2024M13"))
  expect_false(is_dateish("2024Q5"))
  expect_false(is_dateish("2024M00"))
  expect_false(is_dateish("2024X01"))
  expect_false(is_dateish("24M01"))
  expect_false(is_dateish("2024-Q1"))
  expect_false(is_dateish("2024/M01"))
})
