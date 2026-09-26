# wb_country input validation works

    Code
      wb_country(region = "SS")
    Condition
      Error in `wb_country()`:
      ! is_character(region, null_ok = TRUE, n_chars = 3L) is not TRUE

---

    Code
      wb_country(income_level = 1L)
    Condition
      Error in `wb_country()`:
      ! is_character(income_level, null_ok = TRUE, n_chars = 3L) is not TRUE

---

    Code
      wb_country(lending_type = NA)
    Condition
      Error in `wb_country()`:
      ! is_character(lending_type, null_ok = TRUE, n_chars = 3L) is not TRUE

# wb_indicator input validation works

    Code
      wb_indicator(source = 0)
    Condition
      Error in `wb_indicator()`:
      ! is_count(source, null_ok = TRUE) is not TRUE

---

    Code
      wb_indicator(source = "2")
    Condition
      Error in `wb_indicator()`:
      ! is_count(source, null_ok = TRUE) is not TRUE

# wb_search input validation works

    Code
      wb_search("GDP", source = 0)
    Condition
      Error in `wb_search()`:
      ! is_count(source, null_ok = TRUE) is not TRUE

---

    Code
      wb_search("GDP", source = "2")
    Condition
      Error in `wb_search()`:
      ! is_count(source, null_ok = TRUE) is not TRUE

# wb_data mrv and gapfill validation works

    Code
      wb_data(source = 0)
    Condition
      Error in `wb_data()`:
      ! is_count(source, null_ok = TRUE) is not TRUE

---

    Code
      wb_data(source = "2")
    Condition
      Error in `wb_data()`:
      ! is_count(source, null_ok = TRUE) is not TRUE

# wb_data mrnev validation works

    Code
      wb_data(mrnev = 0)
    Condition
      Error in `wb_data()`:
      ! is_count(mrnev, null_ok = TRUE) is not TRUE

---

    Code
      wb_data(mrnev = 1, start_date = 2020)
    Condition
      Error:
      ! `mrnev` cannot be used together with `start_date`/`end_date`.

---

    Code
      wb_data(mrnev = 1, mrv = 1)
    Condition
      Error:
      ! `mrv` and `mrnev` cannot be used together.

# error parsing works

    Code
      wb_indicator("something.wrong")
    Condition
      Error in `req_perform()`:
      ! HTTP 200 OK.
      Error code: 120
      The provided parameter value is not valid
      Read more at <https://datahelpdesk.worldbank.org/knowledgebase/articles/898620-api-error-codes>

# error parsing works with multiple messages

    Code
      wb_data("NY.GDP.MKTP.CD", "ZAF", source = 99999)
    Condition
      Error in `req_perform()`:
      ! HTTP 200 OK.
      Error code: 120
      The provided parameter value is not valid
      Read more at <https://datahelpdesk.worldbank.org/knowledgebase/articles/898620-api-error-codes>

