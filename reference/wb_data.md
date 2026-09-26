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
  mrnev = NULL,
  gapfill = FALSE,
  footnote = FALSE,
  source = NULL
)

wb_country_indicator(
  indicator = "NY.GDP.MKTP.CD",
  country = NULL,
  lang = "en",
  start_date = NULL,
  end_date = NULL,
  mrv = NULL,
  mrnev = NULL,
  gapfill = FALSE,
  footnote = FALSE,
  source = NULL
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

- mrnev:

  (`NULL` \| `integer(1)`)  
  Most recent non-empty values to return for each country. Unlike `mrv`,
  which returns the same most recent dates for every country and drops
  countries without a value for them, the dates can differ between
  countries. An alternative to `start_date`/`end_date` and `mrv`.
  Default `NULL`.

- gapfill:

  (`logical(1)`)  
  Whether to fill missing values by carrying forward the last available
  value. Only used when `mrv` is set. Default `FALSE`.

- footnote:

  (`logical(1)`)  
  Whether to return the footnotes published alongside the observations,
  such as uncertainty bounds or the survey a figure was derived from.
  Default `FALSE`.

- source:

  (`NULL` \| `integer(1)`)  
  ID of the database to query, as listed by
  [`wb_source()`](https://m-muecke.github.io/worldbank/reference/wb_source.md).
  Default `NULL`, which uses the World Development Indicators for
  indicators published there. Set this to get an indicator's values from
  another database, which can differ from those in the World Development
  Indicators.

## Value

A [`data.frame()`](https://rdrr.io/r/base/data.frame.html) with the
available country indicators. The columns are:

- `date`: The date. An integer if all observations are annual, otherwise
  a character vector.

- `indicator_id`: The indicator ID.

- `indicator_name`: The indicator name.

- `country_id`: The country ID.

- `country_name`: The country name.

- `country_code`: The country code.

- `value`: The indicator value.

- `unit`: The indicator unit.

- `obs_status`: The observation status.

- `decimal`: The decimal.

- `footnote`: The observation footnote, or `NA` if there is none. Only
  present when `footnote = TRUE`.

## See also

Other indicators data:
[`wb_bulk()`](https://m-muecke.github.io/worldbank/reference/wb_bulk.md),
[`wb_country()`](https://m-muecke.github.io/worldbank/reference/wb_country.md),
[`wb_income_level()`](https://m-muecke.github.io/worldbank/reference/wb_income_level.md),
[`wb_indicator()`](https://m-muecke.github.io/worldbank/reference/wb_indicator.md),
[`wb_language()`](https://m-muecke.github.io/worldbank/reference/wb_language.md),
[`wb_lending_type()`](https://m-muecke.github.io/worldbank/reference/wb_lending_type.md),
[`wb_region()`](https://m-muecke.github.io/worldbank/reference/wb_region.md),
[`wb_search()`](https://m-muecke.github.io/worldbank/reference/wb_search.md),
[`wb_source()`](https://m-muecke.github.io/worldbank/reference/wb_source.md),
[`wb_topic()`](https://m-muecke.github.io/worldbank/reference/wb_topic.md)

## Examples

``` r
# \donttest{
# single indicator for a single country (all available years)
ind <- wb_data("NY.GDP.MKTP.CD", "US")
head(ind)
#>  [1] date           indicator_id   indicator_name country_id     country_name  
#>  [6] country_code   value          unit           obs_status     decimal       
#> <0 rows> (or 0-length row.names)

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
#> 1 928435275852 <NA>       <NA>       0
#> 2 858479038994 <NA>       <NA>       0
#> 3 840710023481 <NA>       <NA>       0
#> 4 756096180222 <NA>       <NA>       0
#> 5 736384764157 <NA>       <NA>       0
#> 6 740766531454 <NA>       <NA>       0

# latest available poverty rate for each country, even if from different years
ind <- wb_data("SI.POV.DDAY", c("ALB", "BRA", "IND"), mrnev = 1)
ind[c("country_code", "date", "value")]
#>   country_code date value
#> 1          ALB 2020   0.3
#> 2          BRA 2024   3.0
#> 3          IND 2022   5.3

# include the per-observation footnotes
ind <- wb_data("SI.POV.DDAY", "ALB", footnote = TRUE)
head(ind[c("date", "value", "footnote")])
#>   date value
#> 1 2020   0.3
#> 2 2019   0.3
#> 3 2018   1.0
#> 4 2017   1.4
#> 5 2016   1.1
#> 6 2015   1.1
#>                                                               footnote
#> 1 Based on data from HBS. Estimated from unit-record consumption data.
#> 2 Based on data from HBS. Estimated from unit-record consumption data.
#> 3 Based on data from HBS. Estimated from unit-record consumption data.
#> 4 Based on data from HBS. Estimated from unit-record consumption data.
#> 5 Based on data from HBS. Estimated from unit-record consumption data.
#> 6 Based on data from HBS. Estimated from unit-record consumption data.

# GDP as archived in the Africa Development Indicators, which ends in 2011
ind <- wb_data("NY.GDP.MKTP.CD", "ZAF", source = 11)
head(ind)
#>   date   indicator_id    indicator_name country_id country_name country_code
#> 1 2011 NY.GDP.MKTP.CD GDP (current US$)        ZAF South Africa         <NA>
#> 2 2010 NY.GDP.MKTP.CD GDP (current US$)        ZAF South Africa         <NA>
#> 3 2009 NY.GDP.MKTP.CD GDP (current US$)        ZAF South Africa         <NA>
#> 4 2008 NY.GDP.MKTP.CD GDP (current US$)        ZAF South Africa         <NA>
#> 5 2007 NY.GDP.MKTP.CD GDP (current US$)        ZAF South Africa         <NA>
#> 6 2006 NY.GDP.MKTP.CD GDP (current US$)        ZAF South Africa         <NA>
#>          value unit obs_status decimal
#> 1 408236752340 <NA>       <NA>       0
#> 2 363523195186 <NA>       <NA>       0
#> 3 283012416483 <NA>       <NA>       0
#> 4 273870092687 <NA>       <NA>       0
#> 5 286171830700 <NA>       <NA>       0
#> 6 261007039378 <NA>       <NA>       0
# }
```
