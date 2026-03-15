# Return country profile data

Return country profile data

## Usage

``` r
pip_cp(
  country = NULL,
  povline = 2.15,
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

- povline:

  (`numeric(1)`)  
  Poverty line to be used to compute poverty measures. Poverty lines are
  only accepted up to 3 decimals. Default `2.15`.

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

A [`data.frame()`](https://rdrr.io/r/base/data.frame.html) with country
profile statistics including headcount ratios, inequality measures, and
demographic breakdowns.

## See also

Other poverty and inequality statistics:
[`pip_aux()`](https://m-muecke.github.io/worldbank/reference/pip_aux.md),
[`pip_citation()`](https://m-muecke.github.io/worldbank/reference/pip_citation.md),
[`pip_data()`](https://m-muecke.github.io/worldbank/reference/pip_data.md),
[`pip_group()`](https://m-muecke.github.io/worldbank/reference/pip_group.md),
[`pip_health_check()`](https://m-muecke.github.io/worldbank/reference/pip_health_check.md),
[`pip_info()`](https://m-muecke.github.io/worldbank/reference/pip_info.md),
[`pip_valid_params()`](https://m-muecke.github.io/worldbank/reference/pip_valid_params.md),
[`pip_versions()`](https://m-muecke.github.io/worldbank/reference/pip_versions.md)

## Examples

``` r
# \donttest{
cp <- pip_cp("ZAF")
head(cp)
#>   country_code reporting_year poverty_line headcount    gini.x welfare_time
#> 1          ZAF           1993           NA        NA        NA      1993.00
#> 2          ZAF           2000           NA        NA        NA      2000.75
#> 3          ZAF           2005           NA        NA        NA      2005.00
#> 4          ZAF           2008           NA        NA        NA      2008.67
#> 5          ZAF           2010           NA        NA        NA      2010.00
#> 6          ZAF           2014         2.15 0.1981366 0.6302572      2014.83
#>   survey_coverage is_interpolated survey_acronym survey_comparability
#> 1               N           FALSE           KIDS                    0
#> 2               N           FALSE           HIES                    2
#> 3               N           FALSE            IES                    3
#> 4               N           FALSE            LCS                    3
#> 5               N           FALSE            IES                    3
#> 6               N           FALSE            LCS                    3
#>   comparable_spell welfare_type headcount_ipl headcount_lmicpl headcount_umicpl
#> 1             1993         CONS     0.4540300        0.5670900        0.7588900
#> 2             2000         CONS     0.4869700        0.6004500        0.7901000
#> 3      2005 - 2014         CONS     0.4303764        0.5695617        0.7595399
#> 4      2005 - 2014         CONS     0.3120983        0.4493806        0.6760894
#> 5      2005 - 2014         CONS     0.3040549        0.4362340        0.6642118
#> 6      2005 - 2014         CONS     0.3200362        0.4533112        0.6677979
#>   headcount_national headcount_national_footnote    gini.y     theil
#> 1                 NA                          NA 0.5933394        NA
#> 2                 NA                          NA 0.5776966        NA
#> 3              0.666                           1 0.6476209 0.8674991
#> 4              0.621                           1 0.6300900 0.7911583
#> 5              0.532                           1 0.6338269 0.7907242
#> 6              0.555                           1 0.6302580 0.7790964
#>   share_b40_female share_t60_female share_b40_male share_t60_male
#> 1               NA               NA             NA             NA
#> 2               NA               NA             NA             NA
#> 3               NA               NA             NA             NA
#> 4               NA               NA             NA             NA
#> 5               NA               NA             NA             NA
#> 6        0.4169467        0.5830532      0.3822711      0.6177289
#>   share_b40_rural share_t60_rural share_b40_urban share_t60_urban
#> 1              NA              NA              NA              NA
#> 2              NA              NA              NA              NA
#> 3              NA              NA              NA              NA
#> 4              NA              NA              NA              NA
#> 5              NA              NA              NA              NA
#> 6       0.6543594       0.3456406       0.2538252       0.7461749
#>   share_b40agecat_0_14 share_t60agecat_0_14 share_b40agecat_15_64
#> 1                   NA                   NA                    NA
#> 2                   NA                   NA                    NA
#> 3                   NA                   NA                    NA
#> 4                   NA                   NA                    NA
#> 5                   NA                   NA                    NA
#> 6            0.5139337            0.4860663             0.3545554
#>   share_t60agecat_15_64 share_b40agecat_65p share_t60agecat_65p
#> 1                    NA                  NA                  NA
#> 2                    NA                  NA                  NA
#> 3                    NA                  NA                  NA
#> 4                    NA                  NA                  NA
#> 5                    NA                  NA                  NA
#> 6             0.6454446           0.3012934           0.6987066
#>   share_b40edu_noedu share_t60edu_noedu share_b40edu_pri share_t60edu_pri
#> 1                 NA                 NA               NA               NA
#> 2                 NA                 NA               NA               NA
#> 3                 NA                 NA               NA               NA
#> 4                 NA                 NA               NA               NA
#> 5                 NA                 NA               NA               NA
#> 6           0.616284           0.383716         0.545761         0.454239
#>   share_b40edu_sec share_t60edu_sec share_b40edu_ter share_t60edu_ter datatype
#> 1               NA               NA               NA               NA       NA
#> 2               NA               NA               NA               NA       NA
#> 3               NA               NA               NA               NA       NA
#> 4               NA               NA               NA               NA       NA
#> 5               NA               NA               NA               NA       NA
#> 6        0.3552169        0.6447831        0.0555131        0.9444869        1
#>   display_cp mpm_education_attainment mpm_education_enrollment mpm_electricity
#> 1         NA                       NA                       NA              NA
#> 2         NA                       NA                       NA              NA
#> 3         NA                       NA                       NA              NA
#> 4         NA                       NA                       NA              NA
#> 5         NA                       NA                       NA              NA
#> 6          1                0.0220896                0.0233865       0.0409385
#>   mpm_sanitation mpm_water mpm_monetary mpm_headcount mpm_venn1 mpm_venn2
#> 1             NA        NA           NA            NA        NA        NA
#> 2             NA        NA           NA            NA        NA        NA
#> 3             NA        NA           NA            NA        NA        NA
#> 4             NA        NA           NA            NA        NA        NA
#> 5             NA        NA           NA            NA        NA        NA
#> 6      0.3517148 0.1036116    0.3122781     0.3200449 0.0120041 0.1660777
#>   mpm_venn3 mpm_venn4 mpm_venn5 mpm_venn6 mpm_venn7 mpm_venn8
#> 1        NA        NA        NA        NA        NA        NA
#> 2        NA        NA        NA        NA        NA        NA
#> 3        NA        NA        NA        NA        NA        NA
#> 4        NA        NA        NA        NA        NA        NA
#> 5        NA        NA        NA        NA        NA        NA
#> 6 0.0083156  0.003853 0.1258807   6.5e-05 0.0038489 0.6799551
# }
```
