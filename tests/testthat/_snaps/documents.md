# wb_document input validation works

    Code
      wb_document(id = 1L)
    Condition
      Error in `wb_document()`:
      ! is_character(id, null_ok = TRUE) is not TRUE

---

    Code
      wb_document(search = c("a", "b"))
    Condition
      Error in `wb_document()`:
      ! is_string(search, null_ok = TRUE) is not TRUE

---

    Code
      wb_document(country = "BRA")
    Condition
      Error in `wb_document()`:
      ! is_character(country, null_ok = TRUE, n_chars = 2L) is not TRUE

---

    Code
      wb_document(country = NA)
    Condition
      Error in `wb_document()`:
      ! is_character(country, null_ok = TRUE, n_chars = 2L) is not TRUE

---

    Code
      wb_document(type = 1L)
    Condition
      Error in `wb_document()`:
      ! is_character(type, null_ok = TRUE) is not TRUE

---

    Code
      wb_document(project = TRUE)
    Condition
      Error in `wb_document()`:
      ! is_character(project, null_ok = TRUE) is not TRUE

---

    Code
      wb_document(start_date = "2024")
    Condition
      Error in `wb_document()`:
      ! is_string(start_date, null_ok = TRUE, pattern = "^\\d{4}-\\d{2}-\\d{2}$") is not TRUE

---

    Code
      wb_document(end_date = "not-a-date")
    Condition
      Error in `wb_document()`:
      ! is_string(end_date, null_ok = TRUE, pattern = "^\\d{4}-\\d{2}-\\d{2}$") is not TRUE

---

    Code
      wb_document(limit = 0L)
    Condition
      Error in `wb_document()`:
      ! is_count(limit, null_ok = TRUE) is not TRUE

---

    Code
      wb_document(limit = 1.5)
    Condition
      Error in `wb_document()`:
      ! is_count(limit, null_ok = TRUE) is not TRUE

# wb_document rejects start_date after end_date

    Code
      wb_document(start_date = "2024-12-31", end_date = "2024-01-01")
    Condition
      Error:
      ! `start_date` must be earlier than `end_date`.

