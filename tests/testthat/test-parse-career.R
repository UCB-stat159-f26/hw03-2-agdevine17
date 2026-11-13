test_that("parse_career converts JS data into a data frame", {
  js <- paste0(
    'var morematchmx = [',
    '["19951030", "Canadian Open", "Carpet", "W", "L"],',
    '["19970307", "Indian Wells", "Hard", "W", "L"]',
    '];'
  )

  result <- parse_career(js)

  expect_s3_class(result, "data.frame")
  expect_equal(nrow(result), 2)
  expect_equal(result[1, 1], "19951030")
  expect_equal(result[2, 2], "Indian Wells")
})

test_that("parse_career handles invalid input", {
  expect_error(parse_career(123), "JS input must be a single string")
  expect_error(parse_career(NA_character_), "JS input must be a single string")
  expect_error(parse_career("invalid JS"), "Could not find match data")
})

test_that("parse_career handles unequal match lengths", {
  js <- paste0(
    'var morematchmx = [',
    '["19951030", "Canadian Open", "Carpet"],',
    '["19970307", "Indian Wells"]',
    '];'
  )

  result <- parse_career(js)

  expect_equal(nrow(result), 2)
  expect_equal(ncol(result), 3)
  expect_true(is.na(result[2, 3]))
})
