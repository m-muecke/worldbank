# wb_project rejects unknown status

    Code
      wb_project(status = "invalid")
    Condition
      Error in `wb_project()`:
      ! is.null(status) || tolower(status) %in% c("active", "closed",  .... is not TRUE
    Code
      wb_project(status = "act")
    Condition
      Error in `wb_project()`:
      ! is.null(status) || tolower(status) %in% c("active", "closed",  .... is not TRUE

