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
  nowcast = FALSE,
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

- fill_gaps:

  (`logical(1)`)  
  Whether to fill gaps in the data. Default `FALSE`.

- nowcast:

  (`logical(1)`)  
  Whether to include nowcast estimates. Requires `fill_gaps = TRUE`.
  Default `FALSE`.

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
#> 3                    3      2005 - 2022         2.15 0.2569214  0.08248161
#> 4                    3      2005 - 2022         2.15 0.2387424  0.07672129
#> 5                    3      2005 - 2022         2.15 0.1619627  0.04706846
#> 6                    3      2005 - 2022         2.15 0.1624460  0.04981655
#>   poverty_severity      watts      mean   median       mld      gini
#> 1       0.05086701 0.15449681  7.673708 3.507063 0.6366259 0.5933394
#> 2       0.06637223 0.19243840  6.555038 3.185121 0.5999924 0.5776966
#> 3       0.03667323 0.11309852 10.141722 3.736653 0.7832459 0.6500103
#> 4       0.03433840 0.10555018 10.465250 4.190742 0.7273998 0.6251803
#> 5       0.01994215 0.06367754 12.305911 5.260122 0.6841203 0.6087314
#> 6       0.02199264 0.06802333 11.572519 5.196361 0.6517375 0.5963908
#>   polarization     decile1    decile2    decile3    decile4    decile5
#> 1    0.7147437 0.012500158 0.01696966 0.02260853 0.02990889 0.03968160
#> 2    0.6770340 0.012816826 0.01782763 0.02403983 0.03193381 0.04229243
#> 3    0.7533419 0.009981601 0.01578296 0.02081620 0.02612687 0.03292327
#> 4    0.7795235 0.009851315 0.01589892 0.02117398 0.02727510 0.03518300
#> 5    0.7398813 0.010337841 0.01679024 0.02268927 0.02915487 0.03760232
#> 6    0.7045509 0.010506335 0.01783890 0.02411633 0.03077615 0.03947990
#>      decile6    decile7    decile8   decile9  decile10       cpi      ppp
#> 1 0.05336964 0.07383648 0.10780574 0.1767219 0.4665975 0.2138148 7.524514
#> 2 0.05649406 0.07724597 0.11084411 0.1772000 0.4493053 0.3644379 7.524514
#> 3 0.04177270 0.05619889 0.08466862 0.1665420 0.5451869 0.4457968 7.524514
#> 4 0.04631718 0.06473768 0.09839545 0.1803587 0.5008087 0.5473402 7.524514
#> 5 0.04947219 0.06777731 0.10163055 0.1828016 0.4817438 0.6109178 7.524514
#> 6 0.05164180 0.07070396 0.10514788 0.1798380 0.4699508 0.7600676 7.524514
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
#> 3          survey 3.168 0.4299225  9.742785            NA
#> 4          survey 3.395 0.4199089  9.177744            NA
#> 5          survey 3.930 0.3867875  7.435916            NA
#> 6          survey 3.898 0.3891268  7.564706            NA
# }
```
