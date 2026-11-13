parse_career <- function(js_text) {
  validate_js(js_text)
  start <- regexpr("var\\s+morematchmx\\s*=", js_text)
  if (start[1] == -1) stop("Could not find match data in JS file.")
  text <- substring(js_text, start[1] + attr(start, "match.length"))
  matches <- jsonlite::fromJSON(sub(";\\s*$", "", trimws(text)), simplifyVector = FALSE)
  matches <- lapply(matches, unlist)
  width <- max(lengths(matches))
  padded <- lapply(matches, function(x) c(x, rep(NA_character_, width - length(x))))
  as.data.frame(do.call(rbind, padded), stringsAsFactors = FALSE)
}
