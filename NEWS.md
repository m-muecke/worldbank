# worldbank (development version)

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
