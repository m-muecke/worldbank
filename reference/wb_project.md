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
#>              id
#> P163868 P163868
#> P178993 P178993
#> P178563 P178563
#> P172605 P172605
#> P179088 P179088
#> P177070 P177070
#> P179046 P179046
#> P178663 P178663
#> P179365 P179365
#> P073882 P073882
#> P153012 P153012
#> P172497 P172497
#>                                                                   project_name
#> P163868                  Support to Upper Secondary Reform in Brazil Operation
#> P178993     Mato Grosso Resilient, Inclusive, and Sustainable Learning Project
#> P178563            RECOVERING LEARNING LOSSES FROM COVID-19 PANDEMIC IN BRAZIL
#> P172605               Salvador Social Multi-Sector Service Delivery Project II
#> P179088               Progestão Tocantins: Public Sector Management Efficiency
#> P177070                 Progestão Alagoas: Public Sector Management Efficiency
#> P179046                    Progestão Acre: Public Sector Management Efficiency
#> P178663                   Progestão Piauí: Public Sector Management Efficiency
#> P179365 Brazil: Support to New Bolsa Familia Conditional Cash Transfer Program
#> P073882                         RF 2nd Amazon Fire Prevention and Mobilization
#> P153012                        Fortaleza Sustainable Urban Development Project
#> P172497                 Sustainable Multiple Use Landscape Consortia in Brazil
#>         status approval_date closing_date country_code country
#> P163868 Active    2017-12-14   2024-12-31           BR  Brazil
#> P178993 Active    2023-10-26   2028-12-31           BR  Brazil
#> P178563 Active    2022-05-12   2027-12-31           BR  Brazil
#> P172605 Active    2020-09-22   2025-12-30           BR  Brazil
#> P179088 Active    2023-07-24   2028-12-29           BR  Brazil
#> P177070 Active    2022-07-21   2028-03-31           BR  Brazil
#> P179046 Active    2023-07-24   2028-12-29           BR  Brazil
#> P178663 Active    2023-10-03   2029-06-29           BR  Brazil
#> P179365 Active    2023-12-06   2026-04-30           BR  Brazil
#> P073882 Active          <NA>   2004-09-30           BR  Brazil
#> P153012 Active    2017-04-28   2025-03-31           BR  Brazil
#> P172497 Active          <NA>   2027-11-30           BR  Brazil
#>                              region total_commitment ibrd_commitment
#> P163868 Latin America and Caribbean        250.00000           250.0
#> P178993 Latin America and Caribbean        100.00000           100.0
#> P178563 Latin America and Caribbean        250.00000           250.0
#> P172605 Latin America and Caribbean        125.00000           125.0
#> P179088 Latin America and Caribbean         50.00000            50.0
#> P177070 Latin America and Caribbean         40.00000            40.0
#> P179046 Latin America and Caribbean         40.00000            40.0
#> P178663 Latin America and Caribbean         50.00000            50.0
#> P179365 Latin America and Caribbean        300.00000           300.0
#> P073882 Latin America and Caribbean          1.10000             0.0
#> P153012 Latin America and Caribbean         73.30000            73.3
#> P172497 Latin America and Caribbean         24.57798             0.0
#>         ida_commitment            lending_instrument
#> P163868              0 Program-for-Results Financing
#> P178993              0  Investment Project Financing
#> P178563              0 Program-for-Results Financing
#> P172605              0  Investment Project Financing
#> P179088              0  Investment Project Financing
#> P177070              0  Investment Project Financing
#> P179046              0  Investment Project Financing
#> P178663              0  Investment Project Financing
#> P179365              0  Investment Project Financing
#> P073882              0                          <NA>
#> P153012              0  Investment Project Financing
#> P172497              0  Investment Project Financing
#>                                                                          borrower
#> P163868                              Ministry of Economy (Minist�rio da Economia)
#> P178993                                                      STATE OF MATO GROSSO
#> P178563                                         THE FEDERATIVE REPUBLIC OF BRAZIL
#> P172605                                                  Municipality of Salvador
#> P179088                                    State Secretariat of Planning (SEPLAN)
#> P177070 State of Alagoas, with the guarantee of the Federative Republic of Brazil
#> P179046                                                             State of Acre
#> P178663                                                            State of Piaui
#> P179365                                             Federative Republic of Brazil
#> P073882                                                                      <NA>
#> P153012                                                 Municipality of Fortaleza
#> P172497                                                                      IICA
#>                                                                                               implementing_agency
#> P163868                                                            Ministry of Education (Minist�rio da Educa��o)
#> P178993                                                                    SECRETARIAT OF EDUCATION - MATO GROSSO
#> P178563                                                                                     MINISTRY OF EDUCATION
#> P172605                                                                                                Casa Civil
#> P179088                                                                                                       UGP
#> P177070                                                                 Secretariat of Finance - State of Alagoas
#> P179046                                                                             State Secretariat of Planning
#> P178663                                                                           Secretariat of Finance of Piaui
#> P179365                                                                                   Ministry of Citizenship
#> P073882                                                                                                      <NA>
#> P153012 Secretaria Municipal de Urbanismo e Meio Ambiente (SEUMA), Secretaria Municipal de Infraestrutura (SEINF)
#> P172497             Minist�rio do Meio Ambiente (MMA), Minist�rio da Agricultura, Pecu�ria e Abastecimento (MAPA)
#>                                                                                  url
#> P163868 https://projects.worldbank.org/en/projects-operations/project-detail/P163868
#> P178993 https://projects.worldbank.org/en/projects-operations/project-detail/P178993
#> P178563 https://projects.worldbank.org/en/projects-operations/project-detail/P178563
#> P172605 https://projects.worldbank.org/en/projects-operations/project-detail/P172605
#> P179088 https://projects.worldbank.org/en/projects-operations/project-detail/P179088
#> P177070 https://projects.worldbank.org/en/projects-operations/project-detail/P177070
#> P179046 https://projects.worldbank.org/en/projects-operations/project-detail/P179046
#> P178663 https://projects.worldbank.org/en/projects-operations/project-detail/P178663
#> P179365 https://projects.worldbank.org/en/projects-operations/project-detail/P179365
#> P073882 https://projects.worldbank.org/en/projects-operations/project-detail/P073882
#> P153012 https://projects.worldbank.org/en/projects-operations/project-detail/P153012
#> P172497 https://projects.worldbank.org/en/projects-operations/project-detail/P172497

# look up a specific project
wb_project(id = "P163868")
#> Error in req_perform(req, path = get_path(i), mock = mock): HTTP 500 Internal Server Error.
# }
```
