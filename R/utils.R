is_page <- function(x) is.null(x) || is.numeric(x) && length(x) == 1

is_string <- function(x) is.character(x) && length(x) == 1

is_character <- function(x) is.null(x) || is.character(x) && length(x) > 0

na_if_empty <- function(x) replace(x, x == "", NA_character_)

to_logical <- function(x) ifelse(x == "Y", TRUE, FALSE)

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

`%||%` <- function(x, y) {
  if (is.null(x)) y else x
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

format_param <- function(x) {
  x <- x %||% "all"
  if (length(x) > 1) {
    x <- paste(x, collapse = ";")
  }
  x
}
