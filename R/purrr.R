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
  setNames(out, names(.x))
}

map_lgl <- function(.x, .f, ...) {
  map_mold(.x, .f, NA, ...)
}

map_int <- function(.x, .f, ...) {
  map_mold(.x, .f, NA_integer_, ...)
}

map_dbl <- function(.x, .f, ...) {
  map_mold(.x, .f, NA_real_, ...)
}

map_chr <- function(.x, .f, ...) {
  map_mold(.x, .f, NA_character_, ...)
}
