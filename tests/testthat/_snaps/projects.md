# wb_project rejects invalid limit

    Code
      wb_project(limit = 0L)
    Condition
      Error in `wb_project()`:
      ! is_count(limit, null_ok = TRUE) is not TRUE

---

    Code
      wb_project(limit = 1.5)
    Condition
      Error in `wb_project()`:
      ! is_count(limit, null_ok = TRUE) is not TRUE

# wb_project rejects start_date after end_date

    Code
      wb_project(start_date = "2024-12-31", end_date = "2024-01-01")
    Condition
      Error:
      ! `start_date` must be earlier than `end_date`.

# wb_project rejects unknown status

    Code
      wb_project(status = "invalid")
    Condition
      Error in `wb_project()`:
      ! is.null(status) || all(tolower(status) %in% c("active", "closed",  .... is not TRUE
    Code
      wb_project(status = "act")
    Condition
      Error in `wb_project()`:
      ! is.null(status) || all(tolower(status) %in% c("active", "closed",  .... is not TRUE
    Code
      wb_project(status = c("active", "invalid"))
    Condition
      Error in `wb_project()`:
      ! is.null(status) || all(tolower(status) %in% c("active", "closed",  .... is not TRUE

