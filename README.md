
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
head(country)
#>   country_id country_code                country_name region_id region_code
#> 1        ABW           AW                       Aruba       LCN          ZJ
#> 2        AFE           ZH Africa Eastern and Southern        NA          NA
#> 3        AFG           AF                 Afghanistan       SAS          8S
#> 4        AFR           A9                      Africa        NA          NA
#> 5        AFW           ZI  Africa Western and Central        NA          NA
#> 6        AGO           AO                      Angola       SSF          ZG
#>                region_value admin_region_id admin_region_code
#> 1 Latin America & Caribbean            <NA>              <NA>
#> 2                Aggregates            <NA>              <NA>
#> 3                South Asia             SAS                8S
#> 4                Aggregates            <NA>              <NA>
#> 5                Aggregates            <NA>              <NA>
#> 6        Sub-Saharan Africa             SSA                ZF
#>                           admin_region_value income_level_id income_level_code
#> 1                                       <NA>             HIC                XD
#> 2                                       <NA>              NA                NA
#> 3                                 South Asia             LIC                XM
#> 4                                       <NA>              NA                NA
#> 5                                       <NA>              NA                NA
#> 6 Sub-Saharan Africa (excluding high income)             LMC                XN
#>    income_level_value lending_type_id lending_type_code lending_type_value
#> 1         High income             LNX                XX     Not classified
#> 2          Aggregates            <NA>              <NA>         Aggregates
#> 3          Low income             IDX                XI                IDA
#> 4          Aggregates            <NA>              <NA>         Aggregates
#> 5          Aggregates            <NA>              <NA>         Aggregates
#> 6 Lower middle income             IBD                XF               IBRD
#>   capital_city longitude latitude
#> 1   Oranjestad  -70.0167 12.51670
#> 2         <NA>        NA       NA
#> 3        Kabul   69.1761 34.52280
#> 4         <NA>        NA       NA
#> 5         <NA>        NA       NA
#> 6       Luanda   13.2420 -8.81155

# search for specific indicator
ind <- wb_indicator()
ind <- subset(
  ind,
  grepl("GDP", id, fixed = TRUE) & source_value == "World Development Indicators"
)
head(ind)
#>                            id
#> 6243        EG.GDP.PUSE.KO.PP
#> 6244     EG.GDP.PUSE.KO.PP.KD
#> 6365     EN.GHG.CO2.RT.GDP.KD
#> 6366  EN.GHG.CO2.RT.GDP.PP.KD
#> 6453        ER.GDP.FWTL.M3.KD
#> 12472       NY.GDP.COAL.RT.ZS
#>                                                                                                   name
#> 6243                                       GDP per unit of energy use (PPP $ per kg of oil equivalent)
#> 6244                         GDP per unit of energy use (constant 2021 PPP $ per kg of oil equivalent)
#> 6365                                    Carbon intensity of GDP (kg CO2e per constant 2015 US$ of GDP)
#> 6366                                           Carbon intensity of GDP (kg CO2e per 2021 PPP $ of GDP)
#> 6453  Water productivity, total (constant 2015 US$ GDP per cubic meter of total freshwater withdrawal)
#> 12472                                                                            Coal rents (% of GDP)
#>       unit source_id                 source_value
#> 6243  <NA>         2 World Development Indicators
#> 6244  <NA>         2 World Development Indicators
#> 6365  <NA>         2 World Development Indicators
#> 6366  <NA>         2 World Development Indicators
#> 6453  <NA>         2 World Development Indicators
#> 12472 <NA>         2 World Development Indicators
#>                                                                                                                                                                                                                                                                                                                                           source_note
#> 6243  GDP per unit of energy use is the PPP GDP per kilogram of oil equivalent of energy use. PPP GDP is gross domestic product converted to current international dollars using purchasing power parity rates based on the 2017 ICP round. An international dollar has the same purchasing power over GDP as a U.S. dollar has in the United States.
#> 6244                        GDP per unit of energy use is the PPP GDP per kilogram of oil equivalent of energy use. PPP GDP is gross domestic product converted to 2021 constant international dollars using purchasing power parity rates. An international dollar has the same purchasing power over GDP as a U.S. dollar has in the United States.
#> 6365                                                                                                                                    Annual emissions of carbon dioxide (CO2), one of the six Kyoto greenhouse gases (GHG), from the agriculture, energy, waste, and industrial sectors, excluding LULUCF divided by the GDP in constant 2021 US$.
#> 6366                                                                                                                                           Annual emissions of carbon dioxide (CO2), one of the six Kyoto greenhouse gases (GHG), from the agriculture, energy, waste, and industrial sectors, excluding LULUCF divided by the GDP in 2021 PPP $.
#> 6453                                                                                                                                                                                                                                             Water productivity is calculated as GDP in constant prices divided by annual total water withdrawal.
#> 12472                                                                                                                                                                                                      Coal rents are the difference between the value of both hard and soft coal production at world prices and their total costs of production.
#>                                                                                                                                                                                                                                                                                                                                                                   source_organization
#> 6243                                                                                                                                                                                                                                                                  IEA Statistics © OECD/IEA 2014 (https://www.iea.org/data-and-statistics), subject to https://www.iea.org/terms/
#> 6244                                                                                                                                                                                                                                                                  IEA Statistics © OECD/IEA 2014 (https://www.iea.org/data-and-statistics), subject to https://www.iea.org/terms/
#> 6365  EDGAR (Emissions Database for Global Atmospheric Research) Community GHG Database, a collaboration between the European Commission, Joint Research Centre (JRC), the International Energy Agency (IEA), and comprising IEA-EDGAR CO2, EDGAR CH4, EDGAR N2O, EDGAR F-GASES version 8.0, (2023) European Commission, JRC (Datasets). https://edgar.jrc.ec.europa.eu/dataset_ghg80
#> 6366  EDGAR (Emissions Database for Global Atmospheric Research) Community GHG Database, a collaboration between the European Commission, Joint Research Centre (JRC), the International Energy Agency (IEA), and comprising IEA-EDGAR CO2, EDGAR CH4, EDGAR N2O, EDGAR F-GASES version 8.0, (2023) European Commission, JRC (Datasets). https://edgar.jrc.ec.europa.eu/dataset_ghg80
#> 6453                                                                                                                                                                                                                                                                                         Food and Agriculture Organization, AQUASTAT data, and World Bank and OECD GDP estimates.
#> 12472                                                                                                                                                                                                                                                           World Bank staff estimates based on sources and methods described in the World Bank's The Changing Wealth of Nations.
#>       topic_id     topic_value
#> 6243         5 Energy & Mining
#> 6244         5 Energy & Mining
#> 6365         6     Environment
#> 6366         6     Environment
#> 6453         6     Environment
#> 12472        6     Environment

# fetch indicator data for specific or all countries (default)
gdp <- wb_country_indicator("NY.GDP.MKTP.CD", c("US", "DE", "FR", "CH", "JP"))
head(gdp)
#>   date   indicator_id    indicator_name country_id country_name country_code
#> 1 2023 NY.GDP.MKTP.CD GDP (current US$)         CH  Switzerland          CHE
#> 2 2022 NY.GDP.MKTP.CD GDP (current US$)         CH  Switzerland          CHE
#> 3 2021 NY.GDP.MKTP.CD GDP (current US$)         CH  Switzerland          CHE
#> 4 2020 NY.GDP.MKTP.CD GDP (current US$)         CH  Switzerland          CHE
#> 5 2019 NY.GDP.MKTP.CD GDP (current US$)         CH  Switzerland          CHE
#> 6 2018 NY.GDP.MKTP.CD GDP (current US$)         CH  Switzerland          CHE
#>          value unit obs_status decimal
#> 1 884940402230 <NA>       <NA>       0
#> 2 818426550206 <NA>       <NA>       0
#> 3 813408787222 <NA>       <NA>       0
#> 4 741999406006 <NA>       <NA>       0
#> 5 721369112727 <NA>       <NA>       0
#> 6 725568717468 <NA>       <NA>       0
```

<img src="man/figures/README-plotting-1.png" width="100%" />

## Related work

- [wbstats](https://github.com/gshs-ornl/wbstats): R package for
  searching and downloading data from the World Bank API
- [WDI](https://github.com/vincentarelbundock/WDI): R package to
  download World Bank data
- [pipr](https://github.com/worldbank/pipr): R client for the PIP
  Worldbank API
