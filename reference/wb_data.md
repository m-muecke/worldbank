# World Bank country indicator data

List all country indicators supported by the World Bank API.

## Usage

``` r
wb_data(
  indicator = "NY.GDP.MKTP.CD",
  country = NULL,
  lang = "en",
  start_date = NULL,
  end_date = NULL,
  mrv = NULL,
  gapfill = FALSE
)

wb_country_indicator(
  indicator = "NY.GDP.MKTP.CD",
  country = NULL,
  lang = "en",
  start_date = NULL,
  end_date = NULL,
  mrv = NULL,
  gapfill = FALSE
)
```

## Source

<https://api.worldbank.org/v2/country/%7Bcountry%7D/indicator/%7Bindicator%7D>

## Arguments

- indicator:

  ([`character()`](https://rdrr.io/r/base/character.html))  
  Indicators to query.

- country:

  (`NULL` \| [`character()`](https://rdrr.io/r/base/character.html))  
  Countries to query. Default `NULL`. If `NULL`, all countries are
  returned.

- lang:

  (`character(1)`)  
  Language to query. Default `"en"`.

- start_date:

  (`NULL` \| `character(1)` \| `integer(1)`)  
  Start date to query. Default `NULL`. Supported formats:

  - YYYY for yearly data (e.g. `2020` or `"2020"`)

  - YYYYQ\[1-4\] for quarterly data (e.g. `"2020Q1"`)

  - YYYYM\[1-12\] for monthly data (e.g. `"2020M02"`)

- end_date:

  (`NULL` \| `character(1)` \| `integer(1)`)  
  End date to query, in the same format as start_date. Default `NULL`.

- mrv:

  (`NULL` \| `integer(1)`)  
  Most recent values to return. An alternative to
  `start_date`/`end_date`. Default `NULL`.

- gapfill:

  (`logical(1)`)  
  Whether to fill missing values by carrying forward the last available
  value. Only used when `mrv` is set. Default `FALSE`.

## Value

A [`data.frame()`](https://rdrr.io/r/base/data.frame.html) with the
available country indicators. The columns are:

- `date`: The date

- `indicator_id`: The indicator ID.

- `indicator_name`: The indicator name.

- `country_id`: The country ID.

- `country_name`: The country name.

- `country_code`: The country code.

- `value`: The indicator value.

- `unit`: The indicator unit.

- `obs_status`: The observation status.

- `decimal`: The decimal.

## Examples

``` r
# \donttest{
# single indicator for a single country (all available years)
ind <- wb_data("NY.GDP.MKTP.CD", "US")
#> Error in req_perform(req_wb_cache(req_wb_retry(req_error(req_url_query(req_url_path_append(req_user_agent(request("https://api.worldbank.org/v2"),     wb_user_agent()), lang, resource), ..., format = "json",     per_page = per_page), is_error = is_wb_error, body = wb_error_body)))): HTTP 502 Bad Gateway.
head(ind)
#> Error: object 'ind' not found

# multiple indicators for multiple countries (2015-2023)
ind <- wb_data(
  indicator = c("NY.GDP.MKTP.CD", "FP.CPI.TOTL.ZG"),
  country = c("US", "DE", "FR", "CH", "JP"),
  start_date = 2015, end_date = 2023
)
#> Error in req_perform(reqs[[i]], path = paths[[i]]): HTTP 502 Bad Gateway.
head(ind)
#> Error: object 'ind' not found
# }
```
