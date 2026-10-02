# World Bank indicator data

List all indicators supported by the World Bank API.

## Usage

``` r
wb_indicator(indicator = NULL, lang = "en", source = NULL)
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

- source:

  (`NULL` \| `integer(1)`)  
  ID of the source to query, as listed by
  [`wb_source()`](https://m-muecke.github.io/worldbank/reference/wb_source.md).
  Default `NULL`, which uses the API default.

## Value

A [`data.frame()`](https://rdrr.io/r/base/data.frame.html) with the
available indicators. Since an indicator can have several topics,
`topic_id` and `topic_value` hold all of them separated by `;`, which
never occurs within a value, or `NA` if there are none. Use
`strsplit(x, ";")` to split them, or a pattern such as
`"(^|;)Health(;|$)"` to match a single topic exactly. The columns are:

- `id`: The indicator ID.

- `name`: The indicator name.

- `unit`: The indicator unit.

- `source_id`: The source ID.

- `source_value`: The source value.

- `source_note`: The source note.

- `source_organization`: The source organization.

- `topic_id`: The topic IDs, as listed by
  [`wb_topic()`](https://m-muecke.github.io/worldbank/reference/wb_topic.md).

- `topic_value`: The topic names, in the same order as `topic_id`.

## See also

Other indicators data:
[`wb_bulk()`](https://m-muecke.github.io/worldbank/reference/wb_bulk.md),
[`wb_country()`](https://m-muecke.github.io/worldbank/reference/wb_country.md),
[`wb_data()`](https://m-muecke.github.io/worldbank/reference/wb_data.md),
[`wb_income_level()`](https://m-muecke.github.io/worldbank/reference/wb_income_level.md),
[`wb_language()`](https://m-muecke.github.io/worldbank/reference/wb_language.md),
[`wb_lending_type()`](https://m-muecke.github.io/worldbank/reference/wb_lending_type.md),
[`wb_region()`](https://m-muecke.github.io/worldbank/reference/wb_region.md),
[`wb_search()`](https://m-muecke.github.io/worldbank/reference/wb_search.md),
[`wb_source()`](https://m-muecke.github.io/worldbank/reference/wb_source.md),
[`wb_topic()`](https://m-muecke.github.io/worldbank/reference/wb_topic.md)

## Examples

``` r
# \donttest{
wb_indicator("NY.GDP.MKTP.CD")
#>               id              name unit source_id                 source_value
#> 1 NY.GDP.MKTP.CD GDP (current US$) <NA>         2 World Development Indicators
#>                                                                                                                                                                                                                                                                                                                                                                                                                                                                 source_note
#> 1 Gross domestic product is the total income earned through the production of goods and services in an economic territory during an accounting period. It can be measured in three different ways: using either the expenditure approach, the income approach, or the production approach. This indicator is expressed in current prices, meaning no adjustment has been made to account for price changes over time. This indicator is expressed in United States dollars.
#>                                                                                                                                                                                                     source_organization
#> 1 Country official statistics, National Statistical Organizations and/or Central Banks;\nNational Accounts data files, Organisation for Economic Co-operation and Development (OECD);\nStaff estimates, World Bank (WB)
#>   topic_id      topic_value
#> 1        3 Economy & Growth

# an indicator can have several topics, separated by `;`
ind <- wb_indicator("SE.ENR.PRSC.FM.ZS")
ind[c("topic_id", "topic_value")]
#>       topic_id
#> 1 2;19;4;17;15
#>                                                            topic_value
#> 1 Aid Effectiveness;Climate Change;Education;Gender;Social Development
strsplit(ind$topic_value, ";")
#> [[1]]
#> [1] "Aid Effectiveness"  "Climate Change"     "Education"         
#> [4] "Gender"             "Social Development"
#> 
# }
```
