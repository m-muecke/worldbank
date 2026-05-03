# World Bank WDI bulk download

Download the entire World Development Indicators dataset as a single zip
and return its contents as a list of data frames. Useful for
full-dataset analyses where paginating through
[`wb_data()`](https://m-muecke.github.io/worldbank/reference/wb_data.md)
would be slow, and for accessing footnote and series-time metadata that
the API does not expose.

## Usage

``` r
wb_bulk(timeout = 600L)
```

## Source

<https://databankfiles.worldbank.org/public/ddpext_download/WDI_CSV.zip>

## Arguments

- timeout:

  (`integer(1)`)  
  Maximum download time in seconds. Default `600`.

## Value

A named [`list()`](https://rdrr.io/r/base/list.html) of
[`data.frame()`](https://rdrr.io/r/base/data.frame.html)s:

- `data`: indicator values in long format with columns `country_name`,
  `country_code`, `indicator_name`, `indicator_code`, `year`, `value`.

- `country`: country metadata.

- `series`: series (indicator) metadata.

- `country_series`: country-series-specific notes.

- `series_time`: series-year-specific notes.

- `footnote`: footnotes per country, series, and year.

## Details

The download is roughly 280 MB compressed and may take a minute or more.

## See also

Other indicators data:
[`wb_country()`](https://m-muecke.github.io/worldbank/reference/wb_country.md),
[`wb_data()`](https://m-muecke.github.io/worldbank/reference/wb_data.md),
[`wb_income_level()`](https://m-muecke.github.io/worldbank/reference/wb_income_level.md),
[`wb_indicator()`](https://m-muecke.github.io/worldbank/reference/wb_indicator.md),
[`wb_language()`](https://m-muecke.github.io/worldbank/reference/wb_language.md),
[`wb_lending_type()`](https://m-muecke.github.io/worldbank/reference/wb_lending_type.md),
[`wb_region()`](https://m-muecke.github.io/worldbank/reference/wb_region.md),
[`wb_search()`](https://m-muecke.github.io/worldbank/reference/wb_search.md),
[`wb_source()`](https://m-muecke.github.io/worldbank/reference/wb_source.md),
[`wb_topic()`](https://m-muecke.github.io/worldbank/reference/wb_topic.md)

## Examples

``` r
if (FALSE) { # \dontrun{
wdi <- wb_bulk()
head(wdi$data)
} # }
```
