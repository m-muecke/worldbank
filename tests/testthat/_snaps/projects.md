# wb_project rejects unknown status

    Code
      wb_project(status = "Active")
    Condition
      Error in `wb_project()`:
      ! is.null(status) || status %in% c("active", "closed", "dropped",  .... is not TRUE
    Code
      wb_project(status = "invalid")
    Condition
      Error in `wb_project()`:
      ! is.null(status) || status %in% c("active", "closed", "dropped",  .... is not TRUE

