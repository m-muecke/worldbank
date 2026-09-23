# Return aggregation of PIP statistics

Return aggregation of PIP statistics

## Usage

``` r
pip_group(
  country = NULL,
  year = NULL,
  povline = NULL,
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

  (`NULL` \| `numeric(1)`)  
  Poverty line to be used to compute poverty measures, between `0` and
  `2700`. Poverty lines are only accepted up to 3 decimals. Default
  `NULL`, which uses the international poverty line of the requested
  `ppp_version`, e.g. `3` for 2021 PPPs and `2.15` for 2017 PPPs.

- popshare:

  (`NULL` \| `numeric(1)`)  
  Proportion of the population living below the poverty line, between
  `0` and `1`. Takes precedence over `povline`: if both are supplied,
  the poverty line is derived from `popshare`. Default `NULL`.

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
  Level of reporting for the statistics. Default `"all"`.

- additional_ind:

  (`logical(1)`)  
  Whether to include additional indicators. Default `FALSE`.

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
#> 1         AFE Eastern and Southern Africa           1981            3
#> 2         AFE Eastern and Southern Africa           1982            3
#> 3         AFE Eastern and Southern Africa           1983            3
#> 4         AFE Eastern and Southern Africa           1984            3
#> 5         AFE Eastern and Southern Africa           1985            3
#> 6         AFE Eastern and Southern Africa           1986            3
#>   reporting_pop headcount poverty_gap poverty_severity     watts     mean
#> 1     238043099 0.5965929   0.2791532        0.1630652 0.4471287 4.620314
#> 2     245822010 0.5994378   0.2823006        0.1657086 0.4540460 4.564970
#> 3     253644643 0.6061125   0.2888617        0.1712578 0.4685138 4.484695
#> 4     261458202 0.6152549   0.2951063        0.1756477 0.4801159 4.429398
#> 5     269450407 0.6226119   0.3001387        0.1790228 0.4888074 4.362157
#> 6     277621771 0.6176100   0.2963107        0.1765062 0.4825891 4.388316
#>         spr       pg pop_in_poverty estimate_type
#> 1 0.6201646 15.83368      142014821    projection
#> 2 0.6222839 16.05505      147355011    projection
#> 3 0.6273182 16.50500      153737190    projection
#> 4 0.6352590 16.81880      160863442    projection
#> 5 0.6408765 17.02746      167763017    projection
#> 6 0.6360982 16.91017      171461969    projection
# }
```
