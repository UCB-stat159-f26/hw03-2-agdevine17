test_that("get_player_matches returns cleaned career data", {
  page <- "<script>var dob = 19810926;</script>"
  row <- rep("x", 17)
  row[c(1, 5, 12, 17)] <- c("20000101", "W", "Opponent", "19800101")
  js <- paste0("var morematchmx = ", jsonlite::toJSON(list(row)), ";")

  mockery::stub(
    get_player_matches,
    "readLines",
    function(con, ...) if (grepl("wplayer.cgi", con)) page else js
  )

  result <- get_player_matches("Serena Williams")

  expect_s3_class(result, "data.frame")
  expect_equal(nrow(result), 1)
  expect_equal(result$result, "W")
  expect_equal(result$opponent, "Opponent")
  expect_equal(result$match_date, as.Date("2000-01-01"))
  expect_true("age_difference" %in% names(result))
})

test_that("get_player_matches rejects invalid players", {
  mockery::stub(
    get_player_matches,
    "readLines",
    function(con, ...) "<html>Player not found</html>"
  )

  expect_error(
    get_player_matches("Not A Real Player"),
    "Could not find player"
  )
})
