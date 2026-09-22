# Search World Bank indicators

Search the indicator catalog returned by
[`wb_indicator()`](https://m-muecke.github.io/worldbank/reference/wb_indicator.md)
for a regular expression pattern across one or more text fields. By
default the match is case insensitive.

## Usage

``` r
wb_search(
  pattern,
  fields = c("id", "name", "source_note"),
  catalog = NULL,
  lang = "en",
  ignore.case = TRUE,
  source = NULL,
  ...
)
```

## Source

<https://api.worldbank.org/v2/indicator>

## Arguments

- pattern:

  (`character(1)`)  
  Regular expression to match.

- fields:

  ([`character()`](https://rdrr.io/r/base/character.html))  
  Columns of the indicator catalog to search, including the nested
  `topics` column. Default `c("id", "name", "source_note")`.

- catalog:

  (`NULL` \| [`data.frame()`](https://rdrr.io/r/base/data.frame.html))  
  Optional pre-fetched indicator catalog. If `NULL` (default),
  [`wb_indicator()`](https://m-muecke.github.io/worldbank/reference/wb_indicator.md)
  is called.

- lang:

  (`character(1)`)  
  Language to query. Only used when `catalog` is `NULL`. Default `"en"`.

- ignore.case:

  (`logical(1)`)  
  Whether the match should be case insensitive. Default `TRUE`.

- source:

  (`NULL` \| `integer(1)`)  
  ID of the source to query, as listed by
  [`wb_source()`](https://m-muecke.github.io/worldbank/reference/wb_source.md).
  Only used when `catalog` is `NULL`. Default `NULL`, which uses the API
  default.

- ...:

  (`any`)  
  Additional arguments passed to
  [`grepl()`](https://rdrr.io/r/base/grep.html).

## Value

A [`data.frame()`](https://rdrr.io/r/base/data.frame.html) with the
matching rows of the indicator catalog.

## See also

Other indicators data:
[`wb_bulk()`](https://m-muecke.github.io/worldbank/reference/wb_bulk.md),
[`wb_country()`](https://m-muecke.github.io/worldbank/reference/wb_country.md),
[`wb_data()`](https://m-muecke.github.io/worldbank/reference/wb_data.md),
[`wb_income_level()`](https://m-muecke.github.io/worldbank/reference/wb_income_level.md),
[`wb_indicator()`](https://m-muecke.github.io/worldbank/reference/wb_indicator.md),
[`wb_language()`](https://m-muecke.github.io/worldbank/reference/wb_language.md),
[`wb_lending_type()`](https://m-muecke.github.io/worldbank/reference/wb_lending_type.md),
[`wb_region()`](https://m-muecke.github.io/worldbank/reference/wb_region.md),
[`wb_source()`](https://m-muecke.github.io/worldbank/reference/wb_source.md),
[`wb_topic()`](https://m-muecke.github.io/worldbank/reference/wb_topic.md)

## Examples

``` r
# \donttest{
# search for indicators related to GDP
wb_search("GDP")
#> Error in vapply(.x, `[[`, .f, FUN.VALUE = .value, USE.NAMES = FALSE, ...): values must be length 1,
#>  but FUN(X[[1]]) result is length 0

# restrict the search to the indicator name
wb_search("unemployment", fields = "name")
#> Error in vapply(.x, `[[`, .f, FUN.VALUE = .value, USE.NAMES = FALSE, ...): values must be length 1,
#>  but FUN(X[[1]]) result is length 0

# search the topics associated with each indicator
wb_search("Climate Change", fields = "topics")
#> Error in vapply(.x, `[[`, .f, FUN.VALUE = .value, USE.NAMES = FALSE, ...): values must be length 1,
#>  but FUN(X[[1]]) result is length 0

# case-sensitive fixed-string match
wb_search("GDP", ignore.case = FALSE, fixed = TRUE)
#> Error in vapply(.x, `[[`, .f, FUN.VALUE = .value, USE.NAMES = FALSE, ...): values must be length 1,
#>  but FUN(X[[1]]) result is length 0
# }
```
