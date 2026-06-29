# World Bank project data

Query World Bank project data from the Projects API.

## Usage

``` r
wb_project(
  id = NULL,
  country = NULL,
  status = NULL,
  region = NULL,
  search = NULL,
  start_date = NULL,
  end_date = NULL
)
```

## Source

<https://search.worldbank.org/api/v2/projects>

## Arguments

- id:

  (`NULL` \| `character(1)`)  
  Project ID to query, e.g. `"P163868"`. Default `NULL`. If provided,
  other filters are ignored.

- country:

  (`NULL` \| [`character()`](https://rdrr.io/r/base/character.html))  
  ISO country code(s) to filter by, e.g. `"BR"` or `c("BR", "IN")`.
  Default `NULL`.

- status:

  (`NULL` \| `character(1)`)  
  Project status to filter by. One of `"Active"`, `"Closed"`,
  `"Dropped"`, or `"Pipeline"`. Default `NULL`.

- region:

  (`NULL` \| `character(1)`)  
  Region name to filter by, e.g. `"South Asia"`. Default `NULL`.

- search:

  (`NULL` \| `character(1)`)  
  Free-text search term. Default `NULL`.

- start_date:

  (`NULL` \| `character(1)`)  
  Board approval start date in `"YYYY-MM-DD"` format. Default `NULL`.

- end_date:

  (`NULL` \| `character(1)`)  
  Board approval end date in `"YYYY-MM-DD"` format. Default `NULL`.

## Value

A [`data.frame()`](https://rdrr.io/r/base/data.frame.html) with World
Bank project data. The columns are:

- `id`: The project ID.

- `project_name`: The project name.

- `status`: The project status.

- `approval_date`: The board approval date.

- `closing_date`: The closing date.

- `country_code`: The ISO country code.

- `country`: The country name.

- `region`: The region name.

- `total_commitment`: The total commitment amount in millions USD.

- `ibrd_commitment`: The IBRD commitment amount in millions USD.

- `ida_commitment`: The IDA commitment amount in millions USD.

- `lending_instrument`: The lending instrument type.

- `borrower`: The borrower name.

- `implementing_agency`: The implementing agency name.

- `url`: The project URL.

## Examples

``` r
# \donttest{
# active projects in Brazil related to education
wb_project(country = "BR", status = "Active", search = "education")
#> Waiting 4s for retry backoff ■■■■■■■■■                       
#> Waiting 4s for retry backoff ■■■■■■■■■■■■■■■■                
#> Waiting 4s for retry backoff ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■  
#> Error in req_perform(req, path = get_path(i), mock = mock): HTTP 500 Internal Server Error.

# look up a specific project
wb_project(id = "P163868")
#>              id                                          project_name status
#> P163868 P163868 Support to Upper Secondary Reform in Brazil Operation Active
#>         approval_date closing_date country_code country
#> P163868    2017-12-14   2024-12-31           BR  Brazil
#>                              region total_commitment ibrd_commitment
#> P163868 Latin America and Caribbean              250             250
#>         ida_commitment            lending_instrument
#> P163868              0 Program-for-Results Financing
#>                                             borrower
#> P163868 Ministry of Economy (Minist�rio da Economia)
#>                                    implementing_agency
#> P163868 Ministry of Education (Minist�rio da Educa��o)
#>                                                                                  url
#> P163868 https://projects.worldbank.org/en/projects-operations/project-detail/P163868
# }
```
