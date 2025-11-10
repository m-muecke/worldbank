# World Bank income level data

List all income levels supported by the World Bank API.

## Usage

``` r
wb_income_level(income = NULL, lang = "en")
```

## Source

<https://api.worldbank.org/v2/incomeLevels>

## Arguments

- income:

  (`NULL` \| [`character()`](https://rdrr.io/r/base/character.html))  
  Income level to query. Default `NULL`. If `NULL`, all levels are
  returned.

- lang:

  (`character(1)`)  
  Language to query. Default `"en"`.

## Value

A [`data.frame()`](https://rdrr.io/r/base/data.frame.html) with the
available income levels. The columns are:

- id:

  The income level ID.

- iso2code:

  The ISO 2 code of the income level.

- value:

  The income level value.

## See also

Other indicators data:
[`wb_country()`](https://m-muecke.github.io/worldbank/reference/wb_country.md),
[`wb_indicator()`](https://m-muecke.github.io/worldbank/reference/wb_indicator.md),
[`wb_language()`](https://m-muecke.github.io/worldbank/reference/wb_language.md),
[`wb_lending_type()`](https://m-muecke.github.io/worldbank/reference/wb_lending_type.md),
[`wb_region()`](https://m-muecke.github.io/worldbank/reference/wb_region.md),
[`wb_source()`](https://m-muecke.github.io/worldbank/reference/wb_source.md),
[`wb_topic()`](https://m-muecke.github.io/worldbank/reference/wb_topic.md)

## Examples

``` r
wb_income_level()
#>    id iso2code               value
#> 1 HIC       XD         High income
#> 2 INX       XY      Not classified
#> 3 LIC       XM          Low income
#> 4 LMC       XN Lower middle income
#> 5 LMY       XO Low & middle income
#> 6 MIC       XP       Middle income
#> 7 UMC       XT Upper middle income
```
