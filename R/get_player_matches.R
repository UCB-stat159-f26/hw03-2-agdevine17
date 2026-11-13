#' Retrieve Tennis Player Career Matches
#'
#' @param player_name Name of the tennis player.
#' @return A data frame containing career matches and age differences.
#' @export
get_player_matches <- function(player_name) {
  player <- normalize_player_name(player_name)
  base <- "https://www.tennisabstract.com"
  profile <- paste0(base, "/cgi-bin/wplayer.cgi?p=", player)
  career <- paste0(base, "/jsmatches/", player, "Career.js")
  page <- tryCatch(readLines(profile, warn = FALSE),
                   error = function(e) stop("Could not find player: ", player_name))
  birth_date <- tryCatch(get_birth_date(page),
                         error = function(e) stop("Could not find player: ", player_name))
  js <- tryCatch(readLines(career, warn = FALSE),
                 error = function(e) stop("Could not find career matches for: ", player_name))
  matches <- parse_career(paste(js, collapse = "\n"))
  process_matches(clean_matches(matches), birth_date)
}
