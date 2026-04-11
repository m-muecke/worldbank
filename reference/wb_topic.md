# World Bank topic data

List all topics supported by the World Bank API.

## Usage

``` r
wb_topic(topic = NULL, lang = "en")
```

## Source

<https://api.worldbank.org/v2/topics>

## Arguments

- topic:

  (`NULL` \| [`character()`](https://rdrr.io/r/base/character.html))  
  Topic to query. Default `NULL`. If `NULL`, all topics are returned.

- lang:

  (`character(1)`)  
  Language to query. Default `"en"`.

## Value

A [`data.frame()`](https://rdrr.io/r/base/data.frame.html) with the
available topics. The columns are:

- `id`: The topic ID.

- `value`: The topic value.

- `source_note`: The source note.

## See also

Other indicators data:
[`wb_country()`](https://m-muecke.github.io/worldbank/reference/wb_country.md),
[`wb_income_level()`](https://m-muecke.github.io/worldbank/reference/wb_income_level.md),
[`wb_indicator()`](https://m-muecke.github.io/worldbank/reference/wb_indicator.md),
[`wb_language()`](https://m-muecke.github.io/worldbank/reference/wb_language.md),
[`wb_lending_type()`](https://m-muecke.github.io/worldbank/reference/wb_lending_type.md),
[`wb_region()`](https://m-muecke.github.io/worldbank/reference/wb_region.md),
[`wb_source()`](https://m-muecke.github.io/worldbank/reference/wb_source.md)

## Examples

``` r
# \donttest{
topic <- wb_topic()
#> Error in req_perform(req_wb_cache(req_wb_retry(req_error(req_url_query(req_url_path_append(req_user_agent(request("https://api.worldbank.org/v2"),     wb_user_agent()), lang, resource), ..., format = "json",     per_page = per_page), is_error = is_wb_error, body = wb_error_body)))): HTTP 502 Bad Gateway.
head(topic)
#> Error: object 'topic' not found
# }
```
