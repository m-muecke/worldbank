test_that("is_number checks type, length and finiteness", {
  expect_all_true(c(is_number(2.15), is_number(0L), is_number(-1)))
  expect_all_false(c(
    is_number("2.15"),
    is_number(NA_real_),
    is_number(c(1, 2)),
    is_number(numeric()),
    is_number(Inf),
    is_number(TRUE),
    is_number(NULL)
  ))
  expect_true(is_number(NULL, null_ok = TRUE))
})

test_that("is_number checks bounds", {
  expect_all_true(c(
    is_number(0, lower = 0, upper = 1),
    is_number(1, lower = 0, upper = 1),
    is_number(0.5, lower = 0, upper = 1)
  ))
  expect_all_false(c(
    is_number(-0.1, lower = 0, upper = 1),
    is_number(1.1, lower = 0, upper = 1)
  ))
})

test_that("is_version accepts digits as string or number", {
  expect_all_true(c(
    is_version("2017", 4L),
    is_version(2017, 4L),
    is_version(2017L, 4L),
    is_version("20260324", 8L),
    is_version(20260324, 8L)
  ))
  expect_all_false(c(
    is_version("2017a", 4L),
    is_version("v20260324", 8L),
    is_version(2017, 8L),
    is_version(20260324, 4L),
    is_version(NA, 4L),
    is_version(TRUE, 4L),
    is_version(c("2017", "2021"), 4L),
    is_version(NULL, 4L)
  ))
  expect_true(is_version(NULL, 4L, null_ok = TRUE))
})
