test_that("calculates player age at each match", {
  dates <- as.Date(c("1995-10-30", "1997-03-07"))
  birth_date <- "1981-09-26"

  ages <- get_player_age(dates, birth_date)

  expect_equal(length(ages), 2)
  expect_equal(ages[1], 14.09, tolerance = 0.01)
  expect_equal(ages[2], 15.44, tolerance = 0.01)
})

test_that("rejects invalid birth dates", {
  dates <- as.Date("1995-10-30")

  expect_error(get_player_age(dates, NA), "valid player birth date")
})
