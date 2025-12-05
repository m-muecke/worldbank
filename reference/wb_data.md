# World Bank country indicator data

List all country indicators supported by the World Bank API.

## Usage

``` r
wb_data(
  indicator = "NY.GDP.MKTP.CD",
  country = NULL,
  lang = "en",
  start_date = NULL,
  end_date = NULL
)

wb_country_indicator(
  indicator = "NY.GDP.MKTP.CD",
  country = NULL,
  lang = "en",
  start_date = NULL,
  end_date = NULL
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

## Value

A [`data.frame()`](https://rdrr.io/r/base/data.frame.html) with the
available country indicators. The columns are:

- date:

  The date

- indicator_id:

  The indicator ID.

- indicator_name:

  The indicator name.

- country_id:

  The country ID.

- country_name:

  The country name.

- country_code:

  The country code.

- value:

  The indicator value.

- unit:

  The indicator unit.

- obs_status:

  The observation status.

- decimal:

  The decimal.

## Examples

``` r
# \donttest{
# single indicator for a single country (all available years)
ind <- wb_data("NY.GDP.MKTP.CD", "US")
head(ind)
#>   date   indicator_id    indicator_name country_id  country_name country_code
#> 1 2024 NY.GDP.MKTP.CD GDP (current US$)         US United States          USA
#> 2 2023 NY.GDP.MKTP.CD GDP (current US$)         US United States          USA
#> 3 2022 NY.GDP.MKTP.CD GDP (current US$)         US United States          USA
#> 4 2021 NY.GDP.MKTP.CD GDP (current US$)         US United States          USA
#> 5 2020 NY.GDP.MKTP.CD GDP (current US$)         US United States          USA
#> 6 2019 NY.GDP.MKTP.CD GDP (current US$)         US United States          USA
#>          value unit obs_status decimal
#> 1 2.918489e+13 <NA>       <NA>       0
#> 2 2.772071e+13 <NA>       <NA>       0
#> 3 2.600689e+13 <NA>       <NA>       0
#> 4 2.368117e+13 <NA>       <NA>       0
#> 5 2.135410e+13 <NA>       <NA>       0
#> 6 2.153998e+13 <NA>       <NA>       0

# multiple indicators for multiple countries (2015-2023)
ind <- wb_data(
  indicator = c("NY.GDP.MKTP.CD", "FP.CPI.TOTL.ZG"),
  country = c("US", "DE", "FR", "CH", "JP"),
  start_date = 2015, end_date = 2023
)
head(ind)
#>   date   indicator_id    indicator_name country_id country_name country_code
#> 1 2023 NY.GDP.MKTP.CD GDP (current US$)         CH  Switzerland          CHE
#> 2 2022 NY.GDP.MKTP.CD GDP (current US$)         CH  Switzerland          CHE
#> 3 2021 NY.GDP.MKTP.CD GDP (current US$)         CH  Switzerland          CHE
#> 4 2020 NY.GDP.MKTP.CD GDP (current US$)         CH  Switzerland          CHE
#> 5 2019 NY.GDP.MKTP.CD GDP (current US$)         CH  Switzerland          CHE
#> 6 2018 NY.GDP.MKTP.CD GDP (current US$)         CH  Switzerland          CHE
#>          value unit obs_status decimal
#> 1 894424821645 <NA>       <NA>       0
#> 2 828508926958 <NA>       <NA>       0
#> 3 815309330987 <NA>       <NA>       0
#> 4 741999406006 <NA>       <NA>       0
#> 5 721369112727 <NA>       <NA>       0
#> 6 725568717468 <NA>       <NA>       0
# }
```
