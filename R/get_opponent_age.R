get_opponent_age <- function(match_date, opponent_info) {
  info <- as.character(opponent_info)
  is_birthdate <- grepl("^[0-9]{8}$", info)
  age <- suppressWarnings(as.numeric(info))
  birthdate <- as.Date(info[is_birthdate], format = "%Y%m%d")
  age[is_birthdate] <- as.numeric(match_date[is_birthdate] -
                                    birthdate) / 365.25
  age[is.na(info) | info == ""] <- NA_real_
  age
}
