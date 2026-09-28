# PIP poverty inputs must be within the range accepted by the API

    Code
      pip_data(povline = -1)
    Condition
      Error in `pip_data()`:
      ! is_number(povline, lower = 0, upper = 2700, null_ok = TRUE) is not TRUE
    Code
      pip_data(povline = 2700.1)
    Condition
      Error in `pip_data()`:
      ! is_number(povline, lower = 0, upper = 2700, null_ok = TRUE) is not TRUE
    Code
      pip_data(povline = NULL, popshare = 1.5)
    Condition
      Error in `pip_data()`:
      ! is_number(popshare, lower = 0, upper = 1, null_ok = TRUE) is not TRUE
    Code
      pip_cp(povline = -1)
    Condition
      Error in `pip_cp()`:
      ! is_number(povline, lower = 0, upper = 2700, null_ok = TRUE) is not TRUE
    Code
      pip_group(povline = NULL, popshare = 50)
    Condition
      Error in `pip_group()`:
      ! is_number(popshare, lower = 0, upper = 1, null_ok = TRUE) is not TRUE

# PIP version inputs reject values that are not 8 or 4 digits

    Code
      pip_data(release_version = "v20260324")
    Condition
      Error in `pip_data()`:
      ! is_version(release_version, 8L, null_ok = TRUE) is not TRUE
    Code
      pip_data(ppp_version = "2017a")
    Condition
      Error in `pip_data()`:
      ! is_version(ppp_version, 4L, null_ok = TRUE) is not TRUE
    Code
      pip_cp(release_version = 2026)
    Condition
      Error in `pip_cp()`:
      ! is_version(release_version, 8L, null_ok = TRUE) is not TRUE
    Code
      pip_group(ppp_version = 20170101)
    Condition
      Error in `pip_group()`:
      ! is_version(ppp_version, 4L, null_ok = TRUE) is not TRUE

# PIP year rejects invalid values

    Code
      pip_data(year = "latest")
    Condition
      Error in `pip_data()`:
      ! is_pip_year(year, null_ok = TRUE) is not TRUE
    Code
      pip_data(year = c("2019", "MRV"))
    Condition
      Error in `pip_data()`:
      ! is_pip_year(year, null_ok = TRUE) is not TRUE
    Code
      pip_data(year = 19)
    Condition
      Error in `pip_data()`:
      ! is_pip_year(year, null_ok = TRUE) is not TRUE
    Code
      pip_group(year = "2019a")
    Condition
      Error in `pip_group()`:
      ! is_pip_year(year, null_ok = TRUE) is not TRUE

