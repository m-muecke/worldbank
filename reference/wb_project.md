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
#> Error in req_perform(req, path = get_path(i), mock = mock): HTTP 500 Internal Server Error.

# look up a specific project
wb_project(id = "P163868")
#> Error in req_perform(req, path = get_path(i), mock = mock): HTTP 500 Internal Server Error.
# }
```
