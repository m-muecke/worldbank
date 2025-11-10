# Return auxiliary data tables

Return auxiliary data tables

## Usage

``` r
pip_aux(
  table = NULL,
  release_version = NULL,
  ppp_version = NULL,
  version = NULL
)
```

## Source

<https://pip.worldbank.org/api>

## Arguments

- table:

  (`NULL` \| `character(1)`)  
  Table to be returned. Default `NULL`.

- release_version:

  (`NULL` \| `character(1)`)  
  Version of the data release in YYYYMMDD format. Default `NULL`.

- ppp_version:

  (`NULL` \| `character(1)` \| `numeric(1)`)  
  Version of the data. Default `NULL`.

- version:

  (`NULL` \| `character(1)`)  
  Version of the data. Default `NULL`.

## Value

A [`character()`](https://rdrr.io/r/base/character.html) with the
available tables or a
[`data.frame()`](https://rdrr.io/r/base/data.frame.html) containing the
table data.

## See also

Other poverty and inequality statistics:
[`pip_citation()`](https://m-muecke.github.io/worldbank/reference/pip_citation.md),
[`pip_data()`](https://m-muecke.github.io/worldbank/reference/pip_data.md),
[`pip_group()`](https://m-muecke.github.io/worldbank/reference/pip_group.md),
[`pip_health_check()`](https://m-muecke.github.io/worldbank/reference/pip_health_check.md),
[`pip_info()`](https://m-muecke.github.io/worldbank/reference/pip_info.md),
[`pip_valid_params()`](https://m-muecke.github.io/worldbank/reference/pip_valid_params.md),
[`pip_versions()`](https://m-muecke.github.io/worldbank/reference/pip_versions.md)

## Examples

``` r
# \donttest{
# get a list of available tables
pip_aux()
#>  [1] "aux_versions"           "countries"              "country_coverage"      
#>  [4] "country_list"           "cpi"                    "decomposition"         
#>  [7] "dictionary"             "framework"              "gdp"                   
#> [10] "incgrp_coverage"        "indicators"             "interpolated_means"    
#> [13] "metaregion"             "missing_data"           "national_poverty_lines"
#> [16] "pce"                    "pg_lnp"                 "pg_svy"                
#> [19] "pop"                    "pop_region"             "poverty_lines"         
#> [22] "ppp"                    "region_coverage"        "regions"               
#> [25] "spr_lnp"                "spr_svy"                "survey_means"          

# get countries
aux <- pip_aux("countries")
head(aux)
#>   country_code          country_name
#> 1          CIV         Côte d'Ivoire
#> 2          STP São Tomé and Príncipe
#> 3          TUR               Türkiye
#> 4          AGO                Angola
#> 5          ALB               Albania
#> 6          ARE  United Arab Emirates
#>                                              region region_code
#> 1                                Sub-Saharan Africa         SSF
#> 2                                Sub-Saharan Africa         SSF
#> 3                             Europe & Central Asia         ECS
#> 4                                Sub-Saharan Africa         SSF
#> 5                             Europe & Central Asia         ECS
#> 6 Middle East, North Africa, Afghanistan & Pakistan         MEA
#>                  africa_split africa_split_code         fcv fcv_code
#> 1  Western and Central Africa               AFW Not-fragile     FCVN
#> 2 Eastern and Southern Africa               AFE     Fragile     FCVY
#> 3                        <NA>              <NA> Not-fragile     FCVN
#> 4 Eastern and Southern Africa               AFE Not-fragile     FCVN
#> 5                        <NA>              <NA> Not-fragile     FCVN
#> 6                        <NA>              <NA> Not-fragile     FCVN
#>                 ida ida_code            incgroup incgroup_code
#> 1             Blend     BLND Lower middle income          LMIC
#> 2               IDA      IDA Lower middle income          LMIC
#> 3              IBRD     IBRD Upper middle income          UMIC
#> 4              IBRD     IBRD Lower middle income          LMIC
#> 5              IBRD     IBRD Upper middle income          UMIC
#> 6 Rest of the world     REST         High income           HIC
#>                     regionpcn regionpcn_code world world_code
#> 1          Sub-Saharan Africa            SSA World        WLD
#> 2          Sub-Saharan Africa            SSA World        WLD
#> 3       Europe & Central Asia            ECA World        WLD
#> 4          Sub-Saharan Africa            SSA World        WLD
#> 5       Europe & Central Asia            ECA World        WLD
#> 6 Other High Income Countries            OHI World        WLD

# get GDP
aux <- pip_aux("gdp")
head(aux)
#>   country_code data_level year value
#> 1          ABW   national 1977    NA
#> 2          ABW   national 1978    NA
#> 3          ABW   national 1979    NA
#> 4          ABW   national 1980    NA
#> 5          ABW   national 1981    NA
#> 6          ABW   national 1982    NA

# get CPI
aux <- pip_aux("cpi")
head(aux)
#>   country_code data_level year value
#> 1          AGO   national 1977    NA
#> 2          AGO   national 1978    NA
#> 3          AGO   national 1979    NA
#> 4          AGO   national 1980    NA
#> 5          AGO   national 1981    NA
#> 6          AGO   national 1982    NA
# }
```
