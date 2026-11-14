test_that("plot_age_difference returns a ggplot object", {
  matches <- data.frame(
    player_age = c(20, 21, 22),
    age_difference = c(-3, 0, 5),
    result = c("W", "L", "W")
  )

  p <- plot_age_difference(matches)

  expect_s3_class(p, "ggplot")
  expect_equal(nrow(p$data), 3)
  expect_equal(p$data$player_age, c(20, 21, 22))
})

test_that("plot_age_difference uses correct variables", {
  matches <- data.frame(
    player_age = c(20, 21),
    age_difference = c(-2, 4),
    result = c("W", "L")
  )

  p <- plot_age_difference(matches)

  expect_equal(rlang::as_label(p$mapping$x), "player_age")
  expect_equal(rlang::as_label(p$mapping$y), "age_difference")
  expect_equal(rlang::as_label(p$mapping$colour), "result")
})

test_that("plot_age_difference handles missing values", {
  matches <- data.frame(
    player_age = c(20, 21, NA),
    age_difference = c(-2, 4, 3),
    result = c("W", "L", "W")
  )

  p <- plot_age_difference(matches)

  expect_s3_class(p, "ggplot")
  expect_equal(nrow(p$data), 3)
})
