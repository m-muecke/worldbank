# worldbank (development version)

# worldbank 0.8.0

* `wb_data()` gains `mrv` and `gapfill` parameters to query the most recent values and forward-fill missing data.
* `wb_project()` queries World Bank project data with support for filtering by country, status, region, date range, and free-text search.
* `pip_cp()` returns country profile data from the PIP API.
* `pip_data()` gains a `nowcast` parameter to include nowcast estimates.
* `wb_cache_clear()` replaces `wb_cache_delete()`, which is now deprecated.

# worldbank 0.7.1

* Don't cache queries in tests to comply with CRAN

# worldbank 0.7.0

* Added optional request caching to improve performance for repeated queries.
  Enable with `options(worldbank.cache = TRUE)`. Cache duration can be customized
  with `worldbank.cache_max_age` (default: 1 day).
* New functions `wb_cache_delete()` and `wb_cache_dir()` to manage the cache.

# worldbank 0.6.1

* Documentation improvements.

# worldbank 0.6.0

* `wb_data()` has been added as an alias for `wb_country_indicator()`

# worldbank 0.5.0

* `wb_country_indicator()` now allows for multiple indicators to be
  requested at once.

# worldbank 0.4.0

* Removed conditional return of tibble and now always return a
  data.frame instead. This ensures type stability across all functions.
* Add support for Finances One API data.

# worldbank 0.3.0

- Moved to HTTPS for all API calls
- Support for Poverty and Inequality Platform (PIP) data

# worldbank 0.2.0

- Support month and quarter date format in `wb_country_indicator()`
- More robust error handling

# worldbank 0.1.0

- Initial CRAN submission.
