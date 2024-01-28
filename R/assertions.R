is_character <- function(x) {
  is.character(x) && !any(is.na(x)) && length(x) > 0L
}

is_character_or_null <- function(x) {
  is.null(x) || is_character(x)
}

is_string <- function(x) {
  is.character(x) && length(x) == 1L && !is.na(x)
}

is_string_or_null <- function(x) {
  is.null(x) || is_string(x)
}

is_count <- function(x) {
  is.numeric(x) && length(x) == 1L && !is.na(x) &&
    as.integer(x) == x && x > 0L
}
