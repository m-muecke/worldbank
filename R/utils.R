`%||%` <- function(x, y) {
  if (is.null(x)) y else x
}

is_installed <- function(pkg) {
  isTRUE(requireNamespace(pkg, quietly = TRUE))
}

as_tibble <- function(x) {
  if (getOption("worldbank.use_tibble", TRUE) && is_installed("tibble")) {
    tibble::as_tibble(x)
  } else {
    x
  }
}

na_if_empty <- function(x) {
  replace(x, !nzchar(x), NA_character_)
}

to_logical <- function(x) {
  x == "Y"
}

map <- function(.x, .f, ...) {
  if (is.function(.f)) {
    lapply(.x, .f, ...)
  } else {
    lapply(.x, `[[`, .f, ...)
  }
}

map_mold <- function(.x, .f, .value, ...) {
  out <- if (is.function(.f)) {
    vapply(.x, .f, FUN.VALUE = .value, USE.NAMES = FALSE, ...)
  } else {
    vapply(.x, `[[`, .f, FUN.VALUE = .value, USE.NAMES = FALSE, ...)
  }
  stats::setNames(out, names(.x))
}

map_chr <- function(.x, .f, ...) {
  map_mold(.x, .f, NA_character_, ...)
}

map_lgl <- function(.x, .f, ...) {
  map_mold(.x, .f, NA, ...)
}

format_param <- function(x) {
  x <- x %||% "all"
  if (length(x) > 1L) {
    x <- paste(x, collapse = ";")
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
