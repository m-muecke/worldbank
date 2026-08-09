# Return citation for a given version

Return citation for a given version

## Usage

``` r
pip_citation(release_version = NULL, ppp_version = NULL, version = NULL)
```

## Source

<https://pip.worldbank.org/api>

## Arguments

- release_version:

  (`NULL` \| `character(1)` \| `numeric(1)`)  
  Version of the data release in YYYYMMDD format. Default `NULL`.

- ppp_version:

  (`NULL` \| `character(1)` \| `numeric(1)`)  
  Version of the data in YYYY format. Default `NULL`.

- version:

  (`NULL` \| `character(1)`)  
  Version of the data. Default `NULL`.

## Value

A [`data.frame()`](https://rdrr.io/r/base/data.frame.html) with the
citation.

## See also

Other poverty and inequality statistics:
[`pip_aux()`](https://m-muecke.github.io/worldbank/reference/pip_aux.md),
[`pip_cp()`](https://m-muecke.github.io/worldbank/reference/pip_cp.md),
[`pip_data()`](https://m-muecke.github.io/worldbank/reference/pip_data.md),
[`pip_group()`](https://m-muecke.github.io/worldbank/reference/pip_group.md),
[`pip_health_check()`](https://m-muecke.github.io/worldbank/reference/pip_health_check.md),
[`pip_info()`](https://m-muecke.github.io/worldbank/reference/pip_info.md),
[`pip_valid_params()`](https://m-muecke.github.io/worldbank/reference/pip_valid_params.md),
[`pip_versions()`](https://m-muecke.github.io/worldbank/reference/pip_versions.md)

## Examples

``` r
# \donttest{
pip_citation()
#> Error in req_perform(req_url_query(req_error(req_url_path_append(wb_request("https://api.worldbank.org/pip/v1"),     resource), body = pip_error_body), format = format, ...)): HTTP 502 Bad Gateway.
# }
```
