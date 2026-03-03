`%||%` <- function(x, y) {
  if (is.null(x)) y else x # nolint
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
  has_start <- !is.null(start_date)
  has_end <- !is.null(end_date)
  if (has_start && has_end) {
    paste(start_date, end_date, sep = ":")
  } else if (has_start) {
    start_date
  } else if (has_end) {
    end_date
  } else {
    NULL
  }
}
