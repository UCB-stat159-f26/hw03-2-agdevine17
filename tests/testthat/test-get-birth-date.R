test_that("get_birth_date extracts player birth dates", {
  page <- c(
    "<html>",
    "<script>var dob = 19810926;</script>",
    "</html>"
  )

  result <- get_birth_date(page)

  expect_s3_class(result, "Date")
  expect_equal(result, as.Date("1981-09-26"))
})

test_that("get_birth_date handles quoted birth dates", {
  page <- '<script>var dob = "19860603";</script>'

  expect_equal(get_birth_date(page), as.Date("1986-06-03"))
})

test_that("get_birth_date handles missing birth dates", {
  page <- "<html>No birth date available</html>"

  expect_error(
    get_birth_date(page),
    "Could not find player's birth date"
  )
})
