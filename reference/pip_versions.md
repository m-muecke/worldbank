# Return the available data versions

Return the available data versions

## Usage

``` r
pip_versions()
```

## Source

<https://pip.worldbank.org/api>

## Value

A [`data.frame()`](https://rdrr.io/r/base/data.frame.html) with the
available versions.

## See also

Other poverty and inequality statistics:
[`pip_aux()`](https://m-muecke.github.io/worldbank/reference/pip_aux.md),
[`pip_citation()`](https://m-muecke.github.io/worldbank/reference/pip_citation.md),
[`pip_cp()`](https://m-muecke.github.io/worldbank/reference/pip_cp.md),
[`pip_data()`](https://m-muecke.github.io/worldbank/reference/pip_data.md),
[`pip_group()`](https://m-muecke.github.io/worldbank/reference/pip_group.md),
[`pip_health_check()`](https://m-muecke.github.io/worldbank/reference/pip_health_check.md),
[`pip_info()`](https://m-muecke.github.io/worldbank/reference/pip_info.md),
[`pip_valid_params()`](https://m-muecke.github.io/worldbank/reference/pip_valid_params.md)

## Examples

``` r
# \donttest{
vers <- pip_versions()
head(vers)
#>                    version release_version ppp_version identity
#> 1 20260324_2021_01_02_PROD        20260324        2021     PROD
#> 2 20260324_2017_01_02_PROD        20260324        2017     PROD
#> 3 20250930_2021_01_02_PROD        20250930        2021     PROD
#> 4 20250930_2017_01_02_PROD        20250930        2017     PROD
#> 5 20250401_2021_01_02_PROD        20250401        2021     PROD
#> 6 20250401_2017_01_02_PROD        20250401        2017     PROD
# }
```
