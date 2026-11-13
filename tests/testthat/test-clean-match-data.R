test_that("clean_matches_data extracts the correct columns", {
  matches <- as.data.frame(
    matrix("", nrow = 2, ncol = 17),
    stringsAsFactors = FALSE
  )

  matches[[1]] <- c("19951030", "19970307")
  matches[[5]] <- c("L", "W")
  matches[[12]] <- c("Anne Miller", "Alexia Dechaume Balleret")
  matches[[17]] <- c("19770119", "19700503")

  result <- clean_matches(matches)

  expect_equal(nrow(result), 2)
  expect_equal(
    names(result),
    c("match_date", "result", "opponent", "opponent_info")
  )
  expect_equal(result$result, c("L", "W"))
  expect_equal(result$opponent[1], "Anne Miller")
  expect_equal(result$match_date[1], as.Date("1995-10-30"))
})
