# World Bank country data

List all countries supported by the World Bank API.

## Usage

``` r
wb_country(country = NULL, lang = "en")
```

## Source

<https://api.worldbank.org/v2/country>

## Arguments

- country:

  (`NULL` \| [`character()`](https://rdrr.io/r/base/character.html))  
  Country to query. Default `NULL`. If `NULL`, all countries are
  returned.

- lang:

  (`character(1)`)  
  Language to query. Default `"en"`.

## Value

A [`data.frame()`](https://rdrr.io/r/base/data.frame.html) with the
available countries. The columns are:

- `country_id`: The country ID.

- `country_code`: The country code.

- `country_name`: The country name.

- `region_id`: The region ID.

- `region_code`: The region code.

- `region_value`: The region value.

- `admin_region_id`: The admin region ID.

- `admin_region_code`: The admin region code.

- `admin_region_value`: The admin region value.

- `income_level_id`: The income level ID.

- `income_level_code`: The income level code.

- `income_level_value`: The income level value.

- `lending_type_id`: The lending type ID.

- `lending_type_code`: The lending type code.

- `lending_type_value`: The lending type value.

- `capital_city`: The capital city.

- `longitude`: The longitude.

- `latitude`: The latitude.

## See also

Other indicators data:
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
country <- wb_country()
#> Error in req_perform(req_wb_cache(req_wb_retry(req_error(req_url_query(req_url_path_append(req_user_agent(request("https://api.worldbank.org/v2"),     wb_user_agent()), lang, resource), ..., format = "json",     per_page = per_page), is_error = is_wb_error, body = wb_error_body)))): Failed to perform HTTP request.
#> Caused by error in `curl::curl_fetch_memory()`:
#> ! Failure when receiving data from the peer [api.worldbank.org]:
#> Recv failure: Connection reset by peer
head(country)
#> Error: object 'country' not found
# }
```
