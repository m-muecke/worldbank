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

