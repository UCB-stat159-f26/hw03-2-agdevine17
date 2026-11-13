parse_career <- function(js_text) {
  start <- regexpr("var\\s+morematchmx\\s*=", js_text)
  if (start[1] == -1) stop("Could not find match data in JS file.")
  text <- substring(js_text, start[1] + attr(start, "match.length"))
  text <- sub(";\\s*$", "", trimws(text))
  matches <- jsonlite::fromJSON(text, simplifyVector = FALSE)
  width <- max(lengths(matches))
  padded <- lapply(matches, function(x) c(x, rep(NA_character_, width - length(x))))
  as.data.frame(do.call(rbind, padded), stringsAsFactors = FALSE)
}
