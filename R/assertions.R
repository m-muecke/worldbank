is_flag <- function(x, null_ok = FALSE) {
  if (null_ok && is.null(x)) {
    return(TRUE)
  }
  is.logical(x) && length(x) == 1L && !is.na(x)
}

is_character <- function(x, null_ok = FALSE) {
  if (null_ok && is.null(x)) {
    return(TRUE)
  }
  is.character(x) && !anyNA(x) && length(x) > 0L
}

is_string <- function(x, ..., pattern = NULL, null_ok = FALSE) {
  if (null_ok && is.null(x)) {
    return(TRUE)
  }
  ok <- is.character(x) && length(x) == 1L && !is.na(x)
  if (ok && !is.null(pattern)) {
    ok <- grepl(pattern, x, ...)
  }
  ok
}

is_count <- function(x, null_ok = FALSE) {
  if (null_ok && is.null(x)) {
    return(TRUE)
  }
  is.numeric(x) && length(x) == 1L && !is.na(x) && as.integer(x) == x && x > 0L
}

is_dateish <- function(x, null_ok = FALSE) {
  if (null_ok && is.null(x)) {
    return(null_ok)
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
