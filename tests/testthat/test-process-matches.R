test_that("process_matches calculates age differences", {
  matches <- data.frame(
    match_date = as.Date(c("1995-10-30", "1997-03-07")),
    result = c("L", "W"),
    opponent = c("Anne Miller", "Alexia Dechaume Balleret"),
    opponent_info = c("19770119", "19700503")
  )

  result <- process_matches(matches, "1981-09-26")

  expect_equal(nrow(result), 2)
  expect_true(all(c("player_age", "opponent_age",
                    "age_difference") %in% names(result)))
  expect_equal(
    result$age_difference,
    result$player_age - result$opponent_age
  )
  expect_false("opponent_info" %in% names(result))
})
