get_player_age <- function(match_date, birth_date) {
  birth_date <- as.Date(birth_date)
  if (length(birth_date) != 1 || is.na(birth_date))
    stop("A valid player birth date is required.")
  if (any(is.na(match_date)))
    stop("Match dates must be valid.")
  as.numeric(match_date - birth_date) / 365.25
}
