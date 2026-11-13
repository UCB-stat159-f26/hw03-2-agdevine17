get_birth_date <- function(page_text) {
  text <- paste(page_text, collapse = "\n")
  pattern <- "var\\s+dob\\s*=\\s*['\"]?([0-9]{8})['\"]?"
  match <- regmatches(text, regexec(pattern, text))[[1]]
  if (length(match) < 2)
    stop("Could not find player's birth date.")
  birth_date <- as.Date(match[2], format = "%Y%m%d")
  if (is.na(birth_date)) stop("Invalid player birth date.")
  birth_date
}
