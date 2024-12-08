
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

# search for specific indicator
ind <- wb_indicator()
ind <- subset(
  ind,
  grepl("GDP", id, fixed = TRUE) & source_value == "World Development Indicators"
)

# fetch indicator data for specific or all countries (default)
gdp <- wb_country_indicator("NY.GDP.MKTP.CD", c("US", "DE", "FR", "CH", "JP"))
```

<img src="man/figures/README-plotting-1.png" width="100%" />

## Related work

- [wbstats](https://github.com/gshs-ornl/wbstats): R package for
  searching and downloading data from the World Bank API
- [WDI](https://github.com/vincentarelbundock/WDI): R package to
  download World Bank data
- [pipr](https://github.com/worldbank/pipr): R client for the PIP
  Worldbank API
