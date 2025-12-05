# World Bank lending type data

List all lending types supported by the World Bank API.

## Usage

``` r
wb_lending_type(type = NULL, lang = "en")
```

## Source

<https://api.worldbank.org/v2/lendingTypes>

## Arguments

- type:

  (`NULL` \| [`character()`](https://rdrr.io/r/base/character.html))  
  lending type to query. Default `NULL`. If `NULL`, all types are
  returned.

- lang:

  (`character(1)`)  
  Language to query. Default `"en"`.

## Value

A [`data.frame()`](https://rdrr.io/r/base/data.frame.html) with the
available lending types. The columns are:

- id:

  The lending type ID.

- iso2code:

  The ISO 2 code of the lending type.

- value:

  The lending type value.

## See also

Other indicators data:
[`wb_country()`](https://m-muecke.github.io/worldbank/reference/wb_country.md),
[`wb_income_level()`](https://m-muecke.github.io/worldbank/reference/wb_income_level.md),
[`wb_indicator()`](https://m-muecke.github.io/worldbank/reference/wb_indicator.md),
[`wb_language()`](https://m-muecke.github.io/worldbank/reference/wb_language.md),
[`wb_region()`](https://m-muecke.github.io/worldbank/reference/wb_region.md),
[`wb_source()`](https://m-muecke.github.io/worldbank/reference/wb_source.md),
[`wb_topic()`](https://m-muecke.github.io/worldbank/reference/wb_topic.md)

## Examples

``` r
# \donttest{
wb_lending_type()
#>    id iso2code          value
#> 1 IBD       XF           IBRD
#> 2 IDB       XH          Blend
#> 3 IDX       XI            IDA
#> 4 LNX       XX Not classified
# }
```
