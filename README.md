
<!-- README.md is generated from README.Rmd. Please edit that file -->

# worldbank

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![R-CMD-check](https://github.com/m-muecke/worldbank/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/m-muecke/worldbank/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The goal of worldbank is to provide a simple interface to the [World
Bank API
v2](https://datahelpdesk.worldbank.org/knowledgebase/articles/889392-about-the-indicators-api-documentation).
The main difference to other packages is that it’s a modern
implementation using the [httr2](https://httr2.r-lib.org) package
without any other dependencies.

## Installation

You can install the development version of worldbank from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("m-muecke/worldbank")
```

## Usage

worldbank functions are prefixed with `wb_` and follow the naming
convention of the [World Bank API
v2](https://datahelpdesk.worldbank.org/knowledgebase/articles/889392-about-the-indicators-api-documentation).

``` r
library(worldbank)

# filter by specific country
wb_country(c("US", "DE"))
#> # A tibble: 2 × 18
#>   country_id country_code country_name  region_id region_code region_value
#>   <chr>      <chr>        <chr>         <chr>     <chr>       <chr>
#> 1 DEU        DE           Germany       ECS       Z7          Europe & Central …
#> 2 USA        US           United States NAC       XU          North America
#> # ℹ 12 more variables: admin_region_id <chr>, admin_region_code <chr>,
#> #   admin_region_value <chr>, income_level_id <chr>, income_level_code <chr>,
#> #   income_level_value <chr>, lending_type_id <chr>, lending_type_code <chr>,
#> #   lending_type_value <chr>, capital_city <chr>, longitude <dbl>,
#> #   latitude <dbl>

# or fetch all (default)
wb_country()
#> # A tibble: 297 × 18
#>    country_id country_code country_name       region_id region_code region_value
#>    <chr>      <chr>        <chr>              <chr>     <chr>       <chr>
#>  1 ABW        AW           Aruba              LCN       ZJ          Latin Ameri…
#>  2 AFE        ZH           Africa Eastern an… NA        NA          Aggregates
#>  3 AFG        AF           Afghanistan        SAS       8S          South Asia
#>  4 AFR        A9           Africa             NA        NA          Aggregates
#>  5 AFW        ZI           Africa Western an… NA        NA          Aggregates
#>  6 AGO        AO           Angola             SSF       ZG          Sub-Saharan…
#>  7 ALB        AL           Albania            ECS       Z7          Europe & Ce…
#>  8 AND        AD           Andorra            ECS       Z7          Europe & Ce…
#>  9 ARB        1A           Arab World         NA        NA          Aggregates
#> 10 ARE        AE           United Arab Emira… MEA       ZQ          Middle East…
#> # ℹ 287 more rows
#> # ℹ 12 more variables: admin_region_id <chr>, admin_region_code <chr>,
#> #   admin_region_value <chr>, income_level_id <chr>, income_level_code <chr>,
#> #   income_level_value <chr>, lending_type_id <chr>, lending_type_code <chr>,
#> #   lending_type_value <chr>, capital_city <chr>, longitude <dbl>,
#> #   latitude <dbl>

# fetch indicator data for specific country
wb_country_indicator("NY.GDP.MKTP.CD", "US")
#> # A tibble: 63 × 10
#>     year indicator_id   indicator_name    country_id country_name  country_code
#>    <int> <chr>          <chr>             <chr>      <chr>         <chr>
#>  1  2022 NY.GDP.MKTP.CD GDP (current US$) US         United States USA
#>  2  2021 NY.GDP.MKTP.CD GDP (current US$) US         United States USA
#>  3  2020 NY.GDP.MKTP.CD GDP (current US$) US         United States USA
#>  4  2019 NY.GDP.MKTP.CD GDP (current US$) US         United States USA
#>  5  2018 NY.GDP.MKTP.CD GDP (current US$) US         United States USA
#>  6  2017 NY.GDP.MKTP.CD GDP (current US$) US         United States USA
#>  7  2016 NY.GDP.MKTP.CD GDP (current US$) US         United States USA
#>  8  2015 NY.GDP.MKTP.CD GDP (current US$) US         United States USA
#>  9  2014 NY.GDP.MKTP.CD GDP (current US$) US         United States USA
#> 10  2013 NY.GDP.MKTP.CD GDP (current US$) US         United States USA
#> # ℹ 53 more rows
#> # ℹ 4 more variables: value <dbl>, unit <chr>, obs_status <chr>, decimal <int>
```

## Other World Bank packages

- [wbstats](https://github.com/gshs-ornl/wbstats)
- [WDI](https://github.com/vincentarelbundock/WDI)
