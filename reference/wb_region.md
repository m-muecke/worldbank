# World Bank region data

List all regions supported by the World Bank API.

## Usage

``` r
wb_region(region = NULL, lang = "en")
```

## Source

<https://api.worldbank.org/v2/region>

## Arguments

- region:

  (`NULL` \| [`character()`](https://rdrr.io/r/base/character.html))  
  Region to query. Default `NULL`. If `NULL`, all regions are returned

- lang:

  (`character(1)`)  
  Language to query. Default `"en"`.

## Value

A [`data.frame()`](https://rdrr.io/r/base/data.frame.html) with the
available regions. The columns are:

- id:

  The region ID.

- code:

  The region code.

- iso2code:

  The ISO 2 code of the region.

- name:

  The region name.

## See also

Other indicators data:
[`wb_country()`](https://m-muecke.github.io/worldbank/reference/wb_country.md),
[`wb_income_level()`](https://m-muecke.github.io/worldbank/reference/wb_income_level.md),
[`wb_indicator()`](https://m-muecke.github.io/worldbank/reference/wb_indicator.md),
[`wb_language()`](https://m-muecke.github.io/worldbank/reference/wb_language.md),
[`wb_lending_type()`](https://m-muecke.github.io/worldbank/reference/wb_lending_type.md),
[`wb_source()`](https://m-muecke.github.io/worldbank/reference/wb_source.md),
[`wb_topic()`](https://m-muecke.github.io/worldbank/reference/wb_topic.md)

## Examples

``` r
region <- wb_region()
head(region)
#>   id code iso2code                                           name
#> 1 NA  AFE       ZH                    Africa Eastern and Southern
#> 2 NA  AFR       A9                                         Africa
#> 3 NA  AFW       ZI                     Africa Western and Central
#> 4 NA  ARB       1A                                     Arab World
#> 5 NA  CAA       C9        Sub-Saharan Africa (IFC classification)
#> 6 NA  CEA       C4 East Asia and the Pacific (IFC classification)
```
