parse_career <- function(js_text) {
  if (!is.character(js_text) || length(js_text) != 1 || is.na(js_text))
    stop("JS input must be a single string.")
  start <- regexpr("var\\s+morematchmx\\s*=", js_text)
  if (start[1] == -1) stop("Could not find match data in JS file.")
  array_text <- substring(js_text, start[1] + attr(start, "match.length"))
  array_text <- trimws(array_text)
  array_text <- sub(";\\s*$", "", array_text)
  as.data.frame(jsonlite::fromJSON(array_text), stringsAsFactors = FALSE)
}
