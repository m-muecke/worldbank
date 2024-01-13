
<!-- README.md is generated from README.Rmd. Please edit that file -->

# worldbank

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![R-CMD-check](https://github.com/m-muecke/worldbank/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/m-muecke/worldbank/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

## Overview

The goal of worldbank is to provide a simple interface to the [World
Bank API
v2](https://datahelpdesk.worldbank.org/knowledgebase/articles/889392-about-the-indicators-api-documentation).
The main difference to other packages is that it’s a modern
implementation using the [httr2](https://httr2.r-lib.org) package
without any other dependencies.

The `worldbank` package provides a set of functions to interact with
various endpoints of the World Bank API. Each function is designed to
retrieve specific types of data, making it easier to access and analyze
World Bank datasets. Below is an overview of the available endpoints and
their corresponding functions in the package:

- **Languages** (`wb_language`): Retrieves a list of all languages
  supported by the World Bank API. Useful for obtaining
  language-specific data.
- **Lending Types** (`wb_lending_type`): Fetches information about
  different lending types as recognized by the World Bank.
- **Income Levels** (`wb_income_level`): Allows users to access data
  about various income levels defined by the World Bank.
- **Sources** (`wb_source`): Provides details about the different data
  sources available within the World Bank’s datasets.
- **Topics** (`wb_topic`): Lists all topics covered by the World Bank
  API, helping users to narrow down their data search to specific areas
  of interest.
- **Regions** (`wb_region`): Offers information on different
  geographical regions as categorized by the World Bank.
- **Countries** (`wb_country`): Enables access to detailed data about
  individual countries, including socio-economic and developmental
  indicators.
- **Country Indicators** (`wb_country_indicator`): Specific to
  retrieving indicators for a particular country or countries, allowing
  for more targeted data analysis.
- **Indicators** (`wb_indicator`): This endpoint gives users access to a
  wide array of indicators used by the World Bank in its data analysis
  and reports.

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
#> # A tibble: 296 × 18
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
#> # ℹ 286 more rows
#> # ℹ 12 more variables: admin_region_id <chr>, admin_region_code <chr>,
#> #   admin_region_value <chr>, income_level_id <chr>, income_level_code <chr>,
#> #   income_level_value <chr>, lending_type_id <chr>, lending_type_code <chr>,
#> #   lending_type_value <chr>, capital_city <chr>, longitude <dbl>,
#> #   latitude <dbl>

# fetch indicator data for specific country
indicators <- wb_country_indicator("NY.GDP.MKTP.CD")
indicators
#> # A tibble: 13,200 × 10
#>     date indicator_id   indicator_name    country_id country_name   country_code
#>    <int> <chr>          <chr>             <chr>      <chr>          <chr>
#>  1  2022 NY.GDP.MKTP.CD GDP (current US$) ZH         Africa Easter… AFE
#>  2  2021 NY.GDP.MKTP.CD GDP (current US$) ZH         Africa Easter… AFE
#>  3  2020 NY.GDP.MKTP.CD GDP (current US$) ZH         Africa Easter… AFE
#>  4  2019 NY.GDP.MKTP.CD GDP (current US$) ZH         Africa Easter… AFE
#>  5  2018 NY.GDP.MKTP.CD GDP (current US$) ZH         Africa Easter… AFE
#>  6  2017 NY.GDP.MKTP.CD GDP (current US$) ZH         Africa Easter… AFE
#>  7  2016 NY.GDP.MKTP.CD GDP (current US$) ZH         Africa Easter… AFE
#>  8  2015 NY.GDP.MKTP.CD GDP (current US$) ZH         Africa Easter… AFE
#>  9  2014 NY.GDP.MKTP.CD GDP (current US$) ZH         Africa Easter… AFE
#> 10  2013 NY.GDP.MKTP.CD GDP (current US$) ZH         Africa Easter… AFE
#> # ℹ 13,190 more rows
#> # ℹ 4 more variables: value <dbl>, unit <chr>, obs_status <chr>, decimal <int>

# plot indicator data for specific countries
library(ggplot2)

subset(indicators, country_id %in% c("US", "DE", "FR", "CH", "JP")) |>
  ggplot(aes(x = date, y = value, color = country_code)) +
  geom_line() +
  labs(x = "Date", y = "GDP (current US$)", color = "Country")
```

<img src="man/figures/README-demo-1.png" width="100%" />

## Related Work

- [wbstats](https://github.com/gshs-ornl/wbstats)
- [WDI](https://github.com/vincentarelbundock/WDI)
