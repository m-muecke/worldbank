wb_observation <- function(indicator = "SI.POV.DDAY", ...) {
  c(
    list(
      date = "2012",
      indicator = list(id = indicator, value = indicator),
      country = list(id = "AL", value = "Albania"),
      countryiso3code = "ALB",
      value = 1.8,
      unit = "",
      obs_status = "",
      decimal = 1L
    ),
    list(...)
  )
}
