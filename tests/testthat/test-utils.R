test_that("is_string works", {
  expect_true(is_string("hello"))
  expect_true(is_string(""))
  expect_false(is_string(1))
  expect_false(is_string(c("hello", "world")))
  expect_false(is_string(NULL))
  expect_false(is_string(character()))
})

test_that("is_year works", {
  expect_true(is_year(2019))
})

test_that("is_lang_code works", {
  expect_true(is_lang_code("en"))
  expect_true(is_lang_code("EN"))
  expect_false(is_lang_code("en_US"))
  expect_false(is_lang_code(c("en", "US")))
  expect_false(is_lang_code(character()))
  expect_false(is_lang_code(""))
  expect_false(is_lang_code(NULL))
  expect_false(is_lang_code(1))
  expect_false(is_lang_code(TRUE))
})

test_that("is_country_code works", {
  expect_true(is_country_code("US"))
  expect_true(is_country_code("us"))
  expect_true(is_country_code(c("US", "CA")))
  expect_true(is_country_code("USA"))
  expect_false(is_country_code(character()))
  expect_false(is_country_code("en_US"))
  expect_false(is_country_code(FALSE))
  expect_false(is_country_code(NULL))
  expect_false(is_country_code(1))
})
