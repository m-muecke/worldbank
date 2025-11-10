# World Bank country data

List all countries supported by the World Bank API.

## Usage

``` r
wb_country(country = NULL, lang = "en")
```

## Source

<https://api.worldbank.org/v2/country>

## Arguments

- country:

  (`NULL` \| [`character()`](https://rdrr.io/r/base/character.html))  
  Country to query. Default `NULL`. If `NULL`, all countries are
  returned.

- lang:

  (`character(1)`)  
  Language to query. Default `"en"`.

## Value

A [`data.frame()`](https://rdrr.io/r/base/data.frame.html) with the
available countries. The columns are:

- country_id:

  The country ID.

- country_code:

  The country code.

- country_name:

  The country name.

- region_id:

  The region ID.

- region_code:

  The region code.

- region_value:

  The region value.

- admin_region_id:

  The admin region ID.

- admin_region_code:

  The admin region code.

- admin_region_value:

  The admin region value.

- income_level_id:

  The income level ID.

- income_level_code:

  The income level code.

- income_level_value:

  The income level value.

- lending_type_id:

  The lending type ID.

- lending_type_code:

  The lending type code.

- lending_type_value:

  The lending type value.

- capital_city:

  The capital city.

- longitude:

  The longitude.

- latitude:

  The latitude.

## See also

Other indicators data:
[`wb_income_level()`](https://m-muecke.github.io/worldbank/reference/wb_income_level.md),
[`wb_indicator()`](https://m-muecke.github.io/worldbank/reference/wb_indicator.md),
[`wb_language()`](https://m-muecke.github.io/worldbank/reference/wb_language.md),
[`wb_lending_type()`](https://m-muecke.github.io/worldbank/reference/wb_lending_type.md),
[`wb_region()`](https://m-muecke.github.io/worldbank/reference/wb_region.md),
[`wb_source()`](https://m-muecke.github.io/worldbank/reference/wb_source.md),
[`wb_topic()`](https://m-muecke.github.io/worldbank/reference/wb_topic.md)

## Examples

``` r
country <- wb_country()
head(country)
#>   country_id country_code                country_name region_id region_code
#> 1        ABW           AW                       Aruba       LCN          ZJ
#> 2        AFE           ZH Africa Eastern and Southern        NA          NA
#> 3        AFG           AF                 Afghanistan       MEA          ZQ
#> 4        AFR           A9                      Africa        NA          NA
#> 5        AFW           ZI  Africa Western and Central        NA          NA
#> 6        AGO           AO                      Angola       SSF          ZG
#>                                        region_value admin_region_id
#> 1                         Latin America & Caribbean            <NA>
#> 2                                        Aggregates            <NA>
#> 3 Middle East, North Africa, Afghanistan & Pakistan             MNA
#> 4                                        Aggregates            <NA>
#> 5                                        Aggregates            <NA>
#> 6                                Sub-Saharan Africa             SSA
#>   admin_region_code
#> 1              <NA>
#> 2              <NA>
#> 3                XQ
#> 4              <NA>
#> 5              <NA>
#> 6                ZF
#>                                                          admin_region_value
#> 1                                                                      <NA>
#> 2                                                                      <NA>
#> 3 Middle East, North Africa, Afghanistan & Pakistan (excluding high income)
#> 4                                                                      <NA>
#> 5                                                                      <NA>
#> 6                                Sub-Saharan Africa (excluding high income)
#>   income_level_id income_level_code  income_level_value lending_type_id
#> 1             HIC                XD         High income             LNX
#> 2              NA                NA          Aggregates            <NA>
#> 3             LIC                XM          Low income             IDX
#> 4              NA                NA          Aggregates            <NA>
#> 5              NA                NA          Aggregates            <NA>
#> 6             LMC                XN Lower middle income             IBD
#>   lending_type_code lending_type_value capital_city longitude latitude
#> 1                XX     Not classified   Oranjestad  -70.0167 12.51670
#> 2              <NA>         Aggregates         <NA>        NA       NA
#> 3                XI                IDA        Kabul   69.1761 34.52280
#> 4              <NA>         Aggregates         <NA>        NA       NA
#> 5              <NA>         Aggregates         <NA>        NA       NA
#> 6                XF               IBRD       Luanda   13.2420 -8.81155
```
