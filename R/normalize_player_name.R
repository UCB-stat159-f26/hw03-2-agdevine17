normalize_player_name <- function(player_name) {
  if (!is.character(player_name) || length(player_name) != 1 ||
      is.na(player_name) || !nzchar(trimws(player_name))) {
    stop("Player name must be a non-empty string.")
  }

  name <- trimws(player_name)
  name <- gsub("\\s+", " ", name)

  if (!grepl("\\s", name)) {
    return(paste0(toupper(substr(name, 1, 1)),
                  substr(name, 2, nchar(name))))
  }

  parts <- strsplit(tolower(name), " ")[[1]]
  paste0(tools::toTitleCase(parts), collapse = "")
}
