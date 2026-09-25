# wb_document rejects start_date after end_date

    Code
      wb_document(start_date = "2024-12-31", end_date = "2024-01-01")
    Condition
      Error:
      ! `start_date` must be earlier than `end_date`.

