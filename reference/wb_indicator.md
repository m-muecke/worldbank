# World Bank indicator data

List all indicators supported by the World Bank API.

## Usage

``` r
wb_indicator(indicator = NULL, lang = "en")
```

## Source

<https://api.worldbank.org/v2/indicator>

## Arguments

- indicator:

  (`NULL` \| `character(1)`)  
  Indicator to query. Default `NULL`. If `NULL`, all indicators are
  returned.

- lang:

  (`character(1)`)  
  Language to query. Default `"en"`.

## Value

A [`data.frame()`](https://rdrr.io/r/base/data.frame.html) with the
available indicators. The columns are:

- `id`: The indicator ID.

- `name`: The indicator name.

- `unit`: The indicator unit.

- `source_id`: The source ID.

- `source_value`: The source value.

- `source_note`: The source note.

- `source_organization`: The source organization.

- `topic_id`: The topic ID.

- `topic_value`: The topic value.

## See also

Other indicators data:
[`wb_country()`](https://m-muecke.github.io/worldbank/reference/wb_country.md),
[`wb_income_level()`](https://m-muecke.github.io/worldbank/reference/wb_income_level.md),
[`wb_language()`](https://m-muecke.github.io/worldbank/reference/wb_language.md),
[`wb_lending_type()`](https://m-muecke.github.io/worldbank/reference/wb_lending_type.md),
[`wb_region()`](https://m-muecke.github.io/worldbank/reference/wb_region.md),
[`wb_source()`](https://m-muecke.github.io/worldbank/reference/wb_source.md),
[`wb_topic()`](https://m-muecke.github.io/worldbank/reference/wb_topic.md)

## Examples

``` r
# \donttest{
wb_indicator("NY.GDP.MKTP.CD")
#> Error in req_perform(req_wb_cache(req_wb_retry(req_error(req_url_query(req_url_path_append(req_user_agent(request("https://api.worldbank.org/v2"),     wb_user_agent()), lang, resource), ..., format = "json",     per_page = per_page), is_error = is_wb_error, body = wb_error_body)))): HTTP 502 Bad Gateway.
# }
```
