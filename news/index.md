# Changelog

## worldbank (development version)

- [`fone_dataset()`](https://m-muecke.github.io/worldbank/reference/fone.md)
  and
  [`fone_view()`](https://m-muecke.github.io/worldbank/reference/fone.md)
  now return no more than the requested `limit` when pagination is
  required.
- [`fone_dataset()`](https://m-muecke.github.io/worldbank/reference/fone.md),
  [`fone_view()`](https://m-muecke.github.io/worldbank/reference/fone.md),
  and the PIP functions now keep Namibia’s `"NA"` country code, instead
  of reading it as a missing value.
- [`fone_view()`](https://m-muecke.github.io/worldbank/reference/fone.md)
  now trims whitespace and returns `NA` instead of `""` for empty
  fields, matching
  [`fone_dataset()`](https://m-muecke.github.io/worldbank/reference/fone.md)
  and the rest of the package.
- The PIP functions now require `release_version` and `ppp_version` to
  be exactly 8 and 4 digits, given as a string or a number.
- [`pip_data()`](https://m-muecke.github.io/worldbank/reference/pip_data.md),
  [`pip_cp()`](https://m-muecke.github.io/worldbank/reference/pip_cp.md),
  and
  [`pip_group()`](https://m-muecke.github.io/worldbank/reference/pip_group.md)
  now require `povline` and `popshare` to be numbers within the ranges
  accepted by the API.
- [`wb_bulk()`](https://m-muecke.github.io/worldbank/reference/wb_bulk.md)
  now keeps Namibia’s `"NA"` code in the `iso2_code` and `wb_iso2_code`
  columns of the `country` table, instead of reading it as a missing
  value.
- [`wb_data()`](https://m-muecke.github.io/worldbank/reference/wb_data.md)
  no longer returns `NA` dates when a query mixes annual and sub-annual
  indicators.
- [`wb_project()`](https://m-muecke.github.io/worldbank/reference/wb_project.md)
  now returns results when `country` holds more than one code, instead
  of silently returning no rows. Codes are also upper-cased before
  querying, and must be two characters, since the Projects API matches
  them exactly.
- [`wb_project()`](https://m-muecke.github.io/worldbank/reference/wb_project.md)
  now accepts multiple values for `id`, `status`, and `region`,
  returning the projects that match any of them.
- [`wb_project()`](https://m-muecke.github.io/worldbank/reference/wb_project.md)
  now requires `status` to be one of `"active"`, `"closed"`,
  `"dropped"`, or `"pipeline"`.
- [`wb_project()`](https://m-muecke.github.io/worldbank/reference/wb_project.md)
  now numbers the rows of the returned data frame, instead of naming
  them after the project IDs already held in the `id` column.

## worldbank 0.9.1

CRAN release: 2026-06-29

- [`wb_data()`](https://m-muecke.github.io/worldbank/reference/wb_data.md)
  now returns an empty data frame instead of erroring when a query has
  no observations.

## worldbank 0.9.0

CRAN release: 2026-05-03

- [`wb_bulk()`](https://m-muecke.github.io/worldbank/reference/wb_bulk.md)
  downloads the entire World Development Indicators dataset as a zip and
  returns its six CSVs as a list of data frames, including footnote and
  series-time metadata not exposed by the API.
- [`wb_search()`](https://m-muecke.github.io/worldbank/reference/wb_search.md)
  searches the indicator catalog for a regular expression pattern across
  one or more fields.
- Documentation improvements.

## worldbank 0.8.0

CRAN release: 2026-03-15

- [`wb_data()`](https://m-muecke.github.io/worldbank/reference/wb_data.md)
  gains `mrv` and `gapfill` parameters to query the most recent values
  and forward-fill missing data.
- [`wb_project()`](https://m-muecke.github.io/worldbank/reference/wb_project.md)
  queries World Bank project data with support for filtering by country,
  status, region, date range, and free-text search.
- [`pip_cp()`](https://m-muecke.github.io/worldbank/reference/pip_cp.md)
  returns country profile data from the PIP API.
- [`pip_data()`](https://m-muecke.github.io/worldbank/reference/pip_data.md)
  gains a `nowcast` parameter to include nowcast estimates.
- [`wb_cache_clear()`](https://m-muecke.github.io/worldbank/reference/cache.md)
  replaces
  [`wb_cache_delete()`](https://m-muecke.github.io/worldbank/reference/cache.md),
  which is now deprecated.

## worldbank 0.7.1

CRAN release: 2025-12-06

- Don’t cache queries in tests to comply with CRAN

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

- Moved to HTTPS for all API calls.
- Support for Poverty and Inequality Platform (PIP) data.

## worldbank 0.2.0

CRAN release: 2024-07-31

- Support month and quarter date format in
  [`wb_country_indicator()`](https://m-muecke.github.io/worldbank/reference/wb_data.md).
- More robust error handling.

## worldbank 0.1.0

CRAN release: 2024-07-02

- Initial CRAN submission.
