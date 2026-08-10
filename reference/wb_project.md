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

  (`NULL` \| [`character()`](https://rdrr.io/r/base/character.html))  
  Project ID(s) to query, e.g. `"P163868"` or `c("P163868", "P180429")`.
  Default `NULL`. If provided, other filters are ignored.

- country:

  (`NULL` \| [`character()`](https://rdrr.io/r/base/character.html))  
  Two-character World Bank country code(s) to filter by, e.g. `"BR"` or
  `c("BR", "IN")`. Regional aggregates such as `"1W"` (World) or `"3A"`
  (Africa) are also accepted. Matching is case insensitive, and projects
  for any of the given codes are returned. Default `NULL`.

- status:

  (`NULL` \| [`character()`](https://rdrr.io/r/base/character.html))  
  Project status(es) to filter by, each one of `"active"`, `"closed"`,
  `"dropped"`, or `"pipeline"`. Projects with any of the given statuses
  are returned. Default `NULL`.

- region:

  (`NULL` \| [`character()`](https://rdrr.io/r/base/character.html))  
  Region name(s) to filter by, e.g. `"South Asia"`. Matching is case
  insensitive and by substring, so `"Africa"` also matches
  `"Eastern and Southern Africa"` and `"Middle East and North Africa"`.
  Projects matching any of the given names are returned. Default `NULL`.

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
wb_project(country = "BR", status = "active", search = "education")
#>              id
#> P163868 P163868
#> P178993 P178993
#> P178563 P178563
#> P172605 P172605
#> P179088 P179088
#> P177070 P177070
#> P179046 P179046
#> P178663 P178663
#> P073882 P073882
#> P179365 P179365
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
#> P073882                         RF 2nd Amazon Fire Prevention and Mobilization
#> P179365 Brazil: Support to New Bolsa Familia Conditional Cash Transfer Program
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
#> P073882 Active          <NA>   2004-09-30           BR  Brazil
#> P179365 Active    2023-12-06   2026-04-30           BR  Brazil
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
#> P073882 Latin America and Caribbean          1.10000             0.0
#> P179365 Latin America and Caribbean        300.00000           300.0
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
#> P073882              0                          <NA>
#> P179365              0  Investment Project Financing
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
#> P073882                                                                      <NA>
#> P179365                                             Federative Republic of Brazil
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
#> P073882                                                                                                      <NA>
#> P179365                                                                                   Ministry of Citizenship
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
#> P073882 https://projects.worldbank.org/en/projects-operations/project-detail/P073882
#> P179365 https://projects.worldbank.org/en/projects-operations/project-detail/P179365
#> P153012 https://projects.worldbank.org/en/projects-operations/project-detail/P153012
#> P172497 https://projects.worldbank.org/en/projects-operations/project-detail/P172497

# active or pipeline projects across two countries
wb_project(country = c("BR", "IN"), status = c("active", "pipeline"))
#>              id
#> P507508 P507508
#> P178253 P178253
#> P181463 P181463
#> P179935 P179935
#> P180429 P180429
#> P178254 P178254
#> P180555 P180555
#> P181501 P181501
#> P181195 P181195
#> P177965 P177965
#> P180430 P180430
#> P180462 P180462
#> P174825 P174825
#> P178557 P178557
#> P179357 P179357
#> P179749 P179749
#> P500524 P500524
#> P180497 P180497
#> P177474 P177474
#> P178581 P178581
#> P175723 P175723
#> P180634 P180634
#> P179189 P179189
#> P179365 P179365
#> P179182 P179182
#> P178993 P178993
#> P178567 P178567
#> P178663 P178663
#> P179046 P179046
#> P179088 P179088
#> P176733 P176733
#> P176032 P176032
#> P179249 P179249
#> P179337 P179337
#> P178418 P178418
#> P177917 P177917
#> P177980 P177980
#> P177876 P177876
#> P178072 P178072
#> P177671 P177671
#> P176982 P176982
#> P179039 P179039
#> P175811 P175811
#> P174593 P174593
#> P178888 P178888
#> P175728 P175728
#> P178252 P178252
#> P175261 P175261
#> P178339 P178339
#> P177070 P177070
#> P171750 P171750
#> P178146 P178146
#> P175676 P175676
#> P177915 P177915
#> P174798 P174798
#> P178729 P178729
#> P176404 P176404
#> P177856 P177856
#> P178563 P178563
#> P168634 P168634
#> P177632 P177632
#> P174067 P174067
#> P174564 P174564
#> P176107 P176107
#> P172187 P172187
#> P170590 P170590
#> P174732 P174732
#> P173589 P173589
#> P175221 P175221
#> P174778 P174778
#> P173978 P173978
#> P172226 P172226
#> P173958 P173958
#> P170811 P170811
#> P173704 P173704
#> P168633 P168633
#> P170645 P170645
#> P172213 P172213
#> P170873 P170873
#> P166020 P166020
#> P168097 P168097
#> P172605 P172605
#> P169111 P169111
#> P174312 P174312
#> P166868 P166868
#> P170850 P170850
#> P168590 P168590
#> P169140 P169140
#> P167350 P167350
#> P163328 P163328
#> P170682 P170682
#> P169134 P169134
#> P165129 P165129
#> P168310 P168310
#> P157929 P157929
#> P162679 P162679
#> P163533 P163533
#> P165055 P165055
#> P167455 P167455
#> P167581 P167581
#> P160379 P160379
#> P157141 P157141
#> P167523 P167523
#> P166923 P166923
#> P165683 P165683
#> P166578 P166578
#> P165695 P165695
#> P158502 P158502
#> P160463 P160463
#> P162086 P162086
#> P158119 P158119
#> P156869 P156869
#> P158146 P158146
#> P163868 P163868
#> P158522 P158522
#> P157702 P157702
#> P147158 P147158
#> P155617 P155617
#> P156241 P156241
#> P153012 P153012
#> P155303 P155303
#> P148775 P148775
#> P152698 P152698
#> P148531 P148531
#> P155007 P155007
#> P130544 P130544
#> P127725 P127725
#> P154990 P154990
#> P096124 P096124
#> P039027 P039027
#> P108190 P108190
#> P505866 P505866
#> P507322 P507322
#> P500380 P500380
#> P502493 P502493
#> P110539 P110539
#> P508840 P508840
#> P500252 P500252
#> P506955 P506955
#> P507029 P507029
#> P508202 P508202
#> P508363 P508363
#> P504126 P504126
#> P507066 P507066
#> P508221 P508221
#> P180716 P180716
#> P504276 P504276
#> P500570 P500570
#> P173090 P173090
#> P505177 P505177
#> P506272 P506272
#> P506321 P506321
#> P181608 P181608
#> P508025 P508025
#> P105370 P105370
#> P500469 P500469
#> P501071 P501071
#> P181511 P181511
#> P180932 P180932
#> P505235 P505235
#> P507629 P507629
#> P178053 P178053
#> P500564 P500564
#> P505590 P505590
#> P506976 P506976
#> P181767 P181767
#> P506329 P506329
#> P508489 P508489
#> P181244 P181244
#> P502499 P502499
#> P500151 P500151
#> P508719 P508719
#> P505563 P505563
#> P507628 P507628
#> P179349 P179349
#> P504543 P504543
#> P505914 P505914
#> P509041 P509041
#> P506142 P506142
#> P500614 P500614
#> P506861 P506861
#> P180699 P180699
#> P507340 P507340
#> P114890 P114890
#> P500168 P500168
#> P506320 P506320
#> P500431 P500431
#> P508453 P508453
#> P504897 P504897
#> P503872 P503872
#> P506340 P506340
#> P507236 P507236
#> P507910 P507910
#> P504899 P504899
#> P500501 P500501
#> P181020 P181020
#> P114896 P114896
#> P504253 P504253
#> P502491 P502491
#> P181524 P181524
#> P073882 P073882
#> P177159 P177159
#> P171257 P171257
#> P132620 P132620
#> P122387 P122387
#> P128921 P128921
#> P158000 P158000
#> P160018 P160018
#> P172497 P172497
#> P164602 P164602
#> P152285 P152285
#> P009585 P009585
#>                                                                                                            project_name
#> P507508                                                                  Amaravati Integrated Urban Development Program
#> P178253                           Uttar Pradesh Agriculture Growth and Rural Enterprise Ecosystem Strengthening Project
#> P181463                 Maharashtra Strengthening Institutional Capabilities in Districts for Enabling Growth Operation
#> P179935                                                  Enhancing Landscape and Ecosystem Management (ELEMENT) Project
#> P180429                                                                     Bahia Sustainable Rural Development Project
#> P178254                                         Kerala Climate Resilient Agri- Value Chain Modernization (KERA) Project
#> P180555                            Brazil Proactive, Safe, and Resilient Road Asset Management Program - State of Bahia
#> P181501                 BR Enhancing Prosperity and Sustainability in the State of Sergipe Development Policy Financing
#> P181195                                              Second Low-Carbon Energy Programmatic Development Policy Financing
#> P177965 Development of Applied Knowledge and Skills for Human Development in Maharashtra  - (DAKSH) Maharashtra Program
#> P180430                                                  Brazil: Pernambuco Rural Water and Sanitation Project (PROSAR)
#> P180462                                                                     Espírito Santo Digital Acceleration Project
#> P174825                                        West Bengal Boosting Logistics Efficiency and Trade Facilitation Program
#> P178557                                         Integrated Sustainable Mobility Project in the Foz do Rio Itajaí Region
#> P179357                                                          Uttarakhand Climate Responsive Rainfed Farming Project
#> P179749                                                        Uttarakhand Disaster Preparedness and Resilience Project
#> P500524                                                      Sustainable Human Development Project in the State of Pará
#> P180497                                                           BR State of Ceará Sustainable Development Policy Loan
#> P177474                                                          Piauí Pillars of Growth and Social Inclusion Project 2
#> P178581                                                                           Assam Resilient Rural Bridges Program
#> P175723                                                           Mato Grosso Sustainable Development of Family Farming
#> P180634                            Sikkim: Integrated Service Provision and Innovation for Reviving Economies Operation
#> P179189                                                          Tamil Nadu Climate Resilient Urban Development Program
#> P179365                                          Brazil: Support to New Bolsa Familia Conditional Cash Transfer Program
#> P179182                                        Rio de Janeiro Fiscal Management and Sustainable Development Policy Loan
#> P178993                                              Mato Grosso Resilient, Inclusive, and Sustainable Learning Project
#> P178567                                                          Piauí Health and Social Protection Development Project
#> P178663                                                            Progestão Piauí: Public Sector Management Efficiency
#> P179046                                                             Progestão Acre: Public Sector Management Efficiency
#> P179088                                                        Progestão Tocantins: Public Sector Management Efficiency
#> P176733                                                                IN: Manipur Infotech eNabled Development Project
#> P176032                                                               Himachal Pradesh Power Sector Development Program
#> P179249                                                      Chhattisgarh: Accelerated Learning for a Knowledge-Economy
#> P179337                Assam State Secondary Healthcare Initiative for Service Delivery Transformation (ASSIST) Project
#> P178418                                                      Tripura Rural Economic Growth and Service Delivery Project
#> P177917                                     Multidisciplinary Education and Research Improvement in Technical Education
#> P177980                                                               Additional Financing for Resilient Kerala Program
#> P177876                                      West Bengal Accelerated Development of Minor Irrigation Project - Phase II
#> P178072                                 Green, Resilient and Inclusive Regeneration of the Central Area of Porto Alegre
#> P177671                                                    Animal Health System Support for One Health Program (AHSSOH)
#> P176982                                                        Brazil: Espirito Santo Water Security Management Project
#> P179039                                                                Karnataka Sustainable Rural Water Supply Program
#> P175811                                                            Odisha State Capability and Resilient Growth Program
#> P174593                                                                 Assam Integrated River Basin Management Program
#> P178888                                                                                  Brazil Climate Finance Project
#> P175728                                         Gujarat Resilient Cities Partnership: Ahmedabad City Resilience Project
#> P178252                             Systems Reform Endeavours for Transformed Health Achievement in Gujarat (SRESTHA-G)
#> P175261                                                            Punjab: Building Fiscal and Institutional Resilience
#> P178339                                                      Progestão Mato Grosso: Public Sector Management Efficiency
#> P177070                                                          Progestão Alagoas: Public Sector Management Efficiency
#> P171750                                              Additional Financing: Rooftop Solar Program for Residential sector
#> P178146                                                                India's Enhanced Health Service Delivery Program
#> P175676                             PHSPP: Transforming India’s Public Health Systems for Pandemic Preparedness Program
#> P177915                                    GUJARAT OUTCOMES FOR ACCELERATED LEARNING (GOAL) - ADDITIONAL FINANCING (AF)
#> P174798                                                                             Fisheries Sector Prosperity Project
#> P178729                                               Rio de Janeiro Adjustment and Sustainable Development Policy Loan
#> P176404                  RIGHTS: Inclusion, Accessibility and Opportunities for Persons with Disabilities in Tamil Nadu
#> P177856                                                                                          Rail Logistics Project
#> P178563                                                     RECOVERING LEARNING LOSSES FROM COVID-19 PANDEMIC IN BRAZIL
#> P168634                                Parana Public Sector Modernization and Innovation for Service Delivery Operation
#> P177632                                                                      BR State of Goias Sustainable Recovery DPF
#> P174067                                                                   Public Service Capability Enhancement Project
#> P174564                                 West Bengal Building State Capability for Inclusive Social Protection Operation
#> P176107                                       Additional Financing - Karnataka Urban Water Supply Modernization Project
#> P172187                              Rejuvenating Watersheds for Agricultural Resilience through Innovative Development
#> P170590                                                 West Bengal Electricity Distribution Grid Modernization Project
#> P174732                          Shimla-Himachal Pradesh Water Supply and Sewerage Services Improvement Program (PforR)
#> P173589                                                                  Meghalaya Health Systems Strengthening Project
#> P175221                                                    Chennai City Partnership: Sustainable Urban Services Program
#> P174778                                                                                    The Resilient Kerala Program
#> P173978                                                                     Supporting Andhra's Learning Transformation
#> P172226                                                                       Raising and Accelerating MSME Performance
#> P173958                                                                    Mizoram Health Systems Strengthening Project
#> P170811                                                                   Punjab Municipal Services Improvement Project
#> P173704                                                                Gujarat Outcomes for Accelerated Learning (GOAL)
#> P168633                                                                           Kerala Solid Waste Management Project
#> P170645                                         Chhattisgarh Inclusive Rural and Accelerated Agriculture Growth Project
#> P172213                                                            Nagaland: Enhancing Classroom Teaching and Resources
#> P170873                            Second Dam Rehabilitation and Improvement Project - Additional Financing (DRIP-2 AF)
#> P166020                                   West Bengal Inland Water Transport, Logistics and Spatial Development Project
#> P168097                                                                          Meghalaya Integrated Transport Project
#> P172605                                                        Salvador Social Multi-Sector Service Delivery Project II
#> P169111                                                                       Second National Ganga River Basin Project
#> P174312                                                                     Second National Ganga River Basin Guarantee
#> P166868                                                         Strengthening Teaching-Learning  And Results for States
#> P170850                                                             Energy and Mineral Sectors Strengthening Project II
#> P168590                                                              Tamil Nadu Housing and Habitat Development Project
#> P169140                                                                 São Paulo Aricanduva Bus Rapid Transit Corridor
#> P167350                                                                        Green National Highways Corridor Project
#> P163328                                                             Himachal Pradesh State Roads Transformation Project
#> P170682                                                       Linha de Crédito para Resiliência Urbana no Sul do Brasil
#> P169134                               Improving Mobility and Urban Inclusion in the Amazonas Corridor in Belo Horizonte
#> P165129     Integrated Project for Source Sustainability and Climate Resilient Rain-fed Agriculture in Himachal Pradesh
#> P168310                                            State of Maharashtra's Agribusiness and Rural Transformation Project
#> P157929                                                                            Assam Inland Water Transport Project
#> P162679                                                       West Bengal Major Irrigation and Flood Management Project
#> P163533                                          Odisha Integrated Irrigation Project for Climate Resilient Agriculture
#> P165055                                                                             Ceará Water Security and Governance
#> P167455                                                Ceara Rural Sustainable Development and Competitiveness Phase II
#> P167581                                                             Andhra Pradesh Health Systems Strengthening Project
#> P160379                                                               Innovation in Solar Power and Hybrid Technologies
#> P157141                                                                 Rajasthan State Highways Development Program II
#> P167523                                                                     Program Towards Elimination of Tuberculosis
#> P166923                                                   Uttarakhand Public Financial Management Strengthening Project
#> P165683                                             Paraiba Improving Water Resources Management and Services Provision
#> P166578                                             Chhattisgarh Public Financial Management and Accountability Program
#> P165695            SABESP - IMPROVING WATER SERVICE ACCESS AND SECURITY IN THE METROPOLITAN REGION OF SÃO PAULO PROJECT
#> P158502                                                                         Jharkhand Municipal Development Project
#> P160463                                                   AP Integrated Irrigation & Agriculture Transformation Project
#> P162086                                                                      Jharkhand Power System Improvement Project
#> P158119                                           Atal Bhujal Yojana (Abhy)-National Groundwater Management Improvement
#> P156869                                                          Strengthening Public Financial Management in Rajasthan
#> P158146                                                           Uttarakhand Water Supply Program for Peri Urban Areas
#> P163868                                                           Support to Upper Secondary Reform in Brazil Operation
#> P158522                                                          Tamil Nadu Irrigated Agriculture Modernization Project
#> P157702                                                                 Tamil Nadu Rural Transformation Project (TNRTP)
#> P147158                                                                           Paraiba Sustainable Rural Development
#> P155617                                                             Assam Agribusiness and Rural Transformation Project
#> P156241                                                                             Innovate in India for Inclusiveness
#> P153012                                                                 Fortaleza Sustainable Urban Development Project
#> P155303                                                                        Madhya Pradesh Urban Development Project
#> P148775                                     Capacity Augmentation of the National Waterway- 1 (JAL MARG VIKAS)  Project
#> P152698                                                                                      National Hydrology Project
#> P148531                                                                  Uttarakhand Health Systems Development Project
#> P155007                                                                            Grid-Connected Rooftop Solar Program
#> P130544                                                           IN Karnataka Urban Water Supply Modernization Project
#> P127725                                                                            Bihar Kosi Basin Development Project
#> P154990                                                                          Jhelum and Tawi Flood Recovery Project
#> P096124                                                                      Vishnugad Pipalkoti Hydro Electric Project
#> P039027                                                               RF Science Centers - Emergency Assistance Project
#> P108190                                                            Subterranean Arsenic Removal: Experiment to Delivery
#> P505866                                                                                                       BR PE DPL
#> P507322                                                 Brazil Enhancing Productivity, Sustainability and Inclusion DPF
#> P500380  India Supporting Socioeconomic Development and Livelihood Security among Particularly Vulnerable Tribal Groups
#> P502493                                             Rio Grande do Norte: Sustainable Development and Governance Project
#> P110539                                                                    India: FaL-G High Capacity Automation Plants
#> P508840                                                                              Institutions MPA – Phase 1 (Assam)
#> P500252                                                                                                             IPF
#> P506955                                                                                                    PPP SP Rails
#> P507029                                  Brazil Electromobility Multiphase Programmatic Approach – MPA Phase 2 Salvador
#> P508202                        Amazon and Cerrado Bioeconomy, Forest Restoration, and Climate-Smart Agriculture Project
#> P508363                                                                                                      BR Digital
#> P504126                                                                                       Brazil: ASL Xingu project
#> P507066                   Meghalaya Multisectoral Project for Adolescent Wellbeing, Empowerment and Resilience (MPOWER)
#> P508221                                                                                                   SC Resilience
#> P180716                                                                               Promoting Green Hydrogen in India
#> P504276                                                                                                 SP Metro Line 2
#> P500570                                                                  Sergipe Efficient Digital Acceleration project
#> P173090                                         Second Amazona Fiscal and Environmental Sustainability Programmatic DPF
#> P505177                                                            India - Enhancing Innovation among ICMR Institutions
#> P506272                                                                 Karnataka Water Security and Resilience Program
#> P506321                                                                                                   Bahia SIP DPL
#> P181608                                                      Progestão Program - MPA Phase 1 State of Rio Grande do Sul
#> P508025                                                                                                             SS3
#> P105370                                                                          Allian Duhangan Hydro Electric Project
#> P500469  Brazil Proactive, Safe and Resilient Road Asset Management Program - State of Espirito Santo Project - Phase 2
#> P501071                                                          Rajasthan Highway Modernization Project (RHMP) Phase-2
#> P181511                                                   Expanding Clean Hydrogen in Brazil - Ceara Green Hydrogen Hub
#> P180932                                                                Strengthening Coastal Resilience and the Economy
#> P505235                BR State of Rio Grande do Sul Sustainable Recovery and Climate Resilient Development Policy Loan
#> P507629                                                Brazil: Decarbonization of Energy-Intensive Value Chains Project
#> P178053                                                                      Uttar Pradesh Clean Air Management Program
#> P500564                                                      Punjab Outcomes-Acceleration In School Education Operation
#> P505590                                                                                                    MS Pro-Roads
#> P506976                                                                        West Bengal Health System Reform Program
#> P181767                                                        Hybrid PPP - São Paulo Commuter Rail Lines 11, 12 and 13
#> P506329                                                    Private-Delivered Metro Sao Paulo Line 4 Phase III Extension
#> P508489                                                                                                         SRH P4R
#> P181244                                                                  India-West Bengal Health System Reform Program
#> P502499                                                                            Surat Resilience Enhancement Project
#> P500151                                                                                                   PForR Project
#> P508719                                                                                                           AHEAD
#> P505563                                                                                                        PoCRA-II
#> P507628                                                             Energy Transition of the Northeast Region of Brazil
#> P179349                                        Electric Vehicle Operations and Lending for a Vibrant Ecosystem (EVOLVE)
#> P504543                                                    Brazil Electromobility and Energy Transition Finance Project
#> P505914                                                          IN: Digital Empowerment and Services to Harness Growth
#> P509041                                                                                                 Tocantins PRIDP
#> P506142                                      Santa Catarina Rural Development Project for Sustainability and Innovation
#> P500614                                                         BR State of Alagoas Sustainable Development Policy Loan
#> P506861                                                                                                  AM Sustainable
#> P180699                                                    Tamil Nadu Women Employment and Safety (TN WESAFE) Operation
#> P507340                                                               Himachal Disaster Recovery and Resilience Project
#> P114890                                                         Combining income and forest protection: açaí production
#> P500168                                                                                                     IPF Regular
#> P506320                                                         Accelerating the Energy Transition in the Amazon (AETA)
#> P500431                                                     Agroecology and Sustainable Rural Development in Pernambuco
#> P508453                                                                                                            MEGA
#> P504897                                                                  Bahia Urban Socio-Productive Inclusion Project
#> P503872                                                                       Kerala Health Systems Improvement Program
#> P506340                                                                                                            MRDP
#> P507236                                                                   Assam Governance and Service Delivery Program
#> P507910                                                                        Skills: National ITI Upgradation Program
#> P504899                                Strengthening Social Assistance Delivery System in the Municipality of São Paulo
#> P500501                                        Electrification and Improvement of the São Paulo Urban Transport Program
#> P181020                                                                      Gurugram Metro Huda to Cyber City, Haryana
#> P114896                                                                       Collective Land Ownership Model for Women
#> P504253 Brazil Proactive, Safe, and Resilient Road Asset Management Program - State of Santa Catarina Project - Phase 3
#> P502491                                                           Haryana Clean Air and Sustainable Development Program
#> P181524                              Second Dam Rehabilitation and Improvement Project - Additional Financing (DRIP -3)
#> P073882                                                                  RF 2nd Amazon Fire Prevention and Mobilization
#> P177159                                                       Monitoring and Evaluation capacity building in South Asia
#> P171257                                                            Brazil Amazon Sustainable Landscapes Project Phase 2
#> P132620                                                              Partial Risk Sharing Facility in Energy Efficiency
#> P122387                                                                     DFID TF III Supervision and Fiduciary Costs
#> P128921                                                              Partial Risk Sharing Facility in Energy Efficiency
#> P158000                                                                           Amazon Sustainable Landscapes Project
#> P160018                                                   Additional Financing for Grid-Connected Rooftop Solar Program
#> P172497                                                          Sustainable Multiple Use Landscape Consortia in Brazil
#> P164602                                                    Integrated Landscape Management in the Cerrado Biome Project
#> P152285                                                                     Brazil Investment Plan Coordination Project
#> P009585                                                                                                           ODS I
#>           status approval_date closing_date country_code country
#> P507508   Active    2024-12-19         <NA>           IN   India
#> P178253   Active    2024-12-12   2030-09-30           IN   India
#> P181463   Active    2024-12-03   2030-03-31           IN   India
#> P179935   Active    2024-11-25   2030-06-30           IN   India
#> P180429   Active    2024-11-07   2030-10-30           BR  Brazil
#> P178254   Active    2024-10-31   2029-11-30           IN   India
#> P180555   Active    2024-09-10   2032-11-30           BR  Brazil
#> P181501   Active    2024-08-27   2026-12-31           BR  Brazil
#> P181195   Active    2024-06-28   2026-06-30           IN   India
#> P177965   Active    2024-05-22   2029-03-30           IN   India
#> P180430   Active    2024-05-17   2032-07-14           BR  Brazil
#> P180462   Active    2024-05-17   2029-06-30           BR  Brazil
#> P174825   Active    2024-04-24   2028-06-30           IN   India
#> P178557   Active    2024-04-12   2031-11-30           BR  Brazil
#> P179357   Active    2024-04-01   2030-03-31           IN   India
#> P179749   Active    2024-04-01   2029-06-30           IN   India
#> P500524   Active    2024-03-28   2029-04-30           BR  Brazil
#> P180497   Active    2024-03-28   2025-12-31           BR  Brazil
#> P177474   Active    2024-03-14   2029-07-31           BR  Brazil
#> P178581   Active    2024-03-01   2030-06-28           IN   India
#> P175723   Active    2024-02-05   2030-05-15           BR  Brazil
#> P180634   Active    2023-12-21   2029-04-30           IN   India
#> P179189   Active    2023-12-21   2030-12-31           IN   India
#> P179365   Active    2023-12-06   2026-04-30           BR  Brazil
#> P179182   Active    2023-11-16   2024-12-31           BR  Brazil
#> P178993   Active    2023-10-26   2028-12-31           BR  Brazil
#> P178567   Active    2023-10-05   2029-06-30           BR  Brazil
#> P178663   Active    2023-10-03   2029-06-29           BR  Brazil
#> P179046   Active    2023-07-24   2028-12-29           BR  Brazil
#> P179088   Active    2023-07-24   2028-12-29           BR  Brazil
#> P176733   Active    2023-07-06   2028-09-30           IN   India
#> P176032   Active    2023-06-27   2028-03-31           IN   India
#> P179249   Active    2023-06-26   2028-09-29           IN   India
#> P179337   Active    2023-06-26   2029-11-30           IN   India
#> P178418   Active    2023-06-26   2029-06-30           IN   India
#> P177917   Active    2023-06-23   2028-12-29           IN   India
#> P177980   Active    2023-06-16         <NA>           IN   India
#> P177876   Active    2023-06-09   2029-06-29           IN   India
#> P178072   Active    2023-06-07   2028-12-29           BR  Brazil
#> P177671   Active    2023-05-10   2027-11-30           IN   India
#> P176982   Active    2023-05-09   2029-06-30           BR  Brazil
#> P179039   Active    2023-03-28   2028-06-01           IN   India
#> P175811   Active    2023-03-28   2028-04-26           IN   India
#> P174593   Active    2023-03-24   2027-07-31           IN   India
#> P178888   Active    2022-12-22   2028-04-30           BR  Brazil
#> P175728   Active    2022-11-22   2028-12-31           IN   India
#> P178252   Active    2022-09-21   2028-03-31           IN   India
#> P175261   Active    2022-09-19   2027-06-30           IN   India
#> P178339   Active    2022-08-23   2028-06-30           BR  Brazil
#> P177070   Active    2022-07-21   2028-03-31           BR  Brazil
#> P171750   Active    2022-06-28         <NA>           IN   India
#> P178146   Active    2022-06-28   2027-06-30           IN   India
#> P175676   Active    2022-06-28   2027-12-31           IN   India
#> P177915   Active    2022-06-21         <NA>           IN   India
#> P174798   Active    2022-06-17   2027-06-30           IN   India
#> P178729   Active    2022-06-16   2024-12-31           BR  Brazil
#> P176404   Active    2022-06-14   2028-06-30           IN   India
#> P177856   Active    2022-06-10   2027-06-30           IN   India
#> P178563   Active    2022-05-12   2027-12-31           BR  Brazil
#> P168634   Active    2022-04-28   2027-10-31           BR  Brazil
#> P177632   Active    2022-04-28   2024-12-31           BR  Brazil
#> P174067   Active    2022-04-27   2027-03-31           IN   India
#> P174564   Active    2022-01-19   2028-08-31           IN   India
#> P176107   Active    2021-12-21         <NA>           IN   India
#> P172187   Active    2021-12-10   2026-06-30           IN   India
#> P170590   Active    2021-11-29   2026-11-30           IN   India
#> P174732   Active    2021-11-05   2026-12-31           IN   India
#> P173589   Active    2021-09-30   2027-03-31           IN   India
#> P175221   Active    2021-09-30   2026-12-31           IN   India
#> P174778   Active    2021-06-24   2028-06-30           IN   India
#> P173978   Active    2021-06-17   2026-12-31           IN   India
#> P172226   Active    2021-06-04   2026-09-30           IN   India
#> P173958   Active    2021-03-31   2026-03-31           IN   India
#> P170811   Active    2021-03-31   2026-09-30           IN   India
#> P173704   Active    2021-03-24   2027-09-30           IN   India
#> P168633   Active    2021-03-09   2027-06-30           IN   India
#> P170645   Active    2020-12-15   2026-07-31           IN   India
#> P172213   Active    2020-12-15   2026-06-30           IN   India
#> P170873   Active    2020-12-15   2027-12-31           IN   India
#> P166020   Active    2020-11-30   2026-03-31           IN   India
#> P168097   Active    2020-10-23   2026-10-31           IN   India
#> P172605   Active    2020-09-22   2025-12-30           BR  Brazil
#> P169111   Active    2020-06-25   2026-12-31           IN   India
#> P174312   Active    2020-06-25   2026-12-31           IN   India
#> P166868   Active    2020-06-24   2025-12-31           IN   India
#> P170850   Active    2020-05-22   2025-12-31           BR  Brazil
#> P168590   Active    2020-05-18   2025-06-30           IN   India
#> P169140   Active    2020-04-22   2026-06-30           BR  Brazil
#> P167350   Active    2020-03-27   2025-03-18           IN   India
#> P163328   Active    2020-03-27   2026-06-30           IN   India
#> P170682   Active    2020-03-24   2026-06-30           BR  Brazil
#> P169134   Active    2020-03-24   2028-09-30           BR  Brazil
#> P165129   Active    2020-02-18   2025-03-31           IN   India
#> P168310   Active    2019-12-17   2027-03-31           IN   India
#> P157929   Active    2019-12-13   2025-12-31           IN   India
#> P162679   Active    2019-12-10   2025-11-30           IN   India
#> P163533   Active    2019-09-30   2025-12-31           IN   India
#> P165055   Active    2019-08-08   2026-12-31           BR  Brazil
#> P167455   Active    2019-07-18   2025-12-31           BR  Brazil
#> P167581   Active    2019-05-15   2025-03-31           IN   India
#> P160379   Active    2019-03-29   2025-12-31           IN   India
#> P157141   Active    2019-03-29   2024-12-31           IN   India
#> P167523   Active    2019-03-29   2025-03-31           IN   India
#> P166923   Active    2019-03-07   2025-06-30           IN   India
#> P165683   Active    2019-02-28   2026-06-30           BR  Brazil
#> P166578   Active    2019-02-21   2025-03-31           IN   India
#> P165695   Active    2018-12-18   2026-06-16           BR  Brazil
#> P158502   Active    2018-12-12   2025-10-31           IN   India
#> P160463   Active    2018-10-23   2025-10-31           IN   India
#> P162086   Active    2018-10-01   2024-12-31           IN   India
#> P158119   Active    2018-06-05   2025-09-28           IN   India
#> P156869   Active    2018-05-01   2025-03-31           IN   India
#> P158146   Active    2018-01-04   2025-06-30           IN   India
#> P163868   Active    2017-12-14   2024-12-31           BR  Brazil
#> P158522   Active    2017-12-01   2025-06-02           IN   India
#> P157702   Active    2017-12-01   2025-06-30           IN   India
#> P147158   Active    2017-10-20   2025-06-15           BR  Brazil
#> P155617   Active    2017-08-31   2025-09-30           IN   India
#> P156241   Active    2017-05-31   2025-06-23           IN   India
#> P153012   Active    2017-04-28   2025-03-31           BR  Brazil
#> P155303   Active    2017-04-12   2024-12-30           IN   India
#> P148775   Active    2017-04-12   2025-12-24           IN   India
#> P152698   Active    2017-03-15   2025-03-31           IN   India
#> P148531   Active    2017-01-26   2024-12-31           IN   India
#> P155007   Active    2016-05-13   2027-11-30           IN   India
#> P130544   Active    2016-03-31   2026-06-30           IN   India
#> P127725   Active    2015-12-08   2025-03-27           IN   India
#> P154990   Active    2015-06-02   2024-12-31           IN   India
#> P096124   Active    2011-06-30   2024-12-31           IN   India
#> P039027   Active    1994-10-28         <NA>           BR  Brazil
#> P108190 Pipeline          <NA>   2008-12-31           IN   India
#> P505866 Pipeline          <NA>         <NA>           BR  Brazil
#> P507322 Pipeline          <NA>         <NA>           BR  Brazil
#> P500380 Pipeline          <NA>         <NA>           IN   India
#> P502493 Pipeline          <NA>         <NA>           BR  Brazil
#> P110539 Pipeline          <NA>         <NA>           IN   India
#> P508840 Pipeline          <NA>         <NA>           IN   India
#> P500252 Pipeline          <NA>         <NA>           IN   India
#> P506955 Pipeline          <NA>         <NA>           BR  Brazil
#> P507029 Pipeline          <NA>         <NA>           BR  Brazil
#> P508202 Pipeline          <NA>         <NA>           BR  Brazil
#> P508363 Pipeline          <NA>         <NA>           BR  Brazil
#> P504126 Pipeline          <NA>         <NA>           BR  Brazil
#> P507066 Pipeline          <NA>         <NA>           IN   India
#> P508221 Pipeline          <NA>         <NA>           BR  Brazil
#> P180716 Pipeline          <NA>         <NA>           IN   India
#> P504276 Pipeline          <NA>         <NA>           BR  Brazil
#> P500570 Pipeline          <NA>         <NA>           BR  Brazil
#> P173090 Pipeline          <NA>         <NA>           BR  Brazil
#> P505177 Pipeline          <NA>         <NA>           IN   India
#> P506272 Pipeline          <NA>         <NA>           IN   India
#> P506321 Pipeline          <NA>         <NA>           BR  Brazil
#> P181608 Pipeline          <NA>         <NA>           BR  Brazil
#> P508025 Pipeline          <NA>         <NA>           BR  Brazil
#> P105370 Pipeline          <NA>   2018-05-04           IN   India
#> P500469 Pipeline          <NA>         <NA>           BR  Brazil
#> P501071 Pipeline          <NA>         <NA>           IN   India
#> P181511 Pipeline          <NA>         <NA>           BR  Brazil
#> P180932 Pipeline          <NA>         <NA>           IN   India
#> P505235 Pipeline          <NA>         <NA>           BR  Brazil
#> P507629 Pipeline          <NA>         <NA>           BR  Brazil
#> P178053 Pipeline          <NA>         <NA>           IN   India
#> P500564 Pipeline          <NA>         <NA>           IN   India
#> P505590 Pipeline          <NA>         <NA>           BR  Brazil
#> P506976 Pipeline          <NA>         <NA>           IN   India
#> P181767 Pipeline          <NA>         <NA>           BR  Brazil
#> P506329 Pipeline          <NA>         <NA>           BR  Brazil
#> P508489 Pipeline          <NA>         <NA>           IN   India
#> P181244 Pipeline          <NA>         <NA>           IN   India
#> P502499 Pipeline          <NA>         <NA>           IN   India
#> P500151 Pipeline          <NA>         <NA>           IN   India
#> P508719 Pipeline          <NA>         <NA>           IN   India
#> P505563 Pipeline          <NA>         <NA>           IN   India
#> P507628 Pipeline          <NA>         <NA>           BR  Brazil
#> P179349 Pipeline          <NA>         <NA>           IN   India
#> P504543 Pipeline          <NA>         <NA>           BR  Brazil
#> P505914 Pipeline          <NA>         <NA>           IN   India
#> P509041 Pipeline          <NA>         <NA>           BR  Brazil
#> P506142 Pipeline          <NA>         <NA>           BR  Brazil
#> P500614 Pipeline          <NA>         <NA>           BR  Brazil
#> P506861 Pipeline          <NA>         <NA>           BR  Brazil
#> P180699 Pipeline          <NA>         <NA>           IN   India
#> P507340 Pipeline          <NA>         <NA>           IN   India
#> P114890 Pipeline          <NA>   2011-10-01           BR  Brazil
#> P500168 Pipeline          <NA>         <NA>           IN   India
#> P506320 Pipeline          <NA>         <NA>           BR  Brazil
#> P500431 Pipeline          <NA>         <NA>           BR  Brazil
#> P508453 Pipeline          <NA>         <NA>           IN   India
#> P504897 Pipeline          <NA>         <NA>           BR  Brazil
#> P503872 Pipeline          <NA>         <NA>           IN   India
#> P506340 Pipeline          <NA>         <NA>           IN   India
#> P507236 Pipeline          <NA>         <NA>           IN   India
#> P507910 Pipeline          <NA>         <NA>           IN   India
#> P504899 Pipeline          <NA>         <NA>           BR  Brazil
#> P500501 Pipeline          <NA>         <NA>           BR  Brazil
#> P181020 Pipeline          <NA>         <NA>           IN   India
#> P114896 Pipeline          <NA>   2011-10-01           IN   India
#> P504253 Pipeline          <NA>         <NA>           BR  Brazil
#> P502491 Pipeline          <NA>         <NA>           IN   India
#> P181524 Pipeline          <NA>         <NA>           IN   India
#> P073882   Active          <NA>   2004-09-30           BR  Brazil
#> P177159   Active          <NA>   2025-06-30           IN   India
#> P171257   Active          <NA>         <NA>           BR  Brazil
#> P132620   Active          <NA>   2025-03-31           IN   India
#> P122387   Active          <NA>         <NA>           IN   India
#> P128921   Active          <NA>   2025-03-31           IN   India
#> P158000   Active          <NA>   2026-12-31           BR  Brazil
#> P160018   Active          <NA>   2026-11-30           IN   India
#> P172497   Active          <NA>   2027-11-30           BR  Brazil
#> P164602   Active          <NA>   2025-11-30           BR  Brazil
#> P152285   Active          <NA>   2024-11-30           BR  Brazil
#> P009585   Active          <NA>         <NA>           IN   India
#>                              region total_commitment ibrd_commitment
#> P507508                  South Asia         0.000000          0.0000
#> P178253                  South Asia       325.100000        325.1000
#> P181463                  South Asia       188.280000        188.2800
#> P179935                  South Asia       225.520000        225.5200
#> P180429 Latin America and Caribbean       100.000000        100.0000
#> P178254                  South Asia       200.000000        200.0000
#> P180555 Latin America and Caribbean       150.000000        150.0000
#> P181501 Latin America and Caribbean       110.000000        110.0000
#> P181195                  South Asia      1500.000000       1468.5000
#> P177965                  South Asia       195.000000        195.0000
#> P180430 Latin America and Caribbean        90.000000         90.0000
#> P180462 Latin America and Caribbean        61.220000         61.2200
#> P174825                  South Asia       150.000000        150.0000
#> P178557 Latin America and Caribbean        90.000000         90.0000
#> P179357                  South Asia        96.200000         96.2000
#> P179749                  South Asia       135.000000        135.0000
#> P500524 Latin America and Caribbean       350.000000         70.0000
#> P180497 Latin America and Caribbean       541.880000        541.8800
#> P177474 Latin America and Caribbean        50.000000         50.0000
#> P178581                  South Asia       452.000000        452.0000
#> P175723 Latin America and Caribbean        80.000000         80.0000
#> P180634                  South Asia       100.000000        100.0000
#> P179189                  South Asia       300.000000        300.0000
#> P179365 Latin America and Caribbean       300.000000        300.0000
#> P179182 Latin America and Caribbean       135.238245        135.2382
#> P178993 Latin America and Caribbean       100.000000        100.0000
#> P178567 Latin America and Caribbean        50.000000         50.0000
#> P178663 Latin America and Caribbean        50.000000         50.0000
#> P179046 Latin America and Caribbean        40.000000         40.0000
#> P179088 Latin America and Caribbean        50.000000         50.0000
#> P176733                  South Asia        46.000000         46.0000
#> P176032                  South Asia       200.000000        200.0000
#> P179249                  South Asia       300.000000        300.0000
#> P179337                  South Asia       251.030000        251.0300
#> P178418                  South Asia       140.000000        140.0000
#> P177917                  South Asia       255.500000        255.5000
#> P177980                  South Asia       150.000000        150.0000
#> P177876                  South Asia       148.000000        148.0000
#> P178072 Latin America and Caribbean        84.550000         84.5500
#> P177671                  South Asia        82.000000         82.0000
#> P176982 Latin America and Caribbean        86.100000         86.1000
#> P179039                  South Asia       363.000000        363.0000
#> P175811                  South Asia       100.000000        100.0000
#> P174593                  South Asia       108.000000        108.0000
#> P178888 Latin America and Caribbean       500.000000        500.0000
#> P175728                  South Asia       280.000000        280.0000
#> P178252                  South Asia       350.000000        350.0000
#> P175261                  South Asia       150.000000        150.0000
#> P178339 Latin America and Caribbean        40.000000         40.0000
#> P177070 Latin America and Caribbean        40.000000         40.0000
#> P171750                  South Asia       165.000000        150.0000
#> P178146                  South Asia       500.000000        500.0000
#> P175676                  South Asia       500.000000        500.0000
#> P177915                  South Asia       250.000000        250.0000
#> P174798                  South Asia       200.000000        150.0000
#> P178729 Latin America and Caribbean       135.238245        135.2382
#> P176404                  South Asia       162.000000        162.0000
#> P177856                  South Asia       245.000000        245.0000
#> P178563 Latin America and Caribbean       250.000000        250.0000
#> P168634 Latin America and Caribbean       130.000000        130.0000
#> P177632 Latin America and Caribbean       500.000000        500.0000
#> P174067                  South Asia        47.000000         47.0000
#> P174564                  South Asia       125.000000        125.0000
#> P176107                  South Asia       150.000000        150.0000
#> P172187                  South Asia       115.000000        115.0000
#> P170590                  South Asia       270.000000        135.0000
#> P174732                  South Asia       160.000000        160.0000
#> P173589                  South Asia        40.000000         40.0000
#> P175221                  South Asia       300.000000        150.0000
#> P174778                  South Asia       370.000000        125.0000
#> P173978                  South Asia       250.000000        250.0000
#> P172226                  South Asia       500.000000        500.0000
#> P173958                  South Asia        32.000000         32.0000
#> P170811                  South Asia       210.000000        105.0000
#> P173704                  South Asia       750.000000        500.0000
#> P168633                  South Asia       210.000000        105.0000
#> P170645                  South Asia       167.000000        100.0000
#> P172213                  South Asia        68.000000         68.0000
#> P170873                  South Asia       500.000000        250.0000
#> P166020                  South Asia       105.000000        105.0000
#> P168097                  South Asia       120.000000        120.0000
#> P172605 Latin America and Caribbean       125.000000        125.0000
#> P169111                  South Asia       381.000000        381.0000
#> P174312                  South Asia       381.000000        381.0000
#> P166868                  South Asia       500.000000        500.0000
#> P170850 Latin America and Caribbean        38.000000         38.0000
#> P168590                  South Asia        50.000000         50.0000
#> P169140 Latin America and Caribbean        97.000000         97.0000
#> P167350                  South Asia       466.350000        466.3500
#> P163328                  South Asia        82.000000         82.0000
#> P170682 Latin America and Caribbean        98.800000         98.8000
#> P169134 Latin America and Caribbean        80.000000         80.0000
#> P165129                  South Asia        80.000000         80.0000
#> P168310                  South Asia       210.000000        210.0000
#> P157929                  South Asia        88.000000         88.0000
#> P162679                  South Asia       290.000000        145.0000
#> P163533                  South Asia       165.000000        165.0000
#> P165055 Latin America and Caribbean       139.880000        139.8800
#> P167455 Latin America and Caribbean       100.000000        100.0000
#> P167581                  South Asia       328.000000        328.0000
#> P160379                  South Asia       199.810000        150.0000
#> P157141                  South Asia       250.000000        250.0000
#> P167523                  South Asia       400.000000        400.0000
#> P166923                  South Asia        31.580000         31.5800
#> P165683 Latin America and Caribbean       126.886000        126.8860
#> P166578                  South Asia        25.200000         25.2000
#> P165695 Latin America and Caribbean       250.000000        250.0000
#> P158502                  South Asia       122.000000        122.0000
#> P160463                  South Asia       172.200000        172.2000
#> P162086                  South Asia       310.000000        310.0000
#> P158119                  South Asia       450.000000        450.0000
#> P156869                  South Asia        21.700000         21.7000
#> P158146                  South Asia       120.000000        120.0000
#> P163868 Latin America and Caribbean       250.000000        250.0000
#> P158522                  South Asia       318.000000        318.0000
#> P157702                  South Asia       100.000000        100.0000
#> P147158 Latin America and Caribbean        50.000000         50.0000
#> P155617                  South Asia       200.000000        200.0000
#> P156241                  South Asia       125.000000        125.0000
#> P153012 Latin America and Caribbean        73.300000         73.3000
#> P155303                  South Asia       116.200000        116.2000
#> P148775                  South Asia       375.000000        375.0000
#> P152698                  South Asia       175.000000        175.0000
#> P148531                  South Asia       100.000000          0.0000
#> P155007                  South Asia       648.000000        500.0000
#> P130544                  South Asia       100.000000        100.0000
#> P127725                  South Asia       250.000000          0.0000
#> P154990                  South Asia       250.000000          0.0000
#> P096124                  South Asia       648.000000        648.0000
#> P039027 Latin America and Caribbean         6.400000          0.0000
#> P108190                  South Asia         0.000000          0.0000
#> P505866 Latin America and Caribbean         0.000000          0.0000
#> P507322 Latin America and Caribbean         0.000000          0.0000
#> P500380                  South Asia         0.000000          0.0000
#> P502493 Latin America and Caribbean        45.000000          0.0000
#> P110539                  South Asia         0.000000          0.0000
#> P508840                  South Asia         0.000000          0.0000
#> P500252                  South Asia         0.000000          0.0000
#> P506955 Latin America and Caribbean         0.000000          0.0000
#> P507029 Latin America and Caribbean         0.000000          0.0000
#> P508202 Latin America and Caribbean         0.000000          0.0000
#> P508363 Latin America and Caribbean         0.000000          0.0000
#> P504126 Latin America and Caribbean         8.560000          0.0000
#> P507066                  South Asia         0.000000          0.0000
#> P508221 Latin America and Caribbean         0.000000          0.0000
#> P180716                  South Asia      1000.000000       1000.0000
#> P504276 Latin America and Caribbean       900.000000          0.0000
#> P500570 Latin America and Caribbean        13.400000         13.4000
#> P173090 Latin America and Caribbean       200.000000        200.0000
#> P505177                  South Asia         1.000000          1.0000
#> P506272                  South Asia         0.000000          0.0000
#> P506321 Latin America and Caribbean         0.000000          0.0000
#> P181608 Latin America and Caribbean        50.000000         50.0000
#> P508025 Latin America and Caribbean         0.000000          0.0000
#> P105370                  South Asia         0.000000          0.0000
#> P500469 Latin America and Caribbean       162.400000          0.0000
#> P501071                  South Asia       250.000000          0.0000
#> P181511 Latin America and Caribbean        90.000000         90.0000
#> P180932                  South Asia       212.640000        212.6400
#> P505235 Latin America and Caribbean         0.000000          0.0000
#> P507629 Latin America and Caribbean         0.000000          0.0000
#> P178053                  South Asia       350.000000        350.0000
#> P500564                  South Asia       135.000000          0.0000
#> P505590 Latin America and Caribbean       200.000000          0.0000
#> P506976                  South Asia         0.000000          0.0000
#> P181767 Latin America and Caribbean       100.000000        100.0000
#> P506329 Latin America and Caribbean         0.000000          0.0000
#> P508489                  South Asia         0.000000          0.0000
#> P181244                  South Asia       315.000000        315.0000
#> P502499                  South Asia       196.000000          0.0000
#> P500151                  South Asia         0.000000          0.0000
#> P508719                  South Asia         0.000000          0.0000
#> P505563                  South Asia       490.000000          0.0000
#> P507628 Latin America and Caribbean         0.000000          0.0000
#> P179349                  South Asia         0.000000          0.0000
#> P504543 Latin America and Caribbean         0.000000          0.0000
#> P505914                  South Asia      5400.000000          0.0000
#> P509041 Latin America and Caribbean         0.000000          0.0000
#> P506142 Latin America and Caribbean         0.000000          0.0000
#> P500614 Latin America and Caribbean         0.000000          0.0000
#> P506861 Latin America and Caribbean         0.000000          0.0000
#> P180699                  South Asia       150.000000        150.0000
#> P507340                  South Asia         0.000000          0.0000
#> P114890 Latin America and Caribbean         0.000000          0.0000
#> P500168                  South Asia         0.000000          0.0000
#> P506320 Latin America and Caribbean         0.000000          0.0000
#> P500431 Latin America and Caribbean        50.000000          0.0000
#> P508453                  South Asia         0.000000          0.0000
#> P504897 Latin America and Caribbean        30.000000          0.0000
#> P503872                  South Asia       280.000000          0.0000
#> P506340                  South Asia         0.000000          0.0000
#> P507236                  South Asia         0.000000          0.0000
#> P507910                  South Asia         0.000000          0.0000
#> P504899 Latin America and Caribbean         0.000000          0.0000
#> P500501 Latin America and Caribbean      2300.000000       2300.0000
#> P181020                  South Asia       131.000000        131.0000
#> P114896                  South Asia         0.000000          0.0000
#> P504253 Latin America and Caribbean       375.000000          0.0000
#> P502491                  South Asia      2830.250000        128.0000
#> P181524                  South Asia       420.000000        420.0000
#> P073882 Latin America and Caribbean         1.100000          0.0000
#> P177159                  South Asia         0.852516          0.0000
#> P171257 Latin America and Caribbean        19.284404          0.0000
#> P132620                  South Asia        25.000000          0.0000
#> P122387                  South Asia         1.160000          0.0000
#> P128921                  South Asia        18.000000          0.0000
#> P158000 Latin America and Caribbean        60.330000          0.0000
#> P160018                  South Asia        22.935780          0.0000
#> P172497 Latin America and Caribbean        24.577982          0.0000
#> P164602 Latin America and Caribbean        21.000000          0.0000
#> P152285 Latin America and Caribbean         1.000000          0.0000
#> P009585                  South Asia         1.300000          0.0000
#>         ida_commitment            lending_instrument
#> P507508           0.00 Program-for-Results Financing
#> P178253           0.00  Investment Project Financing
#> P181463           0.00 Program-for-Results Financing
#> P179935           0.00  Investment Project Financing
#> P180429           0.00  Investment Project Financing
#> P178254           0.00  Investment Project Financing
#> P180555           0.00  Investment Project Financing
#> P181501           0.00    Development Policy Lending
#> P181195          31.50    Development Policy Lending
#> P177965           0.00 Program-for-Results Financing
#> P180430           0.00  Investment Project Financing
#> P180462           0.00  Investment Project Financing
#> P174825           0.00 Program-for-Results Financing
#> P178557           0.00  Investment Project Financing
#> P179357           0.00  Investment Project Financing
#> P179749           0.00  Investment Project Financing
#> P500524         280.00  Investment Project Financing
#> P180497           0.00    Development Policy Lending
#> P177474           0.00  Investment Project Financing
#> P178581           0.00 Program-for-Results Financing
#> P175723           0.00  Investment Project Financing
#> P180634           0.00 Program-for-Results Financing
#> P179189           0.00 Program-for-Results Financing
#> P179365           0.00  Investment Project Financing
#> P179182           0.00    Development Policy Lending
#> P178993           0.00  Investment Project Financing
#> P178567           0.00  Investment Project Financing
#> P178663           0.00  Investment Project Financing
#> P179046           0.00  Investment Project Financing
#> P179088           0.00  Investment Project Financing
#> P176733           0.00  Investment Project Financing
#> P176032           0.00 Program-for-Results Financing
#> P179249           0.00 Program-for-Results Financing
#> P179337           0.00  Investment Project Financing
#> P178418           0.00  Investment Project Financing
#> P177917           0.00  Investment Project Financing
#> P177980           0.00 Program-for-Results Financing
#> P177876           0.00  Investment Project Financing
#> P178072           0.00  Investment Project Financing
#> P177671           0.00 Program-for-Results Financing
#> P176982           0.00  Investment Project Financing
#> P179039           0.00 Program-for-Results Financing
#> P175811           0.00 Program-for-Results Financing
#> P174593           0.00  Investment Project Financing
#> P178888           0.00  Investment Project Financing
#> P175728           0.00  Investment Project Financing
#> P178252           0.00 Program-for-Results Financing
#> P175261           0.00 Program-for-Results Financing
#> P178339           0.00  Investment Project Financing
#> P177070           0.00  Investment Project Financing
#> P171750           0.00 Program-for-Results Financing
#> P178146           0.00 Program-for-Results Financing
#> P175676           0.00 Program-for-Results Financing
#> P177915           0.00 Program-for-Results Financing
#> P174798           0.00  Investment Project Financing
#> P178729           0.00    Development Policy Lending
#> P176404           0.00  Investment Project Financing
#> P177856           0.00  Investment Project Financing
#> P178563           0.00 Program-for-Results Financing
#> P168634           0.00 Program-for-Results Financing
#> P177632           0.00    Development Policy Lending
#> P174067           0.00  Investment Project Financing
#> P174564           0.00 Program-for-Results Financing
#> P176107           0.00  Investment Project Financing
#> P172187           0.00 Program-for-Results Financing
#> P170590           0.00  Investment Project Financing
#> P174732           0.00 Program-for-Results Financing
#> P173589           0.00  Investment Project Financing
#> P175221           0.00 Program-for-Results Financing
#> P174778           0.00 Program-for-Results Financing
#> P173978           0.00 Program-for-Results Financing
#> P172226           0.00 Program-for-Results Financing
#> P173958           0.00  Investment Project Financing
#> P170811           0.00  Investment Project Financing
#> P173704           0.00 Program-for-Results Financing
#> P168633           0.00  Investment Project Financing
#> P170645           0.00  Investment Project Financing
#> P172213           0.00  Investment Project Financing
#> P170873           0.00  Investment Project Financing
#> P166020           0.00  Investment Project Financing
#> P168097           0.00  Investment Project Financing
#> P172605           0.00  Investment Project Financing
#> P169111           0.00  Investment Project Financing
#> P174312           0.00  Investment Project Financing
#> P166868           0.00 Program-for-Results Financing
#> P170850           0.00  Investment Project Financing
#> P168590           0.00  Investment Project Financing
#> P169140           0.00  Investment Project Financing
#> P167350           0.00  Investment Project Financing
#> P163328           0.00  Investment Project Financing
#> P170682           0.00  Investment Project Financing
#> P169134           0.00  Investment Project Financing
#> P165129           0.00  Investment Project Financing
#> P168310           0.00  Investment Project Financing
#> P157929           0.00  Investment Project Financing
#> P162679           0.00  Investment Project Financing
#> P163533           0.00  Investment Project Financing
#> P165055           0.00  Investment Project Financing
#> P167455           0.00  Investment Project Financing
#> P167581           0.00  Investment Project Financing
#> P160379           0.00  Investment Project Financing
#> P157141           0.00  Investment Project Financing
#> P167523           0.00 Program-for-Results Financing
#> P166923           0.00  Investment Project Financing
#> P165683           0.00  Investment Project Financing
#> P166578           0.00 Program-for-Results Financing
#> P165695           0.00  Investment Project Financing
#> P158502           0.00  Investment Project Financing
#> P160463           0.00  Investment Project Financing
#> P162086           0.00  Investment Project Financing
#> P158119           0.00 Program-for-Results Financing
#> P156869           0.00  Investment Project Financing
#> P158146           0.00 Program-for-Results Financing
#> P163868           0.00 Program-for-Results Financing
#> P158522           0.00  Investment Project Financing
#> P157702           0.00  Investment Project Financing
#> P147158           0.00  Investment Project Financing
#> P155617           0.00  Investment Project Financing
#> P156241           0.00  Investment Project Financing
#> P153012           0.00  Investment Project Financing
#> P155303           0.00  Investment Project Financing
#> P148775           0.00  Investment Project Financing
#> P152698           0.00  Investment Project Financing
#> P148531         100.00  Investment Project Financing
#> P155007           0.00 Program-for-Results Financing
#> P130544           0.00  Investment Project Financing
#> P127725         250.00  Investment Project Financing
#> P154990         250.00  Investment Project Financing
#> P096124           0.00  Investment Project Financing
#> P039027           0.00                          <NA>
#> P108190           0.00      Specific Investment Loan
#> P505866           0.00    Development Policy Lending
#> P507322           0.00    Development Policy Lending
#> P500380           0.00  Investment Project Financing
#> P502493          45.00  Investment Project Financing
#> P110539           0.00                          <NA>
#> P508840           0.00 Program-for-Results Financing
#> P500252           0.00  Investment Project Financing
#> P506955           0.00  Investment Project Financing
#> P507029           0.00  Investment Project Financing
#> P508202           0.00  Investment Project Financing
#> P508363           0.00  Investment Project Financing
#> P504126           8.56  Investment Project Financing
#> P507066           0.00  Investment Project Financing
#> P508221           0.00  Investment Project Financing
#> P180716           0.00 Program-for-Results Financing
#> P504276         900.00  Investment Project Financing
#> P500570           0.00  Investment Project Financing
#> P173090           0.00    Development Policy Lending
#> P505177           0.00  Investment Project Financing
#> P506272           0.00 Program-for-Results Financing
#> P506321           0.00    Development Policy Lending
#> P181608           0.00  Investment Project Financing
#> P508025           0.00 Program-for-Results Financing
#> P105370           0.00                          <NA>
#> P500469         162.40  Investment Project Financing
#> P501071         250.00  Investment Project Financing
#> P181511           0.00  Investment Project Financing
#> P180932           0.00  Investment Project Financing
#> P505235           0.00    Development Policy Lending
#> P507629           0.00  Investment Project Financing
#> P178053           0.00 Program-for-Results Financing
#> P500564         135.00 Program-for-Results Financing
#> P505590         200.00  Investment Project Financing
#> P506976           0.00 Program-for-Results Financing
#> P181767           0.00  Investment Project Financing
#> P506329           0.00  Investment Project Financing
#> P508489           0.00 Program-for-Results Financing
#> P181244           0.00 Program-for-Results Financing
#> P502499         196.00  Investment Project Financing
#> P500151           0.00 Program-for-Results Financing
#> P508719           0.00 Program-for-Results Financing
#> P505563         490.00  Investment Project Financing
#> P507628           0.00  Investment Project Financing
#> P179349           0.00  Investment Project Financing
#> P504543           0.00  Investment Project Financing
#> P505914        5400.00  Investment Project Financing
#> P509041           0.00  Investment Project Financing
#> P506142           0.00  Investment Project Financing
#> P500614           0.00    Development Policy Lending
#> P506861           0.00    Development Policy Lending
#> P180699           0.00 Program-for-Results Financing
#> P507340           0.00  Investment Project Financing
#> P114890           0.00      Specific Investment Loan
#> P500168           0.00  Investment Project Financing
#> P506320           0.00  Investment Project Financing
#> P500431          50.00  Investment Project Financing
#> P508453           0.00  Investment Project Financing
#> P504897          30.00  Investment Project Financing
#> P503872         280.00 Program-for-Results Financing
#> P506340           0.00  Investment Project Financing
#> P507236           0.00  Investment Project Financing
#> P507910           0.00 Program-for-Results Financing
#> P504899           0.00  Investment Project Financing
#> P500501           0.00 Program-for-Results Financing
#> P181020           0.00  Investment Project Financing
#> P114896           0.00      Specific Investment Loan
#> P504253         375.00  Investment Project Financing
#> P502491        2702.25 Program-for-Results Financing
#> P181524           0.00  Investment Project Financing
#> P073882           0.00                          <NA>
#> P177159           0.00  Investment Project Financing
#> P171257           0.00  Investment Project Financing
#> P132620           0.00  Investment Project Financing
#> P122387           0.00  Investment Project Financing
#> P128921           0.00  Investment Project Financing
#> P158000           0.00  Investment Project Financing
#> P160018           0.00 Program-for-Results Financing
#> P172497           0.00  Investment Project Financing
#> P164602           0.00  Investment Project Financing
#> P152285           0.00  Investment Project Financing
#> P009585           0.00      Specific Investment Loan
#>                                                                                                                  borrower
#> P507508                                                                                                              <NA>
#> P178253                                                                                                              <NA>
#> P181463                                                                                                             India
#> P179935                                                                                                             India
#> P180429                                                                                  Government of the State of Bahia
#> P178254                                                                                                              <NA>
#> P180555                                                                                                              <NA>
#> P181501                                                                                                  State of Sergipe
#> P181195                                                                                                             India
#> P177965                                                                                                              <NA>
#> P180430                                                                             Government of the State of Pernambuco
#> P180462                                                                             Secretaria de Economia e Planejamento
#> P174825                                                                                                             India
#> P178557                                               CIM - AMFRI (Foz do Rio Itaja� Region Consortium of Municipalities)
#> P179357                                                                                    Department of Economic Affairs
#> P179749                                                                                               Government of India
#> P500524                                                                                                              <NA>
#> P180497                                                                                          State Government of Cear
#> P177474                                                                                                     State of Piau
#> P178581                                                                                                             India
#> P175723                                                                                              State of Mato Grosso
#> P180634                                                                                                             India
#> P179189                                                                                               Ministry of Finance
#> P179365                                                                                     Federative Republic of Brazil
#> P179182                                                                                    Municipality of Rio de Janeiro
#> P178993                                                                                              STATE OF MATO GROSSO
#> P178567                                                                                                              <NA>
#> P178663                                                                                                    State of Piaui
#> P179046                                                                                                     State of Acre
#> P179088                                                                            State Secretariat of Planning (SEPLAN)
#> P176733                                                                                                             India
#> P176032                                                                                                             India
#> P179249                                                                                                             India
#> P179337                                                                                                             India
#> P178418                                                                                                             India
#> P177917                                                                                                             India
#> P177980                                                                                                             India
#> P177876                                                                                                             India
#> P178072                                                                                                              <NA>
#> P177671                                                                                                             India
#> P176982                                                                                           State of Espirito Santo
#> P179039                                                                                                             India
#> P175811                                                                                                             India
#> P174593                                                                                                             India
#> P178888                                                                                                   Banco do Brasil
#> P175728                                                                                                             India
#> P178252                                                                                                             India
#> P175261                                                                                                             India
#> P178339                                                                                              State of Mato Grosso
#> P177070                                         State of Alagoas, with the guarantee of the Federative Republic of Brazil
#> P171750                                                                                               State Bank of India
#> P178146                                                                                                             India
#> P175676                                                                                                             India
#> P177915                                                                        Government of Gujarat, Ministry of Finance
#> P174798                                                                                                             INDIA
#> P178729                                                                                    Municipality of Rio de Janeiro
#> P176404                                                                                                             India
#> P177856                                                           Dedicated Freight Corridor Corporation of India Limited
#> P178563                                                                                 THE FEDERATIVE REPUBLIC OF BRAZIL
#> P168634                                                                                                   State of Parana
#> P177632                                                                                                    State of Goi�s
#> P174067                                                                                                             India
#> P174564                                                                                                             India
#> P176107                                                                                                             India
#> P172187                                                                                                             India
#> P170590                                                                                                             INDIA
#> P174732                                                                                                             India
#> P173589                                                                                                             India
#> P175221                                                                                                             India
#> P174778                                                                                                             India
#> P173978                                                                                                             India
#> P172226                                                                                                             India
#> P173958                                                       India (Department of Economic Affairs, Government of India)
#> P170811                                                                                                             India
#> P173704                                                                                               Ministry of Finance
#> P168633                                                                                                             India
#> P170645                                                                                               Ministry of Finance
#> P172213                                                                                                             India
#> P170873                                                               Ministry of Finance, Department of Economic Affairs
#> P166020                                                                                                 Republic of India
#> P168097                                                                                                             India
#> P172605                                                                                          Municipality of Salvador
#> P169111                                                                                                             India
#> P174312                                                                                                              <NA>
#> P166868                                                                                                             India
#> P170850                                                                                     Federative Republic of Brazil
#> P168590                                                                                                             India
#> P169140                                                                                         Municipality of S�o Paulo
#> P167350                                                                                                             India
#> P163328                                                                                                             India
#> P170682                                                           Banco Regional de Desenvolvimento do Extremo Sul (BRDE)
#> P169134                                                                                       Municipio de Belo Horizonte
#> P165129                                                                                                 Republic of India
#> P168310                                                                                                 Republic of India
#> P157929                                                                                                             India
#> P162679                                                                                                 Republic of India
#> P163533                                                                                                 Republic of India
#> P165055                                                                                                    State of Ceara
#> P167455                                                                                                    State of Ceara
#> P167581                                                                                                 Republic of India
#> P160379                                                                                                             India
#> P157141                                                                                                             India
#> P167523                                                                                                 Republic of India
#> P166923                                                                                                             India
#> P165683                                                                                                              <NA>
#> P166578                                                                                                             India
#> P165695                                                                                                            SABESP
#> P158502                                                                                                             India
#> P160463                                                                                                 Republic of India
#> P162086                                                                                               Government of India
#> P158119                                          Department of Economic Affairs, Ministry of Finance, Government of India
#> P156869                                                                                                             India
#> P158146                                                                                                             India
#> P163868                                                                      Ministry of Economy (Minist�rio da Economia)
#> P158522                                                                                                             India
#> P157702                                                                    Department of Economic Affairs, Govt. of India
#> P147158                                                                                       State Government of Paraiba
#> P155617                                                                                                 Republic of India
#> P156241                                                                                                             India
#> P153012                                                                                         Municipality of Fortaleza
#> P155303                                                                                                             India
#> P148775                                                               Department of Economic Affairs, Government of India
#> P152698                                                               Ministry of Finance, Department of Economic Affairs
#> P148531                                                                                                             India
#> P155007                                                                                               State Bank of India
#> P130544                                                                                                             India
#> P127725                                                                                                             India
#> P154990                                                                                                             India
#> P096124                                                                                                             India
#> P039027                                                                                                              <NA>
#> P108190                                                                                                              <NA>
#> P505866                                                                                                              <NA>
#> P507322                                                                                                              <NA>
#> P500380                                                                                                              <NA>
#> P502493                                                                                                              <NA>
#> P110539                                                                                                              <NA>
#> P508840                                                                                                              <NA>
#> P500252                                                                                                              <NA>
#> P506955                                                                                                              <NA>
#> P507029                                                                                                              <NA>
#> P508202                                                                                                              <NA>
#> P508363                                                                                                              <NA>
#> P504126                                                                                                              <NA>
#> P507066                                                                                                              <NA>
#> P508221                                                                                                              <NA>
#> P180716                                                                                               Ministry of Finance
#> P504276                                                                                                              <NA>
#> P500570                                                                                                              <NA>
#> P173090                                                                                                              <NA>
#> P505177                                                                                                              <NA>
#> P506272                                                                                                              <NA>
#> P506321                                                                                                              <NA>
#> P181608                                                                                                 State of Amazonas
#> P508025                                                                                                              <NA>
#> P105370                                                                                                              <NA>
#> P500469                                                                                                              <NA>
#> P501071                                                                                                              <NA>
#> P181511                                                                     Complexo Industrial Portuario de Pecem (CIPP)
#> P180932                                                                                                             India
#> P505235                                                                                                              <NA>
#> P507629                                                                                                              <NA>
#> P178053                                                                                                 Republic of India
#> P500564                                                                                                              <NA>
#> P505590                                                                                                              <NA>
#> P506976                                                                                                              <NA>
#> P181767                                                                                                              <NA>
#> P506329                                                                                                              <NA>
#> P508489                                                                                                              <NA>
#> P181244                                                                                               Ministry of Finance
#> P502499                                                                                                              <NA>
#> P500151                                                                                                              <NA>
#> P508719                                                                                                              <NA>
#> P505563                                                                                                              <NA>
#> P507628                                                                                                              <NA>
#> P179349                                                                                                              <NA>
#> P504543                                                                                                              <NA>
#> P505914                                                                                                              <NA>
#> P509041                                                                                                              <NA>
#> P506142                                                                                                              <NA>
#> P500614                                                                                                              <NA>
#> P506861                                                                                                              <NA>
#> P180699                                                                                                             India
#> P507340                                                                                                              <NA>
#> P114890                                                                                                              <NA>
#> P500168                                                                                                              <NA>
#> P506320                                                                                                              <NA>
#> P500431                                                                                                              <NA>
#> P508453                                                                                                              <NA>
#> P504897                                                                                                              <NA>
#> P503872                                                                                                              <NA>
#> P506340                                                                                                              <NA>
#> P507236                                                                                                              <NA>
#> P507910                                                                                                              <NA>
#> P504899                                                                                                              <NA>
#> P500501                                                                                                              <NA>
#> P181020                                                                                               Government of India
#> P114896                                                                                                              <NA>
#> P504253                                                                                                              <NA>
#> P502491                                                                                                              <NA>
#> P181524                                                               Ministry of Finance, Department of Economic Affairs
#> P073882                                                                                                              <NA>
#> P177159                                                            Institute for Financial Management and Research (IFMR)
#> P171257 Fundo Brasileiro de Biodiversidade - FUNBIO, Fundacao Getulio Vargas - FGV, Conservacao Internacional - CI Brazil
#> P132620                                                                                        Government of India, India
#> P122387                                                                                                              <NA>
#> P128921                                                                                                              <NA>
#> P158000 Fundo Brasileiro de Biodiversidade - FUNBIO, Conserva��o Internacional - CI Brazil, Funda��o Get�lio Vargas - FGV
#> P160018                                                                                               State Bank of India
#> P172497                                                                                                              IICA
#> P164602                                       Brazil - Deutsche Gesellschaft f�r Internationale Zusammenarbeit GmbH (GIZ)
#> P152285                                                                                  Funda��o Pro-Natureza - FUNATURA
#> P009585                                                                                                              <NA>
#>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              implementing_agency
#> P507508                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> P178253                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   Department of Agriculture, Government of Uttar Pradesh
#> P181463                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           Planning Department, Government of Maharashtra
#> P179935                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           Government of Tripura, Government of Nagaland, Ministry of Development of North Eastern Region
#> P180429                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       CAR - Companhia de Desenvolvimento e Acao Regional
#> P178254                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               Ishita Roy
#> P180555                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        Secretary of Infrastructure of the State of Bahia
#> P181501                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            State Secretariate of Finance
#> P181195                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     Ministry of New and Renewable Energy
#> P177965                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> P180430                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                Pernambuco Water and Climate Agency (Ag�ncia Pernambucana de �guas e Clima - APAC), Pernambuco Sanitation Company (Companhia Pernambucana de Saneamento - COMPESA), Secretariat of Water Resources and WSS (Secretaria de Recursos H�dricos e Saneamento)
#> P180462                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            Secretaria de Estado da Ci�ncia, Tecnologia, Inova��o, Educa��o Profissional,
#> P174825                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           West Bengal Department of Industries, Commerce and Enterprises
#> P178557                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        Consorcio Intermunicipal Multifinalit�rio - AMFRI
#> P179357                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         Watershed Management Directorate
#> P179749                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               Uttarakhand State Disaster Management Authority, Government of Uttarakhand
#> P500524                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> P180497                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               State Secretary of Finance
#> P177474                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            Piau� State Secretariat for Planning (SEPLAN)
#> P178581                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       Public Works Roads Department, Government of Assam
#> P175723                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            State Secretary for Family Agriculture (SEAF)
#> P180634                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                Planning and Development Department, Government of Sikkim
#> P179189                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                Tamil Nadu Urban Infrastructure Financial Services Limited, Tamil Nadu Municipal Administration & Water Supply Department
#> P179365                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  Ministry of Citizenship
#> P179182                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      Secretaria Municipal de Fazenda e Planejamento, Secretaria Municipal de Transportes
#> P178993                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   SECRETARIAT OF EDUCATION - MATO GROSSO
#> P178567                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      State Secretariat of Health (SESAPI), State Secretariat of Social Assistance, Labor and Human Rights (SASC), State Secretariat of Planning (SEPLAN)
#> P178663                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          Secretariat of Finance of Piaui
#> P179046                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            State Secretariat of Planning
#> P179088                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      UGP
#> P176733                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     Cyber Corporation of Manipur Limited
#> P176032                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    Directorate of Energy, HimUrja, HPPCL (Himachal Pradesh Power Corporation Limited), HPSEBL (Himachal Pradesh State Electricity Board Limited), HPPTCL (Himachal Pradesh Power Transmission Corporation Limited), HPSLDC (Himachal Pradesh State Load Despatch Centre)
#> P179249                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    State of Chhattisgarh
#> P179337                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       Assam Health Infrastructure Development and Management Society (AHIDMS), Health and Family Welfare
#> P178418                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      Department of Tribal Welfare, Government of Tripura
#> P177917                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    Ministry of Education
#> P177980                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     Government of Kerala
#> P177876                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         DWRID, Government of West Bengal
#> P178072                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> P177671                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            Ministry of Fisheries, Animal Husbandry & Dairying, Department of Animal Husbandry & Dairying
#> P176982                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               DER-ES - Buildings and Roads Department of Esp�rito Santo, CEPDEC - State Coordination for Protection and Civil Defense, SEAMA - State Secretariat for the Environment and Water Resources
#> P179039                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             Rural Drinking Water and Sanitation Department, Government of Karnataka, Rural Development and Panchayat Department, Government of Karnataka
#> P175811                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 Finance Department, Government of Odisha
#> P174593                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           Flood and River Erosion Management Agency of Assam, Government of Assam, Water Resources Department, Assam State Disaster Management Authority
#> P178888                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          Banco do Brasil
#> P175728                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       Ahmedabad Municipal Corporation, Gujarat Urban Development Mission, Urban Development and Urban Housing Department
#> P178252                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                Government of Gujarat through Health and Family Welfare Department (HFWD)
#> P175261                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              Department of Finance, Government of Punjab
#> P178339                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     Secretariat of Finance - Mato Grosso
#> P177070                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                Secretariat of Finance - State of Alagoas
#> P171750                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      State Bank of India
#> P178146                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          Department of Health and Family Welfare, Ministry of Health and Family Welfare, Government of India, Ministry of Health and Family Welfare, Government of India
#> P175676                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    Ministry of Health and Family Welfare
#> P177915                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              Education Department, Government of Gujarat
#> P174798                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      Department of Fisheries, Ministry of Fisheries, Animal Husbandry and Dairying, National Fisheries Development Board
#> P178729                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 Secretaria Municipal de Fazenda e Planejamento, Secretaria de Transporte
#> P176404                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         Department for the Welfare of Differently Abled Persons (DfWDAP)
#> P177856                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  Dedicated Freight Corridor Corporation of India Limited
#> P178563                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    MINISTRY OF EDUCATION
#> P168634                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          Secretariat of Planning and Structured Projects
#> P177632                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   State Secretariat of Agriculture and Livestock (SEAPA)
#> P174067                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              Capacity Building Commission, Department of Personnel and Training, Ministry of Personnel, Public Grievances and Pensions, Karmayogi Bharat
#> P174564                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      West Bengal Women & Child Development and Social Welfare Department, West Bengal Finance Department
#> P176107                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                Karnataka Urban Infrastructure Development & Finance Corporation (KUIDFC)
#> P172187                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   Karnataka Department of of Agriculture, Department of Land Resources, Odisha Department of Agriculture
#> P170590                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               West Bengal State Electricity Distribution Company Limited
#> P174732                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        Urban Development Department, Government of Himachal Pradesh, Shimla Jal Prabandhan Nigam Limited
#> P173589                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         Department of Health and Family Welfare, Government of Meghalaya
#> P175221                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      State of Tamil Nadu
#> P174778                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     Government of Kerala
#> P173978                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  State of Andhra Pradesh
#> P172226                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          Ministry of Micro, Small and Medium Enterprises
#> P173958                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              Health and Family Welfare Department, Government of Mizoram
#> P170811                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      Ludhiana Municipal Corporation, Amritsar Municipal Corporation, Punjab Municipal Infrastructure Development Company
#> P173704                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              Education Department, Government of Gujarat
#> P168633                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   Local Self Government Department, Government of Kerala
#> P170645                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 Chhattisgarh, Department of Agriculture Development and Farmer Welfare and Biotechnology
#> P172213                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                Nagaland (Department of School Education)
#> P170873 Uttarakhand Jal Vidyut Nigam Ltd., Kerala State Electricity Board (KSEB), Tamil Nadu Generation and Distribution Corporation Limited (TANGEDCO), Government of Gujarat, Water Resources Department, Government of Chhattisgarh, Water Resources Department, Government of Kerala, Water Resources Department, Government of West Bengal, Irrigation and Waterways Department, Government of Uttar Pradesh, Irrigation and Water Resources Department, Meghalaya Power Generation Corporation Ltd. (MePGCL), Government of Maharasthra, Water Resources Department, Government of Manipur, Water Resources Department, Central Water Commission (CWC), Ministry of Jal Shakti, Government of Rajasthan, Water Resources Department, Government of Odisha, Water Resources Department, Government of Tamil Nadu, Water Resources Department, Government of Madhya Pradesh, Water Resources Department, Government of Karnataka, Water Resources Department
#> P166020                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                Government of West Bengal
#> P168097                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 Meghalaya Infrastructure Development Finance Corporation
#> P172605                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               Casa Civil
#> P169111                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 National Mission for Clean Ganga, Ministry of Jal Shakti
#> P174312                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> P166868                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    Ministry of Education
#> P170850                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            Minist�rio de Minas e Energia
#> P168590                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         Tamil Nadu Urban and Habitat Development Board, Chennai Metropolitan Development Authority (CMDA), Tamil Nadu Infrastructure Fund Management Corporation Limited
#> P169140                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             S�o Paulo Municipal Secretariat of Urban Infrastructure and Works, S�o Paulo Municipal Secretariat of Mobility and Transport
#> P167350                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  Ministry of Road Transport and Highways
#> P163328                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     Himachal Pradesh Road & Other Infrastructure Development Corporation
#> P170682                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  Banco Regional de Desenvolvimento do Extremo Sul (BRDE)
#> P169134                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              URBEL, SMPU, SMOBI, BHTRANS
#> P165129                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     Department of Forest, Government of Himachal Pradesh
#> P168310                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     Department of Agriculture, Government of Maharashtra
#> P157929                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         Transport Dept., Govt. of Assam, Dispur, Guwahati (Assam), India
#> P162679                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       Irrigation and Waterways Department of West Bengal
#> P163533                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            Agricultural Promotion and Investment Corporation of Odisha Limited, Odisha Community Tank Development and Management Society,  Department of Water Resources
#> P165055                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                Ceara Economic Research and Strategy Institute - IPECE, Ceara Water and Sanitation Utility - CAGECE, Secretariat of Water Resources - SRH
#> P167455                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      Secretariat of Agrarian Development
#> P167581                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                Department of Health, Medical and Family Welfare, Govt. of Andhra Pradesh
#> P160379                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                Solar Energy Corporation of India Limited
#> P157141                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         Rajasthan State Highway Authority (RSHA), The State of Rajasthan
#> P167523                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    Ministry of Health and Family Welfare
#> P166923                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            Finance Department, Government of Uttarakhand
#> P165683                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              CAGEPA - State Water and Sanitation Company
#> P166578                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           Finance Department, Government of Chhattisgarh
#> P165695                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   SABESP
#> P158502                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        Urban Development and Housing Department, Government of Jharkhand
#> P160463                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             Government of Andhra Pradesh
#> P162086                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   Jharkhand Urja Sancharan Nigam Ltd., Jharkhand Bijli Vitran Nigam Ltd.
#> P158119                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      The Department of Water Resources, Ganga Rejuvenation and River Development, Ministry of Jal Shakti
#> P156869                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     Department of Economic Affairs (MOF)
#> P158146                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   Department of Drinking Water and Sanitation, Government of Uttarakhand
#> P163868                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           Ministry of Education (Minist�rio da Educa��o)
#> P158522                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                Water Resources Department, Public Works Department, GoTN
#> P157702                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                Department of Rural Development & Panchayat Raj, Government of Tamil Nadu
#> P147158                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                Projeto COOPERAR (SEAFDS)
#> P155617                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 Assam Rural Infrastructure and Agricultural Services (ARIAS) Society, State Health Society, Government of Assam, Department of Health and Family Welfare
#> P156241                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       Biotechnology Industry Research Assistance Council
#> P153012                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                Secretaria Municipal de Urbanismo e Meio Ambiente (SEUMA), Secretaria Municipal de Infraestrutura (SEINF)
#> P155303                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    Urban Development and Environment Department, Govt. of Madhya Pradesh
#> P148775                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      Inland Waterways Authority of India
#> P152698                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           Department of Water Resources, RD & GR, Ministry of Jal Shakti
#> P148531                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               Department of Medical Health and Family Welfare, Government of Uttarakhand
#> P155007                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      State Bank of India
#> P130544                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                Karnataka Urban Infrastructure Development & Finance Corporation (KUIDFC)
#> P127725                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 Water Resources Department (WRD), Rural Works Department (RWD), Bihar Aapada Punarwas Evam Punarnirman Society (BAPEPS), Bihar Rajya Pul Nirman Nigam Limited (BRPNNL), Animal and Fisheries Resources Department (AFRD)
#> P154990                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              Project Implementing Entity
#> P096124                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               THDC (Tehri Hydro Development Corporation)
#> P039027                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> P108190                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> P505866                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> P507322                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> P500380                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> P502493                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> P110539                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> P508840                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> P500252                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> P506955                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> P507029                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> P508202                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> P508363                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> P504126                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> P507066                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> P508221                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> P180716                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     Ministry of New and Renewable Energy
#> P504276                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> P500570                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> P173090                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> P505177                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> P506272                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> P506321                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> P181608                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                State Secretariat of Administration and Management (SEAD)
#> P508025                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> P105370                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> P500469                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> P501071                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> P181511                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   Complexo Industrial Portu�rio de Pec�m
#> P180932                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        Government of Karnataka, Government of Tamil Nadu
#> P505235                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> P507629                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> P178053                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           Department of Environment, Forests, and Climate Change, State of Uttar Pradesh
#> P500564                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> P505590                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> P506976                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> P181767                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> P506329                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> P508489                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> P181244                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                Government of West Bengal
#> P502499                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> P500151                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> P508719                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> P505563                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> P507628                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> P179349                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> P504543                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> P505914                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> P509041                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> P506142                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> P500614                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> P506861                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> P180699                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            Social Welfare & Women Empowerment Department
#> P507340                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> P114890                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> P500168                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> P506320                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> P500431                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> P508453                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> P504897                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> P503872                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> P506340                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> P507236                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> P507910                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> P504899                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> P500501                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> P181020                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 Haryana Mass Rapid Transport Corporation Limited (HMRTC)
#> P114896                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> P504253                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> P502491                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> P181524 Uttarakhand Jal Vidyut Nigam Ltd., Kerala State Electricity Board (KSEB), Tamil Nadu Generation and Distribution Corporation Limited (TANGEDCO), Government of Gujarat, Water Resources Department, Government of Chhattisgarh, Water Resources Department, Government of Kerala, Water Resources Department, Government of West Bengal, Irrigation and Waterways Department, Government of Uttar Pradesh, Irrigation and Water Resources Department, Meghalaya Power Generation Corporation Ltd. (MePGCL), Government of Maharasthra, Water Resources Department, Government of Manipur, Water Resources Department, Central Water Commission (CWC), Ministry of Jal Shakti, Government of Rajasthan, Water Resources Department, Government of Odisha, Water Resources Department, Government of Tamil Nadu, Water Resources Department, Government of Madhya Pradesh, Water Resources Department, Government of Karnataka, Water Resources Department
#> P073882                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> P177159                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      Jameel Poverty Action Lab (J-PAL) South Asia at the Institute for Financial Management and Research
#> P171257                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   Ministry of Environment - MMA, Funda��o Getulio Vargas
#> P132620                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      Small Industries Development Bank of India, EESL Energy Efficiency Services Limited
#> P122387                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> P128921                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> P158000                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                Funda��o Getulio Vargas, Ministry of Environment and Climate Change - MMA
#> P160018                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      State Bank of India
#> P172497                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            Minist�rio do Meio Ambiente (MMA), Minist�rio da Agricultura, Pecu�ria e Abastecimento (MAPA)
#> P164602                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        Ministry of Agriculture and  Livestock(MAPA), National Rural Learning Service, Ministry of Environment / Brazilian Forest Service
#> P152285                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  Ministry of Environment
#> P009585                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#>                                                                                  url
#> P507508 https://projects.worldbank.org/en/projects-operations/project-detail/P507508
#> P178253 https://projects.worldbank.org/en/projects-operations/project-detail/P178253
#> P181463 https://projects.worldbank.org/en/projects-operations/project-detail/P181463
#> P179935 https://projects.worldbank.org/en/projects-operations/project-detail/P179935
#> P180429 https://projects.worldbank.org/en/projects-operations/project-detail/P180429
#> P178254 https://projects.worldbank.org/en/projects-operations/project-detail/P178254
#> P180555 https://projects.worldbank.org/en/projects-operations/project-detail/P180555
#> P181501 https://projects.worldbank.org/en/projects-operations/project-detail/P181501
#> P181195 https://projects.worldbank.org/en/projects-operations/project-detail/P181195
#> P177965 https://projects.worldbank.org/en/projects-operations/project-detail/P177965
#> P180430 https://projects.worldbank.org/en/projects-operations/project-detail/P180430
#> P180462 https://projects.worldbank.org/en/projects-operations/project-detail/P180462
#> P174825 https://projects.worldbank.org/en/projects-operations/project-detail/P174825
#> P178557 https://projects.worldbank.org/en/projects-operations/project-detail/P178557
#> P179357 https://projects.worldbank.org/en/projects-operations/project-detail/P179357
#> P179749 https://projects.worldbank.org/en/projects-operations/project-detail/P179749
#> P500524 https://projects.worldbank.org/en/projects-operations/project-detail/P500524
#> P180497 https://projects.worldbank.org/en/projects-operations/project-detail/P180497
#> P177474 https://projects.worldbank.org/en/projects-operations/project-detail/P177474
#> P178581 https://projects.worldbank.org/en/projects-operations/project-detail/P178581
#> P175723 https://projects.worldbank.org/en/projects-operations/project-detail/P175723
#> P180634 https://projects.worldbank.org/en/projects-operations/project-detail/P180634
#> P179189 https://projects.worldbank.org/en/projects-operations/project-detail/P179189
#> P179365 https://projects.worldbank.org/en/projects-operations/project-detail/P179365
#> P179182 https://projects.worldbank.org/en/projects-operations/project-detail/P179182
#> P178993 https://projects.worldbank.org/en/projects-operations/project-detail/P178993
#> P178567 https://projects.worldbank.org/en/projects-operations/project-detail/P178567
#> P178663 https://projects.worldbank.org/en/projects-operations/project-detail/P178663
#> P179046 https://projects.worldbank.org/en/projects-operations/project-detail/P179046
#> P179088 https://projects.worldbank.org/en/projects-operations/project-detail/P179088
#> P176733 https://projects.worldbank.org/en/projects-operations/project-detail/P176733
#> P176032 https://projects.worldbank.org/en/projects-operations/project-detail/P176032
#> P179249 https://projects.worldbank.org/en/projects-operations/project-detail/P179249
#> P179337 https://projects.worldbank.org/en/projects-operations/project-detail/P179337
#> P178418 https://projects.worldbank.org/en/projects-operations/project-detail/P178418
#> P177917 https://projects.worldbank.org/en/projects-operations/project-detail/P177917
#> P177980 https://projects.worldbank.org/en/projects-operations/project-detail/P177980
#> P177876 https://projects.worldbank.org/en/projects-operations/project-detail/P177876
#> P178072 https://projects.worldbank.org/en/projects-operations/project-detail/P178072
#> P177671 https://projects.worldbank.org/en/projects-operations/project-detail/P177671
#> P176982 https://projects.worldbank.org/en/projects-operations/project-detail/P176982
#> P179039 https://projects.worldbank.org/en/projects-operations/project-detail/P179039
#> P175811 https://projects.worldbank.org/en/projects-operations/project-detail/P175811
#> P174593 https://projects.worldbank.org/en/projects-operations/project-detail/P174593
#> P178888 https://projects.worldbank.org/en/projects-operations/project-detail/P178888
#> P175728 https://projects.worldbank.org/en/projects-operations/project-detail/P175728
#> P178252 https://projects.worldbank.org/en/projects-operations/project-detail/P178252
#> P175261 https://projects.worldbank.org/en/projects-operations/project-detail/P175261
#> P178339 https://projects.worldbank.org/en/projects-operations/project-detail/P178339
#> P177070 https://projects.worldbank.org/en/projects-operations/project-detail/P177070
#> P171750 https://projects.worldbank.org/en/projects-operations/project-detail/P171750
#> P178146 https://projects.worldbank.org/en/projects-operations/project-detail/P178146
#> P175676 https://projects.worldbank.org/en/projects-operations/project-detail/P175676
#> P177915 https://projects.worldbank.org/en/projects-operations/project-detail/P177915
#> P174798 https://projects.worldbank.org/en/projects-operations/project-detail/P174798
#> P178729 https://projects.worldbank.org/en/projects-operations/project-detail/P178729
#> P176404 https://projects.worldbank.org/en/projects-operations/project-detail/P176404
#> P177856 https://projects.worldbank.org/en/projects-operations/project-detail/P177856
#> P178563 https://projects.worldbank.org/en/projects-operations/project-detail/P178563
#> P168634 https://projects.worldbank.org/en/projects-operations/project-detail/P168634
#> P177632 https://projects.worldbank.org/en/projects-operations/project-detail/P177632
#> P174067 https://projects.worldbank.org/en/projects-operations/project-detail/P174067
#> P174564 https://projects.worldbank.org/en/projects-operations/project-detail/P174564
#> P176107 https://projects.worldbank.org/en/projects-operations/project-detail/P176107
#> P172187 https://projects.worldbank.org/en/projects-operations/project-detail/P172187
#> P170590 https://projects.worldbank.org/en/projects-operations/project-detail/P170590
#> P174732 https://projects.worldbank.org/en/projects-operations/project-detail/P174732
#> P173589 https://projects.worldbank.org/en/projects-operations/project-detail/P173589
#> P175221 https://projects.worldbank.org/en/projects-operations/project-detail/P175221
#> P174778 https://projects.worldbank.org/en/projects-operations/project-detail/P174778
#> P173978 https://projects.worldbank.org/en/projects-operations/project-detail/P173978
#> P172226 https://projects.worldbank.org/en/projects-operations/project-detail/P172226
#> P173958 https://projects.worldbank.org/en/projects-operations/project-detail/P173958
#> P170811 https://projects.worldbank.org/en/projects-operations/project-detail/P170811
#> P173704 https://projects.worldbank.org/en/projects-operations/project-detail/P173704
#> P168633 https://projects.worldbank.org/en/projects-operations/project-detail/P168633
#> P170645 https://projects.worldbank.org/en/projects-operations/project-detail/P170645
#> P172213 https://projects.worldbank.org/en/projects-operations/project-detail/P172213
#> P170873 https://projects.worldbank.org/en/projects-operations/project-detail/P170873
#> P166020 https://projects.worldbank.org/en/projects-operations/project-detail/P166020
#> P168097 https://projects.worldbank.org/en/projects-operations/project-detail/P168097
#> P172605 https://projects.worldbank.org/en/projects-operations/project-detail/P172605
#> P169111 https://projects.worldbank.org/en/projects-operations/project-detail/P169111
#> P174312 https://projects.worldbank.org/en/projects-operations/project-detail/P174312
#> P166868 https://projects.worldbank.org/en/projects-operations/project-detail/P166868
#> P170850 https://projects.worldbank.org/en/projects-operations/project-detail/P170850
#> P168590 https://projects.worldbank.org/en/projects-operations/project-detail/P168590
#> P169140 https://projects.worldbank.org/en/projects-operations/project-detail/P169140
#> P167350 https://projects.worldbank.org/en/projects-operations/project-detail/P167350
#> P163328 https://projects.worldbank.org/en/projects-operations/project-detail/P163328
#> P170682 https://projects.worldbank.org/en/projects-operations/project-detail/P170682
#> P169134 https://projects.worldbank.org/en/projects-operations/project-detail/P169134
#> P165129 https://projects.worldbank.org/en/projects-operations/project-detail/P165129
#> P168310 https://projects.worldbank.org/en/projects-operations/project-detail/P168310
#> P157929 https://projects.worldbank.org/en/projects-operations/project-detail/P157929
#> P162679 https://projects.worldbank.org/en/projects-operations/project-detail/P162679
#> P163533 https://projects.worldbank.org/en/projects-operations/project-detail/P163533
#> P165055 https://projects.worldbank.org/en/projects-operations/project-detail/P165055
#> P167455 https://projects.worldbank.org/en/projects-operations/project-detail/P167455
#> P167581 https://projects.worldbank.org/en/projects-operations/project-detail/P167581
#> P160379 https://projects.worldbank.org/en/projects-operations/project-detail/P160379
#> P157141 https://projects.worldbank.org/en/projects-operations/project-detail/P157141
#> P167523 https://projects.worldbank.org/en/projects-operations/project-detail/P167523
#> P166923 https://projects.worldbank.org/en/projects-operations/project-detail/P166923
#> P165683 https://projects.worldbank.org/en/projects-operations/project-detail/P165683
#> P166578 https://projects.worldbank.org/en/projects-operations/project-detail/P166578
#> P165695 https://projects.worldbank.org/en/projects-operations/project-detail/P165695
#> P158502 https://projects.worldbank.org/en/projects-operations/project-detail/P158502
#> P160463 https://projects.worldbank.org/en/projects-operations/project-detail/P160463
#> P162086 https://projects.worldbank.org/en/projects-operations/project-detail/P162086
#> P158119 https://projects.worldbank.org/en/projects-operations/project-detail/P158119
#> P156869 https://projects.worldbank.org/en/projects-operations/project-detail/P156869
#> P158146 https://projects.worldbank.org/en/projects-operations/project-detail/P158146
#> P163868 https://projects.worldbank.org/en/projects-operations/project-detail/P163868
#> P158522 https://projects.worldbank.org/en/projects-operations/project-detail/P158522
#> P157702 https://projects.worldbank.org/en/projects-operations/project-detail/P157702
#> P147158 https://projects.worldbank.org/en/projects-operations/project-detail/P147158
#> P155617 https://projects.worldbank.org/en/projects-operations/project-detail/P155617
#> P156241 https://projects.worldbank.org/en/projects-operations/project-detail/P156241
#> P153012 https://projects.worldbank.org/en/projects-operations/project-detail/P153012
#> P155303 https://projects.worldbank.org/en/projects-operations/project-detail/P155303
#> P148775 https://projects.worldbank.org/en/projects-operations/project-detail/P148775
#> P152698 https://projects.worldbank.org/en/projects-operations/project-detail/P152698
#> P148531 https://projects.worldbank.org/en/projects-operations/project-detail/P148531
#> P155007 https://projects.worldbank.org/en/projects-operations/project-detail/P155007
#> P130544 https://projects.worldbank.org/en/projects-operations/project-detail/P130544
#> P127725 https://projects.worldbank.org/en/projects-operations/project-detail/P127725
#> P154990 https://projects.worldbank.org/en/projects-operations/project-detail/P154990
#> P096124 https://projects.worldbank.org/en/projects-operations/project-detail/P096124
#> P039027 https://projects.worldbank.org/en/projects-operations/project-detail/P039027
#> P108190 https://projects.worldbank.org/en/projects-operations/project-detail/P108190
#> P505866 https://projects.worldbank.org/en/projects-operations/project-detail/P505866
#> P507322 https://projects.worldbank.org/en/projects-operations/project-detail/P507322
#> P500380 https://projects.worldbank.org/en/projects-operations/project-detail/P500380
#> P502493 https://projects.worldbank.org/en/projects-operations/project-detail/P502493
#> P110539 https://projects.worldbank.org/en/projects-operations/project-detail/P110539
#> P508840 https://projects.worldbank.org/en/projects-operations/project-detail/P508840
#> P500252 https://projects.worldbank.org/en/projects-operations/project-detail/P500252
#> P506955 https://projects.worldbank.org/en/projects-operations/project-detail/P506955
#> P507029 https://projects.worldbank.org/en/projects-operations/project-detail/P507029
#> P508202 https://projects.worldbank.org/en/projects-operations/project-detail/P508202
#> P508363 https://projects.worldbank.org/en/projects-operations/project-detail/P508363
#> P504126 https://projects.worldbank.org/en/projects-operations/project-detail/P504126
#> P507066 https://projects.worldbank.org/en/projects-operations/project-detail/P507066
#> P508221 https://projects.worldbank.org/en/projects-operations/project-detail/P508221
#> P180716 https://projects.worldbank.org/en/projects-operations/project-detail/P180716
#> P504276 https://projects.worldbank.org/en/projects-operations/project-detail/P504276
#> P500570 https://projects.worldbank.org/en/projects-operations/project-detail/P500570
#> P173090 https://projects.worldbank.org/en/projects-operations/project-detail/P173090
#> P505177 https://projects.worldbank.org/en/projects-operations/project-detail/P505177
#> P506272 https://projects.worldbank.org/en/projects-operations/project-detail/P506272
#> P506321 https://projects.worldbank.org/en/projects-operations/project-detail/P506321
#> P181608 https://projects.worldbank.org/en/projects-operations/project-detail/P181608
#> P508025 https://projects.worldbank.org/en/projects-operations/project-detail/P508025
#> P105370 https://projects.worldbank.org/en/projects-operations/project-detail/P105370
#> P500469 https://projects.worldbank.org/en/projects-operations/project-detail/P500469
#> P501071 https://projects.worldbank.org/en/projects-operations/project-detail/P501071
#> P181511 https://projects.worldbank.org/en/projects-operations/project-detail/P181511
#> P180932 https://projects.worldbank.org/en/projects-operations/project-detail/P180932
#> P505235 https://projects.worldbank.org/en/projects-operations/project-detail/P505235
#> P507629 https://projects.worldbank.org/en/projects-operations/project-detail/P507629
#> P178053 https://projects.worldbank.org/en/projects-operations/project-detail/P178053
#> P500564 https://projects.worldbank.org/en/projects-operations/project-detail/P500564
#> P505590 https://projects.worldbank.org/en/projects-operations/project-detail/P505590
#> P506976 https://projects.worldbank.org/en/projects-operations/project-detail/P506976
#> P181767 https://projects.worldbank.org/en/projects-operations/project-detail/P181767
#> P506329 https://projects.worldbank.org/en/projects-operations/project-detail/P506329
#> P508489 https://projects.worldbank.org/en/projects-operations/project-detail/P508489
#> P181244 https://projects.worldbank.org/en/projects-operations/project-detail/P181244
#> P502499 https://projects.worldbank.org/en/projects-operations/project-detail/P502499
#> P500151 https://projects.worldbank.org/en/projects-operations/project-detail/P500151
#> P508719 https://projects.worldbank.org/en/projects-operations/project-detail/P508719
#> P505563 https://projects.worldbank.org/en/projects-operations/project-detail/P505563
#> P507628 https://projects.worldbank.org/en/projects-operations/project-detail/P507628
#> P179349 https://projects.worldbank.org/en/projects-operations/project-detail/P179349
#> P504543 https://projects.worldbank.org/en/projects-operations/project-detail/P504543
#> P505914 https://projects.worldbank.org/en/projects-operations/project-detail/P505914
#> P509041 https://projects.worldbank.org/en/projects-operations/project-detail/P509041
#> P506142 https://projects.worldbank.org/en/projects-operations/project-detail/P506142
#> P500614 https://projects.worldbank.org/en/projects-operations/project-detail/P500614
#> P506861 https://projects.worldbank.org/en/projects-operations/project-detail/P506861
#> P180699 https://projects.worldbank.org/en/projects-operations/project-detail/P180699
#> P507340 https://projects.worldbank.org/en/projects-operations/project-detail/P507340
#> P114890 https://projects.worldbank.org/en/projects-operations/project-detail/P114890
#> P500168 https://projects.worldbank.org/en/projects-operations/project-detail/P500168
#> P506320 https://projects.worldbank.org/en/projects-operations/project-detail/P506320
#> P500431 https://projects.worldbank.org/en/projects-operations/project-detail/P500431
#> P508453 https://projects.worldbank.org/en/projects-operations/project-detail/P508453
#> P504897 https://projects.worldbank.org/en/projects-operations/project-detail/P504897
#> P503872 https://projects.worldbank.org/en/projects-operations/project-detail/P503872
#> P506340 https://projects.worldbank.org/en/projects-operations/project-detail/P506340
#> P507236 https://projects.worldbank.org/en/projects-operations/project-detail/P507236
#> P507910 https://projects.worldbank.org/en/projects-operations/project-detail/P507910
#> P504899 https://projects.worldbank.org/en/projects-operations/project-detail/P504899
#> P500501 https://projects.worldbank.org/en/projects-operations/project-detail/P500501
#> P181020 https://projects.worldbank.org/en/projects-operations/project-detail/P181020
#> P114896 https://projects.worldbank.org/en/projects-operations/project-detail/P114896
#> P504253 https://projects.worldbank.org/en/projects-operations/project-detail/P504253
#> P502491 https://projects.worldbank.org/en/projects-operations/project-detail/P502491
#> P181524 https://projects.worldbank.org/en/projects-operations/project-detail/P181524
#> P073882 https://projects.worldbank.org/en/projects-operations/project-detail/P073882
#> P177159 https://projects.worldbank.org/en/projects-operations/project-detail/P177159
#> P171257 https://projects.worldbank.org/en/projects-operations/project-detail/P171257
#> P132620 https://projects.worldbank.org/en/projects-operations/project-detail/P132620
#> P122387 https://projects.worldbank.org/en/projects-operations/project-detail/P122387
#> P128921 https://projects.worldbank.org/en/projects-operations/project-detail/P128921
#> P158000 https://projects.worldbank.org/en/projects-operations/project-detail/P158000
#> P160018 https://projects.worldbank.org/en/projects-operations/project-detail/P160018
#> P172497 https://projects.worldbank.org/en/projects-operations/project-detail/P172497
#> P164602 https://projects.worldbank.org/en/projects-operations/project-detail/P164602
#> P152285 https://projects.worldbank.org/en/projects-operations/project-detail/P152285
#> P009585 https://projects.worldbank.org/en/projects-operations/project-detail/P009585

# look up specific projects
wb_project(id = c("P163868", "P180429"))
#>              id                                          project_name status
#> P180429 P180429           Bahia Sustainable Rural Development Project Active
#> P163868 P163868 Support to Upper Secondary Reform in Brazil Operation Active
#>         approval_date closing_date country_code country
#> P180429    2024-11-07   2030-10-30           BR  Brazil
#> P163868    2017-12-14   2024-12-31           BR  Brazil
#>                              region total_commitment ibrd_commitment
#> P180429 Latin America and Caribbean              100             100
#> P163868 Latin America and Caribbean              250             250
#>         ida_commitment            lending_instrument
#> P180429              0  Investment Project Financing
#> P163868              0 Program-for-Results Financing
#>                                             borrower
#> P180429             Government of the State of Bahia
#> P163868 Ministry of Economy (Minist�rio da Economia)
#>                                        implementing_agency
#> P180429 CAR - Companhia de Desenvolvimento e Acao Regional
#> P163868     Ministry of Education (Minist�rio da Educa��o)
#>                                                                                  url
#> P180429 https://projects.worldbank.org/en/projects-operations/project-detail/P180429
#> P163868 https://projects.worldbank.org/en/projects-operations/project-detail/P163868
# }
```
