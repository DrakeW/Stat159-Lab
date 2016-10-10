# load the source code of the functions to be tested
source("../functions/functions.R")

# context with one test that groups expectations
context("Test for range value") 

test_that("range works as expected", {
  x <- c(1, 2, 3, 4, 5)

  expect_equal(range_value(x), 4)
  expect_length(range_value(x), 1)
  expect_type(range_value(x), 'double')
})


test_that("range work for vector with NA values", {
	y <- c(1, 2, 3, 4, NA)
	expect_length(range_value(y, na.rm=TRUE), 1)
	expect_equal(range_value(y, na.rm=TRUE), 3)
	expect_equal(range_value(y), NA_real_)
})

test_that("range works for vector with boolean values", {
	z <- c(TRUE, FALSE, TRUE)
	expect_length(range_value(z), 1)
	expect_type(range_value(z), "integer")
	expect_equal(range_value(z), 1L)
})

test_that("range should throw errir for vector with letters", {
	w <- letters[1:5]
	expect_error(range_value(w), "non-numeric argument to binary operator")
})

context("Test for missing value")

test_that("missing value should work for vector with NA", {
	x <- c(1, 2, 3, 4, NA)
	expect_length(missing_values(x), 1)
	expect_type(missing_values(x), "double")
	expect_gte(missing_values(x), 0)
})