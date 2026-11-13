clean_matches <- function(matches) {
  if (!is.data.frame(matches) || ncol(matches) < 17)
    stop("Match data must have at least 17 columns.")
  data.frame(
    match_date = as.Date(matches[[1]], format = "%Y%m%d"),
    result = matches[[5]],
    opponent = matches[[12]],
    opponent_info = matches[[17]],
    stringsAsFactors = FALSE
  )
}
