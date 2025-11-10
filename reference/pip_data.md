# Return main poverty and inequality statistics

Return main poverty and inequality statistics

## Usage

``` r
pip_data(
  country = NULL,
  year = NULL,
  povline = 2.15,
  popshare = NULL,
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
  Poverty line to be used to compute poverty mesures. Poverty lines are
  only accepted up to 3 decimals. Default `2.15`.

- popshare:

  (`NULL` \| `numeric(1)`)  
  Proportion of the population living below the poverty line. Will be
  ignored if povline is specified. Default `NULL`.

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
[`pip_group()`](https://m-muecke.github.io/worldbank/reference/pip_group.md),
[`pip_health_check()`](https://m-muecke.github.io/worldbank/reference/pip_health_check.md),
[`pip_info()`](https://m-muecke.github.io/worldbank/reference/pip_info.md),
[`pip_valid_params()`](https://m-muecke.github.io/worldbank/reference/pip_valid_params.md),
[`pip_versions()`](https://m-muecke.github.io/worldbank/reference/pip_versions.md)

## Examples

``` r
# \donttest{
data <- pip_data(c("ZAF", "ZMB"))
head(data)
#>          region_name region_code country_name country_code reporting_year
#> 1 Sub-Saharan Africa         SSF South Africa          ZAF           1993
#> 2 Sub-Saharan Africa         SSF South Africa          ZAF           2000
#> 3 Sub-Saharan Africa         SSF South Africa          ZAF           2005
#> 4 Sub-Saharan Africa         SSF South Africa          ZAF           2008
#> 5 Sub-Saharan Africa         SSF South Africa          ZAF           2010
#> 6 Sub-Saharan Africa         SSF South Africa          ZAF           2014
#>   reporting_level survey_acronym survey_coverage survey_year welfare_type
#> 1        national           KIDS        national     1993.00  consumption
#> 2        national           HIES        national     2000.75  consumption
#> 3        national            IES        national     2005.00  consumption
#> 4        national            LCS        national     2008.67  consumption
#> 5        national            IES        national     2010.00  consumption
#> 6        national            LCS        national     2014.83  consumption
#>   survey_comparability comparable_spell poverty_line headcount poverty_gap
#> 1                    0             1993         2.15 0.3277900  0.11517318
#> 2                    2             2000         2.15 0.3606700  0.13815964
#> 3                    3      2005 - 2014         2.15 0.2743531  0.08889369
#> 4                    3      2005 - 2014         2.15 0.1781907  0.05156310
#> 5                    3      2005 - 2014         2.15 0.1734140  0.05208539
#> 6                    3      2005 - 2014         2.15 0.1981366  0.06556677
#>   poverty_severity      watts      mean   median       mld      gini
#> 1       0.05086701 0.15449681  7.673708 3.507063 0.6366259 0.5933394
#> 2       0.06637223 0.19243840  6.555038 3.185121 0.5999924 0.5776966
#> 3       0.04027338 0.12318308  9.743641 3.619834 0.7781528 0.6476188
#> 4       0.02151527 0.06901188 12.305543 4.863325 0.7351245 0.6300900
#> 5       0.02241920 0.07094004 12.983699 5.089282 0.7526441 0.6338256
#> 6       0.03087331 0.09236196 12.224286 4.865342 0.7502296 0.6302572
#>   polarization     decile1    decile2    decile3    decile4    decile5
#> 1    0.7147437 0.012500158 0.01696966 0.02260853 0.02990889 0.03968160
#> 2    0.6770340 0.012816826 0.01782763 0.02403983 0.03193381 0.04229243
#> 3    0.7549428 0.009988388 0.01586569 0.02091390 0.02623093 0.03312265
#> 4    0.7609605 0.010057582 0.01602856 0.02129058 0.02735578 0.03503969
#> 5    0.7837881 0.009384292 0.01530752 0.02053135 0.02663764 0.03442381
#> 6    0.7876801 0.008574053 0.01507192 0.02074483 0.02708842 0.03505580
#>      decile6    decile7    decile8   decile9  decile10       cpi      ppp
#> 1 0.05336964 0.07383648 0.10780574 0.1767219 0.4665975 0.2138148 7.524514
#> 2 0.05649406 0.07724597 0.11084411 0.1772000 0.4493053 0.3644379 7.524514
#> 3 0.04201133 0.05651407 0.08522587 0.1679377 0.5421895 0.4457968 7.524514
#> 4 0.04551465 0.06298532 0.09485078 0.1743129 0.5125641 0.5473402 7.524514
#> 5 0.04529464 0.06279666 0.09618902 0.1768472 0.5125879 0.6109178 7.524514
#> 6 0.04650064 0.06531549 0.09957486 0.1771185 0.5049555 0.7600676 7.524514
#>   reporting_pop reporting_gdp reporting_pce is_interpolated distribution_type
#> 1      43297156      4193.598      2372.839           FALSE             group
#> 2      47465030      4700.876      2790.873           FALSE             group
#> 3      49490033      5406.076      3292.593           FALSE             micro
#> 4      51525923      6009.720      3738.485           FALSE             micro
#> 5      52344051      5953.945      3758.295           FALSE             micro
#> 6      56531658      6155.006      3887.509           FALSE             micro
#>   estimation_type   spl       spr        pg estimate_type
#> 1          survey 3.054 0.4524100 10.726072            NA
#> 2          survey 3.000 0.4791000 12.006065            NA
#> 3          survey 3.110 0.4365479 10.139765            NA
#> 4          survey 3.732 0.3929530  7.771608            NA
#> 5          survey 3.845 0.3939435  7.726541            NA
#> 6          survey 3.733 0.3992801  8.388849            NA
# }
```
