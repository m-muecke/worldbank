test_that("wb_lending_type input validation works", {
  # type should be a three letter code or NULL
  expect_error(wb_lending_type(character(0)))
  expect_error(wb_lending_type(""))
  expect_error(wb_lending_type("ab"))
  expect_error(wb_lending_type("abcd"))
  expect_error(wb_lending_type(c("abc", "abcd")))
  expect_error(wb_lending_type(NA))
  expect_error(wb_lending_type(1L))
  expect_error(wb_lending_type(TRUE))
  # lang should be two letter code
  expect_error(wb_lending_type(lang = "a"))
  expect_error(wb_lending_type(lang = "abc"))
  expect_error(wb_lending_type(lang = c("a", "b")))
  expect_error(wb_lending_type(lang = TRUE))
  expect_error(wb_lending_type(lang = 1L))
})

test_that("wb_income_level input validation works", {
  # income should be a three letter code or NULL
  expect_error(wb_income_level(character(0)))
  expect_error(wb_income_level(""))
  expect_error(wb_income_level("ab"))
  expect_error(wb_income_level("abcd"))
  expect_error(wb_income_level(c("abc", "abcd")))
  expect_error(wb_income_level(NA))
  expect_error(wb_income_level(1L))
  expect_error(wb_income_level(TRUE))
  # lang should be two letter code
  expect_error(wb_income_level(lang = "a"))
  expect_error(wb_income_level(lang = "abc"))
  expect_error(wb_income_level(lang = c("a", "b")))
  expect_error(wb_income_level(lang = TRUE))
  expect_error(wb_income_level(lang = 1L))
})

test_that("wb_source input validation works", {
  # source should be a character vector or NULL
  expect_error(wb_source(character(0)))
  expect_error(wb_source(NA))
  expect_error(wb_source(1L))
  expect_error(wb_source(TRUE))
  # lang should be two letter code
  expect_error(wb_source(lang = "a"))
  expect_error(wb_source(lang = "abc"))
  expect_error(wb_source(lang = c("a", "b")))
  expect_error(wb_source(lang = TRUE))
  expect_error(wb_source(lang = 1L))
})

test_that("wb_topic input validation works", {
  # topic should be a character vector or NULL
  expect_error(wb_topic(character(0)))
  expect_error(wb_topic(NA))
  expect_error(wb_topic(1L))
  expect_error(wb_topic(TRUE))
  # lang should be two letter code
  expect_error(wb_topic(lang = "a"))
  expect_error(wb_topic(lang = "abc"))
  expect_error(wb_topic(lang = c("a", "b")))
  expect_error(wb_topic(lang = TRUE))
  expect_error(wb_topic(lang = 1L))
})

test_that("wb_region input validation works", {
  # region should be a character vector or NULL
  expect_error(wb_region(character(0)))
  expect_error(wb_region(NA))
  expect_error(wb_region(1L))
  expect_error(wb_region(TRUE))
  # lang should be two letter code
  expect_error(wb_region(lang = "a"))
  expect_error(wb_region(lang = "abc"))
  expect_error(wb_region(lang = c("a", "b")))
  expect_error(wb_region(lang = TRUE))
  expect_error(wb_region(lang = 1L))
})

test_that("wb_country input validation works", {
  # country should be a character vector with 2/3 letters or NULL
  expect_error(wb_country("a"))
  expect_error(wb_country("abcd"))
  expect_error(wb_country(c("ab", "abcd")))
  expect_error(wb_country(character(0)))
  expect_error(wb_country(NA))
  expect_error(wb_country(1L))
  expect_error(wb_country(TRUE))
  # lang should be two letter code
  expect_error(wb_country(lang = "a"))
  expect_error(wb_country(lang = "abc"))
  expect_error(wb_country(lang = c("a", "b")))
  expect_error(wb_country(lang = TRUE))
  expect_error(wb_country(lang = 1L))
})

test_that("wb_indicator input validation works", {
  # country should be a character vector with 2/3 letters or NULL
  expect_error(wb_indicator("a"))
  expect_error(wb_indicator("abcd"))
  expect_error(wb_indicator(c("ab", "abcd")))
  expect_error(wb_indicator(character(0)))
  expect_error(wb_indicator(NA))
  expect_error(wb_indicator(1L))
  expect_error(wb_indicator(TRUE))
  # lang should be two letter code
  expect_error(wb_indicator(lang = "a"))
  expect_error(wb_indicaotr(lang = "abc"))
  expect_error(wb_indicaotr(lang = c("a", "b")))
  expect_error(wb_indicaotr(lang = TRUE))
  expect_error(wb_indicaotr(lang = 1L))
})

test_that("wb_country_indicator input validation works", {
  # indicator should be a string
  expect_error(wb_country_indicator(indicator = NULL))
  expect_error(wb_country_indicator(indicator = c("a", "b")))
  expect_error(wb_country_indicator(indicator = 1L))
  expect_error(wb_country_indicator(indicator = NA))
  # country should be a character vector with 2/3 letters or NULL
  expect_error(wb_country_indicator(country = "a"))
  expect_error(wb_country_indicator(country = "abcd"))
  expect_error(wb_country_indicator(country = c("ab", "abcd")))
  expect_error(wb_country_indicator(country = character(0)))
  expect_error(wb_country_indicator(country = NA))
  expect_error(wb_country_indicator(country = 1L))
  expect_error(wb_country_indicator(country = TRUE))
  # lang should be two letter code
  expect_error(wb_country_indicator(lang = "a"))
  expect_error(wb_country_indicaotr(lang = "abc"))
  expect_error(wb_country_indicaotr(lang = c("a", "b")))
  expect_error(wb_country_indicaotr(lang = TRUE))
  expect_error(wb_country_indicaotr(lang = 1L))
})
