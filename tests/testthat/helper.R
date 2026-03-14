has_ws <- function(x) {
  any(!is.na(x) & (startsWith(x, " ") | endsWith(x, " ")))
}
