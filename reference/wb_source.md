# World Bank source data

List all sources supported by the World Bank API.

## Usage

``` r
wb_source(source = NULL, lang = "en")
```

## Source

<https://api.worldbank.org/v2/sources>

## Arguments

- source:

  (`NULL` \| [`character()`](https://rdrr.io/r/base/character.html))  
  Source to query. Default `NULL`. If `NULL`, all sources are returned.

- lang:

  (`character(1)`)  
  Language to query. Default `"en"`.

## Value

A [`data.frame()`](https://rdrr.io/r/base/data.frame.html) with the
available sources. The columns are:

- `id`: The source ID.

- `last_updated`: The date the source was last updated.

- `name`: The source name.

- `code`: The source code.

- `description`: The source description.

- `url`: The source URL.

- `data_availability`: Whether the source has data available.

- `metadata_availability`: Whether the source has metadata available.

- `concepts`: The concepts associated with the source.

## See also

Other indicators data:
[`wb_country()`](https://m-muecke.github.io/worldbank/reference/wb_country.md),
[`wb_income_level()`](https://m-muecke.github.io/worldbank/reference/wb_income_level.md),
[`wb_indicator()`](https://m-muecke.github.io/worldbank/reference/wb_indicator.md),
[`wb_language()`](https://m-muecke.github.io/worldbank/reference/wb_language.md),
[`wb_lending_type()`](https://m-muecke.github.io/worldbank/reference/wb_lending_type.md),
[`wb_region()`](https://m-muecke.github.io/worldbank/reference/wb_region.md),
[`wb_topic()`](https://m-muecke.github.io/worldbank/reference/wb_topic.md)

## Examples

``` r
# \donttest{
src <- wb_source()
#> Error in req_perform(req_wb_cache(req_wb_retry(req_error(req_url_query(req_url_path_append(req_user_agent(request("https://api.worldbank.org/v2"),     wb_user_agent()), lang, resource), ..., format = "json",     per_page = per_page), is_error = is_wb_error, body = wb_error_body)))): HTTP 502 Bad Gateway.
head(src)
#> Error: object 'src' not found
# }
```
