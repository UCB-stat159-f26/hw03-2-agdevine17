process_matches <- function(matches, birth_date) {
  matches$player_age <- get_player_age(matches$match_date, birth_date)
  matches$opponent_age <- get_opponent_age(
    matches$match_date, matches$opponent_info
  )
  matches$age_difference <- matches$player_age - matches$opponent_age
  matches$opponent_info <- NULL
  matches
}
