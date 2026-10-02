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
  end_date = NULL,
  limit = NULL
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

- limit:

  (`NULL` \| `integer(1)`)  
  The maximum number of projects to return. Default `NULL`. If `NULL`,
  all matching projects are returned, which can take many requests for
  broad queries. Projects are returned in descending order of `id`, so
  the most recently created projects come first.

## Value

A [`data.frame()`](https://rdrr.io/r/base/data.frame.html) with World
Bank project data. The columns are:

- `id`: The project ID.

- `project_name`: The project name.

- `status`: The project status.

- `approval_date`: The board approval date.

- `closing_date`: The closing date.

- `country_code`: The country code, or a regional code such as `"3A"`
  for multi-country projects.

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
#>         id
#> 1  P179365
#> 2  P179088
#> 3  P179046
#> 4  P178993
#> 5  P178663
#> 6  P178563
#> 7  P177070
#> 8  P172605
#> 9  P172497
#> 10 P163868
#> 11 P153012
#> 12 P073882
#>                                                              project_name
#> 1  Brazil: Support to New Bolsa Familia Conditional Cash Transfer Program
#> 2                Progestão Tocantins: Public Sector Management Efficiency
#> 3                     Progestão Acre: Public Sector Management Efficiency
#> 4      Mato Grosso Resilient, Inclusive, and Sustainable Learning Project
#> 5                    Progestão Piauí: Public Sector Management Efficiency
#> 6             RECOVERING LEARNING LOSSES FROM COVID-19 PANDEMIC IN BRAZIL
#> 7                  Progestão Alagoas: Public Sector Management Efficiency
#> 8                Salvador Social Multi-Sector Service Delivery Project II
#> 9                  Sustainable Multiple Use Landscape Consortia in Brazil
#> 10                  Support to Upper Secondary Reform in Brazil Operation
#> 11                        Fortaleza Sustainable Urban Development Project
#> 12                         RF 2nd Amazon Fire Prevention and Mobilization
#>    status approval_date closing_date country_code country
#> 1  Active    2023-12-06   2026-04-30           BR  Brazil
#> 2  Active    2023-07-24   2028-12-29           BR  Brazil
#> 3  Active    2023-07-24   2028-12-29           BR  Brazil
#> 4  Active    2023-10-26   2028-12-31           BR  Brazil
#> 5  Active    2023-10-03   2029-06-29           BR  Brazil
#> 6  Active    2022-05-12   2027-12-31           BR  Brazil
#> 7  Active    2022-07-21   2028-03-31           BR  Brazil
#> 8  Active    2020-09-22   2025-12-30           BR  Brazil
#> 9  Active          <NA>   2027-11-30           BR  Brazil
#> 10 Active    2017-12-14   2024-12-31           BR  Brazil
#> 11 Active    2017-04-28   2025-03-31           BR  Brazil
#> 12 Active          <NA>   2004-09-30           BR  Brazil
#>                         region total_commitment ibrd_commitment ida_commitment
#> 1  Latin America and Caribbean        300.00000           300.0              0
#> 2  Latin America and Caribbean         50.00000            50.0              0
#> 3  Latin America and Caribbean         40.00000            40.0              0
#> 4  Latin America and Caribbean        100.00000           100.0              0
#> 5  Latin America and Caribbean         50.00000            50.0              0
#> 6  Latin America and Caribbean        250.00000           250.0              0
#> 7  Latin America and Caribbean         40.00000            40.0              0
#> 8  Latin America and Caribbean        125.00000           125.0              0
#> 9  Latin America and Caribbean         24.57798             0.0              0
#> 10 Latin America and Caribbean        250.00000           250.0              0
#> 11 Latin America and Caribbean         73.30000            73.3              0
#> 12 Latin America and Caribbean          1.10000             0.0              0
#>               lending_instrument
#> 1   Investment Project Financing
#> 2   Investment Project Financing
#> 3   Investment Project Financing
#> 4   Investment Project Financing
#> 5   Investment Project Financing
#> 6  Program-for-Results Financing
#> 7   Investment Project Financing
#> 8   Investment Project Financing
#> 9   Investment Project Financing
#> 10 Program-for-Results Financing
#> 11  Investment Project Financing
#> 12                          <NA>
#>                                                                     borrower
#> 1                                              Federative Republic of Brazil
#> 2                                     State Secretariat of Planning (SEPLAN)
#> 3                                                              State of Acre
#> 4                                                       STATE OF MATO GROSSO
#> 5                                                             State of Piaui
#> 6                                          THE FEDERATIVE REPUBLIC OF BRAZIL
#> 7  State of Alagoas, with the guarantee of the Federative Republic of Brazil
#> 8                                                   Municipality of Salvador
#> 9                                                                       IICA
#> 10                              Ministry of Economy (Minist�rio da Economia)
#> 11                                                 Municipality of Fortaleza
#> 12                                                                      <NA>
#>                                                                                          implementing_agency
#> 1                                                                                    Ministry of Citizenship
#> 2                                                                                                        UGP
#> 3                                                                              State Secretariat of Planning
#> 4                                                                     SECRETARIAT OF EDUCATION - MATO GROSSO
#> 5                                                                            Secretariat of Finance of Piaui
#> 6                                                                                      MINISTRY OF EDUCATION
#> 7                                                                  Secretariat of Finance - State of Alagoas
#> 8                                                                                                 Casa Civil
#> 9              Minist�rio do Meio Ambiente (MMA), Minist�rio da Agricultura, Pecu�ria e Abastecimento (MAPA)
#> 10                                                            Ministry of Education (Minist�rio da Educa��o)
#> 11 Secretaria Municipal de Urbanismo e Meio Ambiente (SEUMA), Secretaria Municipal de Infraestrutura (SEINF)
#> 12                                                                                                      <NA>
#>                                                                             url
#> 1  https://projects.worldbank.org/en/projects-operations/project-detail/P179365
#> 2  https://projects.worldbank.org/en/projects-operations/project-detail/P179088
#> 3  https://projects.worldbank.org/en/projects-operations/project-detail/P179046
#> 4  https://projects.worldbank.org/en/projects-operations/project-detail/P178993
#> 5  https://projects.worldbank.org/en/projects-operations/project-detail/P178663
#> 6  https://projects.worldbank.org/en/projects-operations/project-detail/P178563
#> 7  https://projects.worldbank.org/en/projects-operations/project-detail/P177070
#> 8  https://projects.worldbank.org/en/projects-operations/project-detail/P172605
#> 9  https://projects.worldbank.org/en/projects-operations/project-detail/P172497
#> 10 https://projects.worldbank.org/en/projects-operations/project-detail/P163868
#> 11 https://projects.worldbank.org/en/projects-operations/project-detail/P153012
#> 12 https://projects.worldbank.org/en/projects-operations/project-detail/P073882

# active or pipeline projects across two countries
wb_project(country = c("BR", "IN"), status = c("active", "pipeline"))
#>          id
#> 1   P509041
#> 2   P508840
#> 3   P508719
#> 4   P508489
#> 5   P508453
#> 6   P508363
#> 7   P508221
#> 8   P508202
#> 9   P508025
#> 10  P507910
#> 11  P507629
#> 12  P507628
#> 13  P507508
#> 14  P507340
#> 15  P507322
#> 16  P507236
#> 17  P507066
#> 18  P507029
#> 19  P506976
#> 20  P506955
#> 21  P506861
#> 22  P506340
#> 23  P506329
#> 24  P506321
#> 25  P506320
#> 26  P506272
#> 27  P506142
#> 28  P505914
#> 29  P505866
#> 30  P505590
#> 31  P505563
#> 32  P505235
#> 33  P505177
#> 34  P504899
#> 35  P504897
#> 36  P504543
#> 37  P504276
#> 38  P504253
#> 39  P504126
#> 40  P503872
#> 41  P502499
#> 42  P502493
#> 43  P502491
#> 44  P501071
#> 45  P500614
#> 46  P500570
#> 47  P500564
#> 48  P500524
#> 49  P500501
#> 50  P500469
#> 51  P500431
#> 52  P500380
#> 53  P500252
#> 54  P500168
#> 55  P500151
#> 56  P181767
#> 57  P181608
#> 58  P181524
#> 59  P181511
#> 60  P181501
#> 61  P181463
#> 62  P181244
#> 63  P181195
#> 64  P181020
#> 65  P180932
#> 66  P180716
#> 67  P180699
#> 68  P180634
#> 69  P180555
#> 70  P180497
#> 71  P180462
#> 72  P180430
#> 73  P180429
#> 74  P179935
#> 75  P179749
#> 76  P179365
#> 77  P179357
#> 78  P179349
#> 79  P179337
#> 80  P179249
#> 81  P179189
#> 82  P179182
#> 83  P179088
#> 84  P179046
#> 85  P179039
#> 86  P178993
#> 87  P178888
#> 88  P178729
#> 89  P178663
#> 90  P178581
#> 91  P178567
#> 92  P178563
#> 93  P178557
#> 94  P178418
#> 95  P178339
#> 96  P178254
#> 97  P178253
#> 98  P178252
#> 99  P178146
#> 100 P178072
#> 101 P178053
#> 102 P177980
#> 103 P177965
#> 104 P177917
#> 105 P177915
#> 106 P177876
#> 107 P177856
#> 108 P177671
#> 109 P177632
#> 110 P177474
#> 111 P177159
#> 112 P177070
#> 113 P176982
#> 114 P176733
#> 115 P176404
#> 116 P176107
#> 117 P176032
#> 118 P175811
#> 119 P175728
#> 120 P175723
#> 121 P175676
#> 122 P175261
#> 123 P175221
#> 124 P174825
#> 125 P174798
#> 126 P174778
#> 127 P174732
#> 128 P174593
#> 129 P174564
#> 130 P174312
#> 131 P174067
#> 132 P173978
#> 133 P173958
#> 134 P173704
#> 135 P173589
#> 136 P173090
#> 137 P172605
#> 138 P172497
#> 139 P172226
#> 140 P172213
#> 141 P172187
#> 142 P171750
#> 143 P171257
#> 144 P170873
#> 145 P170850
#> 146 P170811
#> 147 P170682
#> 148 P170645
#> 149 P170590
#> 150 P169140
#> 151 P169134
#> 152 P169111
#> 153 P168634
#> 154 P168633
#> 155 P168590
#> 156 P168310
#> 157 P168097
#> 158 P167581
#> 159 P167523
#> 160 P167455
#> 161 P167350
#> 162 P166923
#> 163 P166868
#> 164 P166578
#> 165 P166020
#> 166 P165695
#> 167 P165683
#> 168 P165129
#> 169 P165055
#> 170 P164602
#> 171 P163868
#> 172 P163533
#> 173 P163328
#> 174 P162679
#> 175 P162086
#> 176 P160463
#> 177 P160379
#> 178 P160018
#> 179 P158522
#> 180 P158502
#> 181 P158146
#> 182 P158119
#> 183 P158000
#> 184 P157929
#> 185 P157702
#> 186 P157141
#> 187 P156869
#> 188 P156241
#> 189 P155617
#> 190 P155303
#> 191 P155007
#> 192 P154990
#> 193 P153012
#> 194 P152698
#> 195 P152285
#> 196 P148775
#> 197 P148531
#> 198 P147158
#> 199 P132620
#> 200 P130544
#> 201 P128921
#> 202 P127725
#> 203 P122387
#> 204 P114896
#> 205 P114890
#> 206 P110539
#> 207 P108190
#> 208 P105370
#> 209 P096124
#> 210 P073882
#> 211 P039027
#> 212 P009585
#>                                                                                                        project_name
#> 1                                                                                                   Tocantins PRIDP
#> 2                                                                                Institutions MPA – Phase 1 (Assam)
#> 3                                                                                                             AHEAD
#> 4                                                                                                           SRH P4R
#> 5                                                                                                              MEGA
#> 6                                                                                                        BR Digital
#> 7                                                                                                     SC Resilience
#> 8                          Amazon and Cerrado Bioeconomy, Forest Restoration, and Climate-Smart Agriculture Project
#> 9                                                                                                               SS3
#> 10                                                                         Skills: National ITI Upgradation Program
#> 11                                                 Brazil: Decarbonization of Energy-Intensive Value Chains Project
#> 12                                                              Energy Transition of the Northeast Region of Brazil
#> 13                                                                   Amaravati Integrated Urban Development Program
#> 14                                                                Himachal Disaster Recovery and Resilience Project
#> 15                                                  Brazil Enhancing Productivity, Sustainability and Inclusion DPF
#> 16                                                                    Assam Governance and Service Delivery Program
#> 17                    Meghalaya Multisectoral Project for Adolescent Wellbeing, Empowerment and Resilience (MPOWER)
#> 18                                   Brazil Electromobility Multiphase Programmatic Approach – MPA Phase 2 Salvador
#> 19                                                                         West Bengal Health System Reform Program
#> 20                                                                                                     PPP SP Rails
#> 21                                                                                                   AM Sustainable
#> 22                                                                                                             MRDP
#> 23                                                     Private-Delivered Metro Sao Paulo Line 4 Phase III Extension
#> 24                                                                                                    Bahia SIP DPL
#> 25                                                          Accelerating the Energy Transition in the Amazon (AETA)
#> 26                                                                  Karnataka Water Security and Resilience Program
#> 27                                       Santa Catarina Rural Development Project for Sustainability and Innovation
#> 28                                                           IN: Digital Empowerment and Services to Harness Growth
#> 29                                                                                                        BR PE DPL
#> 30                                                                                                     MS Pro-Roads
#> 31                                                                                                         PoCRA-II
#> 32                 BR State of Rio Grande do Sul Sustainable Recovery and Climate Resilient Development Policy Loan
#> 33                                                             India - Enhancing Innovation among ICMR Institutions
#> 34                                 Strengthening Social Assistance Delivery System in the Municipality of São Paulo
#> 35                                                                   Bahia Urban Socio-Productive Inclusion Project
#> 36                                                     Brazil Electromobility and Energy Transition Finance Project
#> 37                                                                                                  SP Metro Line 2
#> 38  Brazil Proactive, Safe, and Resilient Road Asset Management Program - State of Santa Catarina Project - Phase 3
#> 39                                                                                        Brazil: ASL Xingu project
#> 40                                                                        Kerala Health Systems Improvement Program
#> 41                                                                             Surat Resilience Enhancement Project
#> 42                                              Rio Grande do Norte: Sustainable Development and Governance Project
#> 43                                                            Haryana Clean Air and Sustainable Development Program
#> 44                                                           Rajasthan Highway Modernization Project (RHMP) Phase-2
#> 45                                                          BR State of Alagoas Sustainable Development Policy Loan
#> 46                                                                   Sergipe Efficient Digital Acceleration project
#> 47                                                       Punjab Outcomes-Acceleration In School Education Operation
#> 48                                                       Sustainable Human Development Project in the State of Pará
#> 49                                         Electrification and Improvement of the São Paulo Urban Transport Program
#> 50   Brazil Proactive, Safe and Resilient Road Asset Management Program - State of Espirito Santo Project - Phase 2
#> 51                                                      Agroecology and Sustainable Rural Development in Pernambuco
#> 52   India Supporting Socioeconomic Development and Livelihood Security among Particularly Vulnerable Tribal Groups
#> 53                                                                                                              IPF
#> 54                                                                                                      IPF Regular
#> 55                                                                                                    PForR Project
#> 56                                                         Hybrid PPP - São Paulo Commuter Rail Lines 11, 12 and 13
#> 57                                                       Progestão Program - MPA Phase 1 State of Rio Grande do Sul
#> 58                               Second Dam Rehabilitation and Improvement Project - Additional Financing (DRIP -3)
#> 59                                                    Expanding Clean Hydrogen in Brazil - Ceara Green Hydrogen Hub
#> 60                  BR Enhancing Prosperity and Sustainability in the State of Sergipe Development Policy Financing
#> 61                  Maharashtra Strengthening Institutional Capabilities in Districts for Enabling Growth Operation
#> 62                                                                   India-West Bengal Health System Reform Program
#> 63                                               Second Low-Carbon Energy Programmatic Development Policy Financing
#> 64                                                                       Gurugram Metro Huda to Cyber City, Haryana
#> 65                                                                 Strengthening Coastal Resilience and the Economy
#> 66                                                                                Promoting Green Hydrogen in India
#> 67                                                     Tamil Nadu Women Employment and Safety (TN WESAFE) Operation
#> 68                             Sikkim: Integrated Service Provision and Innovation for Reviving Economies Operation
#> 69                             Brazil Proactive, Safe, and Resilient Road Asset Management Program - State of Bahia
#> 70                                                            BR State of Ceará Sustainable Development Policy Loan
#> 71                                                                      Espírito Santo Digital Acceleration Project
#> 72                                                   Brazil: Pernambuco Rural Water and Sanitation Project (PROSAR)
#> 73                                                                      Bahia Sustainable Rural Development Project
#> 74                                                   Enhancing Landscape and Ecosystem Management (ELEMENT) Project
#> 75                                                         Uttarakhand Disaster Preparedness and Resilience Project
#> 76                                           Brazil: Support to New Bolsa Familia Conditional Cash Transfer Program
#> 77                                                           Uttarakhand Climate Responsive Rainfed Farming Project
#> 78                                         Electric Vehicle Operations and Lending for a Vibrant Ecosystem (EVOLVE)
#> 79                 Assam State Secondary Healthcare Initiative for Service Delivery Transformation (ASSIST) Project
#> 80                                                       Chhattisgarh: Accelerated Learning for a Knowledge-Economy
#> 81                                                           Tamil Nadu Climate Resilient Urban Development Program
#> 82                                         Rio de Janeiro Fiscal Management and Sustainable Development Policy Loan
#> 83                                                         Progestão Tocantins: Public Sector Management Efficiency
#> 84                                                              Progestão Acre: Public Sector Management Efficiency
#> 85                                                                 Karnataka Sustainable Rural Water Supply Program
#> 86                                               Mato Grosso Resilient, Inclusive, and Sustainable Learning Project
#> 87                                                                                   Brazil Climate Finance Project
#> 88                                                Rio de Janeiro Adjustment and Sustainable Development Policy Loan
#> 89                                                             Progestão Piauí: Public Sector Management Efficiency
#> 90                                                                            Assam Resilient Rural Bridges Program
#> 91                                                           Piauí Health and Social Protection Development Project
#> 92                                                      RECOVERING LEARNING LOSSES FROM COVID-19 PANDEMIC IN BRAZIL
#> 93                                          Integrated Sustainable Mobility Project in the Foz do Rio Itajaí Region
#> 94                                                       Tripura Rural Economic Growth and Service Delivery Project
#> 95                                                       Progestão Mato Grosso: Public Sector Management Efficiency
#> 96                                          Kerala Climate Resilient Agri- Value Chain Modernization (KERA) Project
#> 97                            Uttar Pradesh Agriculture Growth and Rural Enterprise Ecosystem Strengthening Project
#> 98                              Systems Reform Endeavours for Transformed Health Achievement in Gujarat (SRESTHA-G)
#> 99                                                                 India's Enhanced Health Service Delivery Program
#> 100                                 Green, Resilient and Inclusive Regeneration of the Central Area of Porto Alegre
#> 101                                                                      Uttar Pradesh Clean Air Management Program
#> 102                                                               Additional Financing for Resilient Kerala Program
#> 103 Development of Applied Knowledge and Skills for Human Development in Maharashtra  - (DAKSH) Maharashtra Program
#> 104                                     Multidisciplinary Education and Research Improvement in Technical Education
#> 105                                    GUJARAT OUTCOMES FOR ACCELERATED LEARNING (GOAL) - ADDITIONAL FINANCING (AF)
#> 106                                      West Bengal Accelerated Development of Minor Irrigation Project - Phase II
#> 107                                                                                          Rail Logistics Project
#> 108                                                    Animal Health System Support for One Health Program (AHSSOH)
#> 109                                                                      BR State of Goias Sustainable Recovery DPF
#> 110                                                          Piauí Pillars of Growth and Social Inclusion Project 2
#> 111                                                       Monitoring and Evaluation capacity building in South Asia
#> 112                                                          Progestão Alagoas: Public Sector Management Efficiency
#> 113                                                        Brazil: Espirito Santo Water Security Management Project
#> 114                                                                IN: Manipur Infotech eNabled Development Project
#> 115                  RIGHTS: Inclusion, Accessibility and Opportunities for Persons with Disabilities in Tamil Nadu
#> 116                                       Additional Financing - Karnataka Urban Water Supply Modernization Project
#> 117                                                               Himachal Pradesh Power Sector Development Program
#> 118                                                            Odisha State Capability and Resilient Growth Program
#> 119                                         Gujarat Resilient Cities Partnership: Ahmedabad City Resilience Project
#> 120                                                           Mato Grosso Sustainable Development of Family Farming
#> 121                             PHSPP: Transforming India’s Public Health Systems for Pandemic Preparedness Program
#> 122                                                            Punjab: Building Fiscal and Institutional Resilience
#> 123                                                    Chennai City Partnership: Sustainable Urban Services Program
#> 124                                        West Bengal Boosting Logistics Efficiency and Trade Facilitation Program
#> 125                                                                             Fisheries Sector Prosperity Project
#> 126                                                                                    The Resilient Kerala Program
#> 127                          Shimla-Himachal Pradesh Water Supply and Sewerage Services Improvement Program (PforR)
#> 128                                                                 Assam Integrated River Basin Management Program
#> 129                                 West Bengal Building State Capability for Inclusive Social Protection Operation
#> 130                                                                     Second National Ganga River Basin Guarantee
#> 131                                                                   Public Service Capability Enhancement Project
#> 132                                                                     Supporting Andhra's Learning Transformation
#> 133                                                                    Mizoram Health Systems Strengthening Project
#> 134                                                                Gujarat Outcomes for Accelerated Learning (GOAL)
#> 135                                                                  Meghalaya Health Systems Strengthening Project
#> 136                                         Second Amazona Fiscal and Environmental Sustainability Programmatic DPF
#> 137                                                        Salvador Social Multi-Sector Service Delivery Project II
#> 138                                                          Sustainable Multiple Use Landscape Consortia in Brazil
#> 139                                                                       Raising and Accelerating MSME Performance
#> 140                                                            Nagaland: Enhancing Classroom Teaching and Resources
#> 141                              Rejuvenating Watersheds for Agricultural Resilience through Innovative Development
#> 142                                              Additional Financing: Rooftop Solar Program for Residential sector
#> 143                                                            Brazil Amazon Sustainable Landscapes Project Phase 2
#> 144                            Second Dam Rehabilitation and Improvement Project - Additional Financing (DRIP-2 AF)
#> 145                                                             Energy and Mineral Sectors Strengthening Project II
#> 146                                                                   Punjab Municipal Services Improvement Project
#> 147                                                       Linha de Crédito para Resiliência Urbana no Sul do Brasil
#> 148                                         Chhattisgarh Inclusive Rural and Accelerated Agriculture Growth Project
#> 149                                                 West Bengal Electricity Distribution Grid Modernization Project
#> 150                                                                 São Paulo Aricanduva Bus Rapid Transit Corridor
#> 151                               Improving Mobility and Urban Inclusion in the Amazonas Corridor in Belo Horizonte
#> 152                                                                       Second National Ganga River Basin Project
#> 153                                Parana Public Sector Modernization and Innovation for Service Delivery Operation
#> 154                                                                           Kerala Solid Waste Management Project
#> 155                                                              Tamil Nadu Housing and Habitat Development Project
#> 156                                            State of Maharashtra's Agribusiness and Rural Transformation Project
#> 157                                                                          Meghalaya Integrated Transport Project
#> 158                                                             Andhra Pradesh Health Systems Strengthening Project
#> 159                                                                     Program Towards Elimination of Tuberculosis
#> 160                                                Ceara Rural Sustainable Development and Competitiveness Phase II
#> 161                                                                        Green National Highways Corridor Project
#> 162                                                   Uttarakhand Public Financial Management Strengthening Project
#> 163                                                         Strengthening Teaching-Learning  And Results for States
#> 164                                             Chhattisgarh Public Financial Management and Accountability Program
#> 165                                   West Bengal Inland Water Transport, Logistics and Spatial Development Project
#> 166            SABESP - IMPROVING WATER SERVICE ACCESS AND SECURITY IN THE METROPOLITAN REGION OF SÃO PAULO PROJECT
#> 167                                             Paraiba Improving Water Resources Management and Services Provision
#> 168     Integrated Project for Source Sustainability and Climate Resilient Rain-fed Agriculture in Himachal Pradesh
#> 169                                                                             Ceará Water Security and Governance
#> 170                                                    Integrated Landscape Management in the Cerrado Biome Project
#> 171                                                           Support to Upper Secondary Reform in Brazil Operation
#> 172                                          Odisha Integrated Irrigation Project for Climate Resilient Agriculture
#> 173                                                             Himachal Pradesh State Roads Transformation Project
#> 174                                                       West Bengal Major Irrigation and Flood Management Project
#> 175                                                                      Jharkhand Power System Improvement Project
#> 176                                                   AP Integrated Irrigation & Agriculture Transformation Project
#> 177                                                               Innovation in Solar Power and Hybrid Technologies
#> 178                                                   Additional Financing for Grid-Connected Rooftop Solar Program
#> 179                                                          Tamil Nadu Irrigated Agriculture Modernization Project
#> 180                                                                         Jharkhand Municipal Development Project
#> 181                                                           Uttarakhand Water Supply Program for Peri Urban Areas
#> 182                                           Atal Bhujal Yojana (Abhy)-National Groundwater Management Improvement
#> 183                                                                           Amazon Sustainable Landscapes Project
#> 184                                                                            Assam Inland Water Transport Project
#> 185                                                                 Tamil Nadu Rural Transformation Project (TNRTP)
#> 186                                                                 Rajasthan State Highways Development Program II
#> 187                                                          Strengthening Public Financial Management in Rajasthan
#> 188                                                                             Innovate in India for Inclusiveness
#> 189                                                             Assam Agribusiness and Rural Transformation Project
#> 190                                                                        Madhya Pradesh Urban Development Project
#> 191                                                                            Grid-Connected Rooftop Solar Program
#> 192                                                                          Jhelum and Tawi Flood Recovery Project
#> 193                                                                 Fortaleza Sustainable Urban Development Project
#> 194                                                                                      National Hydrology Project
#> 195                                                                     Brazil Investment Plan Coordination Project
#> 196                                     Capacity Augmentation of the National Waterway- 1 (JAL MARG VIKAS)  Project
#> 197                                                                  Uttarakhand Health Systems Development Project
#> 198                                                                           Paraiba Sustainable Rural Development
#> 199                                                              Partial Risk Sharing Facility in Energy Efficiency
#> 200                                                           IN Karnataka Urban Water Supply Modernization Project
#> 201                                                              Partial Risk Sharing Facility in Energy Efficiency
#> 202                                                                            Bihar Kosi Basin Development Project
#> 203                                                                     DFID TF III Supervision and Fiduciary Costs
#> 204                                                                       Collective Land Ownership Model for Women
#> 205                                                         Combining income and forest protection: açaí production
#> 206                                                                    India: FaL-G High Capacity Automation Plants
#> 207                                                            Subterranean Arsenic Removal: Experiment to Delivery
#> 208                                                                          Allian Duhangan Hydro Electric Project
#> 209                                                                      Vishnugad Pipalkoti Hydro Electric Project
#> 210                                                                  RF 2nd Amazon Fire Prevention and Mobilization
#> 211                                                               RF Science Centers - Emergency Assistance Project
#> 212                                                                                                           ODS I
#>       status approval_date closing_date country_code country
#> 1   Pipeline          <NA>         <NA>           BR  Brazil
#> 2   Pipeline          <NA>         <NA>           IN   India
#> 3   Pipeline          <NA>         <NA>           IN   India
#> 4   Pipeline          <NA>         <NA>           IN   India
#> 5   Pipeline          <NA>         <NA>           IN   India
#> 6   Pipeline          <NA>         <NA>           BR  Brazil
#> 7   Pipeline          <NA>         <NA>           BR  Brazil
#> 8   Pipeline          <NA>         <NA>           BR  Brazil
#> 9   Pipeline          <NA>         <NA>           BR  Brazil
#> 10  Pipeline          <NA>         <NA>           IN   India
#> 11  Pipeline          <NA>         <NA>           BR  Brazil
#> 12  Pipeline          <NA>         <NA>           BR  Brazil
#> 13    Active    2024-12-19         <NA>           IN   India
#> 14  Pipeline          <NA>         <NA>           IN   India
#> 15  Pipeline          <NA>         <NA>           BR  Brazil
#> 16  Pipeline          <NA>         <NA>           IN   India
#> 17  Pipeline          <NA>         <NA>           IN   India
#> 18  Pipeline          <NA>         <NA>           BR  Brazil
#> 19  Pipeline          <NA>         <NA>           IN   India
#> 20  Pipeline          <NA>         <NA>           BR  Brazil
#> 21  Pipeline          <NA>         <NA>           BR  Brazil
#> 22  Pipeline          <NA>         <NA>           IN   India
#> 23  Pipeline          <NA>         <NA>           BR  Brazil
#> 24  Pipeline          <NA>         <NA>           BR  Brazil
#> 25  Pipeline          <NA>         <NA>           BR  Brazil
#> 26  Pipeline          <NA>         <NA>           IN   India
#> 27  Pipeline          <NA>         <NA>           BR  Brazil
#> 28  Pipeline          <NA>         <NA>           IN   India
#> 29  Pipeline          <NA>         <NA>           BR  Brazil
#> 30  Pipeline          <NA>         <NA>           BR  Brazil
#> 31  Pipeline          <NA>         <NA>           IN   India
#> 32  Pipeline          <NA>         <NA>           BR  Brazil
#> 33  Pipeline          <NA>         <NA>           IN   India
#> 34  Pipeline          <NA>         <NA>           BR  Brazil
#> 35  Pipeline          <NA>         <NA>           BR  Brazil
#> 36  Pipeline          <NA>         <NA>           BR  Brazil
#> 37  Pipeline          <NA>         <NA>           BR  Brazil
#> 38  Pipeline          <NA>         <NA>           BR  Brazil
#> 39  Pipeline          <NA>         <NA>           BR  Brazil
#> 40  Pipeline          <NA>         <NA>           IN   India
#> 41  Pipeline          <NA>         <NA>           IN   India
#> 42  Pipeline          <NA>         <NA>           BR  Brazil
#> 43  Pipeline          <NA>         <NA>           IN   India
#> 44  Pipeline          <NA>         <NA>           IN   India
#> 45  Pipeline          <NA>         <NA>           BR  Brazil
#> 46  Pipeline          <NA>         <NA>           BR  Brazil
#> 47  Pipeline          <NA>         <NA>           IN   India
#> 48    Active    2024-03-28   2029-04-30           BR  Brazil
#> 49  Pipeline          <NA>         <NA>           BR  Brazil
#> 50  Pipeline          <NA>         <NA>           BR  Brazil
#> 51  Pipeline          <NA>         <NA>           BR  Brazil
#> 52  Pipeline          <NA>         <NA>           IN   India
#> 53  Pipeline          <NA>         <NA>           IN   India
#> 54  Pipeline          <NA>         <NA>           IN   India
#> 55  Pipeline          <NA>         <NA>           IN   India
#> 56  Pipeline          <NA>         <NA>           BR  Brazil
#> 57  Pipeline          <NA>         <NA>           BR  Brazil
#> 58  Pipeline          <NA>         <NA>           IN   India
#> 59  Pipeline          <NA>         <NA>           BR  Brazil
#> 60    Active    2024-08-27   2026-12-31           BR  Brazil
#> 61    Active    2024-12-03   2030-03-31           IN   India
#> 62  Pipeline          <NA>         <NA>           IN   India
#> 63    Active    2024-06-28   2026-06-30           IN   India
#> 64  Pipeline          <NA>         <NA>           IN   India
#> 65  Pipeline          <NA>         <NA>           IN   India
#> 66  Pipeline          <NA>         <NA>           IN   India
#> 67  Pipeline          <NA>         <NA>           IN   India
#> 68    Active    2023-12-21   2029-04-30           IN   India
#> 69    Active    2024-09-10   2032-11-30           BR  Brazil
#> 70    Active    2024-03-28   2025-12-31           BR  Brazil
#> 71    Active    2024-05-17   2029-06-30           BR  Brazil
#> 72    Active    2024-05-17   2032-07-14           BR  Brazil
#> 73    Active    2024-11-07   2030-10-30           BR  Brazil
#> 74    Active    2024-11-25   2030-06-30           IN   India
#> 75    Active    2024-04-01   2029-06-30           IN   India
#> 76    Active    2023-12-06   2026-04-30           BR  Brazil
#> 77    Active    2024-04-01   2030-03-31           IN   India
#> 78  Pipeline          <NA>         <NA>           IN   India
#> 79    Active    2023-06-26   2029-11-30           IN   India
#> 80    Active    2023-06-26   2028-09-29           IN   India
#> 81    Active    2023-12-21   2030-12-31           IN   India
#> 82    Active    2023-11-16   2024-12-31           BR  Brazil
#> 83    Active    2023-07-24   2028-12-29           BR  Brazil
#> 84    Active    2023-07-24   2028-12-29           BR  Brazil
#> 85    Active    2023-03-28   2028-06-01           IN   India
#> 86    Active    2023-10-26   2028-12-31           BR  Brazil
#> 87    Active    2022-12-22   2028-04-30           BR  Brazil
#> 88    Active    2022-06-16   2024-12-31           BR  Brazil
#> 89    Active    2023-10-03   2029-06-29           BR  Brazil
#> 90    Active    2024-03-01   2030-06-28           IN   India
#> 91    Active    2023-10-05   2029-06-30           BR  Brazil
#> 92    Active    2022-05-12   2027-12-31           BR  Brazil
#> 93    Active    2024-04-12   2031-11-30           BR  Brazil
#> 94    Active    2023-06-26   2029-06-30           IN   India
#> 95    Active    2022-08-23   2028-06-30           BR  Brazil
#> 96    Active    2024-10-31   2029-11-30           IN   India
#> 97    Active    2024-12-12   2030-09-30           IN   India
#> 98    Active    2022-09-21   2028-03-31           IN   India
#> 99    Active    2022-06-28   2027-06-30           IN   India
#> 100   Active    2023-06-07   2028-12-29           BR  Brazil
#> 101 Pipeline          <NA>         <NA>           IN   India
#> 102   Active    2023-06-16         <NA>           IN   India
#> 103   Active    2024-05-22   2029-03-30           IN   India
#> 104   Active    2023-06-23   2028-12-29           IN   India
#> 105   Active    2022-06-21         <NA>           IN   India
#> 106   Active    2023-06-09   2029-06-29           IN   India
#> 107   Active    2022-06-10   2027-06-30           IN   India
#> 108   Active    2023-05-10   2027-11-30           IN   India
#> 109   Active    2022-04-28   2024-12-31           BR  Brazil
#> 110   Active    2024-03-14   2029-07-31           BR  Brazil
#> 111   Active          <NA>   2025-06-30           IN   India
#> 112   Active    2022-07-21   2028-03-31           BR  Brazil
#> 113   Active    2023-05-09   2029-06-30           BR  Brazil
#> 114   Active    2023-07-06   2028-09-30           IN   India
#> 115   Active    2022-06-14   2028-06-30           IN   India
#> 116   Active    2021-12-21         <NA>           IN   India
#> 117   Active    2023-06-27   2028-03-31           IN   India
#> 118   Active    2023-03-28   2028-04-26           IN   India
#> 119   Active    2022-11-22   2028-12-31           IN   India
#> 120   Active    2024-02-05   2030-05-15           BR  Brazil
#> 121   Active    2022-06-28   2027-12-31           IN   India
#> 122   Active    2022-09-19   2027-06-30           IN   India
#> 123   Active    2021-09-30   2026-12-31           IN   India
#> 124   Active    2024-04-24   2028-06-30           IN   India
#> 125   Active    2022-06-17   2027-06-30           IN   India
#> 126   Active    2021-06-24   2028-06-30           IN   India
#> 127   Active    2021-11-05   2026-12-31           IN   India
#> 128   Active    2023-03-24   2027-07-31           IN   India
#> 129   Active    2022-01-19   2028-08-31           IN   India
#> 130   Active    2020-06-25   2026-12-31           IN   India
#> 131   Active    2022-04-27   2027-03-31           IN   India
#> 132   Active    2021-06-17   2026-12-31           IN   India
#> 133   Active    2021-03-31   2026-03-31           IN   India
#> 134   Active    2021-03-24   2027-09-30           IN   India
#> 135   Active    2021-09-30   2027-03-31           IN   India
#> 136 Pipeline          <NA>         <NA>           BR  Brazil
#> 137   Active    2020-09-22   2025-12-30           BR  Brazil
#> 138   Active          <NA>   2027-11-30           BR  Brazil
#> 139   Active    2021-06-04   2026-09-30           IN   India
#> 140   Active    2020-12-15   2026-06-30           IN   India
#> 141   Active    2021-12-10   2026-06-30           IN   India
#> 142   Active    2022-06-28         <NA>           IN   India
#> 143   Active          <NA>         <NA>           BR  Brazil
#> 144   Active    2020-12-15   2027-12-31           IN   India
#> 145   Active    2020-05-22   2025-12-31           BR  Brazil
#> 146   Active    2021-03-31   2026-09-30           IN   India
#> 147   Active    2020-03-24   2026-06-30           BR  Brazil
#> 148   Active    2020-12-15   2026-07-31           IN   India
#> 149   Active    2021-11-29   2026-11-30           IN   India
#> 150   Active    2020-04-22   2026-06-30           BR  Brazil
#> 151   Active    2020-03-24   2028-09-30           BR  Brazil
#> 152   Active    2020-06-25   2026-12-31           IN   India
#> 153   Active    2022-04-28   2027-10-31           BR  Brazil
#> 154   Active    2021-03-09   2027-06-30           IN   India
#> 155   Active    2020-05-18   2025-06-30           IN   India
#> 156   Active    2019-12-17   2027-03-31           IN   India
#> 157   Active    2020-10-23   2026-10-31           IN   India
#> 158   Active    2019-05-15   2025-03-31           IN   India
#> 159   Active    2019-03-29   2025-03-31           IN   India
#> 160   Active    2019-07-18   2025-12-31           BR  Brazil
#> 161   Active    2020-03-27   2025-03-18           IN   India
#> 162   Active    2019-03-07   2025-06-30           IN   India
#> 163   Active    2020-06-24   2025-12-31           IN   India
#> 164   Active    2019-02-21   2025-03-31           IN   India
#> 165   Active    2020-11-30   2026-03-31           IN   India
#> 166   Active    2018-12-18   2026-06-16           BR  Brazil
#> 167   Active    2019-02-28   2026-06-30           BR  Brazil
#> 168   Active    2020-02-18   2025-03-31           IN   India
#> 169   Active    2019-08-08   2026-12-31           BR  Brazil
#> 170   Active          <NA>   2025-11-30           BR  Brazil
#> 171   Active    2017-12-14   2024-12-31           BR  Brazil
#> 172   Active    2019-09-30   2025-12-31           IN   India
#> 173   Active    2020-03-27   2026-06-30           IN   India
#> 174   Active    2019-12-10   2025-11-30           IN   India
#> 175   Active    2018-10-01   2024-12-31           IN   India
#> 176   Active    2018-10-23   2025-10-31           IN   India
#> 177   Active    2019-03-29   2025-12-31           IN   India
#> 178   Active          <NA>   2026-11-30           IN   India
#> 179   Active    2017-12-01   2025-06-02           IN   India
#> 180   Active    2018-12-12   2025-10-31           IN   India
#> 181   Active    2018-01-04   2025-06-30           IN   India
#> 182   Active    2018-06-05   2025-09-28           IN   India
#> 183   Active          <NA>   2026-12-31           BR  Brazil
#> 184   Active    2019-12-13   2025-12-31           IN   India
#> 185   Active    2017-12-01   2025-06-30           IN   India
#> 186   Active    2019-03-29   2024-12-31           IN   India
#> 187   Active    2018-05-01   2025-03-31           IN   India
#> 188   Active    2017-05-31   2025-06-23           IN   India
#> 189   Active    2017-08-31   2025-09-30           IN   India
#> 190   Active    2017-04-12   2024-12-30           IN   India
#> 191   Active    2016-05-13   2027-11-30           IN   India
#> 192   Active    2015-06-02   2024-12-31           IN   India
#> 193   Active    2017-04-28   2025-03-31           BR  Brazil
#> 194   Active    2017-03-15   2025-03-31           IN   India
#> 195   Active          <NA>   2024-11-30           BR  Brazil
#> 196   Active    2017-04-12   2025-12-24           IN   India
#> 197   Active    2017-01-26   2024-12-31           IN   India
#> 198   Active    2017-10-20   2025-06-15           BR  Brazil
#> 199   Active          <NA>   2025-03-31           IN   India
#> 200   Active    2016-03-31   2026-06-30           IN   India
#> 201   Active          <NA>   2025-03-31           IN   India
#> 202   Active    2015-12-08   2025-03-27           IN   India
#> 203   Active          <NA>         <NA>           IN   India
#> 204 Pipeline          <NA>   2011-10-01           IN   India
#> 205 Pipeline          <NA>   2011-10-01           BR  Brazil
#> 206 Pipeline          <NA>         <NA>           IN   India
#> 207 Pipeline          <NA>   2008-12-31           IN   India
#> 208 Pipeline          <NA>   2018-05-04           IN   India
#> 209   Active    2011-06-30   2024-12-31           IN   India
#> 210   Active          <NA>   2004-09-30           BR  Brazil
#> 211   Active    1994-10-28         <NA>           BR  Brazil
#> 212   Active          <NA>         <NA>           IN   India
#>                          region total_commitment ibrd_commitment ida_commitment
#> 1   Latin America and Caribbean         0.000000          0.0000           0.00
#> 2                    South Asia         0.000000          0.0000           0.00
#> 3                    South Asia         0.000000          0.0000           0.00
#> 4                    South Asia         0.000000          0.0000           0.00
#> 5                    South Asia         0.000000          0.0000           0.00
#> 6   Latin America and Caribbean         0.000000          0.0000           0.00
#> 7   Latin America and Caribbean         0.000000          0.0000           0.00
#> 8   Latin America and Caribbean         0.000000          0.0000           0.00
#> 9   Latin America and Caribbean         0.000000          0.0000           0.00
#> 10                   South Asia         0.000000          0.0000           0.00
#> 11  Latin America and Caribbean         0.000000          0.0000           0.00
#> 12  Latin America and Caribbean         0.000000          0.0000           0.00
#> 13                   South Asia         0.000000          0.0000           0.00
#> 14                   South Asia         0.000000          0.0000           0.00
#> 15  Latin America and Caribbean         0.000000          0.0000           0.00
#> 16                   South Asia         0.000000          0.0000           0.00
#> 17                   South Asia         0.000000          0.0000           0.00
#> 18  Latin America and Caribbean         0.000000          0.0000           0.00
#> 19                   South Asia         0.000000          0.0000           0.00
#> 20  Latin America and Caribbean         0.000000          0.0000           0.00
#> 21  Latin America and Caribbean         0.000000          0.0000           0.00
#> 22                   South Asia         0.000000          0.0000           0.00
#> 23  Latin America and Caribbean         0.000000          0.0000           0.00
#> 24  Latin America and Caribbean         0.000000          0.0000           0.00
#> 25  Latin America and Caribbean         0.000000          0.0000           0.00
#> 26                   South Asia         0.000000          0.0000           0.00
#> 27  Latin America and Caribbean         0.000000          0.0000           0.00
#> 28                   South Asia      5400.000000          0.0000        5400.00
#> 29  Latin America and Caribbean         0.000000          0.0000           0.00
#> 30  Latin America and Caribbean       200.000000          0.0000         200.00
#> 31                   South Asia       490.000000          0.0000         490.00
#> 32  Latin America and Caribbean         0.000000          0.0000           0.00
#> 33                   South Asia         1.000000          1.0000           0.00
#> 34  Latin America and Caribbean         0.000000          0.0000           0.00
#> 35  Latin America and Caribbean        30.000000          0.0000          30.00
#> 36  Latin America and Caribbean         0.000000          0.0000           0.00
#> 37  Latin America and Caribbean       900.000000          0.0000         900.00
#> 38  Latin America and Caribbean       375.000000          0.0000         375.00
#> 39  Latin America and Caribbean         8.560000          0.0000           8.56
#> 40                   South Asia       280.000000          0.0000         280.00
#> 41                   South Asia       196.000000          0.0000         196.00
#> 42  Latin America and Caribbean        45.000000          0.0000          45.00
#> 43                   South Asia      2830.250000        128.0000        2702.25
#> 44                   South Asia       250.000000          0.0000         250.00
#> 45  Latin America and Caribbean         0.000000          0.0000           0.00
#> 46  Latin America and Caribbean        13.400000         13.4000           0.00
#> 47                   South Asia       135.000000          0.0000         135.00
#> 48  Latin America and Caribbean       350.000000         70.0000         280.00
#> 49  Latin America and Caribbean      2300.000000       2300.0000           0.00
#> 50  Latin America and Caribbean       162.400000          0.0000         162.40
#> 51  Latin America and Caribbean        50.000000          0.0000          50.00
#> 52                   South Asia         0.000000          0.0000           0.00
#> 53                   South Asia         0.000000          0.0000           0.00
#> 54                   South Asia         0.000000          0.0000           0.00
#> 55                   South Asia         0.000000          0.0000           0.00
#> 56  Latin America and Caribbean       100.000000        100.0000           0.00
#> 57  Latin America and Caribbean        50.000000         50.0000           0.00
#> 58                   South Asia       420.000000        420.0000           0.00
#> 59  Latin America and Caribbean        90.000000         90.0000           0.00
#> 60  Latin America and Caribbean       110.000000        110.0000           0.00
#> 61                   South Asia       188.280000        188.2800           0.00
#> 62                   South Asia       315.000000        315.0000           0.00
#> 63                   South Asia      1500.000000       1468.5000          31.50
#> 64                   South Asia       131.000000        131.0000           0.00
#> 65                   South Asia       212.640000        212.6400           0.00
#> 66                   South Asia      1000.000000       1000.0000           0.00
#> 67                   South Asia       150.000000        150.0000           0.00
#> 68                   South Asia       100.000000        100.0000           0.00
#> 69  Latin America and Caribbean       150.000000        150.0000           0.00
#> 70  Latin America and Caribbean       541.880000        541.8800           0.00
#> 71  Latin America and Caribbean        61.220000         61.2200           0.00
#> 72  Latin America and Caribbean        90.000000         90.0000           0.00
#> 73  Latin America and Caribbean       100.000000        100.0000           0.00
#> 74                   South Asia       225.520000        225.5200           0.00
#> 75                   South Asia       135.000000        135.0000           0.00
#> 76  Latin America and Caribbean       300.000000        300.0000           0.00
#> 77                   South Asia        96.200000         96.2000           0.00
#> 78                   South Asia         0.000000          0.0000           0.00
#> 79                   South Asia       251.030000        251.0300           0.00
#> 80                   South Asia       300.000000        300.0000           0.00
#> 81                   South Asia       300.000000        300.0000           0.00
#> 82  Latin America and Caribbean       135.238245        135.2382           0.00
#> 83  Latin America and Caribbean        50.000000         50.0000           0.00
#> 84  Latin America and Caribbean        40.000000         40.0000           0.00
#> 85                   South Asia       363.000000        363.0000           0.00
#> 86  Latin America and Caribbean       100.000000        100.0000           0.00
#> 87  Latin America and Caribbean       500.000000        500.0000           0.00
#> 88  Latin America and Caribbean       135.238245        135.2382           0.00
#> 89  Latin America and Caribbean        50.000000         50.0000           0.00
#> 90                   South Asia       452.000000        452.0000           0.00
#> 91  Latin America and Caribbean        50.000000         50.0000           0.00
#> 92  Latin America and Caribbean       250.000000        250.0000           0.00
#> 93  Latin America and Caribbean        90.000000         90.0000           0.00
#> 94                   South Asia       140.000000        140.0000           0.00
#> 95  Latin America and Caribbean        40.000000         40.0000           0.00
#> 96                   South Asia       200.000000        200.0000           0.00
#> 97                   South Asia       325.100000        325.1000           0.00
#> 98                   South Asia       350.000000        350.0000           0.00
#> 99                   South Asia       500.000000        500.0000           0.00
#> 100 Latin America and Caribbean        84.550000         84.5500           0.00
#> 101                  South Asia       350.000000        350.0000           0.00
#> 102                  South Asia       150.000000        150.0000           0.00
#> 103                  South Asia       195.000000        195.0000           0.00
#> 104                  South Asia       255.500000        255.5000           0.00
#> 105                  South Asia       250.000000        250.0000           0.00
#> 106                  South Asia       148.000000        148.0000           0.00
#> 107                  South Asia       245.000000        245.0000           0.00
#> 108                  South Asia        82.000000         82.0000           0.00
#> 109 Latin America and Caribbean       500.000000        500.0000           0.00
#> 110 Latin America and Caribbean        50.000000         50.0000           0.00
#> 111                  South Asia         0.852516          0.0000           0.00
#> 112 Latin America and Caribbean        40.000000         40.0000           0.00
#> 113 Latin America and Caribbean        86.100000         86.1000           0.00
#> 114                  South Asia        46.000000         46.0000           0.00
#> 115                  South Asia       162.000000        162.0000           0.00
#> 116                  South Asia       150.000000        150.0000           0.00
#> 117                  South Asia       200.000000        200.0000           0.00
#> 118                  South Asia       100.000000        100.0000           0.00
#> 119                  South Asia       280.000000        280.0000           0.00
#> 120 Latin America and Caribbean        80.000000         80.0000           0.00
#> 121                  South Asia       500.000000        500.0000           0.00
#> 122                  South Asia       150.000000        150.0000           0.00
#> 123                  South Asia       300.000000        150.0000           0.00
#> 124                  South Asia       150.000000        150.0000           0.00
#> 125                  South Asia       200.000000        150.0000           0.00
#> 126                  South Asia       370.000000        125.0000           0.00
#> 127                  South Asia       160.000000        160.0000           0.00
#> 128                  South Asia       108.000000        108.0000           0.00
#> 129                  South Asia       125.000000        125.0000           0.00
#> 130                  South Asia       381.000000        381.0000           0.00
#> 131                  South Asia        47.000000         47.0000           0.00
#> 132                  South Asia       250.000000        250.0000           0.00
#> 133                  South Asia        32.000000         32.0000           0.00
#> 134                  South Asia       750.000000        500.0000           0.00
#> 135                  South Asia        40.000000         40.0000           0.00
#> 136 Latin America and Caribbean       200.000000        200.0000           0.00
#> 137 Latin America and Caribbean       125.000000        125.0000           0.00
#> 138 Latin America and Caribbean        24.577982          0.0000           0.00
#> 139                  South Asia       500.000000        500.0000           0.00
#> 140                  South Asia        68.000000         68.0000           0.00
#> 141                  South Asia       115.000000        115.0000           0.00
#> 142                  South Asia       165.000000        150.0000           0.00
#> 143 Latin America and Caribbean        19.284404          0.0000           0.00
#> 144                  South Asia       500.000000        250.0000           0.00
#> 145 Latin America and Caribbean        38.000000         38.0000           0.00
#> 146                  South Asia       210.000000        105.0000           0.00
#> 147 Latin America and Caribbean        98.800000         98.8000           0.00
#> 148                  South Asia       167.000000        100.0000           0.00
#> 149                  South Asia       270.000000        135.0000           0.00
#> 150 Latin America and Caribbean        97.000000         97.0000           0.00
#> 151 Latin America and Caribbean        80.000000         80.0000           0.00
#> 152                  South Asia       381.000000        381.0000           0.00
#> 153 Latin America and Caribbean       130.000000        130.0000           0.00
#> 154                  South Asia       210.000000        105.0000           0.00
#> 155                  South Asia        50.000000         50.0000           0.00
#> 156                  South Asia       210.000000        210.0000           0.00
#> 157                  South Asia       120.000000        120.0000           0.00
#> 158                  South Asia       328.000000        328.0000           0.00
#> 159                  South Asia       400.000000        400.0000           0.00
#> 160 Latin America and Caribbean       100.000000        100.0000           0.00
#> 161                  South Asia       466.350000        466.3500           0.00
#> 162                  South Asia        31.580000         31.5800           0.00
#> 163                  South Asia       500.000000        500.0000           0.00
#> 164                  South Asia        25.200000         25.2000           0.00
#> 165                  South Asia       105.000000        105.0000           0.00
#> 166 Latin America and Caribbean       250.000000        250.0000           0.00
#> 167 Latin America and Caribbean       126.886000        126.8860           0.00
#> 168                  South Asia        80.000000         80.0000           0.00
#> 169 Latin America and Caribbean       139.880000        139.8800           0.00
#> 170 Latin America and Caribbean        21.000000          0.0000           0.00
#> 171 Latin America and Caribbean       250.000000        250.0000           0.00
#> 172                  South Asia       165.000000        165.0000           0.00
#> 173                  South Asia        82.000000         82.0000           0.00
#> 174                  South Asia       290.000000        145.0000           0.00
#> 175                  South Asia       310.000000        310.0000           0.00
#> 176                  South Asia       172.200000        172.2000           0.00
#> 177                  South Asia       199.810000        150.0000           0.00
#> 178                  South Asia        22.935780          0.0000           0.00
#> 179                  South Asia       318.000000        318.0000           0.00
#> 180                  South Asia       122.000000        122.0000           0.00
#> 181                  South Asia       120.000000        120.0000           0.00
#> 182                  South Asia       450.000000        450.0000           0.00
#> 183 Latin America and Caribbean        60.330000          0.0000           0.00
#> 184                  South Asia        88.000000         88.0000           0.00
#> 185                  South Asia       100.000000        100.0000           0.00
#> 186                  South Asia       250.000000        250.0000           0.00
#> 187                  South Asia        21.700000         21.7000           0.00
#> 188                  South Asia       125.000000        125.0000           0.00
#> 189                  South Asia       200.000000        200.0000           0.00
#> 190                  South Asia       116.200000        116.2000           0.00
#> 191                  South Asia       648.000000        500.0000           0.00
#> 192                  South Asia       250.000000          0.0000         250.00
#> 193 Latin America and Caribbean        73.300000         73.3000           0.00
#> 194                  South Asia       175.000000        175.0000           0.00
#> 195 Latin America and Caribbean         1.000000          0.0000           0.00
#> 196                  South Asia       375.000000        375.0000           0.00
#> 197                  South Asia       100.000000          0.0000         100.00
#> 198 Latin America and Caribbean        50.000000         50.0000           0.00
#> 199                  South Asia        25.000000          0.0000           0.00
#> 200                  South Asia       100.000000        100.0000           0.00
#> 201                  South Asia        18.000000          0.0000           0.00
#> 202                  South Asia       250.000000          0.0000         250.00
#> 203                  South Asia         1.160000          0.0000           0.00
#> 204                  South Asia         0.000000          0.0000           0.00
#> 205 Latin America and Caribbean         0.000000          0.0000           0.00
#> 206                  South Asia         0.000000          0.0000           0.00
#> 207                  South Asia         0.000000          0.0000           0.00
#> 208                  South Asia         0.000000          0.0000           0.00
#> 209                  South Asia       648.000000        648.0000           0.00
#> 210 Latin America and Caribbean         1.100000          0.0000           0.00
#> 211 Latin America and Caribbean         6.400000          0.0000           0.00
#> 212                  South Asia         1.300000          0.0000           0.00
#>                lending_instrument
#> 1    Investment Project Financing
#> 2   Program-for-Results Financing
#> 3   Program-for-Results Financing
#> 4   Program-for-Results Financing
#> 5    Investment Project Financing
#> 6    Investment Project Financing
#> 7    Investment Project Financing
#> 8    Investment Project Financing
#> 9   Program-for-Results Financing
#> 10  Program-for-Results Financing
#> 11   Investment Project Financing
#> 12   Investment Project Financing
#> 13  Program-for-Results Financing
#> 14   Investment Project Financing
#> 15     Development Policy Lending
#> 16   Investment Project Financing
#> 17   Investment Project Financing
#> 18   Investment Project Financing
#> 19  Program-for-Results Financing
#> 20   Investment Project Financing
#> 21     Development Policy Lending
#> 22   Investment Project Financing
#> 23   Investment Project Financing
#> 24     Development Policy Lending
#> 25   Investment Project Financing
#> 26  Program-for-Results Financing
#> 27   Investment Project Financing
#> 28   Investment Project Financing
#> 29     Development Policy Lending
#> 30   Investment Project Financing
#> 31   Investment Project Financing
#> 32     Development Policy Lending
#> 33   Investment Project Financing
#> 34   Investment Project Financing
#> 35   Investment Project Financing
#> 36   Investment Project Financing
#> 37   Investment Project Financing
#> 38   Investment Project Financing
#> 39   Investment Project Financing
#> 40  Program-for-Results Financing
#> 41   Investment Project Financing
#> 42   Investment Project Financing
#> 43  Program-for-Results Financing
#> 44   Investment Project Financing
#> 45     Development Policy Lending
#> 46   Investment Project Financing
#> 47  Program-for-Results Financing
#> 48   Investment Project Financing
#> 49  Program-for-Results Financing
#> 50   Investment Project Financing
#> 51   Investment Project Financing
#> 52   Investment Project Financing
#> 53   Investment Project Financing
#> 54   Investment Project Financing
#> 55  Program-for-Results Financing
#> 56   Investment Project Financing
#> 57   Investment Project Financing
#> 58   Investment Project Financing
#> 59   Investment Project Financing
#> 60     Development Policy Lending
#> 61  Program-for-Results Financing
#> 62  Program-for-Results Financing
#> 63     Development Policy Lending
#> 64   Investment Project Financing
#> 65   Investment Project Financing
#> 66  Program-for-Results Financing
#> 67  Program-for-Results Financing
#> 68  Program-for-Results Financing
#> 69   Investment Project Financing
#> 70     Development Policy Lending
#> 71   Investment Project Financing
#> 72   Investment Project Financing
#> 73   Investment Project Financing
#> 74   Investment Project Financing
#> 75   Investment Project Financing
#> 76   Investment Project Financing
#> 77   Investment Project Financing
#> 78   Investment Project Financing
#> 79   Investment Project Financing
#> 80  Program-for-Results Financing
#> 81  Program-for-Results Financing
#> 82     Development Policy Lending
#> 83   Investment Project Financing
#> 84   Investment Project Financing
#> 85  Program-for-Results Financing
#> 86   Investment Project Financing
#> 87   Investment Project Financing
#> 88     Development Policy Lending
#> 89   Investment Project Financing
#> 90  Program-for-Results Financing
#> 91   Investment Project Financing
#> 92  Program-for-Results Financing
#> 93   Investment Project Financing
#> 94   Investment Project Financing
#> 95   Investment Project Financing
#> 96   Investment Project Financing
#> 97   Investment Project Financing
#> 98  Program-for-Results Financing
#> 99  Program-for-Results Financing
#> 100  Investment Project Financing
#> 101 Program-for-Results Financing
#> 102 Program-for-Results Financing
#> 103 Program-for-Results Financing
#> 104  Investment Project Financing
#> 105 Program-for-Results Financing
#> 106  Investment Project Financing
#> 107  Investment Project Financing
#> 108 Program-for-Results Financing
#> 109    Development Policy Lending
#> 110  Investment Project Financing
#> 111  Investment Project Financing
#> 112  Investment Project Financing
#> 113  Investment Project Financing
#> 114  Investment Project Financing
#> 115  Investment Project Financing
#> 116  Investment Project Financing
#> 117 Program-for-Results Financing
#> 118 Program-for-Results Financing
#> 119  Investment Project Financing
#> 120  Investment Project Financing
#> 121 Program-for-Results Financing
#> 122 Program-for-Results Financing
#> 123 Program-for-Results Financing
#> 124 Program-for-Results Financing
#> 125  Investment Project Financing
#> 126 Program-for-Results Financing
#> 127 Program-for-Results Financing
#> 128  Investment Project Financing
#> 129 Program-for-Results Financing
#> 130  Investment Project Financing
#> 131  Investment Project Financing
#> 132 Program-for-Results Financing
#> 133  Investment Project Financing
#> 134 Program-for-Results Financing
#> 135  Investment Project Financing
#> 136    Development Policy Lending
#> 137  Investment Project Financing
#> 138  Investment Project Financing
#> 139 Program-for-Results Financing
#> 140  Investment Project Financing
#> 141 Program-for-Results Financing
#> 142 Program-for-Results Financing
#> 143  Investment Project Financing
#> 144  Investment Project Financing
#> 145  Investment Project Financing
#> 146  Investment Project Financing
#> 147  Investment Project Financing
#> 148  Investment Project Financing
#> 149  Investment Project Financing
#> 150  Investment Project Financing
#> 151  Investment Project Financing
#> 152  Investment Project Financing
#> 153 Program-for-Results Financing
#> 154  Investment Project Financing
#> 155  Investment Project Financing
#> 156  Investment Project Financing
#> 157  Investment Project Financing
#> 158  Investment Project Financing
#> 159 Program-for-Results Financing
#> 160  Investment Project Financing
#> 161  Investment Project Financing
#> 162  Investment Project Financing
#> 163 Program-for-Results Financing
#> 164 Program-for-Results Financing
#> 165  Investment Project Financing
#> 166  Investment Project Financing
#> 167  Investment Project Financing
#> 168  Investment Project Financing
#> 169  Investment Project Financing
#> 170  Investment Project Financing
#> 171 Program-for-Results Financing
#> 172  Investment Project Financing
#> 173  Investment Project Financing
#> 174  Investment Project Financing
#> 175  Investment Project Financing
#> 176  Investment Project Financing
#> 177  Investment Project Financing
#> 178 Program-for-Results Financing
#> 179  Investment Project Financing
#> 180  Investment Project Financing
#> 181 Program-for-Results Financing
#> 182 Program-for-Results Financing
#> 183  Investment Project Financing
#> 184  Investment Project Financing
#> 185  Investment Project Financing
#> 186  Investment Project Financing
#> 187  Investment Project Financing
#> 188  Investment Project Financing
#> 189  Investment Project Financing
#> 190  Investment Project Financing
#> 191 Program-for-Results Financing
#> 192  Investment Project Financing
#> 193  Investment Project Financing
#> 194  Investment Project Financing
#> 195  Investment Project Financing
#> 196  Investment Project Financing
#> 197  Investment Project Financing
#> 198  Investment Project Financing
#> 199  Investment Project Financing
#> 200  Investment Project Financing
#> 201  Investment Project Financing
#> 202  Investment Project Financing
#> 203  Investment Project Financing
#> 204      Specific Investment Loan
#> 205      Specific Investment Loan
#> 206                          <NA>
#> 207      Specific Investment Loan
#> 208                          <NA>
#> 209  Investment Project Financing
#> 210                          <NA>
#> 211                          <NA>
#> 212      Specific Investment Loan
#>                                                                                                              borrower
#> 1                                                                                                                <NA>
#> 2                                                                                                                <NA>
#> 3                                                                                                                <NA>
#> 4                                                                                                                <NA>
#> 5                                                                                                                <NA>
#> 6                                                                                                                <NA>
#> 7                                                                                                                <NA>
#> 8                                                                                                                <NA>
#> 9                                                                                                                <NA>
#> 10                                                                                                               <NA>
#> 11                                                                                                               <NA>
#> 12                                                                                                               <NA>
#> 13                                                                                                               <NA>
#> 14                                                                                                               <NA>
#> 15                                                                                                               <NA>
#> 16                                                                                                               <NA>
#> 17                                                                                                               <NA>
#> 18                                                                                                               <NA>
#> 19                                                                                                               <NA>
#> 20                                                                                                               <NA>
#> 21                                                                                                               <NA>
#> 22                                                                                                               <NA>
#> 23                                                                                                               <NA>
#> 24                                                                                                               <NA>
#> 25                                                                                                               <NA>
#> 26                                                                                                               <NA>
#> 27                                                                                                               <NA>
#> 28                                                                                                               <NA>
#> 29                                                                                                               <NA>
#> 30                                                                                                               <NA>
#> 31                                                                                                               <NA>
#> 32                                                                                                               <NA>
#> 33                                                                                                               <NA>
#> 34                                                                                                               <NA>
#> 35                                                                                                               <NA>
#> 36                                                                                                               <NA>
#> 37                                                                                                               <NA>
#> 38                                                                                                               <NA>
#> 39                                                                                                               <NA>
#> 40                                                                                                               <NA>
#> 41                                                                                                               <NA>
#> 42                                                                                                               <NA>
#> 43                                                                                                               <NA>
#> 44                                                                                                               <NA>
#> 45                                                                                                               <NA>
#> 46                                                                                                               <NA>
#> 47                                                                                                               <NA>
#> 48                                                                                                               <NA>
#> 49                                                                                                               <NA>
#> 50                                                                                                               <NA>
#> 51                                                                                                               <NA>
#> 52                                                                                                               <NA>
#> 53                                                                                                               <NA>
#> 54                                                                                                               <NA>
#> 55                                                                                                               <NA>
#> 56                                                                                                               <NA>
#> 57                                                                                                  State of Amazonas
#> 58                                                                Ministry of Finance, Department of Economic Affairs
#> 59                                                                      Complexo Industrial Portuario de Pecem (CIPP)
#> 60                                                                                                   State of Sergipe
#> 61                                                                                                              India
#> 62                                                                                                Ministry of Finance
#> 63                                                                                                              India
#> 64                                                                                                Government of India
#> 65                                                                                                              India
#> 66                                                                                                Ministry of Finance
#> 67                                                                                                              India
#> 68                                                                                                              India
#> 69                                                                                                               <NA>
#> 70                                                                                           State Government of Cear
#> 71                                                                              Secretaria de Economia e Planejamento
#> 72                                                                              Government of the State of Pernambuco
#> 73                                                                                   Government of the State of Bahia
#> 74                                                                                                              India
#> 75                                                                                                Government of India
#> 76                                                                                      Federative Republic of Brazil
#> 77                                                                                     Department of Economic Affairs
#> 78                                                                                                               <NA>
#> 79                                                                                                              India
#> 80                                                                                                              India
#> 81                                                                                                Ministry of Finance
#> 82                                                                                     Municipality of Rio de Janeiro
#> 83                                                                             State Secretariat of Planning (SEPLAN)
#> 84                                                                                                      State of Acre
#> 85                                                                                                              India
#> 86                                                                                               STATE OF MATO GROSSO
#> 87                                                                                                    Banco do Brasil
#> 88                                                                                     Municipality of Rio de Janeiro
#> 89                                                                                                     State of Piaui
#> 90                                                                                                              India
#> 91                                                                                                               <NA>
#> 92                                                                                  THE FEDERATIVE REPUBLIC OF BRAZIL
#> 93                                                CIM - AMFRI (Foz do Rio Itaja� Region Consortium of Municipalities)
#> 94                                                                                                              India
#> 95                                                                                               State of Mato Grosso
#> 96                                                                                                               <NA>
#> 97                                                                                                               <NA>
#> 98                                                                                                              India
#> 99                                                                                                              India
#> 100                                                                                                              <NA>
#> 101                                                                                                 Republic of India
#> 102                                                                                                             India
#> 103                                                                                                              <NA>
#> 104                                                                                                             India
#> 105                                                                        Government of Gujarat, Ministry of Finance
#> 106                                                                                                             India
#> 107                                                           Dedicated Freight Corridor Corporation of India Limited
#> 108                                                                                                             India
#> 109                                                                                                    State of Goi�s
#> 110                                                                                                     State of Piau
#> 111                                                            Institute for Financial Management and Research (IFMR)
#> 112                                         State of Alagoas, with the guarantee of the Federative Republic of Brazil
#> 113                                                                                           State of Espirito Santo
#> 114                                                                                                             India
#> 115                                                                                                             India
#> 116                                                                                                             India
#> 117                                                                                                             India
#> 118                                                                                                             India
#> 119                                                                                                             India
#> 120                                                                                              State of Mato Grosso
#> 121                                                                                                             India
#> 122                                                                                                             India
#> 123                                                                                                             India
#> 124                                                                                                             India
#> 125                                                                                                             INDIA
#> 126                                                                                                             India
#> 127                                                                                                             India
#> 128                                                                                                             India
#> 129                                                                                                             India
#> 130                                                                                                              <NA>
#> 131                                                                                                             India
#> 132                                                                                                             India
#> 133                                                       India (Department of Economic Affairs, Government of India)
#> 134                                                                                               Ministry of Finance
#> 135                                                                                                             India
#> 136                                                                                                              <NA>
#> 137                                                                                          Municipality of Salvador
#> 138                                                                                                              IICA
#> 139                                                                                                             India
#> 140                                                                                                             India
#> 141                                                                                                             India
#> 142                                                                                               State Bank of India
#> 143 Fundo Brasileiro de Biodiversidade - FUNBIO, Fundacao Getulio Vargas - FGV, Conservacao Internacional - CI Brazil
#> 144                                                               Ministry of Finance, Department of Economic Affairs
#> 145                                                                                     Federative Republic of Brazil
#> 146                                                                                                             India
#> 147                                                           Banco Regional de Desenvolvimento do Extremo Sul (BRDE)
#> 148                                                                                               Ministry of Finance
#> 149                                                                                                             INDIA
#> 150                                                                                         Municipality of S�o Paulo
#> 151                                                                                       Municipio de Belo Horizonte
#> 152                                                                                                             India
#> 153                                                                                                   State of Parana
#> 154                                                                                                             India
#> 155                                                                                                             India
#> 156                                                                                                 Republic of India
#> 157                                                                                                             India
#> 158                                                                                                 Republic of India
#> 159                                                                                                 Republic of India
#> 160                                                                                                    State of Ceara
#> 161                                                                                                             India
#> 162                                                                                                             India
#> 163                                                                                                             India
#> 164                                                                                                             India
#> 165                                                                                                 Republic of India
#> 166                                                                                                            SABESP
#> 167                                                                                                              <NA>
#> 168                                                                                                 Republic of India
#> 169                                                                                                    State of Ceara
#> 170                                       Brazil - Deutsche Gesellschaft f�r Internationale Zusammenarbeit GmbH (GIZ)
#> 171                                                                      Ministry of Economy (Minist�rio da Economia)
#> 172                                                                                                 Republic of India
#> 173                                                                                                             India
#> 174                                                                                                 Republic of India
#> 175                                                                                               Government of India
#> 176                                                                                                 Republic of India
#> 177                                                                                                             India
#> 178                                                                                               State Bank of India
#> 179                                                                                                             India
#> 180                                                                                                             India
#> 181                                                                                                             India
#> 182                                          Department of Economic Affairs, Ministry of Finance, Government of India
#> 183 Fundo Brasileiro de Biodiversidade - FUNBIO, Conserva��o Internacional - CI Brazil, Funda��o Get�lio Vargas - FGV
#> 184                                                                                                             India
#> 185                                                                    Department of Economic Affairs, Govt. of India
#> 186                                                                                                             India
#> 187                                                                                                             India
#> 188                                                                                                             India
#> 189                                                                                                 Republic of India
#> 190                                                                                                             India
#> 191                                                                                               State Bank of India
#> 192                                                                                                             India
#> 193                                                                                         Municipality of Fortaleza
#> 194                                                               Ministry of Finance, Department of Economic Affairs
#> 195                                                                                  Funda��o Pro-Natureza - FUNATURA
#> 196                                                               Department of Economic Affairs, Government of India
#> 197                                                                                                             India
#> 198                                                                                       State Government of Paraiba
#> 199                                                                                        Government of India, India
#> 200                                                                                                             India
#> 201                                                                                                              <NA>
#> 202                                                                                                             India
#> 203                                                                                                              <NA>
#> 204                                                                                                              <NA>
#> 205                                                                                                              <NA>
#> 206                                                                                                              <NA>
#> 207                                                                                                              <NA>
#> 208                                                                                                              <NA>
#> 209                                                                                                             India
#> 210                                                                                                              <NA>
#> 211                                                                                                              <NA>
#> 212                                                                                                              <NA>
#>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          implementing_agency
#> 1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       <NA>
#> 2                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       <NA>
#> 3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       <NA>
#> 4                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       <NA>
#> 5                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       <NA>
#> 6                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       <NA>
#> 7                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       <NA>
#> 8                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       <NA>
#> 9                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       <NA>
#> 10                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 11                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 12                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 13                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 14                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 15                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 16                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 17                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 18                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 19                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 20                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 21                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 22                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 23                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 24                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 25                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 26                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 27                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 28                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 29                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 30                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 31                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 32                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 33                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 34                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 35                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 36                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 37                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 38                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 39                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 40                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 41                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 42                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 43                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 44                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 45                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 46                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 47                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 48                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 49                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 50                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 51                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 52                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 53                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 54                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 55                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 56                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 57                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 State Secretariat of Administration and Management (SEAD)
#> 58  Uttarakhand Jal Vidyut Nigam Ltd., Kerala State Electricity Board (KSEB), Tamil Nadu Generation and Distribution Corporation Limited (TANGEDCO), Government of Gujarat, Water Resources Department, Government of Chhattisgarh, Water Resources Department, Government of Kerala, Water Resources Department, Government of West Bengal, Irrigation and Waterways Department, Government of Uttar Pradesh, Irrigation and Water Resources Department, Meghalaya Power Generation Corporation Ltd. (MePGCL), Government of Maharasthra, Water Resources Department, Government of Manipur, Water Resources Department, Central Water Commission (CWC), Ministry of Jal Shakti, Government of Rajasthan, Water Resources Department, Government of Odisha, Water Resources Department, Government of Tamil Nadu, Water Resources Department, Government of Madhya Pradesh, Water Resources Department, Government of Karnataka, Water Resources Department
#> 59                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    Complexo Industrial Portu�rio de Pec�m
#> 60                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             State Secretariate of Finance
#> 61                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            Planning Department, Government of Maharashtra
#> 62                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 Government of West Bengal
#> 63                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      Ministry of New and Renewable Energy
#> 64                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  Haryana Mass Rapid Transport Corporation Limited (HMRTC)
#> 65                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         Government of Karnataka, Government of Tamil Nadu
#> 66                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      Ministry of New and Renewable Energy
#> 67                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             Social Welfare & Women Empowerment Department
#> 68                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 Planning and Development Department, Government of Sikkim
#> 69                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         Secretary of Infrastructure of the State of Bahia
#> 70                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                State Secretary of Finance
#> 71                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             Secretaria de Estado da Ci�ncia, Tecnologia, Inova��o, Educa��o Profissional,
#> 72                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 Pernambuco Water and Climate Agency (Ag�ncia Pernambucana de �guas e Clima - APAC), Pernambuco Sanitation Company (Companhia Pernambucana de Saneamento - COMPESA), Secretariat of Water Resources and WSS (Secretaria de Recursos H�dricos e Saneamento)
#> 73                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        CAR - Companhia de Desenvolvimento e Acao Regional
#> 74                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            Government of Tripura, Government of Nagaland, Ministry of Development of North Eastern Region
#> 75                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                Uttarakhand State Disaster Management Authority, Government of Uttarakhand
#> 76                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   Ministry of Citizenship
#> 77                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          Watershed Management Directorate
#> 78                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 79                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        Assam Health Infrastructure Development and Management Society (AHIDMS), Health and Family Welfare
#> 80                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     State of Chhattisgarh
#> 81                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 Tamil Nadu Urban Infrastructure Financial Services Limited, Tamil Nadu Municipal Administration & Water Supply Department
#> 82                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       Secretaria Municipal de Fazenda e Planejamento, Secretaria Municipal de Transportes
#> 83                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       UGP
#> 84                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             State Secretariat of Planning
#> 85                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              Rural Drinking Water and Sanitation Department, Government of Karnataka, Rural Development and Panchayat Department, Government of Karnataka
#> 86                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    SECRETARIAT OF EDUCATION - MATO GROSSO
#> 87                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           Banco do Brasil
#> 88                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  Secretaria Municipal de Fazenda e Planejamento, Secretaria de Transporte
#> 89                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           Secretariat of Finance of Piaui
#> 90                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        Public Works Roads Department, Government of Assam
#> 91                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       State Secretariat of Health (SESAPI), State Secretariat of Social Assistance, Labor and Human Rights (SASC), State Secretariat of Planning (SEPLAN)
#> 92                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     MINISTRY OF EDUCATION
#> 93                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         Consorcio Intermunicipal Multifinalit�rio - AMFRI
#> 94                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       Department of Tribal Welfare, Government of Tripura
#> 95                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      Secretariat of Finance - Mato Grosso
#> 96                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                Ishita Roy
#> 97                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    Department of Agriculture, Government of Uttar Pradesh
#> 98                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 Government of Gujarat through Health and Family Welfare Department (HFWD)
#> 99                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           Department of Health and Family Welfare, Ministry of Health and Family Welfare, Government of India, Ministry of Health and Family Welfare, Government of India
#> 100                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 101                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           Department of Environment, Forests, and Climate Change, State of Uttar Pradesh
#> 102                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     Government of Kerala
#> 103                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 104                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    Ministry of Education
#> 105                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              Education Department, Government of Gujarat
#> 106                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         DWRID, Government of West Bengal
#> 107                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  Dedicated Freight Corridor Corporation of India Limited
#> 108                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            Ministry of Fisheries, Animal Husbandry & Dairying, Department of Animal Husbandry & Dairying
#> 109                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   State Secretariat of Agriculture and Livestock (SEAPA)
#> 110                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            Piau� State Secretariat for Planning (SEPLAN)
#> 111                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      Jameel Poverty Action Lab (J-PAL) South Asia at the Institute for Financial Management and Research
#> 112                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                Secretariat of Finance - State of Alagoas
#> 113                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               DER-ES - Buildings and Roads Department of Esp�rito Santo, CEPDEC - State Coordination for Protection and Civil Defense, SEAMA - State Secretariat for the Environment and Water Resources
#> 114                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     Cyber Corporation of Manipur Limited
#> 115                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         Department for the Welfare of Differently Abled Persons (DfWDAP)
#> 116                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                Karnataka Urban Infrastructure Development & Finance Corporation (KUIDFC)
#> 117                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    Directorate of Energy, HimUrja, HPPCL (Himachal Pradesh Power Corporation Limited), HPSEBL (Himachal Pradesh State Electricity Board Limited), HPPTCL (Himachal Pradesh Power Transmission Corporation Limited), HPSLDC (Himachal Pradesh State Load Despatch Centre)
#> 118                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 Finance Department, Government of Odisha
#> 119                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       Ahmedabad Municipal Corporation, Gujarat Urban Development Mission, Urban Development and Urban Housing Department
#> 120                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            State Secretary for Family Agriculture (SEAF)
#> 121                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    Ministry of Health and Family Welfare
#> 122                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              Department of Finance, Government of Punjab
#> 123                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      State of Tamil Nadu
#> 124                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           West Bengal Department of Industries, Commerce and Enterprises
#> 125                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      Department of Fisheries, Ministry of Fisheries, Animal Husbandry and Dairying, National Fisheries Development Board
#> 126                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     Government of Kerala
#> 127                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        Urban Development Department, Government of Himachal Pradesh, Shimla Jal Prabandhan Nigam Limited
#> 128                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           Flood and River Erosion Management Agency of Assam, Government of Assam, Water Resources Department, Assam State Disaster Management Authority
#> 129                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      West Bengal Women & Child Development and Social Welfare Department, West Bengal Finance Department
#> 130                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 131                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              Capacity Building Commission, Department of Personnel and Training, Ministry of Personnel, Public Grievances and Pensions, Karmayogi Bharat
#> 132                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  State of Andhra Pradesh
#> 133                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              Health and Family Welfare Department, Government of Mizoram
#> 134                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              Education Department, Government of Gujarat
#> 135                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         Department of Health and Family Welfare, Government of Meghalaya
#> 136                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 137                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               Casa Civil
#> 138                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            Minist�rio do Meio Ambiente (MMA), Minist�rio da Agricultura, Pecu�ria e Abastecimento (MAPA)
#> 139                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          Ministry of Micro, Small and Medium Enterprises
#> 140                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                Nagaland (Department of School Education)
#> 141                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   Karnataka Department of of Agriculture, Department of Land Resources, Odisha Department of Agriculture
#> 142                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      State Bank of India
#> 143                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   Ministry of Environment - MMA, Funda��o Getulio Vargas
#> 144 Uttarakhand Jal Vidyut Nigam Ltd., Kerala State Electricity Board (KSEB), Tamil Nadu Generation and Distribution Corporation Limited (TANGEDCO), Government of Gujarat, Water Resources Department, Government of Chhattisgarh, Water Resources Department, Government of Kerala, Water Resources Department, Government of West Bengal, Irrigation and Waterways Department, Government of Uttar Pradesh, Irrigation and Water Resources Department, Meghalaya Power Generation Corporation Ltd. (MePGCL), Government of Maharasthra, Water Resources Department, Government of Manipur, Water Resources Department, Central Water Commission (CWC), Ministry of Jal Shakti, Government of Rajasthan, Water Resources Department, Government of Odisha, Water Resources Department, Government of Tamil Nadu, Water Resources Department, Government of Madhya Pradesh, Water Resources Department, Government of Karnataka, Water Resources Department
#> 145                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            Minist�rio de Minas e Energia
#> 146                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      Ludhiana Municipal Corporation, Amritsar Municipal Corporation, Punjab Municipal Infrastructure Development Company
#> 147                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  Banco Regional de Desenvolvimento do Extremo Sul (BRDE)
#> 148                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 Chhattisgarh, Department of Agriculture Development and Farmer Welfare and Biotechnology
#> 149                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               West Bengal State Electricity Distribution Company Limited
#> 150                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             S�o Paulo Municipal Secretariat of Urban Infrastructure and Works, S�o Paulo Municipal Secretariat of Mobility and Transport
#> 151                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              URBEL, SMPU, SMOBI, BHTRANS
#> 152                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 National Mission for Clean Ganga, Ministry of Jal Shakti
#> 153                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          Secretariat of Planning and Structured Projects
#> 154                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   Local Self Government Department, Government of Kerala
#> 155                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         Tamil Nadu Urban and Habitat Development Board, Chennai Metropolitan Development Authority (CMDA), Tamil Nadu Infrastructure Fund Management Corporation Limited
#> 156                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     Department of Agriculture, Government of Maharashtra
#> 157                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 Meghalaya Infrastructure Development Finance Corporation
#> 158                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                Department of Health, Medical and Family Welfare, Govt. of Andhra Pradesh
#> 159                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    Ministry of Health and Family Welfare
#> 160                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      Secretariat of Agrarian Development
#> 161                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  Ministry of Road Transport and Highways
#> 162                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            Finance Department, Government of Uttarakhand
#> 163                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    Ministry of Education
#> 164                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           Finance Department, Government of Chhattisgarh
#> 165                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                Government of West Bengal
#> 166                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   SABESP
#> 167                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              CAGEPA - State Water and Sanitation Company
#> 168                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     Department of Forest, Government of Himachal Pradesh
#> 169                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                Ceara Economic Research and Strategy Institute - IPECE, Ceara Water and Sanitation Utility - CAGECE, Secretariat of Water Resources - SRH
#> 170                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        Ministry of Agriculture and  Livestock(MAPA), National Rural Learning Service, Ministry of Environment / Brazilian Forest Service
#> 171                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           Ministry of Education (Minist�rio da Educa��o)
#> 172                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            Agricultural Promotion and Investment Corporation of Odisha Limited, Odisha Community Tank Development and Management Society,  Department of Water Resources
#> 173                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     Himachal Pradesh Road & Other Infrastructure Development Corporation
#> 174                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       Irrigation and Waterways Department of West Bengal
#> 175                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   Jharkhand Urja Sancharan Nigam Ltd., Jharkhand Bijli Vitran Nigam Ltd.
#> 176                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             Government of Andhra Pradesh
#> 177                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                Solar Energy Corporation of India Limited
#> 178                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      State Bank of India
#> 179                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                Water Resources Department, Public Works Department, GoTN
#> 180                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        Urban Development and Housing Department, Government of Jharkhand
#> 181                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   Department of Drinking Water and Sanitation, Government of Uttarakhand
#> 182                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      The Department of Water Resources, Ganga Rejuvenation and River Development, Ministry of Jal Shakti
#> 183                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                Funda��o Getulio Vargas, Ministry of Environment and Climate Change - MMA
#> 184                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         Transport Dept., Govt. of Assam, Dispur, Guwahati (Assam), India
#> 185                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                Department of Rural Development & Panchayat Raj, Government of Tamil Nadu
#> 186                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         Rajasthan State Highway Authority (RSHA), The State of Rajasthan
#> 187                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     Department of Economic Affairs (MOF)
#> 188                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       Biotechnology Industry Research Assistance Council
#> 189                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 Assam Rural Infrastructure and Agricultural Services (ARIAS) Society, State Health Society, Government of Assam, Department of Health and Family Welfare
#> 190                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    Urban Development and Environment Department, Govt. of Madhya Pradesh
#> 191                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      State Bank of India
#> 192                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              Project Implementing Entity
#> 193                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                Secretaria Municipal de Urbanismo e Meio Ambiente (SEUMA), Secretaria Municipal de Infraestrutura (SEINF)
#> 194                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           Department of Water Resources, RD & GR, Ministry of Jal Shakti
#> 195                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  Ministry of Environment
#> 196                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      Inland Waterways Authority of India
#> 197                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               Department of Medical Health and Family Welfare, Government of Uttarakhand
#> 198                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                Projeto COOPERAR (SEAFDS)
#> 199                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      Small Industries Development Bank of India, EESL Energy Efficiency Services Limited
#> 200                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                Karnataka Urban Infrastructure Development & Finance Corporation (KUIDFC)
#> 201                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 202                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 Water Resources Department (WRD), Rural Works Department (RWD), Bihar Aapada Punarwas Evam Punarnirman Society (BAPEPS), Bihar Rajya Pul Nirman Nigam Limited (BRPNNL), Animal and Fisheries Resources Department (AFRD)
#> 203                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 204                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 205                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 206                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 207                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 208                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 209                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               THDC (Tehri Hydro Development Corporation)
#> 210                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 211                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 212                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#>                                                                              url
#> 1   https://projects.worldbank.org/en/projects-operations/project-detail/P509041
#> 2   https://projects.worldbank.org/en/projects-operations/project-detail/P508840
#> 3   https://projects.worldbank.org/en/projects-operations/project-detail/P508719
#> 4   https://projects.worldbank.org/en/projects-operations/project-detail/P508489
#> 5   https://projects.worldbank.org/en/projects-operations/project-detail/P508453
#> 6   https://projects.worldbank.org/en/projects-operations/project-detail/P508363
#> 7   https://projects.worldbank.org/en/projects-operations/project-detail/P508221
#> 8   https://projects.worldbank.org/en/projects-operations/project-detail/P508202
#> 9   https://projects.worldbank.org/en/projects-operations/project-detail/P508025
#> 10  https://projects.worldbank.org/en/projects-operations/project-detail/P507910
#> 11  https://projects.worldbank.org/en/projects-operations/project-detail/P507629
#> 12  https://projects.worldbank.org/en/projects-operations/project-detail/P507628
#> 13  https://projects.worldbank.org/en/projects-operations/project-detail/P507508
#> 14  https://projects.worldbank.org/en/projects-operations/project-detail/P507340
#> 15  https://projects.worldbank.org/en/projects-operations/project-detail/P507322
#> 16  https://projects.worldbank.org/en/projects-operations/project-detail/P507236
#> 17  https://projects.worldbank.org/en/projects-operations/project-detail/P507066
#> 18  https://projects.worldbank.org/en/projects-operations/project-detail/P507029
#> 19  https://projects.worldbank.org/en/projects-operations/project-detail/P506976
#> 20  https://projects.worldbank.org/en/projects-operations/project-detail/P506955
#> 21  https://projects.worldbank.org/en/projects-operations/project-detail/P506861
#> 22  https://projects.worldbank.org/en/projects-operations/project-detail/P506340
#> 23  https://projects.worldbank.org/en/projects-operations/project-detail/P506329
#> 24  https://projects.worldbank.org/en/projects-operations/project-detail/P506321
#> 25  https://projects.worldbank.org/en/projects-operations/project-detail/P506320
#> 26  https://projects.worldbank.org/en/projects-operations/project-detail/P506272
#> 27  https://projects.worldbank.org/en/projects-operations/project-detail/P506142
#> 28  https://projects.worldbank.org/en/projects-operations/project-detail/P505914
#> 29  https://projects.worldbank.org/en/projects-operations/project-detail/P505866
#> 30  https://projects.worldbank.org/en/projects-operations/project-detail/P505590
#> 31  https://projects.worldbank.org/en/projects-operations/project-detail/P505563
#> 32  https://projects.worldbank.org/en/projects-operations/project-detail/P505235
#> 33  https://projects.worldbank.org/en/projects-operations/project-detail/P505177
#> 34  https://projects.worldbank.org/en/projects-operations/project-detail/P504899
#> 35  https://projects.worldbank.org/en/projects-operations/project-detail/P504897
#> 36  https://projects.worldbank.org/en/projects-operations/project-detail/P504543
#> 37  https://projects.worldbank.org/en/projects-operations/project-detail/P504276
#> 38  https://projects.worldbank.org/en/projects-operations/project-detail/P504253
#> 39  https://projects.worldbank.org/en/projects-operations/project-detail/P504126
#> 40  https://projects.worldbank.org/en/projects-operations/project-detail/P503872
#> 41  https://projects.worldbank.org/en/projects-operations/project-detail/P502499
#> 42  https://projects.worldbank.org/en/projects-operations/project-detail/P502493
#> 43  https://projects.worldbank.org/en/projects-operations/project-detail/P502491
#> 44  https://projects.worldbank.org/en/projects-operations/project-detail/P501071
#> 45  https://projects.worldbank.org/en/projects-operations/project-detail/P500614
#> 46  https://projects.worldbank.org/en/projects-operations/project-detail/P500570
#> 47  https://projects.worldbank.org/en/projects-operations/project-detail/P500564
#> 48  https://projects.worldbank.org/en/projects-operations/project-detail/P500524
#> 49  https://projects.worldbank.org/en/projects-operations/project-detail/P500501
#> 50  https://projects.worldbank.org/en/projects-operations/project-detail/P500469
#> 51  https://projects.worldbank.org/en/projects-operations/project-detail/P500431
#> 52  https://projects.worldbank.org/en/projects-operations/project-detail/P500380
#> 53  https://projects.worldbank.org/en/projects-operations/project-detail/P500252
#> 54  https://projects.worldbank.org/en/projects-operations/project-detail/P500168
#> 55  https://projects.worldbank.org/en/projects-operations/project-detail/P500151
#> 56  https://projects.worldbank.org/en/projects-operations/project-detail/P181767
#> 57  https://projects.worldbank.org/en/projects-operations/project-detail/P181608
#> 58  https://projects.worldbank.org/en/projects-operations/project-detail/P181524
#> 59  https://projects.worldbank.org/en/projects-operations/project-detail/P181511
#> 60  https://projects.worldbank.org/en/projects-operations/project-detail/P181501
#> 61  https://projects.worldbank.org/en/projects-operations/project-detail/P181463
#> 62  https://projects.worldbank.org/en/projects-operations/project-detail/P181244
#> 63  https://projects.worldbank.org/en/projects-operations/project-detail/P181195
#> 64  https://projects.worldbank.org/en/projects-operations/project-detail/P181020
#> 65  https://projects.worldbank.org/en/projects-operations/project-detail/P180932
#> 66  https://projects.worldbank.org/en/projects-operations/project-detail/P180716
#> 67  https://projects.worldbank.org/en/projects-operations/project-detail/P180699
#> 68  https://projects.worldbank.org/en/projects-operations/project-detail/P180634
#> 69  https://projects.worldbank.org/en/projects-operations/project-detail/P180555
#> 70  https://projects.worldbank.org/en/projects-operations/project-detail/P180497
#> 71  https://projects.worldbank.org/en/projects-operations/project-detail/P180462
#> 72  https://projects.worldbank.org/en/projects-operations/project-detail/P180430
#> 73  https://projects.worldbank.org/en/projects-operations/project-detail/P180429
#> 74  https://projects.worldbank.org/en/projects-operations/project-detail/P179935
#> 75  https://projects.worldbank.org/en/projects-operations/project-detail/P179749
#> 76  https://projects.worldbank.org/en/projects-operations/project-detail/P179365
#> 77  https://projects.worldbank.org/en/projects-operations/project-detail/P179357
#> 78  https://projects.worldbank.org/en/projects-operations/project-detail/P179349
#> 79  https://projects.worldbank.org/en/projects-operations/project-detail/P179337
#> 80  https://projects.worldbank.org/en/projects-operations/project-detail/P179249
#> 81  https://projects.worldbank.org/en/projects-operations/project-detail/P179189
#> 82  https://projects.worldbank.org/en/projects-operations/project-detail/P179182
#> 83  https://projects.worldbank.org/en/projects-operations/project-detail/P179088
#> 84  https://projects.worldbank.org/en/projects-operations/project-detail/P179046
#> 85  https://projects.worldbank.org/en/projects-operations/project-detail/P179039
#> 86  https://projects.worldbank.org/en/projects-operations/project-detail/P178993
#> 87  https://projects.worldbank.org/en/projects-operations/project-detail/P178888
#> 88  https://projects.worldbank.org/en/projects-operations/project-detail/P178729
#> 89  https://projects.worldbank.org/en/projects-operations/project-detail/P178663
#> 90  https://projects.worldbank.org/en/projects-operations/project-detail/P178581
#> 91  https://projects.worldbank.org/en/projects-operations/project-detail/P178567
#> 92  https://projects.worldbank.org/en/projects-operations/project-detail/P178563
#> 93  https://projects.worldbank.org/en/projects-operations/project-detail/P178557
#> 94  https://projects.worldbank.org/en/projects-operations/project-detail/P178418
#> 95  https://projects.worldbank.org/en/projects-operations/project-detail/P178339
#> 96  https://projects.worldbank.org/en/projects-operations/project-detail/P178254
#> 97  https://projects.worldbank.org/en/projects-operations/project-detail/P178253
#> 98  https://projects.worldbank.org/en/projects-operations/project-detail/P178252
#> 99  https://projects.worldbank.org/en/projects-operations/project-detail/P178146
#> 100 https://projects.worldbank.org/en/projects-operations/project-detail/P178072
#> 101 https://projects.worldbank.org/en/projects-operations/project-detail/P178053
#> 102 https://projects.worldbank.org/en/projects-operations/project-detail/P177980
#> 103 https://projects.worldbank.org/en/projects-operations/project-detail/P177965
#> 104 https://projects.worldbank.org/en/projects-operations/project-detail/P177917
#> 105 https://projects.worldbank.org/en/projects-operations/project-detail/P177915
#> 106 https://projects.worldbank.org/en/projects-operations/project-detail/P177876
#> 107 https://projects.worldbank.org/en/projects-operations/project-detail/P177856
#> 108 https://projects.worldbank.org/en/projects-operations/project-detail/P177671
#> 109 https://projects.worldbank.org/en/projects-operations/project-detail/P177632
#> 110 https://projects.worldbank.org/en/projects-operations/project-detail/P177474
#> 111 https://projects.worldbank.org/en/projects-operations/project-detail/P177159
#> 112 https://projects.worldbank.org/en/projects-operations/project-detail/P177070
#> 113 https://projects.worldbank.org/en/projects-operations/project-detail/P176982
#> 114 https://projects.worldbank.org/en/projects-operations/project-detail/P176733
#> 115 https://projects.worldbank.org/en/projects-operations/project-detail/P176404
#> 116 https://projects.worldbank.org/en/projects-operations/project-detail/P176107
#> 117 https://projects.worldbank.org/en/projects-operations/project-detail/P176032
#> 118 https://projects.worldbank.org/en/projects-operations/project-detail/P175811
#> 119 https://projects.worldbank.org/en/projects-operations/project-detail/P175728
#> 120 https://projects.worldbank.org/en/projects-operations/project-detail/P175723
#> 121 https://projects.worldbank.org/en/projects-operations/project-detail/P175676
#> 122 https://projects.worldbank.org/en/projects-operations/project-detail/P175261
#> 123 https://projects.worldbank.org/en/projects-operations/project-detail/P175221
#> 124 https://projects.worldbank.org/en/projects-operations/project-detail/P174825
#> 125 https://projects.worldbank.org/en/projects-operations/project-detail/P174798
#> 126 https://projects.worldbank.org/en/projects-operations/project-detail/P174778
#> 127 https://projects.worldbank.org/en/projects-operations/project-detail/P174732
#> 128 https://projects.worldbank.org/en/projects-operations/project-detail/P174593
#> 129 https://projects.worldbank.org/en/projects-operations/project-detail/P174564
#> 130 https://projects.worldbank.org/en/projects-operations/project-detail/P174312
#> 131 https://projects.worldbank.org/en/projects-operations/project-detail/P174067
#> 132 https://projects.worldbank.org/en/projects-operations/project-detail/P173978
#> 133 https://projects.worldbank.org/en/projects-operations/project-detail/P173958
#> 134 https://projects.worldbank.org/en/projects-operations/project-detail/P173704
#> 135 https://projects.worldbank.org/en/projects-operations/project-detail/P173589
#> 136 https://projects.worldbank.org/en/projects-operations/project-detail/P173090
#> 137 https://projects.worldbank.org/en/projects-operations/project-detail/P172605
#> 138 https://projects.worldbank.org/en/projects-operations/project-detail/P172497
#> 139 https://projects.worldbank.org/en/projects-operations/project-detail/P172226
#> 140 https://projects.worldbank.org/en/projects-operations/project-detail/P172213
#> 141 https://projects.worldbank.org/en/projects-operations/project-detail/P172187
#> 142 https://projects.worldbank.org/en/projects-operations/project-detail/P171750
#> 143 https://projects.worldbank.org/en/projects-operations/project-detail/P171257
#> 144 https://projects.worldbank.org/en/projects-operations/project-detail/P170873
#> 145 https://projects.worldbank.org/en/projects-operations/project-detail/P170850
#> 146 https://projects.worldbank.org/en/projects-operations/project-detail/P170811
#> 147 https://projects.worldbank.org/en/projects-operations/project-detail/P170682
#> 148 https://projects.worldbank.org/en/projects-operations/project-detail/P170645
#> 149 https://projects.worldbank.org/en/projects-operations/project-detail/P170590
#> 150 https://projects.worldbank.org/en/projects-operations/project-detail/P169140
#> 151 https://projects.worldbank.org/en/projects-operations/project-detail/P169134
#> 152 https://projects.worldbank.org/en/projects-operations/project-detail/P169111
#> 153 https://projects.worldbank.org/en/projects-operations/project-detail/P168634
#> 154 https://projects.worldbank.org/en/projects-operations/project-detail/P168633
#> 155 https://projects.worldbank.org/en/projects-operations/project-detail/P168590
#> 156 https://projects.worldbank.org/en/projects-operations/project-detail/P168310
#> 157 https://projects.worldbank.org/en/projects-operations/project-detail/P168097
#> 158 https://projects.worldbank.org/en/projects-operations/project-detail/P167581
#> 159 https://projects.worldbank.org/en/projects-operations/project-detail/P167523
#> 160 https://projects.worldbank.org/en/projects-operations/project-detail/P167455
#> 161 https://projects.worldbank.org/en/projects-operations/project-detail/P167350
#> 162 https://projects.worldbank.org/en/projects-operations/project-detail/P166923
#> 163 https://projects.worldbank.org/en/projects-operations/project-detail/P166868
#> 164 https://projects.worldbank.org/en/projects-operations/project-detail/P166578
#> 165 https://projects.worldbank.org/en/projects-operations/project-detail/P166020
#> 166 https://projects.worldbank.org/en/projects-operations/project-detail/P165695
#> 167 https://projects.worldbank.org/en/projects-operations/project-detail/P165683
#> 168 https://projects.worldbank.org/en/projects-operations/project-detail/P165129
#> 169 https://projects.worldbank.org/en/projects-operations/project-detail/P165055
#> 170 https://projects.worldbank.org/en/projects-operations/project-detail/P164602
#> 171 https://projects.worldbank.org/en/projects-operations/project-detail/P163868
#> 172 https://projects.worldbank.org/en/projects-operations/project-detail/P163533
#> 173 https://projects.worldbank.org/en/projects-operations/project-detail/P163328
#> 174 https://projects.worldbank.org/en/projects-operations/project-detail/P162679
#> 175 https://projects.worldbank.org/en/projects-operations/project-detail/P162086
#> 176 https://projects.worldbank.org/en/projects-operations/project-detail/P160463
#> 177 https://projects.worldbank.org/en/projects-operations/project-detail/P160379
#> 178 https://projects.worldbank.org/en/projects-operations/project-detail/P160018
#> 179 https://projects.worldbank.org/en/projects-operations/project-detail/P158522
#> 180 https://projects.worldbank.org/en/projects-operations/project-detail/P158502
#> 181 https://projects.worldbank.org/en/projects-operations/project-detail/P158146
#> 182 https://projects.worldbank.org/en/projects-operations/project-detail/P158119
#> 183 https://projects.worldbank.org/en/projects-operations/project-detail/P158000
#> 184 https://projects.worldbank.org/en/projects-operations/project-detail/P157929
#> 185 https://projects.worldbank.org/en/projects-operations/project-detail/P157702
#> 186 https://projects.worldbank.org/en/projects-operations/project-detail/P157141
#> 187 https://projects.worldbank.org/en/projects-operations/project-detail/P156869
#> 188 https://projects.worldbank.org/en/projects-operations/project-detail/P156241
#> 189 https://projects.worldbank.org/en/projects-operations/project-detail/P155617
#> 190 https://projects.worldbank.org/en/projects-operations/project-detail/P155303
#> 191 https://projects.worldbank.org/en/projects-operations/project-detail/P155007
#> 192 https://projects.worldbank.org/en/projects-operations/project-detail/P154990
#> 193 https://projects.worldbank.org/en/projects-operations/project-detail/P153012
#> 194 https://projects.worldbank.org/en/projects-operations/project-detail/P152698
#> 195 https://projects.worldbank.org/en/projects-operations/project-detail/P152285
#> 196 https://projects.worldbank.org/en/projects-operations/project-detail/P148775
#> 197 https://projects.worldbank.org/en/projects-operations/project-detail/P148531
#> 198 https://projects.worldbank.org/en/projects-operations/project-detail/P147158
#> 199 https://projects.worldbank.org/en/projects-operations/project-detail/P132620
#> 200 https://projects.worldbank.org/en/projects-operations/project-detail/P130544
#> 201 https://projects.worldbank.org/en/projects-operations/project-detail/P128921
#> 202 https://projects.worldbank.org/en/projects-operations/project-detail/P127725
#> 203 https://projects.worldbank.org/en/projects-operations/project-detail/P122387
#> 204 https://projects.worldbank.org/en/projects-operations/project-detail/P114896
#> 205 https://projects.worldbank.org/en/projects-operations/project-detail/P114890
#> 206 https://projects.worldbank.org/en/projects-operations/project-detail/P110539
#> 207 https://projects.worldbank.org/en/projects-operations/project-detail/P108190
#> 208 https://projects.worldbank.org/en/projects-operations/project-detail/P105370
#> 209 https://projects.worldbank.org/en/projects-operations/project-detail/P096124
#> 210 https://projects.worldbank.org/en/projects-operations/project-detail/P073882
#> 211 https://projects.worldbank.org/en/projects-operations/project-detail/P039027
#> 212 https://projects.worldbank.org/en/projects-operations/project-detail/P009585

# look up specific projects
wb_project(id = c("P163868", "P180429"))
#>        id                                          project_name status
#> 1 P180429           Bahia Sustainable Rural Development Project Active
#> 2 P163868 Support to Upper Secondary Reform in Brazil Operation Active
#>   approval_date closing_date country_code country                      region
#> 1    2024-11-07   2030-10-30           BR  Brazil Latin America and Caribbean
#> 2    2017-12-14   2024-12-31           BR  Brazil Latin America and Caribbean
#>   total_commitment ibrd_commitment ida_commitment            lending_instrument
#> 1              100             100              0  Investment Project Financing
#> 2              250             250              0 Program-for-Results Financing
#>                                       borrower
#> 1             Government of the State of Bahia
#> 2 Ministry of Economy (Minist�rio da Economia)
#>                                  implementing_agency
#> 1 CAR - Companhia de Desenvolvimento e Acao Regional
#> 2     Ministry of Education (Minist�rio da Educa��o)
#>                                                                            url
#> 1 https://projects.worldbank.org/en/projects-operations/project-detail/P180429
#> 2 https://projects.worldbank.org/en/projects-operations/project-detail/P163868

# the first 100 projects mentioning climate
wb_project(search = "climate", limit = 100)
#>          id
#> 1   P508202
#> 2   P508114
#> 3   P507698
#> 4   P507576
#> 5   P507190
#> 6   P507116
#> 7   P506960
#> 8   P506846
#> 9   P506818
#> 10  P506425
#> 11  P506356
#> 12  P506144
#> 13  P506083
#> 14  P506072
#> 15  P505581
#> 16  P505244
#> 17  P505241
#> 18  P505235
#> 19  P505188
#> 20  P505118
#> 21  P505075
#> 22  P504910
#> 23  P504773
#> 24  P504629
#> 25  P504400
#> 26  P504373
#> 27  P504278
#> 28  P504023
#> 29  P503960
#> 30  P503945
#> 31  P503941
#> 32  P503776
#> 33  P503393
#> 34  P502536
#> 35  P502157
#> 36  P502125
#> 37  P502012
#> 38  P501988
#> 39  P501037
#> 40  P501014
#> 41  P500912
#> 42  P500764
#> 43  P500689
#> 44  P500609
#> 45  P500565
#> 46  P500557
#> 47  P500536
#> 48  P500488
#> 49  P500402
#> 50  P181752
#> 51  P181746
#> 52  P181690
#> 53  P181679
#> 54  P181678
#> 55  P181659
#> 56  P181658
#> 57  P181651
#> 58  P181648
#> 59  P181646
#> 60  P181645
#> 61  P181632
#> 62  P181623
#> 63  P181612
#> 64  P181608
#> 65  P181603
#> 66  P181595
#> 67  P181591
#> 68  P181587
#> 69  P181585
#> 70  P181577
#> 71  P181573
#> 72  P181565
#> 73  P181564
#> 74  P181563
#> 75  P181561
#> 76  P181555
#> 77  P181550
#> 78  P181549
#> 79  P181546
#> 80  P181533
#> 81  P181523
#> 82  P181518
#> 83  P181517
#> 84  P181512
#> 85  P181501
#> 86  P181490
#> 87  P181480
#> 88  P181479
#> 89  P181469
#> 90  P181468
#> 91  P181466
#> 92  P181458
#> 93  P181457
#> 94  P181455
#> 95  P181436
#> 96  P181434
#> 97  P181432
#> 98  P181428
#> 99  P181424
#> 100 P181423
#>                                                                                                                           project_name
#> 1                                             Amazon and Cerrado Bioeconomy, Forest Restoration, and Climate-Smart Agriculture Project
#> 2                                                                            Dominica: Strengthening Fiscal and Climate Resilience DPC
#> 3                                                                  Climate Resilient Fisheries and Agrifood Sector Development Project
#> 4                                                                 Moldova Supporting Economic Opportunities and Climate Resilience DPO
#> 5                                                                             Barbados – Beryl Emergency Response and Recovery Project
#> 6                                                           First Zambia Climate and Economic Resilience Programmatic DPF with Cat-DDO
#> 7                                                       Seychelles First Sustainable and Inclusive Growth Development Policy Operation
#> 8                                                                 Support to the Sustainability and Equity of Public Transport Project
#> 9                                                                    Ethiopia: Climate Resilient Irrigation for Sustainable Production
#> 10                                                                                          Kiribati Kiritimati Infrastructure Project
#> 11                                                          Tuvalu Second Climate and Disaster Resilience Development Policy Financing
#> 12                                                                                                       Sindh Flood Emergency Project
#> 13                                                                Transforming Healthcare through Reform and Investments in Efficiency
#> 14                                                                       Guinea Enhancing Health System Transformation (GUEST) Project
#> 15                                                                                   Nile Civil Society for Climate Resilience Project
#> 16                                                                              Boosting Green Finance, Investment and Trade in Rwanda
#> 17                                                    Integrated Rural Development and Climate Resilience Program Series of Projects 1
#> 18                                    BR State of Rio Grande do Sul Sustainable Recovery and Climate Resilient Development Policy Loan
#> 19                    Zambia Health Emergency Preparedness, Response and Resilience Project Using the Multiphase Programmatic Approach
#> 20                                                                                                        Jordan Human Capital Program
#> 21                                               Regenerative Farming for Agro-Pastoral Livelihoods and Climate Resilience in Ethiopia
#> 22                                                     Generating Resilience, Opportunities, and Welfare for a Thriving Egypt (GROWTH)
#> 23                                                                   Supporting Reconstruction through Smart Fiscal Governance (SURGE)
#> 24                                                                                 Sudan Health Assistance and Response to Emergencies
#> 25                                                                                               Ecuador Guayas: Resilient Rural Roads
#> 26                                     RMI Enhancing Fiscal Management and Building Disaster and Climate Resilience DPO with a Cat DDO
#> 27                                                             Strengthening Moldova's Disaster Risk Management and Resilience Project
#> 28                                                                                   Rwanda-Emergency Connectivity Restoration Project
#> 29                                   Sierra Leone First Macro Stability and Resilience DPO with a Catastrophe Deferred Drawdown Option
#> 30                                            Ethiopia Second Climate Action through Landscape Management Program for Results (Hybrid)
#> 31                                                                                 Zambia Refugee and Host Communities Project - ZRHCP
#> 32                                    Advancing Resilience and Inclusive Health Systems for Everyone (ARISE - KENEYA YIRIWALI) in Mali
#> 33                                                                                    Guyana Coastal Adaptation and Resilience Project
#> 34                                 Promoting Community Led Nature-based Solutions to Climate Change Adaptation in the Usangu Catchment
#> 35                                                                  First DRC Climate Smart and Inclusive Development Policy Financing
#> 36                                                                           Lesotho Integrated Transport, Trade and Logistics Project
#> 37                                                        The Gambia Second Boosting Resilience and Unlocking Productive Potential DPF
#> 38                                                                      First Somalia Economic Resilience Development Policy Financing
#> 39                                                          Second Inclusive and Resilient Market Economy Development Policy Operation
#> 40                                                          Mauritius First Growth and Climate Resilience Development Policy Financing
#> 41                                                                              First Kenya Fiscal Sustainability and Resilient Growth
#> 42                                                                        Indonesia Supporting Health Transformation Project (I-SeHat)
#> 43                                                                         Indonesia Universal Health Coverage Development Policy Loan
#> 44                           Fiji Growth and Resilience First Development Policy Financing with a Catastrophe Deferred Drawdown Option
#> 45                  Transport Resilience and Connectivity Enhancement Project (Jezkazgan-Karagandy Section of TCITR (Middle Corridor))
#> 46                                                                                                         Sustainable Development DPL
#> 47                     Bhutan Climate and Disaster Resilience Development Policy Financing with a Catastrophe Deferred Drawdown Option
#> 48                                                                                       Climate Resilient Roads for the North Project
#> 49                                                                             Morocco Sustainable Oasis Ecosystems Management Project
#> 50                                                                                                        Cote d'Ivoire DPO3 Guarantee
#> 51                                                                  Benin Boosting Inclusive Growth and Resilience DPF2 FY25 Guarantee
#> 52                                                                   Additional Financing for Tanzania Food Systems Resilience Program
#> 53                                                            Morocco Public Sector Performance (ENNAJAA) Program Additional Financing
#> 54                                                                         Additional Financing - Resilient Municipal Services Project
#> 55                                                              Third AF to The Gambia Essential Health Services Strengthening Project
#> 56                                     Additional Financing for the Kiribati Outer Islands Transport Infrastructure Investment Project
#> 57                                                          SCALING-UP SHOCK RESPONSIVE SOCIAL PROTECTION PROJECT ADDITIONAL FINANCING
#> 58                                                                       West Africa Coastal Areas Resilience Investment Project AF CI
#> 59                                     Additional Financing for the Pacific Resilience Project II under the Pacific Resilience Program
#> 60                                                          Additional Financing III Dominica Disaster Vulnerability Reduction Project
#> 61                                        Additional Financing to Togo for the Gulf of Guinea Northern Regions Social Cohesion Project
#> 62                                                           Building Beirut Businesses Back & Better (B5) Fund - Additional Financing
#> 63                                                                 AF Economic Management and Statistics Development for Policy Making
#> 64                                                                          Progestão Program - MPA Phase 1 State of Rio Grande do Sul
#> 65                            Rwanda Disaster Risk Management Development Policy Financing with a Catastrophe Deferred Drawdown Option
#> 66                                                     Additional Financing for Maritime Investment in Climate Resilient Operations II
#> 67                                                        Ethiopia First Sustainable and Inclusive Growth Development Policy Operation
#> 68                                                                                           Transforming Agri-food Systems in Morocco
#> 69                                                            Second Solomon Islands Roads and Aviation Project - Additional Financing
#> 70                                                                 Vanuatu Climate Resilient Transport Project Additional Financing II
#> 71                       West Bank and Gaza Emergency Social Protection and Jobs COVID-19 Response Project Second Additional Financing
#> 72                                                     Second Additional Financing to Tunisia Emergency Food Security Response Project
#> 73                                                                      Sri Lanka: Primary Healthcare System Enhancing Project (PHSEP)
#> 74  Technical Assistance for Repurposing of Agricultural Public Support Towards a Sustainable Food System Transformation in Bangladesh
#> 75                                                  Additional Financing- CAR Health Service Delivery and System Strengthening Project
#> 76                                                                                  Accelerating Sustainable Energy Transition Program
#> 77                                                            Urban Productive Safety Net and Jobs Project Second Additional Financing
#> 78                                                  Productive Safety Net for Socioeconomic Opportunities Project Additional Financing
#> 79                                                                                         BURKINA FASO WATER SUPPLY AND SANITATION AF
#> 80                                                 Additional Financing for Regional Sahel Pastoralism Support Project II Burkina Faso
#> 81                                                                     Social Safety Net System Project II second Additional Financing
#> 82                                                                                        Scaling-Up Energy Efficiency in ECA (E3) MPA
#> 83                                                                  Romania Fiscal Management and Green Growth Development Policy Loan
#> 84                                                                Somalia Urban Resilience Project Phase II Third Additional Financing
#> 85                                     BR Enhancing Prosperity and Sustainability in the State of Sergipe Development Policy Financing
#> 86                                                                               Sudan Somoud - Enhancing Community Resilience Project
#> 87                                                                Additional Financing for Afghanistan Emergency Food Security Project
#> 88                                                                                        Moldova Supporting Growth and Resilience DPO
#> 89                                            Somalia Shock Responsive Safety Net for Human Capital Project Third Additional Financing
#> 90                                  Emergency Social Protection Enhancement and COVID-19 Response Project - Third Additional Financing
#> 91                                                                                          Chad Accessibility  and Resilience Project
#> 92                                                                                     Second Rural Infrastructure Development Project
#> 93                                                                   Benin Second Boosting Inclusive Growth and Resilience DPF and PBG
#> 94                                                                                                   Excellence in Learning in Liberia
#> 95                                                                                                        Turkiye Green Export Project
#> 96                                                                               Uzbekistan Solar and Renewable Energy Storage Project
#> 97                                                                                        Saint Lucia Disaster Risk Management Cat DDO
#> 98                                                              Agriculture Sector Recovery in Türkiye's Earthquake-affected Provinces
#> 99                                                                      Dominican Republic Energy Efficiency and Rooftop Solar Project
#> 100                                                                    Second Additional Financing for Dasu Hydropower Stage I Project
#>       status approval_date closing_date country_code
#> 1   Pipeline          <NA>         <NA>           BR
#> 2   Pipeline          <NA>         <NA>           DM
#> 3   Pipeline          <NA>         <NA>           ME
#> 4   Pipeline          <NA>         <NA>           MD
#> 5     Active    2024-11-21   2030-12-31           BB
#> 6     Active    2024-12-18   2027-12-31           ZM
#> 7     Active    2024-11-27   2025-12-31           SC
#> 8     Active    2024-11-19   2027-12-30           AR
#> 9   Pipeline          <NA>         <NA>           ET
#> 10    Active    2024-12-13   2031-03-31           KI
#> 11  Pipeline          <NA>         <NA>           TV
#> 12  Pipeline          <NA>         <NA>         <NA>
#> 13  Pipeline          <NA>         <NA>           UA
#> 14    Active    2024-09-23   2029-12-31           GN
#> 15  Pipeline          <NA>         <NA>           3E
#> 16    Active    2024-12-20   2025-12-20           RW
#> 17  Pipeline          <NA>         <NA>           LK
#> 18  Pipeline          <NA>         <NA>           BR
#> 19    Active    2024-06-13   2029-06-30           ZM
#> 20    Active    2024-06-27   2025-12-31           JO
#> 21  Pipeline          <NA>         <NA>           ET
#> 22    Active    2024-06-21   2025-12-01           EG
#> 23    Active    2024-11-07   2027-03-31           UA
#> 24    Active    2024-12-13   2027-01-31           SD
#> 25    Active    2024-09-13   2029-12-31           EC
#> 26    Active    2024-07-19   2027-09-30           MH
#> 27    Active    2024-09-05   2029-09-30           MD
#> 28    Active    2024-04-25   2028-09-29           RW
#> 29    Active    2024-12-13   2027-12-31           SL
#> 30  Pipeline          <NA>         <NA>           ET
#> 31    Active    2024-09-26   2028-10-31           ZM
#> 32    Active    2024-06-28   2029-06-30           ML
#> 33    Active    2024-06-05   2026-12-31           GY
#> 34  Pipeline          <NA>         <NA>           TZ
#> 35  Pipeline          <NA>         <NA>           ZR
#> 36    Active    2024-06-07   2029-12-31           LS
#> 37    Active    2024-12-05   2025-12-31           GM
#> 38    Active    2024-07-30   2025-12-31           SO
#> 39    Active    2024-10-03   2026-12-31           UZ
#> 40  Pipeline          <NA>         <NA>           MU
#> 41    Active    2024-05-30   2025-06-30           KE
#> 42    Active    2024-11-27   2027-01-31           ID
#> 43    Closed    2023-12-06   2024-12-24           ID
#> 44    Active    2024-06-21   2027-07-15           FJ
#> 45    Active    2024-11-15   2032-06-30           KZ
#> 46    Active    2024-06-07   2025-12-31           DO
#> 47    Active    2024-12-11   2027-12-31           BT
#> 48    Active    2024-04-25   2030-06-30           MZ
#> 49    Active    2024-05-20   2026-06-30           MA
#> 50    Active    2024-12-05         <NA>           CI
#> 51    Active    2024-10-31   2039-12-13           BJ
#> 52    Active          <NA>         <NA>           3E
#> 53    Active    2024-06-20         <NA>           MA
#> 54    Active          <NA>         <NA>           GZ
#> 55    Active    2024-06-28         <NA>           GM
#> 56    Active    2024-04-08         <NA>           KI
#> 57    Active          <NA>         <NA>           ZM
#> 58    Active    2024-05-17         <NA>           3W
#> 59    Active    2024-05-06         <NA>           MH
#> 60    Active    2024-12-06         <NA>           DM
#> 61    Active    2024-05-23         <NA>           3W
#> 62    Active          <NA>         <NA>           LB
#> 63    Active    2024-03-15         <NA>           DJ
#> 64  Pipeline          <NA>         <NA>           BR
#> 65  Pipeline          <NA>         <NA>           RW
#> 66    Active    2024-05-15         <NA>           TV
#> 67    Active    2024-07-30   2027-12-31           ET
#> 68    Active    2024-12-19   2029-12-31           MA
#> 69  Pipeline          <NA>         <NA>           SB
#> 70    Active    2024-06-12         <NA>           VU
#> 71    Active          <NA>         <NA>           GZ
#> 72    Active    2024-03-14         <NA>           TN
#> 73    Active    2024-06-21   2028-12-31           LK
#> 74    Active          <NA>   2027-09-30           BD
#> 75    Active    2024-04-10         <NA>           CF
#> 76    Active    2024-09-24   2029-06-30           4E
#> 77    Active    2024-03-22         <NA>           ET
#> 78    Active    2024-09-03         <NA>           SS
#> 79  Pipeline          <NA>         <NA>           BF
#> 80    Active    2024-05-31         <NA>           3W
#> 81    Active    2024-04-25         <NA>           MR
#> 82   Dropped          <NA>         <NA>           7E
#> 83    Active    2024-07-25   2026-12-31           RO
#> 84    Active    2024-05-02         <NA>           SO
#> 85    Active    2024-08-27   2026-12-31           BR
#> 86    Active          <NA>   2026-09-30           SD
#> 87    Active          <NA>         <NA>           AF
#> 88    Active    2024-06-14   2026-06-30           MD
#> 89    Active    2023-12-15         <NA>           SO
#> 90    Active    2024-06-13         <NA>           RY
#> 91  Pipeline          <NA>         <NA>           TD
#> 92  Pipeline          <NA>         <NA>           UZ
#> 93    Active    2024-10-31   2025-12-31           BJ
#> 94  Pipeline          <NA>         <NA>           LR
#> 95    Active    2024-02-22   2029-06-30           TR
#> 96    Active    2024-01-03   2025-12-31           UZ
#> 97  Pipeline          <NA>         <NA>           LC
#> 98    Active    2024-12-11   2030-12-31           TR
#> 99  Pipeline          <NA>         <NA>           DO
#> 100   Active    2024-06-10         <NA>           PK
#>                           country                       region total_commitment
#> 1                          Brazil  Latin America and Caribbean          0.00000
#> 2                        Dominica  Latin America and Caribbean          0.00000
#> 3                      Montenegro      Europe and Central Asia          0.00000
#> 4                         Moldova      Europe and Central Asia          0.00000
#> 5                        Barbados  Latin America and Caribbean          0.00000
#> 6                          Zambia  Eastern and Southern Africa          0.00000
#> 7                      Seychelles  Eastern and Southern Africa          0.00000
#> 8                       Argentina  Latin America and Caribbean          0.00000
#> 9                        Ethiopia  Eastern and Southern Africa          0.00000
#> 10                       Kiribati        East Asia and Pacific          0.00000
#> 11                         Tuvalu        East Asia and Pacific          0.00000
#> 12                           <NA>                         <NA>         10.00000
#> 13                        Ukraine      Europe and Central Asia         20.00000
#> 14                         Guinea   Western and Central Africa         85.00000
#> 15    Eastern and Southern Africa  Eastern and Southern Africa          2.50000
#> 16                         Rwanda  Eastern and Southern Africa        200.00000
#> 17                      Sri Lanka                   South Asia        200.00000
#> 18                         Brazil  Latin America and Caribbean          0.00000
#> 19                         Zambia  Eastern and Southern Africa         50.00000
#> 20                         Jordan Middle East and North Africa          0.00000
#> 21                       Ethiopia  Eastern and Southern Africa          3.00000
#> 22        Egypt, Arab Republic of Middle East and North Africa          0.00000
#> 23                        Ukraine      Europe and Central Asia        750.00000
#> 24                          Sudan  Eastern and Southern Africa         86.00000
#> 25                        Ecuador  Latin America and Caribbean          0.25000
#> 26               Marshall Islands        East Asia and Pacific         21.00000
#> 27                        Moldova      Europe and Central Asia         40.00000
#> 28                         Rwanda  Eastern and Southern Africa         27.36000
#> 29                   Sierra Leone   Western and Central Africa          0.00000
#> 30                       Ethiopia  Eastern and Southern Africa        251.18000
#> 31                         Zambia  Eastern and Southern Africa          0.00000
#> 32                           Mali   Western and Central Africa          0.00000
#> 33                         Guyana  Latin America and Caribbean          0.00000
#> 34                       Tanzania  Eastern and Southern Africa          2.80000
#> 35  Congo, Democratic Republic of  Eastern and Southern Africa          0.00000
#> 36                        Lesotho  Eastern and Southern Africa         22.70000
#> 37                    Gambia, The   Western and Central Africa         25.00000
#> 38                        Somalia  Eastern and Southern Africa          0.00000
#> 39                     Uzbekistan      Europe and Central Asia        300.00000
#> 40                      Mauritius  Eastern and Southern Africa          0.00000
#> 41                          Kenya  Eastern and Southern Africa        900.00000
#> 42                      Indonesia        East Asia and Pacific          0.00000
#> 43                      Indonesia        East Asia and Pacific          0.00000
#> 44                           Fiji        East Asia and Pacific        100.30000
#> 45                     Kazakhstan      Europe and Central Asia        326.63000
#> 46             Dominican Republic  Latin America and Caribbean          0.00000
#> 47                         Bhutan                   South Asia          0.00000
#> 48                     Mozambique  Eastern and Southern Africa        125.00000
#> 49                        Morocco Middle East and North Africa         16.30000
#> 50                  Cote d'Ivoire   Western and Central Africa        543.50000
#> 51                          Benin   Western and Central Africa        150.00000
#> 52    Eastern and Southern Africa  Eastern and Southern Africa          0.00000
#> 53                        Morocco Middle East and North Africa        250.00000
#> 54             West Bank and Gaza Middle East and North Africa         22.00000
#> 55                    Gambia, The   Western and Central Africa         35.00000
#> 56                       Kiribati        East Asia and Pacific         10.00000
#> 57                         Zambia  Eastern and Southern Africa         13.37566
#> 58     Western and Central Africa   Western and Central Africa         40.00000
#> 59               Marshall Islands        East Asia and Pacific         15.00000
#> 60                       Dominica  Latin America and Caribbean         40.00000
#> 61     Western and Central Africa   Western and Central Africa         23.00000
#> 62                        Lebanon Middle East and North Africa          0.00000
#> 63                       Djibouti Middle East and North Africa          5.00000
#> 64                         Brazil  Latin America and Caribbean         50.00000
#> 65                         Rwanda  Eastern and Southern Africa        141.00000
#> 66                         Tuvalu        East Asia and Pacific         42.00000
#> 67                       Ethiopia  Eastern and Southern Africa       1500.00000
#> 68                        Morocco Middle East and North Africa        250.00000
#> 69                Solomon Islands        East Asia and Pacific         51.20000
#> 70                        Vanuatu        East Asia and Pacific         30.00000
#> 71             West Bank and Gaza Middle East and North Africa         10.00000
#> 72                        Tunisia Middle East and North Africa        300.00000
#> 73                      Sri Lanka                   South Asia        150.00000
#> 74                     Bangladesh                   South Asia          0.00000
#> 75       Central African Republic   Western and Central Africa         24.80000
#> 76          East Asia and Pacific        East Asia and Pacific          5.00000
#> 77                       Ethiopia  Eastern and Southern Africa         95.00000
#> 78                    South Sudan  Eastern and Southern Africa         70.00000
#> 79                   Burkina Faso   Western and Central Africa        150.00000
#> 80     Western and Central Africa   Western and Central Africa         50.00000
#> 81                     Mauritania   Western and Central Africa         36.00000
#> 82        Europe and Central Asia      Europe and Central Asia          0.00000
#> 83                        Romania      Europe and Central Asia        650.00000
#> 84                        Somalia  Eastern and Southern Africa         50.00000
#> 85                         Brazil  Latin America and Caribbean        110.00000
#> 86                          Sudan  Eastern and Southern Africa          0.00000
#> 87                    Afghanistan                   South Asia        100.00000
#> 88                        Moldova      Europe and Central Asia         40.00000
#> 89                        Somalia  Eastern and Southern Africa        100.00000
#> 90             Yemen, Republic of Middle East and North Africa        150.00000
#> 91                           Chad   Western and Central Africa        100.00000
#> 92                     Uzbekistan      Europe and Central Asia        150.00000
#> 93                          Benin   Western and Central Africa        150.00000
#> 94                        Liberia   Western and Central Africa          0.00000
#> 95                        Turkiye      Europe and Central Asia        654.90000
#> 96                     Uzbekistan      Europe and Central Asia         12.00000
#> 97                      St. Lucia  Latin America and Caribbean         20.00000
#> 98                        Turkiye      Europe and Central Asia        250.00000
#> 99             Dominican Republic  Latin America and Caribbean        150.00000
#> 100                      Pakistan                   South Asia       1000.00000
#>     ibrd_commitment ida_commitment            lending_instrument
#> 1              0.00           0.00  Investment Project Financing
#> 2              0.00           0.00    Development Policy Lending
#> 3              0.00           0.00  Investment Project Financing
#> 4              0.00           0.00    Development Policy Lending
#> 5              0.00           0.00  Investment Project Financing
#> 6              0.00           0.00    Development Policy Lending
#> 7              0.00           0.00    Development Policy Lending
#> 8              0.00           0.00  Investment Project Financing
#> 9              0.00           0.00  Investment Project Financing
#> 10             0.00           0.00  Investment Project Financing
#> 11             0.00           0.00    Development Policy Lending
#> 12            10.00           0.00  Investment Project Financing
#> 13             0.00          20.00 Program-for-Results Financing
#> 14             0.00          85.00  Investment Project Financing
#> 15             0.00           2.50  Investment Project Financing
#> 16           200.00           0.00    Development Policy Lending
#> 17             0.00         200.00  Investment Project Financing
#> 18             0.00           0.00    Development Policy Lending
#> 19             0.00          50.00  Investment Project Financing
#> 20             0.00           0.00    Development Policy Lending
#> 21             3.00           0.00  Investment Project Financing
#> 22             0.00           0.00    Development Policy Lending
#> 23             0.00         750.00 Program-for-Results Financing
#> 24            86.00           0.00  Investment Project Financing
#> 25             0.25           0.00  Investment Project Financing
#> 26            21.00           0.00    Development Policy Lending
#> 27             0.00          40.00  Investment Project Financing
#> 28             0.00          27.36  Investment Project Financing
#> 29             0.00           0.00    Development Policy Lending
#> 30             0.00         251.18 Program-for-Results Financing
#> 31             0.00           0.00  Investment Project Financing
#> 32             0.00           0.00  Investment Project Financing
#> 33             0.00           0.00  Investment Project Financing
#> 34             0.00           2.80  Investment Project Financing
#> 35             0.00           0.00    Development Policy Lending
#> 36            22.70           0.00  Investment Project Financing
#> 37            25.00           0.00    Development Policy Lending
#> 38             0.00           0.00    Development Policy Lending
#> 39           300.00           0.00    Development Policy Lending
#> 40             0.00           0.00    Development Policy Lending
#> 41             0.00         900.00    Development Policy Lending
#> 42             0.00           0.00  Investment Project Financing
#> 43             0.00           0.00    Development Policy Lending
#> 44             0.00         100.30    Development Policy Lending
#> 45             0.00         326.63  Investment Project Financing
#> 46             0.00           0.00    Development Policy Lending
#> 47             0.00           0.00    Development Policy Lending
#> 48             0.00         125.00  Investment Project Financing
#> 49            12.00           4.30  Investment Project Financing
#> 50           543.50           0.00    Development Policy Lending
#> 51             0.00         150.00    Development Policy Lending
#> 52             0.00           0.00 Program-for-Results Financing
#> 53           250.00           0.00 Program-for-Results Financing
#> 54             0.00           0.00  Investment Project Financing
#> 55             0.00          35.00  Investment Project Financing
#> 56             0.00          10.00  Investment Project Financing
#> 57             0.00           0.00  Investment Project Financing
#> 58             0.00           7.00  Investment Project Financing
#> 59             0.00          15.00  Investment Project Financing
#> 60             0.00          40.00  Investment Project Financing
#> 61             0.00          23.00  Investment Project Financing
#> 62             0.00           0.00  Investment Project Financing
#> 63             0.00           5.00  Investment Project Financing
#> 64            50.00           0.00  Investment Project Financing
#> 65             0.00         141.00    Development Policy Lending
#> 66             0.00          42.00  Investment Project Financing
#> 67             0.00        1500.00    Development Policy Lending
#> 68           250.00           0.00 Program-for-Results Financing
#> 69             0.00          51.20  Investment Project Financing
#> 70             0.00          30.00  Investment Project Financing
#> 71             0.00           0.00  Investment Project Financing
#> 72           300.00           0.00  Investment Project Financing
#> 73             0.00         150.00  Investment Project Financing
#> 74             0.00           0.00  Investment Project Financing
#> 75             0.00          20.00  Investment Project Financing
#> 76             0.00           5.00  Investment Project Financing
#> 77             0.00          82.50  Investment Project Financing
#> 78             0.00          70.00  Investment Project Financing
#> 79             0.00         150.00 Program-for-Results Financing
#> 80             0.00          50.00  Investment Project Financing
#> 81             0.00          26.00  Investment Project Financing
#> 82             0.00           0.00  Investment Project Financing
#> 83           650.00           0.00    Development Policy Lending
#> 84             0.00          40.00  Investment Project Financing
#> 85           110.00           0.00    Development Policy Lending
#> 86             0.00           0.00  Investment Project Financing
#> 87             0.00           0.00  Investment Project Financing
#> 88            40.00           0.00    Development Policy Lending
#> 89             0.00         100.00  Investment Project Financing
#> 90             0.00         150.00  Investment Project Financing
#> 91             0.00         100.00  Investment Project Financing
#> 92             0.00         150.00  Investment Project Financing
#> 93             0.00         150.00    Development Policy Lending
#> 94             0.00           0.00  Investment Project Financing
#> 95           654.90           0.00  Investment Project Financing
#> 96            12.00           0.00  Investment Project Financing
#> 97             0.00          20.00    Development Policy Lending
#> 98           250.00           0.00  Investment Project Financing
#> 99           150.00           0.00  Investment Project Financing
#> 100          200.00         800.00  Investment Project Financing
#>                                                                                                                                                                            borrower
#> 1                                                                                                                                                                              <NA>
#> 2                                                                                                                                                                              <NA>
#> 3                                                                                                                                                                              <NA>
#> 4                                                                                                                                                                              <NA>
#> 5                                                                                                                                                                              <NA>
#> 6                                                                                                                                                                              <NA>
#> 7                                                                                                                                                                              <NA>
#> 8                                                                                                                                                                              <NA>
#> 9                                                                                                                                                                              <NA>
#> 10                                                                                                                                                                             <NA>
#> 11                                                                                                                                                                             <NA>
#> 12                                                                                                                                                                             <NA>
#> 13                                                                                                                                                                             <NA>
#> 14                                                                                                                                                                             <NA>
#> 15                                                                                                                                                                             <NA>
#> 16                                                                                                                                                                             <NA>
#> 17                                                                                                                                                                             <NA>
#> 18                                                                                                                                                                             <NA>
#> 19                                                                                                                                                                             <NA>
#> 20                                                                                                                                                                             <NA>
#> 21                                                                                                                                                                             <NA>
#> 22                                                                                                                                                                             <NA>
#> 23                                                                                                                                                                             <NA>
#> 24                                                                                                                                                                             <NA>
#> 25                                                                                                                                                                             <NA>
#> 26                                                                                                                                                                             <NA>
#> 27                                                                                                                                                                             <NA>
#> 28                                                                                                                                                                             <NA>
#> 29                                                                                                                                                                             <NA>
#> 30                                                                                                                                                                             <NA>
#> 31                                                                                                                                                                             <NA>
#> 32                                                                                                                                                                             <NA>
#> 33                                                                                                                                                                             <NA>
#> 34                                                                                                                                                                             <NA>
#> 35                                                                                                                                                                             <NA>
#> 36                                                                                                                                                                             <NA>
#> 37                                                                                                                                                                             <NA>
#> 38                                                                                                                                                                             <NA>
#> 39                                                                                                                                                                             <NA>
#> 40                                                                                                                                                                             <NA>
#> 41                                                                                                                                                                             <NA>
#> 42                                                                                                                                                                             <NA>
#> 43                                                                                                                                                                             <NA>
#> 44                                                                                                                                                                             <NA>
#> 45                                                                                                                                                                             <NA>
#> 46                                                                                                                                                                             <NA>
#> 47                                                                                                                                                                             <NA>
#> 48                                                                                                                                                                             <NA>
#> 49                                                                                                                                                                             <NA>
#> 50                                                                                                                                                                             <NA>
#> 51                                                                                                                                                                             <NA>
#> 52                                                                                                                                                      United Republic of Tanzania
#> 53                                                                                                                                                               Kingdom of Morocco
#> 54                                                                                                 Palestine Liberation Organization (For The Benefit of the Palestinian Authority)
#> 55                                                                                                                                                                       The Gambia
#> 56                                                                                                                                                             Republic of Kiribati
#> 57                                                                                                                                                               Republic of Zambia
#> 58  Repubic of Togo, Republic of Benin, Republic of Senegal, Democractic Republic of Sao Tome and Principe, West Africa Economic and Monetary Union, Islamic Republic of Mauritania
#> 59                                                                                                                                                 Republic of the Marshall Islands
#> 60                                                                                                                                                              Ministry of Finance
#> 61                                                                                                Republic of Togo, Republic of Ghana, Republic of Benin, Republic of C�te d'Ivoire
#> 62                                                                                                                                                                      Kafalat SAL
#> 63                                                                                                                                                             Republic of Djibouti
#> 64                                                                                                                                                                State of Amazonas
#> 65                                                                                                                                                                             <NA>
#> 66                                                                                                                                                                           Tuvalu
#> 67                                                                                                                                          Federal Democratic Republic of Ethiopia
#> 68                                                                                                                                                  Ministry of Economy and Finance
#> 69                                                                                                                                                                  Solomon Islands
#> 70                                                                                                                                                              Republic of Vanuatu
#> 71                                                                            Ministry of Finance, Palestine Liberation Organization (for the Benefit of the Palestinian Authority)
#> 72                                                                                                                                                              Ministry of Economy
#> 73                                                                                                                                       Democratic Socialist Republic of Sri Lanka
#> 74                                                                                                                                                  People's Republic of Bangladesh
#> 75                                                                                                                                                         Central African Republic
#> 76                                                                                                                                                          ASEAN Centre for Energy
#> 77                                                                                                                                          FEDERAL DEMOCRATIC REPUBLIC OF ETHIOPIA
#> 78                                                                                                                                                          Republic of South Sudan
#> 79                                                                                                                                                                             <NA>
#> 80                     Republic of Mali, Republic of Niger, Republic of Chad, CILSS Permanent Interstate Committee for Drought Control in the Sahel, Islamic Republic of Mauritania
#> 81                                                                                                                                                   Islamic Republic of Mauritania
#> 82                                                                                                                            Ministry of Treasury and Finance, Ministry of Finance
#> 83                                                                                                                                                                             <NA>
#> 84                                                                                                                                                      Federal Republic of Somalia
#> 85                                                                                                                                                                 State of Sergipe
#> 86                                                                                                                                          International Organization of Migration
#> 87                                                                                                                                                                              FAO
#> 88                                                                                                                                                              Ministry of Finance
#> 89                                                                                                                                                      Federal Republic of Somalia
#> 90                                                                                             United Nations Development Programme (UNDP), United Nations Children's Fund (UNICEF)
#> 91                                                                                                                                                                             <NA>
#> 92                                                                                                                                                           Republic of Uzbekistan
#> 93                                                                                                                                                  Ministry of Economy and Finance
#> 94                                                                                                                                     Ministry of Finance and Development Planning
#> 95                                                                                                                                    T�rkiye Ihracat Kredi Bankas? A.S. (Eximbank)
#> 96                                                                                                                                                  Ministry of Economy and Finance
#> 97                                                                                                                                                                             <NA>
#> 98                                                                                                                                                 Ministry of Finance and Treasury
#> 99                                                                                                                                                               Dominican Republic
#> 100                                                                                                                                                    Islamic Republic of Pakistan
#>                                                                                                                                                                                                                                                                                                                                                                                                                          implementing_agency
#> 1                                                                                                                                                                                                                                                                                                                                                                                                                                       <NA>
#> 2                                                                                                                                                                                                                                                                                                                                                                                                                                       <NA>
#> 3                                                                                                                                                                                                                                                                                                                                                                                                                                       <NA>
#> 4                                                                                                                                                                                                                                                                                                                                                                                                                                       <NA>
#> 5                                                                                                                                                                                                                                                                                                                                                                                                                                       <NA>
#> 6                                                                                                                                                                                                                                                                                                                                                                                                                                       <NA>
#> 7                                                                                                                                                                                                                                                                                                                                                                                                                                       <NA>
#> 8                                                                                                                                                                                                                                                                                                                                                                                                                                       <NA>
#> 9                                                                                                                                                                                                                                                                                                                                                                                                                                       <NA>
#> 10                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 11                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 12                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 13                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 14                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 15                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 16                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 17                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 18                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 19                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 20                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 21                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 22                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 23                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 24                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 25                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 26                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 27                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 28                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 29                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 30                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 31                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 32                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 33                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 34                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 35                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 36                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 37                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 38                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 39                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 40                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 41                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 42                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 43                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 44                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 45                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 46                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 47                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 48                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 49                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 50                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 51                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 52                                                                                                                                                                                                                                                                                                                                             Ministry of Agriculture, Irrigation, Natural Resources and Livestock, Ministry of Agriculture
#> 53                                                                                                                                                                                                                                                                                                                                                                                                           Ministry of Economy and Finance
#> 54                                                                                                                                                                                                                                                                                                                                                                                                 Municipal Development Lending Fund (MDLF)
#> 55                                                                                                                                                                                                                                                                                                                                                                                                                        Ministry of Health
#> 56                                                                                                                                                                                                                                                                                    Ministry of Infrastructure and Sustainable Energy, Ministry of Finance and Economic Development, Ministry of Information, Communications and Transport
#> 57                                                                                                                                                                                                                                                                                                                                                                             Ministry of Community Development and Social Services (MCDSS)
#> 58                                             Sao Tome and Principe - Ministry of Infrastructures, natural resources and Environment, Benin - Ministry of Living Environment and Sustainable Development, Senegal - Ministry of Environment, Sustainable Development and Ecological Transition, Togo - Ministry of Environment and Forestry Resources, International Union for Conservation of Nature, Mauritania - Ministry of Environment
#> 59                                                                                                                                                                                                                                                                                                                                                                                          Ministry of Finance, Banking and Postal Services
#> 60                                                                                                                                                                                                                                                                                                                                                                            Ministry of Public Works, Public Utilities and Digital Economy
#> 61                                                                                                                                                                                                        National Community Development Support Agency (ANADEB) (Togo), Ministry of Local Government Decentralisation and Rural Development (Ghana), General Secretariat of the Presidency (Benin), Prime Minister's Office (C�te d'Ivoire)
#> 62                                                                                                                                                                                                                                                                                                                                                                                                                               Kafalat SAL
#> 63                                                                                                                                                                                                                                                                                                                   National Institute of Statistics of Djibouti, Ministry of Economy and Finance in charge of Industry, Ministry of Budget
#> 64                                                                                                                                                                                                                                                                                                                                                                                 State Secretariat of Administration and Management (SEAD)
#> 65                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 66                                                                                                                                                                                                                                                                                                                              Ministry of Finance and Economic Development, Ministry of Public Works, Infrastructure Development and Water
#> 67                                                                                                                                                                                                                                                                                                                                                                                                                       Ministry of Finance
#> 68                                                                                                                                                                                                                                                                                                                                              Ministry of Agriculture, Maritime Fisheries, Rural Development, Water and Forests (MAPMDREF)
#> 69                                                                                                                                                                                                                                                                                                                                                            Ministry of Infrastructure Development, Ministry of Communication and Aviation
#> 70                                                                                                                                                                                                                                                                                                                                                                                           Ministry of Infrastructure and Public Utilities
#> 71                                                                                                                                                                                                                                                                                                  Ministry of Social Development, Ministry of Labor/Palestinian Fund for Employment and Social Protection for Workers, Ministry of Finance
#> 72                                                                                                                                                                                                                                                                                                                                                                                                                       Office des C�r�ales
#> 73                                                                                                                                                                                                                                                                                                                                                                                                                        Ministry of Health
#> 74                                                                                                                                                                                                                                                                                                                                                                             Department of Agricultural Extension, Ministry of Agriculture
#> 75                                                                                                                                                                                                                                                                                                                                               Ministry of Finance and Budget, Ministry of Health and Population, Central African Republic
#> 76                                                                                                                                                                                                                                                                                                                                                                                                                   ASEAN Centre for Energy
#> 77                                                                                                                                                                                                                                                                                                                      Ministry of Labor and Skills, Ministry of Urban Development and Infrastructure, Ministry of Women and Social Affairs
#> 78                                                                                                                                                                                                                                                                                                                                                   Ministry of Gender, Child and Social Welfare, Ministry of Agriculture and Food Security
#> 79                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 80  Republic of Chad, Ministry of Livestock and Animal Production, Republic of Senegal, Ministry of Livestock and Animal Production, Islamic Republic of Mauritania, Ministry in charge of Livestock, Burkina Faso, Ministry of Animal Resources and Fisheries, CILSS Permanent Interstate Committee for Drought Control in the Sahel, Republic of Niger, Ministry in charge of Livestock, Republic of Mali, Ministry in charge of Livestock
#> 81                                                                                                                                                                                                                                                                                                                                                                                                                Taazour General Delegation
#> 82                                                                                                                                                                                                                                                                                                                                                              Ministry of Energy, Ministry of Environment, Urbanization and Climate Change
#> 83                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 84                                                                                                                                                                                Garowe Municipality/ Puntland, Dhusamareb/Galmudug, Beledweyne/Hirshabelle, Baidoa Municipality/South West State, Benadir Regional Administration, Ministry of Public Works, Kismayo Municipality/Jubbaland, BeletWeyne/Hirshabelle, Dhusamareeb/Galgaduud
#> 85                                                                                                                                                                                                                                                                                                                                                                                                             State Secretariate of Finance
#> 86                                                                                                                                                                                                                                                                                                                                                                                                                        World Food Program
#> 87                                                                                                                                                                                                                                                                                                                                                                                                                                       FAO
#> 88                                                                                                                                                                                                                                                                                                                                                                                                                       Ministry of Finance
#> 89                                                                                                                                                                                                                                                                                                                                                                                                      Ministry of Labor and Social Affairs
#> 90                                                                                                                                                                                                                                                                                                                                                                                         Social Fund for Development, Public Works Project
#> 91                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 92                                                                                                                                                                                                                                                                                                                                                                                                           Ministry of Economy and Finance
#> 93                                                                                                                                                                                                                                                                                                                                                                                                                           Customs Service
#> 94                                                                                                                                                                                                                                                                                                                                                                                                                     Ministry of Education
#> 95                                                                                                                                                                                                                                                                                                                                                                                             T�rkiye Ihracat Kredi Bankas? A.S. (Eximbank)
#> 96                                                                                                                                                                                                                                                                                                                                                                           National Electric Grid of Uzbekistan (NEGU) Joint Stock Company
#> 97                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 98                                                                                                                                                                                                                                                                                                                                                                                                      Ministry of Agriculture and Forestry
#> 99                                                                                                                                                                                                                                                                                                                                                                                                              Ministry of Energy and Mines
#> 100                                                                                                                                                                                                                                                                                                                                                Water and Power Development Authority (WAPDA), National Transmission and Despatch Company
#>                                                                              url
#> 1   https://projects.worldbank.org/en/projects-operations/project-detail/P508202
#> 2   https://projects.worldbank.org/en/projects-operations/project-detail/P508114
#> 3   https://projects.worldbank.org/en/projects-operations/project-detail/P507698
#> 4   https://projects.worldbank.org/en/projects-operations/project-detail/P507576
#> 5   https://projects.worldbank.org/en/projects-operations/project-detail/P507190
#> 6   https://projects.worldbank.org/en/projects-operations/project-detail/P507116
#> 7   https://projects.worldbank.org/en/projects-operations/project-detail/P506960
#> 8   https://projects.worldbank.org/en/projects-operations/project-detail/P506846
#> 9   https://projects.worldbank.org/en/projects-operations/project-detail/P506818
#> 10  https://projects.worldbank.org/en/projects-operations/project-detail/P506425
#> 11  https://projects.worldbank.org/en/projects-operations/project-detail/P506356
#> 12  https://projects.worldbank.org/en/projects-operations/project-detail/P506144
#> 13  https://projects.worldbank.org/en/projects-operations/project-detail/P506083
#> 14  https://projects.worldbank.org/en/projects-operations/project-detail/P506072
#> 15  https://projects.worldbank.org/en/projects-operations/project-detail/P505581
#> 16  https://projects.worldbank.org/en/projects-operations/project-detail/P505244
#> 17  https://projects.worldbank.org/en/projects-operations/project-detail/P505241
#> 18  https://projects.worldbank.org/en/projects-operations/project-detail/P505235
#> 19  https://projects.worldbank.org/en/projects-operations/project-detail/P505188
#> 20  https://projects.worldbank.org/en/projects-operations/project-detail/P505118
#> 21  https://projects.worldbank.org/en/projects-operations/project-detail/P505075
#> 22  https://projects.worldbank.org/en/projects-operations/project-detail/P504910
#> 23  https://projects.worldbank.org/en/projects-operations/project-detail/P504773
#> 24  https://projects.worldbank.org/en/projects-operations/project-detail/P504629
#> 25  https://projects.worldbank.org/en/projects-operations/project-detail/P504400
#> 26  https://projects.worldbank.org/en/projects-operations/project-detail/P504373
#> 27  https://projects.worldbank.org/en/projects-operations/project-detail/P504278
#> 28  https://projects.worldbank.org/en/projects-operations/project-detail/P504023
#> 29  https://projects.worldbank.org/en/projects-operations/project-detail/P503960
#> 30  https://projects.worldbank.org/en/projects-operations/project-detail/P503945
#> 31  https://projects.worldbank.org/en/projects-operations/project-detail/P503941
#> 32  https://projects.worldbank.org/en/projects-operations/project-detail/P503776
#> 33  https://projects.worldbank.org/en/projects-operations/project-detail/P503393
#> 34  https://projects.worldbank.org/en/projects-operations/project-detail/P502536
#> 35  https://projects.worldbank.org/en/projects-operations/project-detail/P502157
#> 36  https://projects.worldbank.org/en/projects-operations/project-detail/P502125
#> 37  https://projects.worldbank.org/en/projects-operations/project-detail/P502012
#> 38  https://projects.worldbank.org/en/projects-operations/project-detail/P501988
#> 39  https://projects.worldbank.org/en/projects-operations/project-detail/P501037
#> 40  https://projects.worldbank.org/en/projects-operations/project-detail/P501014
#> 41  https://projects.worldbank.org/en/projects-operations/project-detail/P500912
#> 42  https://projects.worldbank.org/en/projects-operations/project-detail/P500764
#> 43  https://projects.worldbank.org/en/projects-operations/project-detail/P500689
#> 44  https://projects.worldbank.org/en/projects-operations/project-detail/P500609
#> 45  https://projects.worldbank.org/en/projects-operations/project-detail/P500565
#> 46  https://projects.worldbank.org/en/projects-operations/project-detail/P500557
#> 47  https://projects.worldbank.org/en/projects-operations/project-detail/P500536
#> 48  https://projects.worldbank.org/en/projects-operations/project-detail/P500488
#> 49  https://projects.worldbank.org/en/projects-operations/project-detail/P500402
#> 50  https://projects.worldbank.org/en/projects-operations/project-detail/P181752
#> 51  https://projects.worldbank.org/en/projects-operations/project-detail/P181746
#> 52  https://projects.worldbank.org/en/projects-operations/project-detail/P181690
#> 53  https://projects.worldbank.org/en/projects-operations/project-detail/P181679
#> 54  https://projects.worldbank.org/en/projects-operations/project-detail/P181678
#> 55  https://projects.worldbank.org/en/projects-operations/project-detail/P181659
#> 56  https://projects.worldbank.org/en/projects-operations/project-detail/P181658
#> 57  https://projects.worldbank.org/en/projects-operations/project-detail/P181651
#> 58  https://projects.worldbank.org/en/projects-operations/project-detail/P181648
#> 59  https://projects.worldbank.org/en/projects-operations/project-detail/P181646
#> 60  https://projects.worldbank.org/en/projects-operations/project-detail/P181645
#> 61  https://projects.worldbank.org/en/projects-operations/project-detail/P181632
#> 62  https://projects.worldbank.org/en/projects-operations/project-detail/P181623
#> 63  https://projects.worldbank.org/en/projects-operations/project-detail/P181612
#> 64  https://projects.worldbank.org/en/projects-operations/project-detail/P181608
#> 65  https://projects.worldbank.org/en/projects-operations/project-detail/P181603
#> 66  https://projects.worldbank.org/en/projects-operations/project-detail/P181595
#> 67  https://projects.worldbank.org/en/projects-operations/project-detail/P181591
#> 68  https://projects.worldbank.org/en/projects-operations/project-detail/P181587
#> 69  https://projects.worldbank.org/en/projects-operations/project-detail/P181585
#> 70  https://projects.worldbank.org/en/projects-operations/project-detail/P181577
#> 71  https://projects.worldbank.org/en/projects-operations/project-detail/P181573
#> 72  https://projects.worldbank.org/en/projects-operations/project-detail/P181565
#> 73  https://projects.worldbank.org/en/projects-operations/project-detail/P181564
#> 74  https://projects.worldbank.org/en/projects-operations/project-detail/P181563
#> 75  https://projects.worldbank.org/en/projects-operations/project-detail/P181561
#> 76  https://projects.worldbank.org/en/projects-operations/project-detail/P181555
#> 77  https://projects.worldbank.org/en/projects-operations/project-detail/P181550
#> 78  https://projects.worldbank.org/en/projects-operations/project-detail/P181549
#> 79  https://projects.worldbank.org/en/projects-operations/project-detail/P181546
#> 80  https://projects.worldbank.org/en/projects-operations/project-detail/P181533
#> 81  https://projects.worldbank.org/en/projects-operations/project-detail/P181523
#> 82  https://projects.worldbank.org/en/projects-operations/project-detail/P181518
#> 83  https://projects.worldbank.org/en/projects-operations/project-detail/P181517
#> 84  https://projects.worldbank.org/en/projects-operations/project-detail/P181512
#> 85  https://projects.worldbank.org/en/projects-operations/project-detail/P181501
#> 86  https://projects.worldbank.org/en/projects-operations/project-detail/P181490
#> 87  https://projects.worldbank.org/en/projects-operations/project-detail/P181480
#> 88  https://projects.worldbank.org/en/projects-operations/project-detail/P181479
#> 89  https://projects.worldbank.org/en/projects-operations/project-detail/P181469
#> 90  https://projects.worldbank.org/en/projects-operations/project-detail/P181468
#> 91  https://projects.worldbank.org/en/projects-operations/project-detail/P181466
#> 92  https://projects.worldbank.org/en/projects-operations/project-detail/P181458
#> 93  https://projects.worldbank.org/en/projects-operations/project-detail/P181457
#> 94  https://projects.worldbank.org/en/projects-operations/project-detail/P181455
#> 95  https://projects.worldbank.org/en/projects-operations/project-detail/P181436
#> 96  https://projects.worldbank.org/en/projects-operations/project-detail/P181434
#> 97  https://projects.worldbank.org/en/projects-operations/project-detail/P181432
#> 98  https://projects.worldbank.org/en/projects-operations/project-detail/P181428
#> 99  https://projects.worldbank.org/en/projects-operations/project-detail/P181424
#> 100 https://projects.worldbank.org/en/projects-operations/project-detail/P181423
# }
```
