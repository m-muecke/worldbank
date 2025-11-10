# Changelog

## worldbank 0.7.0

CRAN release: 2025-11-10

- Added optional request caching to improve performance for repeated
  queries. Enable with `options(worldbank.cache = TRUE)`. Cache duration
  can be customized with `worldbank.cache_max_age` (default: 1 day).
- New functions
  [`wb_cache_delete()`](https://m-muecke.github.io/worldbank/reference/cache.md)
  and
  [`wb_cache_dir()`](https://m-muecke.github.io/worldbank/reference/cache.md)
  to manage the cache.

## worldbank 0.6.1

CRAN release: 2025-08-29

- Documentation improvements.

## worldbank 0.6.0

CRAN release: 2025-05-29

- [`wb_data()`](https://m-muecke.github.io/worldbank/reference/wb_data.md)
  has been added as an alias for
  [`wb_country_indicator()`](https://m-muecke.github.io/worldbank/reference/wb_data.md)

## worldbank 0.5.0

CRAN release: 2025-01-27

- [`wb_country_indicator()`](https://m-muecke.github.io/worldbank/reference/wb_data.md)
  now allows for multiple indicators to be requested at once.

## worldbank 0.4.0

CRAN release: 2024-12-09

- Removed conditional return of tibble and now always return a
  data.frame instead. This ensures type stability across all functions.
- Add support for Finances One API data.

## worldbank 0.3.0

CRAN release: 2024-08-26

- Moved to HTTPS for all API calls
- Support for Poverty and Inequality Platform (PIP) data

## worldbank 0.2.0

CRAN release: 2024-07-31

- Support month and quarter date format in
  [`wb_country_indicator()`](https://m-muecke.github.io/worldbank/reference/wb_data.md)
- More robust error handling

## worldbank 0.1.0

CRAN release: 2024-07-02

- Initial CRAN submission.
