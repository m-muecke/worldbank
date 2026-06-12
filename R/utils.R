`%||%` <- function(lhs, rhs) {
  if (is.null(lhs)) rhs else lhs # nolint
}

`%&&%` <- function(lhs, rhs) {
  if (is.null(lhs)) lhs else rhs
}

clean_strings <- function(data) {
  for (i in seq_along(data)) {
    x <- data[[i]]
    if (is.character(x)) {
      data[[i]] <- na_if_empty(trimws(x))
    }
  }
  data
}

na_if_empty <- function(x) {
  replace(x, !nzchar(x), NA_character_)
}

to_snake_case <- function(x) {
  x <- gsub("((?<=[a-z0-9])[A-Z]|(?!^)[A-Z](?=[a-z]))", "_\\1", x, perl = TRUE)
  x <- tolower(gsub("[^[:alnum:]]+", "_", x))
  gsub("^_+|_+$", "", x)
}

to_logical <- function(x) {
  x == "Y"
}

format_param <- function(x) {
  x <- x %||% "all"
  if (length(x) > 1L) {
    x <- paste0(x, collapse = ";")
  }
  x
}

format_date <- function(start_date, end_date) {
  if (!is.null(start_date) && !is.null(end_date)) {
    paste(start_date, end_date, sep = ":")
  } else {
    start_date %||% end_date
  }
}
