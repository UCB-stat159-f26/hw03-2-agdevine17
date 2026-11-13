test_that("calculates ages from birth dates", {
  dates <- as.Date(c("1995-10-30", "1997-03-07"))
  info <- c("19770119", "19700503")

  ages <- get_opponent_age(dates, info)

  expect_equal(ages[1], 18.78, tolerance = 0.01)
  expect_equal(ages[2], 26.84, tolerance = 0.01)
})

test_that("uses existing numeric ages", {
  dates <- as.Date(c("2001-09-10", "2001-09-17"))
  info <- c("22.264202601", "24.2902121834")

  ages <- get_opponent_age(dates, info)

  expect_equal(ages, as.numeric(info))
})

test_that("handles missing opponent ages", {
  dates <- as.Date(c("2001-09-10", "2001-09-17"))
  info <- c("", NA_character_)

  ages <- get_opponent_age(dates, info)

  expect_true(all(is.na(ages)))
})
