# World Bank source data

List all sources supported by the World Bank API.

## Usage

``` r
wb_source(source = NULL, lang = "en")
```

## Source

<https://api.worldbank.org/v2/sources>

## Arguments

- source:

  (`NULL` \| [`character()`](https://rdrr.io/r/base/character.html))  
  Source to query. Default `NULL`. If `NULL`, all sources are returned.

- lang:

  (`character(1)`)  
  Language to query. Default `"en"`.

## Value

A [`data.frame()`](https://rdrr.io/r/base/data.frame.html) with the
available sources. The columns are:

- id:

  The source ID.

- last_updated:

  The date the source was last updated.

- name:

  The source name.

- code:

  The source code.

- description:

  The source description.

- url:

  The source URL.

- data_availability:

  Whether the source has data available.

- metadata_availability:

  Whether the source has metadata available.

- concepts:

  The concepts associated with the source.

## See also

Other indicators data:
[`wb_country()`](https://m-muecke.github.io/worldbank/reference/wb_country.md),
[`wb_income_level()`](https://m-muecke.github.io/worldbank/reference/wb_income_level.md),
[`wb_indicator()`](https://m-muecke.github.io/worldbank/reference/wb_indicator.md),
[`wb_language()`](https://m-muecke.github.io/worldbank/reference/wb_language.md),
[`wb_lending_type()`](https://m-muecke.github.io/worldbank/reference/wb_lending_type.md),
[`wb_region()`](https://m-muecke.github.io/worldbank/reference/wb_region.md),
[`wb_topic()`](https://m-muecke.github.io/worldbank/reference/wb_topic.md)

## Examples

``` r
# \donttest{
src <- wb_source()
head(src)
#>   id last_updated                              name code description  url
#> 1  1   2021-08-18                    Doing Business  DBS        <NA> <NA>
#> 2  2   2025-12-19      World Development Indicators  WDI        <NA> <NA>
#> 3  3   2024-11-05   Worldwide Governance Indicators  WGI        <NA> <NA>
#> 4  5   2016-03-21 Subnational Malnutrition Database  SNM        <NA> <NA>
#> 5  6   2025-12-03     International Debt Statistics  IDS        <NA> <NA>
#> 6 11   2013-02-22     Africa Development Indicators  ADI        <NA> <NA>
#>   data_availability metadata_availability concepts
#> 1              TRUE                  TRUE        3
#> 2              TRUE                  TRUE        3
#> 3              TRUE                  TRUE        3
#> 4              TRUE                  TRUE        3
#> 5              TRUE                  TRUE        4
#> 6              TRUE                  TRUE        3
# }
```
