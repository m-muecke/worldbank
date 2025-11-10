# Return information about the API

Return information about the API

## Usage

``` r
pip_info()
```

## Source

<https://pip.worldbank.org/api>

## Value

A [`data.frame()`](https://rdrr.io/r/base/data.frame.html) with the API
information.

## See also

Other poverty and inequality statistics:
[`pip_aux()`](https://m-muecke.github.io/worldbank/reference/pip_aux.md),
[`pip_citation()`](https://m-muecke.github.io/worldbank/reference/pip_citation.md),
[`pip_data()`](https://m-muecke.github.io/worldbank/reference/pip_data.md),
[`pip_group()`](https://m-muecke.github.io/worldbank/reference/pip_group.md),
[`pip_health_check()`](https://m-muecke.github.io/worldbank/reference/pip_health_check.md),
[`pip_valid_params()`](https://m-muecke.github.io/worldbank/reference/pip_valid_params.md),
[`pip_versions()`](https://m-muecke.github.io/worldbank/reference/pip_versions.md)

## Examples

``` r
# \donttest{
pip_info()
#> $available_data_versions
#> $available_data_versions[[1]]
#> [1] "20250930_2021_01_02_PROD"
#> 
#> $available_data_versions[[2]]
#> [1] "20250930_2017_01_02_PROD"
#> 
#> $available_data_versions[[3]]
#> [1] "20250401_2021_01_02_PROD"
#> 
#> $available_data_versions[[4]]
#> [1] "20250401_2017_01_02_PROD"
#> 
#> $available_data_versions[[5]]
#> [1] "20240627_2017_01_02_PROD"
#> 
#> $available_data_versions[[6]]
#> [1] "20240627_2011_02_02_PROD"
#> 
#> $available_data_versions[[7]]
#> [1] "20240326_2017_01_02_PROD"
#> 
#> $available_data_versions[[8]]
#> [1] "20240326_2011_02_02_PROD"
#> 
#> $available_data_versions[[9]]
#> [1] "20230919_2017_01_02_PROD"
#> 
#> $available_data_versions[[10]]
#> [1] "20230919_2011_02_02_PROD"
#> 
#> $available_data_versions[[11]]
#> [1] "20230328_2017_01_02_PROD"
#> 
#> $available_data_versions[[12]]
#> [1] "20230328_2011_02_02_PROD"
#> 
#> $available_data_versions[[13]]
#> [1] "20220909_2017_01_02_PROD"
#> 
#> $available_data_versions[[14]]
#> [1] "20220909_2011_02_02_PROD"
#> 
#> 
#> $pip_packages
#> $pip_packages$pipapi
#> $pip_packages$pipapi$pkg_version
#> $pip_packages$pipapi$pkg_version[[1]]
#> [1] "1.4.1.9018"
#> 
#> 
#> $pip_packages$pipapi$pkg_hash
#> $pip_packages$pipapi$pkg_hash[[1]]
#> [1] "e8ba3efa0070ed06a0eab0270d654156705a59d1"
#> 
#> 
#> 
#> $pip_packages$wbpip
#> $pip_packages$wbpip$pkg_version
#> $pip_packages$wbpip$pkg_version[[1]]
#> [1] "0.1.6"
#> 
#> 
#> $pip_packages$wbpip$pkg_hash
#> $pip_packages$wbpip$pkg_hash[[1]]
#> [1] "fd2c687ed527ebe33d0a7addf9859f72f71ff39f"
#> 
#> 
#> 
#> 
#> $other_packages
#> $other_packages[[1]]
#> [1] "arrow_21.0.0.1"
#> 
#> $other_packages[[2]]
#> [1] "assertthat_0.2.1"
#> 
#> $other_packages[[3]]
#> [1] "bit_4.6.0"
#> 
#> $other_packages[[4]]
#> [1] "bit64_4.6.0-1"
#> 
#> $other_packages[[5]]
#> [1] "cachem_1.1.0"
#> 
#> $other_packages[[6]]
#> [1] "cli_3.6.5"
#> 
#> $other_packages[[7]]
#> [1] "collapse_2.1.3"
#> 
#> $other_packages[[8]]
#> [1] "compiler_4.3.2"
#> 
#> $other_packages[[9]]
#> [1] "crayon_1.5.3"
#> 
#> $other_packages[[10]]
#> [1] "data.table_1.17.8"
#> 
#> $other_packages[[11]]
#> [1] "DBI_1.2.3"
#> 
#> $other_packages[[12]]
#> [1] "duckdb_1.4.0"
#> 
#> $other_packages[[13]]
#> [1] "fastmap_1.2.0"
#> 
#> $other_packages[[14]]
#> [1] "fs_1.6.6"
#> 
#> $other_packages[[15]]
#> [1] "fst_0.9.8"
#> 
#> $other_packages[[16]]
#> [1] "glue_1.8.0"
#> 
#> $other_packages[[17]]
#> [1] "hms_1.1.3"
#> 
#> $other_packages[[18]]
#> [1] "httpuv_1.6.16"
#> 
#> $other_packages[[19]]
#> [1] "joyn_0.2.4"
#> 
#> $other_packages[[20]]
#> [1] "jsonlite_2.0.0"
#> 
#> $other_packages[[21]]
#> [1] "later_1.4.4"
#> 
#> $other_packages[[22]]
#> [1] "lifecycle_1.0.4"
#> 
#> $other_packages[[23]]
#> [1] "magrittr_2.0.4"
#> 
#> $other_packages[[24]]
#> [1] "MASS_7.3-60"
#> 
#> $other_packages[[25]]
#> [1] "memoise_2.0.1"
#> 
#> $other_packages[[26]]
#> [1] "parallel_4.3.2"
#> 
#> $other_packages[[27]]
#> [1] "pillar_1.11.1"
#> 
#> $other_packages[[28]]
#> [1] "pkgconfig_2.0.3"
#> 
#> $other_packages[[29]]
#> [1] "promises_1.3.3"
#> 
#> $other_packages[[30]]
#> [1] "purrr_1.1.0"
#> 
#> $other_packages[[31]]
#> [1] "qs_0.27.3"
#> 
#> $other_packages[[32]]
#> [1] "R.methodsS3_1.8.2"
#> 
#> $other_packages[[33]]
#> [1] "R.oo_1.27.1"
#> 
#> $other_packages[[34]]
#> [1] "R.utils_2.13.0"
#> 
#> $other_packages[[35]]
#> [1] "R6_2.6.1"
#> 
#> $other_packages[[36]]
#> [1] "RApiSerialize_0.1.4"
#> 
#> $other_packages[[37]]
#> [1] "rappdirs_0.3.3"
#> 
#> $other_packages[[38]]
#> [1] "Rcpp_1.1.0"
#> 
#> $other_packages[[39]]
#> [1] "RcppParallel_5.1.11-1"
#> 
#> $other_packages[[40]]
#> [1] "readr_2.1.5"
#> 
#> $other_packages[[41]]
#> [1] "rlang_1.1.6"
#> 
#> $other_packages[[42]]
#> [1] "stringfish_0.17.0"
#> 
#> $other_packages[[43]]
#> [1] "stringi_1.8.7"
#> 
#> $other_packages[[44]]
#> [1] "swagger_5.17.14.1"
#> 
#> $other_packages[[45]]
#> [1] "tibble_3.3.0"
#> 
#> $other_packages[[46]]
#> [1] "tidyselect_1.2.1"
#> 
#> $other_packages[[47]]
#> [1] "tools_4.3.2"
#> 
#> $other_packages[[48]]
#> [1] "triebeard_0.4.1"
#> 
#> $other_packages[[49]]
#> [1] "tzdb_0.5.0"
#> 
#> $other_packages[[50]]
#> [1] "urltools_1.7.3.1"
#> 
#> $other_packages[[51]]
#> [1] "vctrs_0.6.5"
#> 
#> $other_packages[[52]]
#> [1] "vroom_1.6.6"
#> 
#> $other_packages[[53]]
#> [1] "webutils_1.2.2"
#> 
#> $other_packages[[54]]
#> [1] "yaml_2.3.10"
#> 
#> 
#> $r_version
#> $r_version[[1]]
#> [1] "R version 4.3.2 (2023-10-31)"
#> 
#> 
#> $server_os
#> $server_os[[1]]
#> [1] "Red Hat Enterprise Linux 8.10 (Ootpa)"
#> 
#> 
#> $server_time
#> $server_time[[1]]
#> [1] "2025-11-10 11:36:00"
#> 
#> 
# }
```
