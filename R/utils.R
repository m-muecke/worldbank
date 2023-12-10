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

map_mold <- function(.x, .f, .value, ...) {
  out <- if (is.function(.f)) {
    vapply(.x, .f, FUN.VALUE = .value, USE.NAMES = FALSE, ...)
  } else {
    vapply(.x, `[[`, .f, FUN.VALUE = .value, USE.NAMES = FALSE, ...)
  }
  setNames(out, names(.x))
}

map_chr <- function(.x, .f, ...) {
  map_mold(.x, .f, NA_character_, ...)
}
