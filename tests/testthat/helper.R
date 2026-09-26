has_ws <- function(x) {
  !is.na(x) & (startsWith(x, " ") | endsWith(x, " "))
}
