withr::local_options(
  list(worldbank.cache = TRUE),
  .local_envir = teardown_env()
)
