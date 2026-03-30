# Return aggregation of PIP statistics

Return aggregation of PIP statistics

## Usage

``` r
pip_group(
  country = NULL,
  year = NULL,
  povline = 2.15,
  popshare = NULL,
  group_by = c("wb", "none"),
  fill_gaps = FALSE,
  welfare_type = c("all", "consumption", "income"),
  reporting_level = c("all", "national", "rural", "urban"),
  additional_ind = FALSE,
  release_version = NULL,
  ppp_version = NULL,
  version = NULL
)
```

## Source

<https://pip.worldbank.org/api>

## Arguments

- country:

  (`NULL` \| [`character()`](https://rdrr.io/r/base/character.html))  
  Countries for which statistics are to be computed, specified as ISO3
  codes. Default `NULL`.

- year:

  (`NULL` \| [`character()`](https://rdrr.io/r/base/character.html) \|
  [`numeric()`](https://rdrr.io/r/base/numeric.html))  
  Years for which statistics are to be computed, specified as YYYY.
  Default `NULL`.

- povline:

  (`numeric(1)`)  
  Poverty line to be used to compute poverty measures. Poverty lines are
  only accepted up to 3 decimals. Default `2.15`.

- popshare:

  (`NULL` \| `numeric(1)`)  
  Proportion of the population living below the poverty line. Will be
  ignored if povline is specified. Default `NULL`.

- group_by:

  (`character(1)`)  
  Aggregate results by pre-defined sub-groups. Default `"wb"`.

- fill_gaps:

  (`logical(1)`)  
  Whether to fill gaps in the data. Default `FALSE`.

- welfare_type:

  (`character(1)`)  
  Type of welfare measure to be used. Default `"all"`.

- reporting_level:

  (`character(1)`)  
  level of reporting for the statistics. Default `"all"`.

- additional_ind:

  (`logical(1)`)  
  Whether to include additional indicators. Default `FALSE`.

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
requested statistics.

## See also

Other poverty and inequality statistics:
[`pip_aux()`](https://m-muecke.github.io/worldbank/reference/pip_aux.md),
[`pip_citation()`](https://m-muecke.github.io/worldbank/reference/pip_citation.md),
[`pip_cp()`](https://m-muecke.github.io/worldbank/reference/pip_cp.md),
[`pip_data()`](https://m-muecke.github.io/worldbank/reference/pip_data.md),
[`pip_health_check()`](https://m-muecke.github.io/worldbank/reference/pip_health_check.md),
[`pip_info()`](https://m-muecke.github.io/worldbank/reference/pip_info.md),
[`pip_valid_params()`](https://m-muecke.github.io/worldbank/reference/pip_valid_params.md),
[`pip_versions()`](https://m-muecke.github.io/worldbank/reference/pip_versions.md)

## Examples

``` r
# \donttest{
grp <- pip_group(c("AFE", "LAC"))
head(grp)
#>   region_code                 region_name reporting_year poverty_line
#> 1         AFE Eastern and Southern Africa           1981         2.15
#> 2         AFE Eastern and Southern Africa           1982         2.15
#> 3         AFE Eastern and Southern Africa           1983         2.15
#> 4         AFE Eastern and Southern Africa           1984         2.15
#> 5         AFE Eastern and Southern Africa           1985         2.15
#> 6         AFE Eastern and Southern Africa           1986         2.15
#>   reporting_pop headcount poverty_gap poverty_severity     watts     mean
#> 1     238043099 0.4491860   0.1803920       0.09601235 0.2722762 4.620314
#> 2     245822010 0.4529310   0.1833875       0.09820633 0.2780057 4.564970
#> 3     253644643 0.4610831   0.1896610       0.10285639 0.2900256 4.484695
#> 4     261458202 0.4703827   0.1947065       0.10595121 0.2985325 4.429398
#> 5     269450407 0.4785722   0.1986180       0.10817873 0.3045951 4.362157
#> 6     277621771 0.4720145   0.1955952       0.10661543 0.3003416 4.388316
#>         spr       pg pop_in_poverty estimate_type
#> 1 0.6201646 15.83368      106925621    projection
#> 2 0.6222839 16.05505      111340398    projection
#> 3 0.6273182 16.50500      116951254    projection
#> 4 0.6352590 16.81880      122985422    projection
#> 5 0.6408765 17.02746      128951486    projection
#> 6 0.6360982 16.91017      131041498    projection
# }
```
