# World Bank country data

List all countries supported by the World Bank API.

## Usage

``` r
wb_country(
  country = NULL,
  region = NULL,
  income_level = NULL,
  lending_type = NULL,
  lang = "en"
)
```

## Source

<https://api.worldbank.org/v2/country>

## Arguments

- country:

  (`NULL` \| [`character()`](https://rdrr.io/r/base/character.html))  
  Country to query. Default `NULL`. If `NULL`, all countries are
  returned.

- region:

  (`NULL` \| [`character()`](https://rdrr.io/r/base/character.html))  
  Region codes to filter by, as listed in the `code` column of
  [`wb_region()`](https://m-muecke.github.io/worldbank/reference/wb_region.md).
  Default `NULL`.

- income_level:

  (`NULL` \| [`character()`](https://rdrr.io/r/base/character.html))  
  Income level IDs to filter by, as listed by
  [`wb_income_level()`](https://m-muecke.github.io/worldbank/reference/wb_income_level.md).
  Default `NULL`.

- lending_type:

  (`NULL` \| [`character()`](https://rdrr.io/r/base/character.html))  
  Lending type IDs to filter by, as listed by
  [`wb_lending_type()`](https://m-muecke.github.io/worldbank/reference/wb_lending_type.md).
  Default `NULL`.

- lang:

  (`character(1)`)  
  Language to query. Default `"en"`.

## Value

A [`data.frame()`](https://rdrr.io/r/base/data.frame.html) with the
available countries. The columns are:

- `country_id`: The country ID.

- `country_code`: The country code.

- `country_name`: The country name.

- `region_id`: The region ID.

- `region_code`: The region code.

- `region_value`: The region value.

- `admin_region_id`: The admin region ID.

- `admin_region_code`: The admin region code.

- `admin_region_value`: The admin region value.

- `income_level_id`: The income level ID.

- `income_level_code`: The income level code.

- `income_level_value`: The income level value.

- `lending_type_id`: The lending type ID.

- `lending_type_code`: The lending type code.

- `lending_type_value`: The lending type value.

- `capital_city`: The capital city.

- `longitude`: The longitude.

- `latitude`: The latitude.

## See also

Other indicators data:
[`wb_bulk()`](https://m-muecke.github.io/worldbank/reference/wb_bulk.md),
[`wb_data()`](https://m-muecke.github.io/worldbank/reference/wb_data.md),
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

# low income countries in Sub-Saharan Africa
wb_country(region = "SSF", income_level = "LIC")
#>    country_id country_code             country_name region_id region_code
#> 1         BDI           BI                  Burundi       SSF          ZG
#> 2         BFA           BF             Burkina Faso       SSF          ZG
#> 3         CAF           CF Central African Republic       SSF          ZG
#> 4         COD           CD         Congo, Dem. Rep.       SSF          ZG
#> 5         ERI           ER                  Eritrea       SSF          ZG
#> 6         ETH           ET                 Ethiopia       SSF          ZG
#> 7         GMB           GM              Gambia, The       SSF          ZG
#> 8         GNB           GW            Guinea-Bissau       SSF          ZG
#> 9         LBR           LR                  Liberia       SSF          ZG
#> 10        MDG           MG               Madagascar       SSF          ZG
#> 11        MLI           ML                     Mali       SSF          ZG
#> 12        MOZ           MZ               Mozambique       SSF          ZG
#> 13        MWI           MW                   Malawi       SSF          ZG
#> 14        NER           NE                    Niger       SSF          ZG
#> 15        RWA           RW                   Rwanda       SSF          ZG
#> 16        SDN           SD                    Sudan       SSF          ZG
#> 17        SLE           SL             Sierra Leone       SSF          ZG
#> 18        SOM           SO       Somalia, Fed. Rep.       SSF          ZG
#> 19        SSD           SS              South Sudan       SSF          ZG
#> 20        TCD           TD                     Chad       SSF          ZG
#> 21        UGA           UG                   Uganda       SSF          ZG
#>          region_value admin_region_id admin_region_code
#> 1  Sub-Saharan Africa             SSA                ZF
#> 2  Sub-Saharan Africa             SSA                ZF
#> 3  Sub-Saharan Africa             SSA                ZF
#> 4  Sub-Saharan Africa             SSA                ZF
#> 5  Sub-Saharan Africa             SSA                ZF
#> 6  Sub-Saharan Africa             SSA                ZF
#> 7  Sub-Saharan Africa             SSA                ZF
#> 8  Sub-Saharan Africa             SSA                ZF
#> 9  Sub-Saharan Africa             SSA                ZF
#> 10 Sub-Saharan Africa             SSA                ZF
#> 11 Sub-Saharan Africa             SSA                ZF
#> 12 Sub-Saharan Africa             SSA                ZF
#> 13 Sub-Saharan Africa             SSA                ZF
#> 14 Sub-Saharan Africa             SSA                ZF
#> 15 Sub-Saharan Africa             SSA                ZF
#> 16 Sub-Saharan Africa             SSA                ZF
#> 17 Sub-Saharan Africa             SSA                ZF
#> 18 Sub-Saharan Africa             SSA                ZF
#> 19 Sub-Saharan Africa             SSA                ZF
#> 20 Sub-Saharan Africa             SSA                ZF
#> 21 Sub-Saharan Africa             SSA                ZF
#>                            admin_region_value income_level_id income_level_code
#> 1  Sub-Saharan Africa (excluding high income)             LIC                XM
#> 2  Sub-Saharan Africa (excluding high income)             LIC                XM
#> 3  Sub-Saharan Africa (excluding high income)             LIC                XM
#> 4  Sub-Saharan Africa (excluding high income)             LIC                XM
#> 5  Sub-Saharan Africa (excluding high income)             LIC                XM
#> 6  Sub-Saharan Africa (excluding high income)             LIC                XM
#> 7  Sub-Saharan Africa (excluding high income)             LIC                XM
#> 8  Sub-Saharan Africa (excluding high income)             LIC                XM
#> 9  Sub-Saharan Africa (excluding high income)             LIC                XM
#> 10 Sub-Saharan Africa (excluding high income)             LIC                XM
#> 11 Sub-Saharan Africa (excluding high income)             LIC                XM
#> 12 Sub-Saharan Africa (excluding high income)             LIC                XM
#> 13 Sub-Saharan Africa (excluding high income)             LIC                XM
#> 14 Sub-Saharan Africa (excluding high income)             LIC                XM
#> 15 Sub-Saharan Africa (excluding high income)             LIC                XM
#> 16 Sub-Saharan Africa (excluding high income)             LIC                XM
#> 17 Sub-Saharan Africa (excluding high income)             LIC                XM
#> 18 Sub-Saharan Africa (excluding high income)             LIC                XM
#> 19 Sub-Saharan Africa (excluding high income)             LIC                XM
#> 20 Sub-Saharan Africa (excluding high income)             LIC                XM
#> 21 Sub-Saharan Africa (excluding high income)             LIC                XM
#>    income_level_value lending_type_id lending_type_code lending_type_value
#> 1          Low income             IDX                XI                IDA
#> 2          Low income             IDX                XI                IDA
#> 3          Low income             IDX                XI                IDA
#> 4          Low income             IDX                XI                IDA
#> 5          Low income             IDX                XI                IDA
#> 6          Low income             IDX                XI                IDA
#> 7          Low income             IDX                XI                IDA
#> 8          Low income             IDX                XI                IDA
#> 9          Low income             IDX                XI                IDA
#> 10         Low income             IDX                XI                IDA
#> 11         Low income             IDX                XI                IDA
#> 12         Low income             IDX                XI                IDA
#> 13         Low income             IDX                XI                IDA
#> 14         Low income             IDX                XI                IDA
#> 15         Low income             IDX                XI                IDA
#> 16         Low income             IDX                XI                IDA
#> 17         Low income             IDX                XI                IDA
#> 18         Low income             IDX                XI                IDA
#> 19         Low income             IDX                XI                IDA
#> 20         Low income             IDX                XI                IDA
#> 21         Low income             IDX                XI                IDA
#>    capital_city longitude   latitude
#> 1     Bujumbura  29.36390  -3.378400
#> 2   Ouagadougou  -1.53395  12.360500
#> 3        Bangui  21.64070   5.630560
#> 4      Kinshasa  15.32220  -4.325000
#> 5        Asmara  38.91830  15.331500
#> 6   Addis Ababa  38.74680   9.022740
#> 7        Banjul -16.58850  13.449500
#> 8        Bissau -15.18040  11.803700
#> 9      Monrovia -10.79570   6.300390
#> 10 Antananarivo  45.71670 -20.466700
#> 11       Bamako  -7.50034  13.566700
#> 12       Maputo  32.57130 -25.966400
#> 13     Lilongwe  33.77030 -13.989900
#> 14       Niamey   2.10730  13.514000
#> 15       Kigali  30.05870  -1.953250
#> 16     Khartoum  32.53630  15.593200
#> 17     Freetown -13.21340   8.482100
#> 18    Mogadishu  45.32540   2.075150
#> 19         Juba  31.60000   4.850000
#> 20    N'Djamena  15.04450  12.104800
#> 21      Kampala  32.57290   0.314269
# }
```
