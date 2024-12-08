
<!-- README.md is generated from README.Rmd. Please edit that file -->

# worldbank

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![R-CMD-check](https://github.com/m-muecke/worldbank/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/m-muecke/worldbank/actions/workflows/R-CMD-check.yaml)
[![CRAN
status](https://www.r-pkg.org/badges/version/worldbank)](https://CRAN.R-project.org/package=worldbank)
<!-- badges: end -->

## Overview

**worlbank** provides a simple interface to the following [World
Bank](https://datahelpdesk.worldbank.org/knowledgebase/articles/889386-developer-information-overview)
APIs:

- [Indicators API
  v2](https://datahelpdesk.worldbank.org/knowledgebase/articles/889392-about-the-indicators-api-documentation)
- [Poverty and Inequality Platform (PIP)
  API](https://pip.worldbank.org/api).
- [Finances One API](https://financesone.worldbank.org)

The main difference to other packages is that it’s a modern
implementation using the [httr2](https://httr2.r-lib.org) package and
supports all available endpoints and parameters.

The `worldbank` package provides a set of functions to interact with
various endpoints of the World Bank Indicators API. Each function is
designed to retrieve specific types of data, making it easier to access
and analyze World Bank datasets. Below is an overview of the available
endpoints and their corresponding functions in the package:

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

You can install the released version of **worldbank** from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("worldbank")
```

And the development version from [GitHub](https://github.com/) with:

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
#>   country_id country_code  country_name region_id region_code
#> 1        DEU           DE       Germany       ECS          Z7
#> 2        USA           US United States       NAC          XU
#>            region_value admin_region_id admin_region_code admin_region_value
#> 1 Europe & Central Asia            <NA>              <NA>               <NA>
#> 2         North America            <NA>              <NA>               <NA>
#>   income_level_id income_level_code income_level_value lending_type_id
#> 1             HIC                XD        High income             LNX
#> 2             HIC                XD        High income             LNX
#>   lending_type_code lending_type_value    capital_city longitude latitude
#> 1                XX     Not classified          Berlin   13.4115  52.5235
#> 2                XX     Not classified Washington D.C.  -77.0320  38.8895

# or fetch all (default)
country <- wb_country()
str(country)
#> 'data.frame':    296 obs. of  18 variables:
#>  $ country_id        : chr  "ABW" "AFE" "AFG" "AFR" ...
#>  $ country_code      : chr  "AW" "ZH" "AF" "A9" ...
#>  $ country_name      : chr  "Aruba" "Africa Eastern and Southern" "Afghanistan" "Africa" ...
#>  $ region_id         : chr  "LCN" "NA" "SAS" "NA" ...
#>  $ region_code       : chr  "ZJ" "NA" "8S" "NA" ...
#>  $ region_value      : chr  "Latin America & Caribbean" "Aggregates" "South Asia" "Aggregates" ...
#>  $ admin_region_id   : chr  NA NA "SAS" NA ...
#>  $ admin_region_code : chr  NA NA "8S" NA ...
#>  $ admin_region_value: chr  NA NA "South Asia" NA ...
#>  $ income_level_id   : chr  "HIC" "NA" "LIC" "NA" ...
#>  $ income_level_code : chr  "XD" "NA" "XM" "NA" ...
#>  $ income_level_value: chr  "High income" "Aggregates" "Low income" "Aggregates" ...
#>  $ lending_type_id   : chr  "LNX" NA "IDX" NA ...
#>  $ lending_type_code : chr  "XX" NA "XI" NA ...
#>  $ lending_type_value: chr  "Not classified" "Aggregates" "IDA" "Aggregates" ...
#>  $ capital_city      : chr  "Oranjestad" NA "Kabul" NA ...
#>  $ longitude         : num  -70 NA 69.2 NA NA ...
#>  $ latitude          : num  12.5 NA 34.5 NA NA ...

# search for specific indicator
ind <- wb_indicator()
ind <- subset(
  ind,
  grepl("GDP", id, fixed = TRUE) & source_value == "World Development Indicators"
)
str(ind)
#> 'data.frame':    37 obs. of  9 variables:
#>  $ id                 : chr  "EG.GDP.PUSE.KO.PP" "EG.GDP.PUSE.KO.PP.KD" "EN.GHG.CO2.RT.GDP.KD" "EN.GHG.CO2.RT.GDP.PP.KD" ...
#>  $ name               : chr  "GDP per unit of energy use (PPP $ per kg of oil equivalent)" "GDP per unit of energy use (constant 2021 PPP $ per kg of oil equivalent)" "Carbon intensity of GDP (kg CO2e per constant 2015 US$ of GDP)" "Carbon intensity of GDP (kg CO2e per 2021 PPP $ of GDP)" ...
#>  $ unit               : chr  NA NA NA NA ...
#>  $ source_id          : chr  "2" "2" "2" "2" ...
#>  $ source_value       : chr  "World Development Indicators" "World Development Indicators" "World Development Indicators" "World Development Indicators" ...
#>  $ source_note        : chr  "GDP per unit of energy use is the PPP GDP per kilogram of oil equivalent of energy use. PPP GDP is gross domest"| __truncated__ "GDP per unit of energy use is the PPP GDP per kilogram of oil equivalent of energy use. PPP GDP is gross domest"| __truncated__ "Annual emissions of carbon dioxide (CO2), one of the six Kyoto greenhouse gases (GHG), from the agriculture, en"| __truncated__ "Annual emissions of carbon dioxide (CO2), one of the six Kyoto greenhouse gases (GHG), from the agriculture, en"| __truncated__ ...
#>  $ source_organization: chr  "IEA Statistics © OECD/IEA 2014 (https://www.iea.org/data-and-statistics), subject to https://www.iea.org/terms/" "IEA Statistics © OECD/IEA 2014 (https://www.iea.org/data-and-statistics), subject to https://www.iea.org/terms/" "EDGAR (Emissions Database for Global Atmospheric Research) Community GHG Database, a collaboration between the "| __truncated__ "EDGAR (Emissions Database for Global Atmospheric Research) Community GHG Database, a collaboration between the "| __truncated__ ...
#>  $ topic_id           : chr  "5" "5" "6" "6" ...
#>  $ topic_value        : chr  "Energy & Mining" "Energy & Mining" "Environment" "Environment" ...

# fetch indicator data for specific or all countries (default)
gdp <- wb_country_indicator("NY.GDP.MKTP.CD", c("US", "DE", "FR", "CH", "JP"))
str(gdp)
#> 'data.frame':    320 obs. of  10 variables:
#>  $ date          : int  2023 2022 2021 2020 2019 2018 2017 2016 2015 2014 ...
#>  $ indicator_id  : chr  "NY.GDP.MKTP.CD" "NY.GDP.MKTP.CD" "NY.GDP.MKTP.CD" "NY.GDP.MKTP.CD" ...
#>  $ indicator_name: chr  "GDP (current US$)" "GDP (current US$)" "GDP (current US$)" "GDP (current US$)" ...
#>  $ country_id    : chr  "CH" "CH" "CH" "CH" ...
#>  $ country_name  : chr  "Switzerland" "Switzerland" "Switzerland" "Switzerland" ...
#>  $ country_code  : chr  "CHE" "CHE" "CHE" "CHE" ...
#>  $ value         : num  8.85e+11 8.18e+11 8.13e+11 7.42e+11 7.21e+11 ...
#>  $ unit          : chr  NA NA NA NA ...
#>  $ obs_status    : chr  NA NA NA NA ...
#>  $ decimal       : int  0 0 0 0 0 0 0 0 0 0 ...
```

<img src="man/figures/README-plotting-1.png" width="100%" />

## Related work

- [wbstats](https://github.com/gshs-ornl/wbstats): R package for
  searching and downloading data from the World Bank API
- [WDI](https://github.com/vincentarelbundock/WDI): R package to
  download World Bank data
- [pipr](https://github.com/worldbank/pipr): R client for the PIP
  Worldbank API
