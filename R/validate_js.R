validate_js <- function(js_text) {
  if (!is.character(js_text) || length(js_text) != 1 || is.na(js_text))
    stop("JS input must be a single string.")
}
