# Return valid query parameters

Return valid query parameters

## Usage

``` r
pip_valid_params(
  endpoint = c("all", "aux", "pip", "pip-grp", "pip-info", "valid-params"),
  release_version = NULL,
  ppp_version = NULL,
  version = NULL
)
```

## Source

<https://pip.worldbank.org/api>

## Arguments

- endpoint:

  (`character(1)`)  
  Endpoint for which valid parameters are to be returned. Default
  `"all"`.

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

A [`data.frame()`](https://rdrr.io/r/base/data.frame.html) with the
valid parameters.

## See also

Other poverty and inequality statistics:
[`pip_aux()`](https://m-muecke.github.io/worldbank/reference/pip_aux.md),
[`pip_citation()`](https://m-muecke.github.io/worldbank/reference/pip_citation.md),
[`pip_data()`](https://m-muecke.github.io/worldbank/reference/pip_data.md),
[`pip_group()`](https://m-muecke.github.io/worldbank/reference/pip_group.md),
[`pip_health_check()`](https://m-muecke.github.io/worldbank/reference/pip_health_check.md),
[`pip_info()`](https://m-muecke.github.io/worldbank/reference/pip_info.md),
[`pip_versions()`](https://m-muecke.github.io/worldbank/reference/pip_versions.md)

## Examples

``` r
# \donttest{
params <- pip_valid_params()
head(params)
#>   param_names param_values param_boundaries param_types
#> 1     country          ALL             <NA>   character
#> 2     country          AFE             <NA>   character
#> 3     country          AFW             <NA>   character
#> 4     country          AGO             <NA>   character
#> 5     country          ALB             <NA>   character
#> 6     country          ARE             <NA>   character
# }
```
