is_bool <- function(x) {
  is.logical(x) && length(x) == 1L
}

is_character <- function(x) {
  is.character(x) && !anyNA(x) && length(x) > 0L
}

is_character_or_null <- function(x) {
  is.null(x) || is_character(x)
}

is_string <- function(x, pattern = NULL, ...) {
  ok <- is.character(x) && length(x) == 1L && !is.na(x)
  if (ok && !is.null(pattern)) {
    ok <- grepl(pattern, x, ...)
  }
  ok
}

is_string_or_null <- function(x, pattern = NULL, ...) {
  is.null(x) || is_string(x, pattern, ...)
}

is_count <- function(x) {
  is.numeric(x) && length(x) == 1L && !is.na(x) &&
    as.integer(x) == x && x > 0L
}

is_valid_date <- function(x) {
  if (is.null(x)) {
    return(TRUE)
  }
  if (length(x) != 1L) {
    return(FALSE)
  }
  x <- as.character(x)
  if (grepl("^\\d{4}(M(0[1-9]|1[0-2])|Q[1-4])?$", x)) {
    TRUE
  } else {
    FALSE
  }
}
