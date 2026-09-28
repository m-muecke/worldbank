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
  broad queries.

## Value

A [`data.frame()`](https://rdrr.io/r/base/data.frame.html) with World
Bank project data. The columns are:

- `id`: The project ID.

- `project_name`: The project name.

- `status`: The project status.

- `approval_date`: The board approval date.

- `closing_date`: The closing date.

- `country_code`: The ISO country codes, separated by `;` if there are
  several.

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
#> 1  P163868
#> 2  P178993
#> 3  P178563
#> 4  P172605
#> 5  P179088
#> 6  P177070
#> 7  P179046
#> 8  P178663
#> 9  P073882
#> 10 P179365
#> 11 P172497
#> 12 P153012
#>                                                              project_name
#> 1                   Support to Upper Secondary Reform in Brazil Operation
#> 2      Mato Grosso Resilient, Inclusive, and Sustainable Learning Project
#> 3             RECOVERING LEARNING LOSSES FROM COVID-19 PANDEMIC IN BRAZIL
#> 4                Salvador Social Multi-Sector Service Delivery Project II
#> 5                Progestão Tocantins: Public Sector Management Efficiency
#> 6                  Progestão Alagoas: Public Sector Management Efficiency
#> 7                     Progestão Acre: Public Sector Management Efficiency
#> 8                    Progestão Piauí: Public Sector Management Efficiency
#> 9                          RF 2nd Amazon Fire Prevention and Mobilization
#> 10 Brazil: Support to New Bolsa Familia Conditional Cash Transfer Program
#> 11                 Sustainable Multiple Use Landscape Consortia in Brazil
#> 12                        Fortaleza Sustainable Urban Development Project
#>    status approval_date closing_date country_code country
#> 1  Active    2017-12-14   2024-12-31           BR  Brazil
#> 2  Active    2023-10-26   2028-12-31           BR  Brazil
#> 3  Active    2022-05-12   2027-12-31           BR  Brazil
#> 4  Active    2020-09-22   2025-12-30           BR  Brazil
#> 5  Active    2023-07-24   2028-12-29           BR  Brazil
#> 6  Active    2022-07-21   2028-03-31           BR  Brazil
#> 7  Active    2023-07-24   2028-12-29           BR  Brazil
#> 8  Active    2023-10-03   2029-06-29           BR  Brazil
#> 9  Active          <NA>   2004-09-30           BR  Brazil
#> 10 Active    2023-12-06   2026-04-30           BR  Brazil
#> 11 Active          <NA>   2027-11-30           BR  Brazil
#> 12 Active    2017-04-28   2025-03-31           BR  Brazil
#>                         region total_commitment ibrd_commitment ida_commitment
#> 1  Latin America and Caribbean        250.00000           250.0              0
#> 2  Latin America and Caribbean        100.00000           100.0              0
#> 3  Latin America and Caribbean        250.00000           250.0              0
#> 4  Latin America and Caribbean        125.00000           125.0              0
#> 5  Latin America and Caribbean         50.00000            50.0              0
#> 6  Latin America and Caribbean         40.00000            40.0              0
#> 7  Latin America and Caribbean         40.00000            40.0              0
#> 8  Latin America and Caribbean         50.00000            50.0              0
#> 9  Latin America and Caribbean          1.10000             0.0              0
#> 10 Latin America and Caribbean        300.00000           300.0              0
#> 11 Latin America and Caribbean         24.57798             0.0              0
#> 12 Latin America and Caribbean         73.30000            73.3              0
#>               lending_instrument
#> 1  Program-for-Results Financing
#> 2   Investment Project Financing
#> 3  Program-for-Results Financing
#> 4   Investment Project Financing
#> 5   Investment Project Financing
#> 6   Investment Project Financing
#> 7   Investment Project Financing
#> 8   Investment Project Financing
#> 9                           <NA>
#> 10  Investment Project Financing
#> 11  Investment Project Financing
#> 12  Investment Project Financing
#>                                                                     borrower
#> 1                               Ministry of Economy (Minist�rio da Economia)
#> 2                                                       STATE OF MATO GROSSO
#> 3                                          THE FEDERATIVE REPUBLIC OF BRAZIL
#> 4                                                   Municipality of Salvador
#> 5                                     State Secretariat of Planning (SEPLAN)
#> 6  State of Alagoas, with the guarantee of the Federative Republic of Brazil
#> 7                                                              State of Acre
#> 8                                                             State of Piaui
#> 9                                                                       <NA>
#> 10                                             Federative Republic of Brazil
#> 11                                                                      IICA
#> 12                                                 Municipality of Fortaleza
#>                                                                                          implementing_agency
#> 1                                                             Ministry of Education (Minist�rio da Educa��o)
#> 2                                                                     SECRETARIAT OF EDUCATION - MATO GROSSO
#> 3                                                                                      MINISTRY OF EDUCATION
#> 4                                                                                                 Casa Civil
#> 5                                                                                                        UGP
#> 6                                                                  Secretariat of Finance - State of Alagoas
#> 7                                                                              State Secretariat of Planning
#> 8                                                                            Secretariat of Finance of Piaui
#> 9                                                                                                       <NA>
#> 10                                                                                   Ministry of Citizenship
#> 11             Minist�rio do Meio Ambiente (MMA), Minist�rio da Agricultura, Pecu�ria e Abastecimento (MAPA)
#> 12 Secretaria Municipal de Urbanismo e Meio Ambiente (SEUMA), Secretaria Municipal de Infraestrutura (SEINF)
#>                                                                             url
#> 1  https://projects.worldbank.org/en/projects-operations/project-detail/P163868
#> 2  https://projects.worldbank.org/en/projects-operations/project-detail/P178993
#> 3  https://projects.worldbank.org/en/projects-operations/project-detail/P178563
#> 4  https://projects.worldbank.org/en/projects-operations/project-detail/P172605
#> 5  https://projects.worldbank.org/en/projects-operations/project-detail/P179088
#> 6  https://projects.worldbank.org/en/projects-operations/project-detail/P177070
#> 7  https://projects.worldbank.org/en/projects-operations/project-detail/P179046
#> 8  https://projects.worldbank.org/en/projects-operations/project-detail/P178663
#> 9  https://projects.worldbank.org/en/projects-operations/project-detail/P073882
#> 10 https://projects.worldbank.org/en/projects-operations/project-detail/P179365
#> 11 https://projects.worldbank.org/en/projects-operations/project-detail/P172497
#> 12 https://projects.worldbank.org/en/projects-operations/project-detail/P153012

# active or pipeline projects across two countries
wb_project(country = c("BR", "IN"), status = c("active", "pipeline"))
#>          id
#> 1   P507508
#> 2   P178253
#> 3   P181463
#> 4   P179935
#> 5   P180429
#> 6   P178254
#> 7   P180555
#> 8   P181501
#> 9   P181195
#> 10  P177965
#> 11  P180430
#> 12  P180462
#> 13  P174825
#> 14  P178557
#> 15  P179357
#> 16  P179749
#> 17  P180497
#> 18  P500524
#> 19  P177474
#> 20  P178581
#> 21  P175723
#> 22  P180634
#> 23  P179189
#> 24  P179365
#> 25  P179182
#> 26  P178993
#> 27  P178567
#> 28  P178663
#> 29  P179088
#> 30  P179046
#> 31  P176733
#> 32  P176032
#> 33  P179249
#> 34  P179337
#> 35  P178418
#> 36  P177917
#> 37  P177980
#> 38  P177876
#> 39  P178072
#> 40  P177671
#> 41  P176982
#> 42  P175811
#> 43  P179039
#> 44  P174593
#> 45  P178888
#> 46  P175728
#> 47  P178252
#> 48  P175261
#> 49  P178339
#> 50  P177070
#> 51  P171750
#> 52  P178146
#> 53  P175676
#> 54  P177915
#> 55  P174798
#> 56  P178729
#> 57  P176404
#> 58  P177856
#> 59  P178563
#> 60  P168634
#> 61  P177632
#> 62  P174067
#> 63  P174564
#> 64  P176107
#> 65  P172187
#> 66  P170590
#> 67  P174732
#> 68  P173589
#> 69  P175221
#> 70  P174778
#> 71  P173978
#> 72  P172226
#> 73  P170811
#> 74  P173958
#> 75  P173704
#> 76  P168633
#> 77  P170645
#> 78  P172213
#> 79  P170873
#> 80  P166020
#> 81  P168097
#> 82  P172605
#> 83  P174312
#> 84  P169111
#> 85  P166868
#> 86  P170850
#> 87  P168590
#> 88  P169140
#> 89  P167350
#> 90  P163328
#> 91  P170682
#> 92  P169134
#> 93  P165129
#> 94  P168310
#> 95  P157929
#> 96  P162679
#> 97  P163533
#> 98  P165055
#> 99  P167455
#> 100 P167581
#> 101 P160379
#> 102 P167523
#> 103 P157141
#> 104 P166923
#> 105 P165683
#> 106 P166578
#> 107 P165695
#> 108 P158502
#> 109 P160463
#> 110 P162086
#> 111 P158119
#> 112 P156869
#> 113 P158146
#> 114 P163868
#> 115 P158522
#> 116 P157702
#> 117 P147158
#> 118 P155617
#> 119 P156241
#> 120 P153012
#> 121 P155303
#> 122 P148775
#> 123 P152698
#> 124 P148531
#> 125 P155007
#> 126 P130544
#> 127 P127725
#> 128 P154990
#> 129 P096124
#> 130 P039027
#> 131 P505866
#> 132 P507322
#> 133 P108190
#> 134 P500380
#> 135 P502493
#> 136 P110539
#> 137 P180699
#> 138 P507340
#> 139 P114890
#> 140 P508840
#> 141 P500252
#> 142 P506955
#> 143 P507029
#> 144 P508202
#> 145 P508363
#> 146 P504126
#> 147 P507066
#> 148 P508221
#> 149 P180716
#> 150 P504276
#> 151 P500570
#> 152 P500469
#> 153 P501071
#> 154 P105370
#> 155 P181511
#> 156 P180932
#> 157 P505235
#> 158 P507629
#> 159 P178053
#> 160 P500564
#> 161 P505590
#> 162 P506976
#> 163 P181767
#> 164 P506329
#> 165 P508489
#> 166 P504543
#> 167 P179349
#> 168 P505914
#> 169 P509041
#> 170 P506142
#> 171 P500614
#> 172 P506861
#> 173 P181244
#> 174 P502499
#> 175 P500151
#> 176 P508719
#> 177 P505563
#> 178 P507628
#> 179 P173090
#> 180 P506272
#> 181 P506321
#> 182 P505177
#> 183 P181608
#> 184 P508025
#> 185 P507910
#> 186 P504899
#> 187 P500501
#> 188 P181020
#> 189 P500168
#> 190 P506320
#> 191 P500431
#> 192 P508453
#> 193 P504897
#> 194 P503872
#> 195 P506340
#> 196 P507236
#> 197 P114896
#> 198 P502491
#> 199 P504253
#> 200 P181524
#> 201 P128921
#> 202 P158000
#> 203 P160018
#> 204 P171257
#> 205 P122387
#> 206 P132620
#> 207 P152285
#> 208 P009585
#> 209 P073882
#> 210 P177159
#> 211 P172497
#> 212 P164602
#>                                                                                                        project_name
#> 1                                                                    Amaravati Integrated Urban Development Program
#> 2                             Uttar Pradesh Agriculture Growth and Rural Enterprise Ecosystem Strengthening Project
#> 3                   Maharashtra Strengthening Institutional Capabilities in Districts for Enabling Growth Operation
#> 4                                                    Enhancing Landscape and Ecosystem Management (ELEMENT) Project
#> 5                                                                       Bahia Sustainable Rural Development Project
#> 6                                           Kerala Climate Resilient Agri- Value Chain Modernization (KERA) Project
#> 7                              Brazil Proactive, Safe, and Resilient Road Asset Management Program - State of Bahia
#> 8                   BR Enhancing Prosperity and Sustainability in the State of Sergipe Development Policy Financing
#> 9                                                Second Low-Carbon Energy Programmatic Development Policy Financing
#> 10  Development of Applied Knowledge and Skills for Human Development in Maharashtra  - (DAKSH) Maharashtra Program
#> 11                                                   Brazil: Pernambuco Rural Water and Sanitation Project (PROSAR)
#> 12                                                                      Espírito Santo Digital Acceleration Project
#> 13                                         West Bengal Boosting Logistics Efficiency and Trade Facilitation Program
#> 14                                          Integrated Sustainable Mobility Project in the Foz do Rio Itajaí Region
#> 15                                                           Uttarakhand Climate Responsive Rainfed Farming Project
#> 16                                                         Uttarakhand Disaster Preparedness and Resilience Project
#> 17                                                            BR State of Ceará Sustainable Development Policy Loan
#> 18                                                       Sustainable Human Development Project in the State of Pará
#> 19                                                           Piauí Pillars of Growth and Social Inclusion Project 2
#> 20                                                                            Assam Resilient Rural Bridges Program
#> 21                                                            Mato Grosso Sustainable Development of Family Farming
#> 22                             Sikkim: Integrated Service Provision and Innovation for Reviving Economies Operation
#> 23                                                           Tamil Nadu Climate Resilient Urban Development Program
#> 24                                           Brazil: Support to New Bolsa Familia Conditional Cash Transfer Program
#> 25                                         Rio de Janeiro Fiscal Management and Sustainable Development Policy Loan
#> 26                                               Mato Grosso Resilient, Inclusive, and Sustainable Learning Project
#> 27                                                           Piauí Health and Social Protection Development Project
#> 28                                                             Progestão Piauí: Public Sector Management Efficiency
#> 29                                                         Progestão Tocantins: Public Sector Management Efficiency
#> 30                                                              Progestão Acre: Public Sector Management Efficiency
#> 31                                                                 IN: Manipur Infotech eNabled Development Project
#> 32                                                                Himachal Pradesh Power Sector Development Program
#> 33                                                       Chhattisgarh: Accelerated Learning for a Knowledge-Economy
#> 34                 Assam State Secondary Healthcare Initiative for Service Delivery Transformation (ASSIST) Project
#> 35                                                       Tripura Rural Economic Growth and Service Delivery Project
#> 36                                      Multidisciplinary Education and Research Improvement in Technical Education
#> 37                                                                Additional Financing for Resilient Kerala Program
#> 38                                       West Bengal Accelerated Development of Minor Irrigation Project - Phase II
#> 39                                  Green, Resilient and Inclusive Regeneration of the Central Area of Porto Alegre
#> 40                                                     Animal Health System Support for One Health Program (AHSSOH)
#> 41                                                         Brazil: Espirito Santo Water Security Management Project
#> 42                                                             Odisha State Capability and Resilient Growth Program
#> 43                                                                 Karnataka Sustainable Rural Water Supply Program
#> 44                                                                  Assam Integrated River Basin Management Program
#> 45                                                                                   Brazil Climate Finance Project
#> 46                                          Gujarat Resilient Cities Partnership: Ahmedabad City Resilience Project
#> 47                              Systems Reform Endeavours for Transformed Health Achievement in Gujarat (SRESTHA-G)
#> 48                                                             Punjab: Building Fiscal and Institutional Resilience
#> 49                                                       Progestão Mato Grosso: Public Sector Management Efficiency
#> 50                                                           Progestão Alagoas: Public Sector Management Efficiency
#> 51                                               Additional Financing: Rooftop Solar Program for Residential sector
#> 52                                                                 India's Enhanced Health Service Delivery Program
#> 53                              PHSPP: Transforming India’s Public Health Systems for Pandemic Preparedness Program
#> 54                                     GUJARAT OUTCOMES FOR ACCELERATED LEARNING (GOAL) - ADDITIONAL FINANCING (AF)
#> 55                                                                              Fisheries Sector Prosperity Project
#> 56                                                Rio de Janeiro Adjustment and Sustainable Development Policy Loan
#> 57                   RIGHTS: Inclusion, Accessibility and Opportunities for Persons with Disabilities in Tamil Nadu
#> 58                                                                                           Rail Logistics Project
#> 59                                                      RECOVERING LEARNING LOSSES FROM COVID-19 PANDEMIC IN BRAZIL
#> 60                                 Parana Public Sector Modernization and Innovation for Service Delivery Operation
#> 61                                                                       BR State of Goias Sustainable Recovery DPF
#> 62                                                                    Public Service Capability Enhancement Project
#> 63                                  West Bengal Building State Capability for Inclusive Social Protection Operation
#> 64                                        Additional Financing - Karnataka Urban Water Supply Modernization Project
#> 65                               Rejuvenating Watersheds for Agricultural Resilience through Innovative Development
#> 66                                                  West Bengal Electricity Distribution Grid Modernization Project
#> 67                           Shimla-Himachal Pradesh Water Supply and Sewerage Services Improvement Program (PforR)
#> 68                                                                   Meghalaya Health Systems Strengthening Project
#> 69                                                     Chennai City Partnership: Sustainable Urban Services Program
#> 70                                                                                     The Resilient Kerala Program
#> 71                                                                      Supporting Andhra's Learning Transformation
#> 72                                                                        Raising and Accelerating MSME Performance
#> 73                                                                    Punjab Municipal Services Improvement Project
#> 74                                                                     Mizoram Health Systems Strengthening Project
#> 75                                                                 Gujarat Outcomes for Accelerated Learning (GOAL)
#> 76                                                                            Kerala Solid Waste Management Project
#> 77                                          Chhattisgarh Inclusive Rural and Accelerated Agriculture Growth Project
#> 78                                                             Nagaland: Enhancing Classroom Teaching and Resources
#> 79                             Second Dam Rehabilitation and Improvement Project - Additional Financing (DRIP-2 AF)
#> 80                                    West Bengal Inland Water Transport, Logistics and Spatial Development Project
#> 81                                                                           Meghalaya Integrated Transport Project
#> 82                                                         Salvador Social Multi-Sector Service Delivery Project II
#> 83                                                                      Second National Ganga River Basin Guarantee
#> 84                                                                        Second National Ganga River Basin Project
#> 85                                                          Strengthening Teaching-Learning  And Results for States
#> 86                                                              Energy and Mineral Sectors Strengthening Project II
#> 87                                                               Tamil Nadu Housing and Habitat Development Project
#> 88                                                                  São Paulo Aricanduva Bus Rapid Transit Corridor
#> 89                                                                         Green National Highways Corridor Project
#> 90                                                              Himachal Pradesh State Roads Transformation Project
#> 91                                                        Linha de Crédito para Resiliência Urbana no Sul do Brasil
#> 92                                Improving Mobility and Urban Inclusion in the Amazonas Corridor in Belo Horizonte
#> 93      Integrated Project for Source Sustainability and Climate Resilient Rain-fed Agriculture in Himachal Pradesh
#> 94                                             State of Maharashtra's Agribusiness and Rural Transformation Project
#> 95                                                                             Assam Inland Water Transport Project
#> 96                                                        West Bengal Major Irrigation and Flood Management Project
#> 97                                           Odisha Integrated Irrigation Project for Climate Resilient Agriculture
#> 98                                                                              Ceará Water Security and Governance
#> 99                                                 Ceara Rural Sustainable Development and Competitiveness Phase II
#> 100                                                             Andhra Pradesh Health Systems Strengthening Project
#> 101                                                               Innovation in Solar Power and Hybrid Technologies
#> 102                                                                     Program Towards Elimination of Tuberculosis
#> 103                                                                 Rajasthan State Highways Development Program II
#> 104                                                   Uttarakhand Public Financial Management Strengthening Project
#> 105                                             Paraiba Improving Water Resources Management and Services Provision
#> 106                                             Chhattisgarh Public Financial Management and Accountability Program
#> 107            SABESP - IMPROVING WATER SERVICE ACCESS AND SECURITY IN THE METROPOLITAN REGION OF SÃO PAULO PROJECT
#> 108                                                                         Jharkhand Municipal Development Project
#> 109                                                   AP Integrated Irrigation & Agriculture Transformation Project
#> 110                                                                      Jharkhand Power System Improvement Project
#> 111                                           Atal Bhujal Yojana (Abhy)-National Groundwater Management Improvement
#> 112                                                          Strengthening Public Financial Management in Rajasthan
#> 113                                                           Uttarakhand Water Supply Program for Peri Urban Areas
#> 114                                                           Support to Upper Secondary Reform in Brazil Operation
#> 115                                                          Tamil Nadu Irrigated Agriculture Modernization Project
#> 116                                                                 Tamil Nadu Rural Transformation Project (TNRTP)
#> 117                                                                           Paraiba Sustainable Rural Development
#> 118                                                             Assam Agribusiness and Rural Transformation Project
#> 119                                                                             Innovate in India for Inclusiveness
#> 120                                                                 Fortaleza Sustainable Urban Development Project
#> 121                                                                        Madhya Pradesh Urban Development Project
#> 122                                     Capacity Augmentation of the National Waterway- 1 (JAL MARG VIKAS)  Project
#> 123                                                                                      National Hydrology Project
#> 124                                                                  Uttarakhand Health Systems Development Project
#> 125                                                                            Grid-Connected Rooftop Solar Program
#> 126                                                           IN Karnataka Urban Water Supply Modernization Project
#> 127                                                                            Bihar Kosi Basin Development Project
#> 128                                                                          Jhelum and Tawi Flood Recovery Project
#> 129                                                                      Vishnugad Pipalkoti Hydro Electric Project
#> 130                                                               RF Science Centers - Emergency Assistance Project
#> 131                                                                                                       BR PE DPL
#> 132                                                 Brazil Enhancing Productivity, Sustainability and Inclusion DPF
#> 133                                                            Subterranean Arsenic Removal: Experiment to Delivery
#> 134  India Supporting Socioeconomic Development and Livelihood Security among Particularly Vulnerable Tribal Groups
#> 135                                             Rio Grande do Norte: Sustainable Development and Governance Project
#> 136                                                                    India: FaL-G High Capacity Automation Plants
#> 137                                                    Tamil Nadu Women Employment and Safety (TN WESAFE) Operation
#> 138                                                               Himachal Disaster Recovery and Resilience Project
#> 139                                                         Combining income and forest protection: açaí production
#> 140                                                                              Institutions MPA – Phase 1 (Assam)
#> 141                                                                                                             IPF
#> 142                                                                                                    PPP SP Rails
#> 143                                  Brazil Electromobility Multiphase Programmatic Approach – MPA Phase 2 Salvador
#> 144                        Amazon and Cerrado Bioeconomy, Forest Restoration, and Climate-Smart Agriculture Project
#> 145                                                                                                      BR Digital
#> 146                                                                                       Brazil: ASL Xingu project
#> 147                   Meghalaya Multisectoral Project for Adolescent Wellbeing, Empowerment and Resilience (MPOWER)
#> 148                                                                                                   SC Resilience
#> 149                                                                               Promoting Green Hydrogen in India
#> 150                                                                                                 SP Metro Line 2
#> 151                                                                  Sergipe Efficient Digital Acceleration project
#> 152  Brazil Proactive, Safe and Resilient Road Asset Management Program - State of Espirito Santo Project - Phase 2
#> 153                                                          Rajasthan Highway Modernization Project (RHMP) Phase-2
#> 154                                                                          Allian Duhangan Hydro Electric Project
#> 155                                                   Expanding Clean Hydrogen in Brazil - Ceara Green Hydrogen Hub
#> 156                                                                Strengthening Coastal Resilience and the Economy
#> 157                BR State of Rio Grande do Sul Sustainable Recovery and Climate Resilient Development Policy Loan
#> 158                                                Brazil: Decarbonization of Energy-Intensive Value Chains Project
#> 159                                                                      Uttar Pradesh Clean Air Management Program
#> 160                                                      Punjab Outcomes-Acceleration In School Education Operation
#> 161                                                                                                    MS Pro-Roads
#> 162                                                                        West Bengal Health System Reform Program
#> 163                                                        Hybrid PPP - São Paulo Commuter Rail Lines 11, 12 and 13
#> 164                                                    Private-Delivered Metro Sao Paulo Line 4 Phase III Extension
#> 165                                                                                                         SRH P4R
#> 166                                                    Brazil Electromobility and Energy Transition Finance Project
#> 167                                        Electric Vehicle Operations and Lending for a Vibrant Ecosystem (EVOLVE)
#> 168                                                          IN: Digital Empowerment and Services to Harness Growth
#> 169                                                                                                 Tocantins PRIDP
#> 170                                      Santa Catarina Rural Development Project for Sustainability and Innovation
#> 171                                                         BR State of Alagoas Sustainable Development Policy Loan
#> 172                                                                                                  AM Sustainable
#> 173                                                                  India-West Bengal Health System Reform Program
#> 174                                                                            Surat Resilience Enhancement Project
#> 175                                                                                                   PForR Project
#> 176                                                                                                           AHEAD
#> 177                                                                                                        PoCRA-II
#> 178                                                             Energy Transition of the Northeast Region of Brazil
#> 179                                         Second Amazona Fiscal and Environmental Sustainability Programmatic DPF
#> 180                                                                 Karnataka Water Security and Resilience Program
#> 181                                                                                                   Bahia SIP DPL
#> 182                                                            India - Enhancing Innovation among ICMR Institutions
#> 183                                                      Progestão Program - MPA Phase 1 State of Rio Grande do Sul
#> 184                                                                                                             SS3
#> 185                                                                        Skills: National ITI Upgradation Program
#> 186                                Strengthening Social Assistance Delivery System in the Municipality of São Paulo
#> 187                                        Electrification and Improvement of the São Paulo Urban Transport Program
#> 188                                                                      Gurugram Metro Huda to Cyber City, Haryana
#> 189                                                                                                     IPF Regular
#> 190                                                         Accelerating the Energy Transition in the Amazon (AETA)
#> 191                                                     Agroecology and Sustainable Rural Development in Pernambuco
#> 192                                                                                                            MEGA
#> 193                                                                  Bahia Urban Socio-Productive Inclusion Project
#> 194                                                                       Kerala Health Systems Improvement Program
#> 195                                                                                                            MRDP
#> 196                                                                   Assam Governance and Service Delivery Program
#> 197                                                                       Collective Land Ownership Model for Women
#> 198                                                           Haryana Clean Air and Sustainable Development Program
#> 199 Brazil Proactive, Safe, and Resilient Road Asset Management Program - State of Santa Catarina Project - Phase 3
#> 200                              Second Dam Rehabilitation and Improvement Project - Additional Financing (DRIP -3)
#> 201                                                              Partial Risk Sharing Facility in Energy Efficiency
#> 202                                                                           Amazon Sustainable Landscapes Project
#> 203                                                   Additional Financing for Grid-Connected Rooftop Solar Program
#> 204                                                            Brazil Amazon Sustainable Landscapes Project Phase 2
#> 205                                                                     DFID TF III Supervision and Fiduciary Costs
#> 206                                                              Partial Risk Sharing Facility in Energy Efficiency
#> 207                                                                     Brazil Investment Plan Coordination Project
#> 208                                                                                                           ODS I
#> 209                                                                  RF 2nd Amazon Fire Prevention and Mobilization
#> 210                                                       Monitoring and Evaluation capacity building in South Asia
#> 211                                                          Sustainable Multiple Use Landscape Consortia in Brazil
#> 212                                                    Integrated Landscape Management in the Cerrado Biome Project
#>       status approval_date closing_date country_code country
#> 1     Active    2024-12-19         <NA>           IN   India
#> 2     Active    2024-12-12   2030-09-30           IN   India
#> 3     Active    2024-12-03   2030-03-31           IN   India
#> 4     Active    2024-11-25   2030-06-30           IN   India
#> 5     Active    2024-11-07   2030-10-30           BR  Brazil
#> 6     Active    2024-10-31   2029-11-30           IN   India
#> 7     Active    2024-09-10   2032-11-30           BR  Brazil
#> 8     Active    2024-08-27   2026-12-31           BR  Brazil
#> 9     Active    2024-06-28   2026-06-30           IN   India
#> 10    Active    2024-05-22   2029-03-30           IN   India
#> 11    Active    2024-05-17   2032-07-14           BR  Brazil
#> 12    Active    2024-05-17   2029-06-30           BR  Brazil
#> 13    Active    2024-04-24   2028-06-30           IN   India
#> 14    Active    2024-04-12   2031-11-30           BR  Brazil
#> 15    Active    2024-04-01   2030-03-31           IN   India
#> 16    Active    2024-04-01   2029-06-30           IN   India
#> 17    Active    2024-03-28   2025-12-31           BR  Brazil
#> 18    Active    2024-03-28   2029-04-30           BR  Brazil
#> 19    Active    2024-03-14   2029-07-31           BR  Brazil
#> 20    Active    2024-03-01   2030-06-28           IN   India
#> 21    Active    2024-02-05   2030-05-15           BR  Brazil
#> 22    Active    2023-12-21   2029-04-30           IN   India
#> 23    Active    2023-12-21   2030-12-31           IN   India
#> 24    Active    2023-12-06   2026-04-30           BR  Brazil
#> 25    Active    2023-11-16   2024-12-31           BR  Brazil
#> 26    Active    2023-10-26   2028-12-31           BR  Brazil
#> 27    Active    2023-10-05   2029-06-30           BR  Brazil
#> 28    Active    2023-10-03   2029-06-29           BR  Brazil
#> 29    Active    2023-07-24   2028-12-29           BR  Brazil
#> 30    Active    2023-07-24   2028-12-29           BR  Brazil
#> 31    Active    2023-07-06   2028-09-30           IN   India
#> 32    Active    2023-06-27   2028-03-31           IN   India
#> 33    Active    2023-06-26   2028-09-29           IN   India
#> 34    Active    2023-06-26   2029-11-30           IN   India
#> 35    Active    2023-06-26   2029-06-30           IN   India
#> 36    Active    2023-06-23   2028-12-29           IN   India
#> 37    Active    2023-06-16         <NA>           IN   India
#> 38    Active    2023-06-09   2029-06-29           IN   India
#> 39    Active    2023-06-07   2028-12-29           BR  Brazil
#> 40    Active    2023-05-10   2027-11-30           IN   India
#> 41    Active    2023-05-09   2029-06-30           BR  Brazil
#> 42    Active    2023-03-28   2028-04-26           IN   India
#> 43    Active    2023-03-28   2028-06-01           IN   India
#> 44    Active    2023-03-24   2027-07-31           IN   India
#> 45    Active    2022-12-22   2028-04-30           BR  Brazil
#> 46    Active    2022-11-22   2028-12-31           IN   India
#> 47    Active    2022-09-21   2028-03-31           IN   India
#> 48    Active    2022-09-19   2027-06-30           IN   India
#> 49    Active    2022-08-23   2028-06-30           BR  Brazil
#> 50    Active    2022-07-21   2028-03-31           BR  Brazil
#> 51    Active    2022-06-28         <NA>           IN   India
#> 52    Active    2022-06-28   2027-06-30           IN   India
#> 53    Active    2022-06-28   2027-12-31           IN   India
#> 54    Active    2022-06-21         <NA>           IN   India
#> 55    Active    2022-06-17   2027-06-30           IN   India
#> 56    Active    2022-06-16   2024-12-31           BR  Brazil
#> 57    Active    2022-06-14   2028-06-30           IN   India
#> 58    Active    2022-06-10   2027-06-30           IN   India
#> 59    Active    2022-05-12   2027-12-31           BR  Brazil
#> 60    Active    2022-04-28   2027-10-31           BR  Brazil
#> 61    Active    2022-04-28   2024-12-31           BR  Brazil
#> 62    Active    2022-04-27   2027-03-31           IN   India
#> 63    Active    2022-01-19   2028-08-31           IN   India
#> 64    Active    2021-12-21         <NA>           IN   India
#> 65    Active    2021-12-10   2026-06-30           IN   India
#> 66    Active    2021-11-29   2026-11-30           IN   India
#> 67    Active    2021-11-05   2026-12-31           IN   India
#> 68    Active    2021-09-30   2027-03-31           IN   India
#> 69    Active    2021-09-30   2026-12-31           IN   India
#> 70    Active    2021-06-24   2028-06-30           IN   India
#> 71    Active    2021-06-17   2026-12-31           IN   India
#> 72    Active    2021-06-04   2026-09-30           IN   India
#> 73    Active    2021-03-31   2026-09-30           IN   India
#> 74    Active    2021-03-31   2026-03-31           IN   India
#> 75    Active    2021-03-24   2027-09-30           IN   India
#> 76    Active    2021-03-09   2027-06-30           IN   India
#> 77    Active    2020-12-15   2026-07-31           IN   India
#> 78    Active    2020-12-15   2026-06-30           IN   India
#> 79    Active    2020-12-15   2027-12-31           IN   India
#> 80    Active    2020-11-30   2026-03-31           IN   India
#> 81    Active    2020-10-23   2026-10-31           IN   India
#> 82    Active    2020-09-22   2025-12-30           BR  Brazil
#> 83    Active    2020-06-25   2026-12-31           IN   India
#> 84    Active    2020-06-25   2026-12-31           IN   India
#> 85    Active    2020-06-24   2025-12-31           IN   India
#> 86    Active    2020-05-22   2025-12-31           BR  Brazil
#> 87    Active    2020-05-18   2025-06-30           IN   India
#> 88    Active    2020-04-22   2026-06-30           BR  Brazil
#> 89    Active    2020-03-27   2025-03-18           IN   India
#> 90    Active    2020-03-27   2026-06-30           IN   India
#> 91    Active    2020-03-24   2026-06-30           BR  Brazil
#> 92    Active    2020-03-24   2028-09-30           BR  Brazil
#> 93    Active    2020-02-18   2025-03-31           IN   India
#> 94    Active    2019-12-17   2027-03-31           IN   India
#> 95    Active    2019-12-13   2025-12-31           IN   India
#> 96    Active    2019-12-10   2025-11-30           IN   India
#> 97    Active    2019-09-30   2025-12-31           IN   India
#> 98    Active    2019-08-08   2026-12-31           BR  Brazil
#> 99    Active    2019-07-18   2025-12-31           BR  Brazil
#> 100   Active    2019-05-15   2025-03-31           IN   India
#> 101   Active    2019-03-29   2025-12-31           IN   India
#> 102   Active    2019-03-29   2025-03-31           IN   India
#> 103   Active    2019-03-29   2024-12-31           IN   India
#> 104   Active    2019-03-07   2025-06-30           IN   India
#> 105   Active    2019-02-28   2026-06-30           BR  Brazil
#> 106   Active    2019-02-21   2025-03-31           IN   India
#> 107   Active    2018-12-18   2026-06-16           BR  Brazil
#> 108   Active    2018-12-12   2025-10-31           IN   India
#> 109   Active    2018-10-23   2025-10-31           IN   India
#> 110   Active    2018-10-01   2024-12-31           IN   India
#> 111   Active    2018-06-05   2025-09-28           IN   India
#> 112   Active    2018-05-01   2025-03-31           IN   India
#> 113   Active    2018-01-04   2025-06-30           IN   India
#> 114   Active    2017-12-14   2024-12-31           BR  Brazil
#> 115   Active    2017-12-01   2025-06-02           IN   India
#> 116   Active    2017-12-01   2025-06-30           IN   India
#> 117   Active    2017-10-20   2025-06-15           BR  Brazil
#> 118   Active    2017-08-31   2025-09-30           IN   India
#> 119   Active    2017-05-31   2025-06-23           IN   India
#> 120   Active    2017-04-28   2025-03-31           BR  Brazil
#> 121   Active    2017-04-12   2024-12-30           IN   India
#> 122   Active    2017-04-12   2025-12-24           IN   India
#> 123   Active    2017-03-15   2025-03-31           IN   India
#> 124   Active    2017-01-26   2024-12-31           IN   India
#> 125   Active    2016-05-13   2027-11-30           IN   India
#> 126   Active    2016-03-31   2026-06-30           IN   India
#> 127   Active    2015-12-08   2025-03-27           IN   India
#> 128   Active    2015-06-02   2024-12-31           IN   India
#> 129   Active    2011-06-30   2024-12-31           IN   India
#> 130   Active    1994-10-28         <NA>           BR  Brazil
#> 131 Pipeline          <NA>         <NA>           BR  Brazil
#> 132 Pipeline          <NA>         <NA>           BR  Brazil
#> 133 Pipeline          <NA>   2008-12-31           IN   India
#> 134 Pipeline          <NA>         <NA>           IN   India
#> 135 Pipeline          <NA>         <NA>           BR  Brazil
#> 136 Pipeline          <NA>         <NA>           IN   India
#> 137 Pipeline          <NA>         <NA>           IN   India
#> 138 Pipeline          <NA>         <NA>           IN   India
#> 139 Pipeline          <NA>   2011-10-01           BR  Brazil
#> 140 Pipeline          <NA>         <NA>           IN   India
#> 141 Pipeline          <NA>         <NA>           IN   India
#> 142 Pipeline          <NA>         <NA>           BR  Brazil
#> 143 Pipeline          <NA>         <NA>           BR  Brazil
#> 144 Pipeline          <NA>         <NA>           BR  Brazil
#> 145 Pipeline          <NA>         <NA>           BR  Brazil
#> 146 Pipeline          <NA>         <NA>           BR  Brazil
#> 147 Pipeline          <NA>         <NA>           IN   India
#> 148 Pipeline          <NA>         <NA>           BR  Brazil
#> 149 Pipeline          <NA>         <NA>           IN   India
#> 150 Pipeline          <NA>         <NA>           BR  Brazil
#> 151 Pipeline          <NA>         <NA>           BR  Brazil
#> 152 Pipeline          <NA>         <NA>           BR  Brazil
#> 153 Pipeline          <NA>         <NA>           IN   India
#> 154 Pipeline          <NA>   2018-05-04           IN   India
#> 155 Pipeline          <NA>         <NA>           BR  Brazil
#> 156 Pipeline          <NA>         <NA>           IN   India
#> 157 Pipeline          <NA>         <NA>           BR  Brazil
#> 158 Pipeline          <NA>         <NA>           BR  Brazil
#> 159 Pipeline          <NA>         <NA>           IN   India
#> 160 Pipeline          <NA>         <NA>           IN   India
#> 161 Pipeline          <NA>         <NA>           BR  Brazil
#> 162 Pipeline          <NA>         <NA>           IN   India
#> 163 Pipeline          <NA>         <NA>           BR  Brazil
#> 164 Pipeline          <NA>         <NA>           BR  Brazil
#> 165 Pipeline          <NA>         <NA>           IN   India
#> 166 Pipeline          <NA>         <NA>           BR  Brazil
#> 167 Pipeline          <NA>         <NA>           IN   India
#> 168 Pipeline          <NA>         <NA>           IN   India
#> 169 Pipeline          <NA>         <NA>           BR  Brazil
#> 170 Pipeline          <NA>         <NA>           BR  Brazil
#> 171 Pipeline          <NA>         <NA>           BR  Brazil
#> 172 Pipeline          <NA>         <NA>           BR  Brazil
#> 173 Pipeline          <NA>         <NA>           IN   India
#> 174 Pipeline          <NA>         <NA>           IN   India
#> 175 Pipeline          <NA>         <NA>           IN   India
#> 176 Pipeline          <NA>         <NA>           IN   India
#> 177 Pipeline          <NA>         <NA>           IN   India
#> 178 Pipeline          <NA>         <NA>           BR  Brazil
#> 179 Pipeline          <NA>         <NA>           BR  Brazil
#> 180 Pipeline          <NA>         <NA>           IN   India
#> 181 Pipeline          <NA>         <NA>           BR  Brazil
#> 182 Pipeline          <NA>         <NA>           IN   India
#> 183 Pipeline          <NA>         <NA>           BR  Brazil
#> 184 Pipeline          <NA>         <NA>           BR  Brazil
#> 185 Pipeline          <NA>         <NA>           IN   India
#> 186 Pipeline          <NA>         <NA>           BR  Brazil
#> 187 Pipeline          <NA>         <NA>           BR  Brazil
#> 188 Pipeline          <NA>         <NA>           IN   India
#> 189 Pipeline          <NA>         <NA>           IN   India
#> 190 Pipeline          <NA>         <NA>           BR  Brazil
#> 191 Pipeline          <NA>         <NA>           BR  Brazil
#> 192 Pipeline          <NA>         <NA>           IN   India
#> 193 Pipeline          <NA>         <NA>           BR  Brazil
#> 194 Pipeline          <NA>         <NA>           IN   India
#> 195 Pipeline          <NA>         <NA>           IN   India
#> 196 Pipeline          <NA>         <NA>           IN   India
#> 197 Pipeline          <NA>   2011-10-01           IN   India
#> 198 Pipeline          <NA>         <NA>           IN   India
#> 199 Pipeline          <NA>         <NA>           BR  Brazil
#> 200 Pipeline          <NA>         <NA>           IN   India
#> 201   Active          <NA>   2025-03-31           IN   India
#> 202   Active          <NA>   2026-12-31           BR  Brazil
#> 203   Active          <NA>   2026-11-30           IN   India
#> 204   Active          <NA>         <NA>           BR  Brazil
#> 205   Active          <NA>         <NA>           IN   India
#> 206   Active          <NA>   2025-03-31           IN   India
#> 207   Active          <NA>   2024-11-30           BR  Brazil
#> 208   Active          <NA>         <NA>           IN   India
#> 209   Active          <NA>   2004-09-30           BR  Brazil
#> 210   Active          <NA>   2025-06-30           IN   India
#> 211   Active          <NA>   2027-11-30           BR  Brazil
#> 212   Active          <NA>   2025-11-30           BR  Brazil
#>                          region total_commitment ibrd_commitment ida_commitment
#> 1                    South Asia         0.000000          0.0000           0.00
#> 2                    South Asia       325.100000        325.1000           0.00
#> 3                    South Asia       188.280000        188.2800           0.00
#> 4                    South Asia       225.520000        225.5200           0.00
#> 5   Latin America and Caribbean       100.000000        100.0000           0.00
#> 6                    South Asia       200.000000        200.0000           0.00
#> 7   Latin America and Caribbean       150.000000        150.0000           0.00
#> 8   Latin America and Caribbean       110.000000        110.0000           0.00
#> 9                    South Asia      1500.000000       1468.5000          31.50
#> 10                   South Asia       195.000000        195.0000           0.00
#> 11  Latin America and Caribbean        90.000000         90.0000           0.00
#> 12  Latin America and Caribbean        61.220000         61.2200           0.00
#> 13                   South Asia       150.000000        150.0000           0.00
#> 14  Latin America and Caribbean        90.000000         90.0000           0.00
#> 15                   South Asia        96.200000         96.2000           0.00
#> 16                   South Asia       135.000000        135.0000           0.00
#> 17  Latin America and Caribbean       541.880000        541.8800           0.00
#> 18  Latin America and Caribbean       350.000000         70.0000         280.00
#> 19  Latin America and Caribbean        50.000000         50.0000           0.00
#> 20                   South Asia       452.000000        452.0000           0.00
#> 21  Latin America and Caribbean        80.000000         80.0000           0.00
#> 22                   South Asia       100.000000        100.0000           0.00
#> 23                   South Asia       300.000000        300.0000           0.00
#> 24  Latin America and Caribbean       300.000000        300.0000           0.00
#> 25  Latin America and Caribbean       135.238245        135.2382           0.00
#> 26  Latin America and Caribbean       100.000000        100.0000           0.00
#> 27  Latin America and Caribbean        50.000000         50.0000           0.00
#> 28  Latin America and Caribbean        50.000000         50.0000           0.00
#> 29  Latin America and Caribbean        50.000000         50.0000           0.00
#> 30  Latin America and Caribbean        40.000000         40.0000           0.00
#> 31                   South Asia        46.000000         46.0000           0.00
#> 32                   South Asia       200.000000        200.0000           0.00
#> 33                   South Asia       300.000000        300.0000           0.00
#> 34                   South Asia       251.030000        251.0300           0.00
#> 35                   South Asia       140.000000        140.0000           0.00
#> 36                   South Asia       255.500000        255.5000           0.00
#> 37                   South Asia       150.000000        150.0000           0.00
#> 38                   South Asia       148.000000        148.0000           0.00
#> 39  Latin America and Caribbean        84.550000         84.5500           0.00
#> 40                   South Asia        82.000000         82.0000           0.00
#> 41  Latin America and Caribbean        86.100000         86.1000           0.00
#> 42                   South Asia       100.000000        100.0000           0.00
#> 43                   South Asia       363.000000        363.0000           0.00
#> 44                   South Asia       108.000000        108.0000           0.00
#> 45  Latin America and Caribbean       500.000000        500.0000           0.00
#> 46                   South Asia       280.000000        280.0000           0.00
#> 47                   South Asia       350.000000        350.0000           0.00
#> 48                   South Asia       150.000000        150.0000           0.00
#> 49  Latin America and Caribbean        40.000000         40.0000           0.00
#> 50  Latin America and Caribbean        40.000000         40.0000           0.00
#> 51                   South Asia       165.000000        150.0000           0.00
#> 52                   South Asia       500.000000        500.0000           0.00
#> 53                   South Asia       500.000000        500.0000           0.00
#> 54                   South Asia       250.000000        250.0000           0.00
#> 55                   South Asia       200.000000        150.0000           0.00
#> 56  Latin America and Caribbean       135.238245        135.2382           0.00
#> 57                   South Asia       162.000000        162.0000           0.00
#> 58                   South Asia       245.000000        245.0000           0.00
#> 59  Latin America and Caribbean       250.000000        250.0000           0.00
#> 60  Latin America and Caribbean       130.000000        130.0000           0.00
#> 61  Latin America and Caribbean       500.000000        500.0000           0.00
#> 62                   South Asia        47.000000         47.0000           0.00
#> 63                   South Asia       125.000000        125.0000           0.00
#> 64                   South Asia       150.000000        150.0000           0.00
#> 65                   South Asia       115.000000        115.0000           0.00
#> 66                   South Asia       270.000000        135.0000           0.00
#> 67                   South Asia       160.000000        160.0000           0.00
#> 68                   South Asia        40.000000         40.0000           0.00
#> 69                   South Asia       300.000000        150.0000           0.00
#> 70                   South Asia       370.000000        125.0000           0.00
#> 71                   South Asia       250.000000        250.0000           0.00
#> 72                   South Asia       500.000000        500.0000           0.00
#> 73                   South Asia       210.000000        105.0000           0.00
#> 74                   South Asia        32.000000         32.0000           0.00
#> 75                   South Asia       750.000000        500.0000           0.00
#> 76                   South Asia       210.000000        105.0000           0.00
#> 77                   South Asia       167.000000        100.0000           0.00
#> 78                   South Asia        68.000000         68.0000           0.00
#> 79                   South Asia       500.000000        250.0000           0.00
#> 80                   South Asia       105.000000        105.0000           0.00
#> 81                   South Asia       120.000000        120.0000           0.00
#> 82  Latin America and Caribbean       125.000000        125.0000           0.00
#> 83                   South Asia       381.000000        381.0000           0.00
#> 84                   South Asia       381.000000        381.0000           0.00
#> 85                   South Asia       500.000000        500.0000           0.00
#> 86  Latin America and Caribbean        38.000000         38.0000           0.00
#> 87                   South Asia        50.000000         50.0000           0.00
#> 88  Latin America and Caribbean        97.000000         97.0000           0.00
#> 89                   South Asia       466.350000        466.3500           0.00
#> 90                   South Asia        82.000000         82.0000           0.00
#> 91  Latin America and Caribbean        98.800000         98.8000           0.00
#> 92  Latin America and Caribbean        80.000000         80.0000           0.00
#> 93                   South Asia        80.000000         80.0000           0.00
#> 94                   South Asia       210.000000        210.0000           0.00
#> 95                   South Asia        88.000000         88.0000           0.00
#> 96                   South Asia       290.000000        145.0000           0.00
#> 97                   South Asia       165.000000        165.0000           0.00
#> 98  Latin America and Caribbean       139.880000        139.8800           0.00
#> 99  Latin America and Caribbean       100.000000        100.0000           0.00
#> 100                  South Asia       328.000000        328.0000           0.00
#> 101                  South Asia       199.810000        150.0000           0.00
#> 102                  South Asia       400.000000        400.0000           0.00
#> 103                  South Asia       250.000000        250.0000           0.00
#> 104                  South Asia        31.580000         31.5800           0.00
#> 105 Latin America and Caribbean       126.886000        126.8860           0.00
#> 106                  South Asia        25.200000         25.2000           0.00
#> 107 Latin America and Caribbean       250.000000        250.0000           0.00
#> 108                  South Asia       122.000000        122.0000           0.00
#> 109                  South Asia       172.200000        172.2000           0.00
#> 110                  South Asia       310.000000        310.0000           0.00
#> 111                  South Asia       450.000000        450.0000           0.00
#> 112                  South Asia        21.700000         21.7000           0.00
#> 113                  South Asia       120.000000        120.0000           0.00
#> 114 Latin America and Caribbean       250.000000        250.0000           0.00
#> 115                  South Asia       318.000000        318.0000           0.00
#> 116                  South Asia       100.000000        100.0000           0.00
#> 117 Latin America and Caribbean        50.000000         50.0000           0.00
#> 118                  South Asia       200.000000        200.0000           0.00
#> 119                  South Asia       125.000000        125.0000           0.00
#> 120 Latin America and Caribbean        73.300000         73.3000           0.00
#> 121                  South Asia       116.200000        116.2000           0.00
#> 122                  South Asia       375.000000        375.0000           0.00
#> 123                  South Asia       175.000000        175.0000           0.00
#> 124                  South Asia       100.000000          0.0000         100.00
#> 125                  South Asia       648.000000        500.0000           0.00
#> 126                  South Asia       100.000000        100.0000           0.00
#> 127                  South Asia       250.000000          0.0000         250.00
#> 128                  South Asia       250.000000          0.0000         250.00
#> 129                  South Asia       648.000000        648.0000           0.00
#> 130 Latin America and Caribbean         6.400000          0.0000           0.00
#> 131 Latin America and Caribbean         0.000000          0.0000           0.00
#> 132 Latin America and Caribbean         0.000000          0.0000           0.00
#> 133                  South Asia         0.000000          0.0000           0.00
#> 134                  South Asia         0.000000          0.0000           0.00
#> 135 Latin America and Caribbean        45.000000          0.0000          45.00
#> 136                  South Asia         0.000000          0.0000           0.00
#> 137                  South Asia       150.000000        150.0000           0.00
#> 138                  South Asia         0.000000          0.0000           0.00
#> 139 Latin America and Caribbean         0.000000          0.0000           0.00
#> 140                  South Asia         0.000000          0.0000           0.00
#> 141                  South Asia         0.000000          0.0000           0.00
#> 142 Latin America and Caribbean         0.000000          0.0000           0.00
#> 143 Latin America and Caribbean         0.000000          0.0000           0.00
#> 144 Latin America and Caribbean         0.000000          0.0000           0.00
#> 145 Latin America and Caribbean         0.000000          0.0000           0.00
#> 146 Latin America and Caribbean         8.560000          0.0000           8.56
#> 147                  South Asia         0.000000          0.0000           0.00
#> 148 Latin America and Caribbean         0.000000          0.0000           0.00
#> 149                  South Asia      1000.000000       1000.0000           0.00
#> 150 Latin America and Caribbean       900.000000          0.0000         900.00
#> 151 Latin America and Caribbean        13.400000         13.4000           0.00
#> 152 Latin America and Caribbean       162.400000          0.0000         162.40
#> 153                  South Asia       250.000000          0.0000         250.00
#> 154                  South Asia         0.000000          0.0000           0.00
#> 155 Latin America and Caribbean        90.000000         90.0000           0.00
#> 156                  South Asia       212.640000        212.6400           0.00
#> 157 Latin America and Caribbean         0.000000          0.0000           0.00
#> 158 Latin America and Caribbean         0.000000          0.0000           0.00
#> 159                  South Asia       350.000000        350.0000           0.00
#> 160                  South Asia       135.000000          0.0000         135.00
#> 161 Latin America and Caribbean       200.000000          0.0000         200.00
#> 162                  South Asia         0.000000          0.0000           0.00
#> 163 Latin America and Caribbean       100.000000        100.0000           0.00
#> 164 Latin America and Caribbean         0.000000          0.0000           0.00
#> 165                  South Asia         0.000000          0.0000           0.00
#> 166 Latin America and Caribbean         0.000000          0.0000           0.00
#> 167                  South Asia         0.000000          0.0000           0.00
#> 168                  South Asia      5400.000000          0.0000        5400.00
#> 169 Latin America and Caribbean         0.000000          0.0000           0.00
#> 170 Latin America and Caribbean         0.000000          0.0000           0.00
#> 171 Latin America and Caribbean         0.000000          0.0000           0.00
#> 172 Latin America and Caribbean         0.000000          0.0000           0.00
#> 173                  South Asia       315.000000        315.0000           0.00
#> 174                  South Asia       196.000000          0.0000         196.00
#> 175                  South Asia         0.000000          0.0000           0.00
#> 176                  South Asia         0.000000          0.0000           0.00
#> 177                  South Asia       490.000000          0.0000         490.00
#> 178 Latin America and Caribbean         0.000000          0.0000           0.00
#> 179 Latin America and Caribbean       200.000000        200.0000           0.00
#> 180                  South Asia         0.000000          0.0000           0.00
#> 181 Latin America and Caribbean         0.000000          0.0000           0.00
#> 182                  South Asia         1.000000          1.0000           0.00
#> 183 Latin America and Caribbean        50.000000         50.0000           0.00
#> 184 Latin America and Caribbean         0.000000          0.0000           0.00
#> 185                  South Asia         0.000000          0.0000           0.00
#> 186 Latin America and Caribbean         0.000000          0.0000           0.00
#> 187 Latin America and Caribbean      2300.000000       2300.0000           0.00
#> 188                  South Asia       131.000000        131.0000           0.00
#> 189                  South Asia         0.000000          0.0000           0.00
#> 190 Latin America and Caribbean         0.000000          0.0000           0.00
#> 191 Latin America and Caribbean        50.000000          0.0000          50.00
#> 192                  South Asia         0.000000          0.0000           0.00
#> 193 Latin America and Caribbean        30.000000          0.0000          30.00
#> 194                  South Asia       280.000000          0.0000         280.00
#> 195                  South Asia         0.000000          0.0000           0.00
#> 196                  South Asia         0.000000          0.0000           0.00
#> 197                  South Asia         0.000000          0.0000           0.00
#> 198                  South Asia      2830.250000        128.0000        2702.25
#> 199 Latin America and Caribbean       375.000000          0.0000         375.00
#> 200                  South Asia       420.000000        420.0000           0.00
#> 201                  South Asia        18.000000          0.0000           0.00
#> 202 Latin America and Caribbean        60.330000          0.0000           0.00
#> 203                  South Asia        22.935780          0.0000           0.00
#> 204 Latin America and Caribbean        19.284404          0.0000           0.00
#> 205                  South Asia         1.160000          0.0000           0.00
#> 206                  South Asia        25.000000          0.0000           0.00
#> 207 Latin America and Caribbean         1.000000          0.0000           0.00
#> 208                  South Asia         1.300000          0.0000           0.00
#> 209 Latin America and Caribbean         1.100000          0.0000           0.00
#> 210                  South Asia         0.852516          0.0000           0.00
#> 211 Latin America and Caribbean        24.577982          0.0000           0.00
#> 212 Latin America and Caribbean        21.000000          0.0000           0.00
#>                lending_instrument
#> 1   Program-for-Results Financing
#> 2    Investment Project Financing
#> 3   Program-for-Results Financing
#> 4    Investment Project Financing
#> 5    Investment Project Financing
#> 6    Investment Project Financing
#> 7    Investment Project Financing
#> 8      Development Policy Lending
#> 9      Development Policy Lending
#> 10  Program-for-Results Financing
#> 11   Investment Project Financing
#> 12   Investment Project Financing
#> 13  Program-for-Results Financing
#> 14   Investment Project Financing
#> 15   Investment Project Financing
#> 16   Investment Project Financing
#> 17     Development Policy Lending
#> 18   Investment Project Financing
#> 19   Investment Project Financing
#> 20  Program-for-Results Financing
#> 21   Investment Project Financing
#> 22  Program-for-Results Financing
#> 23  Program-for-Results Financing
#> 24   Investment Project Financing
#> 25     Development Policy Lending
#> 26   Investment Project Financing
#> 27   Investment Project Financing
#> 28   Investment Project Financing
#> 29   Investment Project Financing
#> 30   Investment Project Financing
#> 31   Investment Project Financing
#> 32  Program-for-Results Financing
#> 33  Program-for-Results Financing
#> 34   Investment Project Financing
#> 35   Investment Project Financing
#> 36   Investment Project Financing
#> 37  Program-for-Results Financing
#> 38   Investment Project Financing
#> 39   Investment Project Financing
#> 40  Program-for-Results Financing
#> 41   Investment Project Financing
#> 42  Program-for-Results Financing
#> 43  Program-for-Results Financing
#> 44   Investment Project Financing
#> 45   Investment Project Financing
#> 46   Investment Project Financing
#> 47  Program-for-Results Financing
#> 48  Program-for-Results Financing
#> 49   Investment Project Financing
#> 50   Investment Project Financing
#> 51  Program-for-Results Financing
#> 52  Program-for-Results Financing
#> 53  Program-for-Results Financing
#> 54  Program-for-Results Financing
#> 55   Investment Project Financing
#> 56     Development Policy Lending
#> 57   Investment Project Financing
#> 58   Investment Project Financing
#> 59  Program-for-Results Financing
#> 60  Program-for-Results Financing
#> 61     Development Policy Lending
#> 62   Investment Project Financing
#> 63  Program-for-Results Financing
#> 64   Investment Project Financing
#> 65  Program-for-Results Financing
#> 66   Investment Project Financing
#> 67  Program-for-Results Financing
#> 68   Investment Project Financing
#> 69  Program-for-Results Financing
#> 70  Program-for-Results Financing
#> 71  Program-for-Results Financing
#> 72  Program-for-Results Financing
#> 73   Investment Project Financing
#> 74   Investment Project Financing
#> 75  Program-for-Results Financing
#> 76   Investment Project Financing
#> 77   Investment Project Financing
#> 78   Investment Project Financing
#> 79   Investment Project Financing
#> 80   Investment Project Financing
#> 81   Investment Project Financing
#> 82   Investment Project Financing
#> 83   Investment Project Financing
#> 84   Investment Project Financing
#> 85  Program-for-Results Financing
#> 86   Investment Project Financing
#> 87   Investment Project Financing
#> 88   Investment Project Financing
#> 89   Investment Project Financing
#> 90   Investment Project Financing
#> 91   Investment Project Financing
#> 92   Investment Project Financing
#> 93   Investment Project Financing
#> 94   Investment Project Financing
#> 95   Investment Project Financing
#> 96   Investment Project Financing
#> 97   Investment Project Financing
#> 98   Investment Project Financing
#> 99   Investment Project Financing
#> 100  Investment Project Financing
#> 101  Investment Project Financing
#> 102 Program-for-Results Financing
#> 103  Investment Project Financing
#> 104  Investment Project Financing
#> 105  Investment Project Financing
#> 106 Program-for-Results Financing
#> 107  Investment Project Financing
#> 108  Investment Project Financing
#> 109  Investment Project Financing
#> 110  Investment Project Financing
#> 111 Program-for-Results Financing
#> 112  Investment Project Financing
#> 113 Program-for-Results Financing
#> 114 Program-for-Results Financing
#> 115  Investment Project Financing
#> 116  Investment Project Financing
#> 117  Investment Project Financing
#> 118  Investment Project Financing
#> 119  Investment Project Financing
#> 120  Investment Project Financing
#> 121  Investment Project Financing
#> 122  Investment Project Financing
#> 123  Investment Project Financing
#> 124  Investment Project Financing
#> 125 Program-for-Results Financing
#> 126  Investment Project Financing
#> 127  Investment Project Financing
#> 128  Investment Project Financing
#> 129  Investment Project Financing
#> 130                          <NA>
#> 131    Development Policy Lending
#> 132    Development Policy Lending
#> 133      Specific Investment Loan
#> 134  Investment Project Financing
#> 135  Investment Project Financing
#> 136                          <NA>
#> 137 Program-for-Results Financing
#> 138  Investment Project Financing
#> 139      Specific Investment Loan
#> 140 Program-for-Results Financing
#> 141  Investment Project Financing
#> 142  Investment Project Financing
#> 143  Investment Project Financing
#> 144  Investment Project Financing
#> 145  Investment Project Financing
#> 146  Investment Project Financing
#> 147  Investment Project Financing
#> 148  Investment Project Financing
#> 149 Program-for-Results Financing
#> 150  Investment Project Financing
#> 151  Investment Project Financing
#> 152  Investment Project Financing
#> 153  Investment Project Financing
#> 154                          <NA>
#> 155  Investment Project Financing
#> 156  Investment Project Financing
#> 157    Development Policy Lending
#> 158  Investment Project Financing
#> 159 Program-for-Results Financing
#> 160 Program-for-Results Financing
#> 161  Investment Project Financing
#> 162 Program-for-Results Financing
#> 163  Investment Project Financing
#> 164  Investment Project Financing
#> 165 Program-for-Results Financing
#> 166  Investment Project Financing
#> 167  Investment Project Financing
#> 168  Investment Project Financing
#> 169  Investment Project Financing
#> 170  Investment Project Financing
#> 171    Development Policy Lending
#> 172    Development Policy Lending
#> 173 Program-for-Results Financing
#> 174  Investment Project Financing
#> 175 Program-for-Results Financing
#> 176 Program-for-Results Financing
#> 177  Investment Project Financing
#> 178  Investment Project Financing
#> 179    Development Policy Lending
#> 180 Program-for-Results Financing
#> 181    Development Policy Lending
#> 182  Investment Project Financing
#> 183  Investment Project Financing
#> 184 Program-for-Results Financing
#> 185 Program-for-Results Financing
#> 186  Investment Project Financing
#> 187 Program-for-Results Financing
#> 188  Investment Project Financing
#> 189  Investment Project Financing
#> 190  Investment Project Financing
#> 191  Investment Project Financing
#> 192  Investment Project Financing
#> 193  Investment Project Financing
#> 194 Program-for-Results Financing
#> 195  Investment Project Financing
#> 196  Investment Project Financing
#> 197      Specific Investment Loan
#> 198 Program-for-Results Financing
#> 199  Investment Project Financing
#> 200  Investment Project Financing
#> 201  Investment Project Financing
#> 202  Investment Project Financing
#> 203 Program-for-Results Financing
#> 204  Investment Project Financing
#> 205  Investment Project Financing
#> 206  Investment Project Financing
#> 207  Investment Project Financing
#> 208      Specific Investment Loan
#> 209                          <NA>
#> 210  Investment Project Financing
#> 211  Investment Project Financing
#> 212  Investment Project Financing
#>                                                                                                              borrower
#> 1                                                                                                                <NA>
#> 2                                                                                                                <NA>
#> 3                                                                                                               India
#> 4                                                                                                               India
#> 5                                                                                    Government of the State of Bahia
#> 6                                                                                                                <NA>
#> 7                                                                                                                <NA>
#> 8                                                                                                    State of Sergipe
#> 9                                                                                                               India
#> 10                                                                                                               <NA>
#> 11                                                                              Government of the State of Pernambuco
#> 12                                                                              Secretaria de Economia e Planejamento
#> 13                                                                                                              India
#> 14                                                CIM - AMFRI (Foz do Rio Itaja� Region Consortium of Municipalities)
#> 15                                                                                     Department of Economic Affairs
#> 16                                                                                                Government of India
#> 17                                                                                           State Government of Cear
#> 18                                                                                                               <NA>
#> 19                                                                                                      State of Piau
#> 20                                                                                                              India
#> 21                                                                                               State of Mato Grosso
#> 22                                                                                                              India
#> 23                                                                                                Ministry of Finance
#> 24                                                                                      Federative Republic of Brazil
#> 25                                                                                     Municipality of Rio de Janeiro
#> 26                                                                                               STATE OF MATO GROSSO
#> 27                                                                                                               <NA>
#> 28                                                                                                     State of Piaui
#> 29                                                                             State Secretariat of Planning (SEPLAN)
#> 30                                                                                                      State of Acre
#> 31                                                                                                              India
#> 32                                                                                                              India
#> 33                                                                                                              India
#> 34                                                                                                              India
#> 35                                                                                                              India
#> 36                                                                                                              India
#> 37                                                                                                              India
#> 38                                                                                                              India
#> 39                                                                                                               <NA>
#> 40                                                                                                              India
#> 41                                                                                            State of Espirito Santo
#> 42                                                                                                              India
#> 43                                                                                                              India
#> 44                                                                                                              India
#> 45                                                                                                    Banco do Brasil
#> 46                                                                                                              India
#> 47                                                                                                              India
#> 48                                                                                                              India
#> 49                                                                                               State of Mato Grosso
#> 50                                          State of Alagoas, with the guarantee of the Federative Republic of Brazil
#> 51                                                                                                State Bank of India
#> 52                                                                                                              India
#> 53                                                                                                              India
#> 54                                                                         Government of Gujarat, Ministry of Finance
#> 55                                                                                                              INDIA
#> 56                                                                                     Municipality of Rio de Janeiro
#> 57                                                                                                              India
#> 58                                                            Dedicated Freight Corridor Corporation of India Limited
#> 59                                                                                  THE FEDERATIVE REPUBLIC OF BRAZIL
#> 60                                                                                                    State of Parana
#> 61                                                                                                     State of Goi�s
#> 62                                                                                                              India
#> 63                                                                                                              India
#> 64                                                                                                              India
#> 65                                                                                                              India
#> 66                                                                                                              INDIA
#> 67                                                                                                              India
#> 68                                                                                                              India
#> 69                                                                                                              India
#> 70                                                                                                              India
#> 71                                                                                                              India
#> 72                                                                                                              India
#> 73                                                                                                              India
#> 74                                                        India (Department of Economic Affairs, Government of India)
#> 75                                                                                                Ministry of Finance
#> 76                                                                                                              India
#> 77                                                                                                Ministry of Finance
#> 78                                                                                                              India
#> 79                                                                Ministry of Finance, Department of Economic Affairs
#> 80                                                                                                  Republic of India
#> 81                                                                                                              India
#> 82                                                                                           Municipality of Salvador
#> 83                                                                                                               <NA>
#> 84                                                                                                              India
#> 85                                                                                                              India
#> 86                                                                                      Federative Republic of Brazil
#> 87                                                                                                              India
#> 88                                                                                          Municipality of S�o Paulo
#> 89                                                                                                              India
#> 90                                                                                                              India
#> 91                                                            Banco Regional de Desenvolvimento do Extremo Sul (BRDE)
#> 92                                                                                        Municipio de Belo Horizonte
#> 93                                                                                                  Republic of India
#> 94                                                                                                  Republic of India
#> 95                                                                                                              India
#> 96                                                                                                  Republic of India
#> 97                                                                                                  Republic of India
#> 98                                                                                                     State of Ceara
#> 99                                                                                                     State of Ceara
#> 100                                                                                                 Republic of India
#> 101                                                                                                             India
#> 102                                                                                                 Republic of India
#> 103                                                                                                             India
#> 104                                                                                                             India
#> 105                                                                                                              <NA>
#> 106                                                                                                             India
#> 107                                                                                                            SABESP
#> 108                                                                                                             India
#> 109                                                                                                 Republic of India
#> 110                                                                                               Government of India
#> 111                                          Department of Economic Affairs, Ministry of Finance, Government of India
#> 112                                                                                                             India
#> 113                                                                                                             India
#> 114                                                                      Ministry of Economy (Minist�rio da Economia)
#> 115                                                                                                             India
#> 116                                                                    Department of Economic Affairs, Govt. of India
#> 117                                                                                       State Government of Paraiba
#> 118                                                                                                 Republic of India
#> 119                                                                                                             India
#> 120                                                                                         Municipality of Fortaleza
#> 121                                                                                                             India
#> 122                                                               Department of Economic Affairs, Government of India
#> 123                                                               Ministry of Finance, Department of Economic Affairs
#> 124                                                                                                             India
#> 125                                                                                               State Bank of India
#> 126                                                                                                             India
#> 127                                                                                                             India
#> 128                                                                                                             India
#> 129                                                                                                             India
#> 130                                                                                                              <NA>
#> 131                                                                                                              <NA>
#> 132                                                                                                              <NA>
#> 133                                                                                                              <NA>
#> 134                                                                                                              <NA>
#> 135                                                                                                              <NA>
#> 136                                                                                                              <NA>
#> 137                                                                                                             India
#> 138                                                                                                              <NA>
#> 139                                                                                                              <NA>
#> 140                                                                                                              <NA>
#> 141                                                                                                              <NA>
#> 142                                                                                                              <NA>
#> 143                                                                                                              <NA>
#> 144                                                                                                              <NA>
#> 145                                                                                                              <NA>
#> 146                                                                                                              <NA>
#> 147                                                                                                              <NA>
#> 148                                                                                                              <NA>
#> 149                                                                                               Ministry of Finance
#> 150                                                                                                              <NA>
#> 151                                                                                                              <NA>
#> 152                                                                                                              <NA>
#> 153                                                                                                              <NA>
#> 154                                                                                                              <NA>
#> 155                                                                     Complexo Industrial Portuario de Pecem (CIPP)
#> 156                                                                                                             India
#> 157                                                                                                              <NA>
#> 158                                                                                                              <NA>
#> 159                                                                                                 Republic of India
#> 160                                                                                                              <NA>
#> 161                                                                                                              <NA>
#> 162                                                                                                              <NA>
#> 163                                                                                                              <NA>
#> 164                                                                                                              <NA>
#> 165                                                                                                              <NA>
#> 166                                                                                                              <NA>
#> 167                                                                                                              <NA>
#> 168                                                                                                              <NA>
#> 169                                                                                                              <NA>
#> 170                                                                                                              <NA>
#> 171                                                                                                              <NA>
#> 172                                                                                                              <NA>
#> 173                                                                                               Ministry of Finance
#> 174                                                                                                              <NA>
#> 175                                                                                                              <NA>
#> 176                                                                                                              <NA>
#> 177                                                                                                              <NA>
#> 178                                                                                                              <NA>
#> 179                                                                                                              <NA>
#> 180                                                                                                              <NA>
#> 181                                                                                                              <NA>
#> 182                                                                                                              <NA>
#> 183                                                                                                 State of Amazonas
#> 184                                                                                                              <NA>
#> 185                                                                                                              <NA>
#> 186                                                                                                              <NA>
#> 187                                                                                                              <NA>
#> 188                                                                                               Government of India
#> 189                                                                                                              <NA>
#> 190                                                                                                              <NA>
#> 191                                                                                                              <NA>
#> 192                                                                                                              <NA>
#> 193                                                                                                              <NA>
#> 194                                                                                                              <NA>
#> 195                                                                                                              <NA>
#> 196                                                                                                              <NA>
#> 197                                                                                                              <NA>
#> 198                                                                                                              <NA>
#> 199                                                                                                              <NA>
#> 200                                                               Ministry of Finance, Department of Economic Affairs
#> 201                                                                                                              <NA>
#> 202 Fundo Brasileiro de Biodiversidade - FUNBIO, Conserva��o Internacional - CI Brazil, Funda��o Get�lio Vargas - FGV
#> 203                                                                                               State Bank of India
#> 204 Fundo Brasileiro de Biodiversidade - FUNBIO, Fundacao Getulio Vargas - FGV, Conservacao Internacional - CI Brazil
#> 205                                                                                                              <NA>
#> 206                                                                                        Government of India, India
#> 207                                                                                  Funda��o Pro-Natureza - FUNATURA
#> 208                                                                                                              <NA>
#> 209                                                                                                              <NA>
#> 210                                                            Institute for Financial Management and Research (IFMR)
#> 211                                                                                                              IICA
#> 212                                       Brazil - Deutsche Gesellschaft f�r Internationale Zusammenarbeit GmbH (GIZ)
#>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          implementing_agency
#> 1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       <NA>
#> 2                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     Department of Agriculture, Government of Uttar Pradesh
#> 3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             Planning Department, Government of Maharashtra
#> 4                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             Government of Tripura, Government of Nagaland, Ministry of Development of North Eastern Region
#> 5                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         CAR - Companhia de Desenvolvimento e Acao Regional
#> 6                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 Ishita Roy
#> 7                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          Secretary of Infrastructure of the State of Bahia
#> 8                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              State Secretariate of Finance
#> 9                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       Ministry of New and Renewable Energy
#> 10                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 11                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 Pernambuco Water and Climate Agency (Ag�ncia Pernambucana de �guas e Clima - APAC), Pernambuco Sanitation Company (Companhia Pernambucana de Saneamento - COMPESA), Secretariat of Water Resources and WSS (Secretaria de Recursos H�dricos e Saneamento)
#> 12                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             Secretaria de Estado da Ci�ncia, Tecnologia, Inova��o, Educa��o Profissional,
#> 13                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            West Bengal Department of Industries, Commerce and Enterprises
#> 14                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         Consorcio Intermunicipal Multifinalit�rio - AMFRI
#> 15                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          Watershed Management Directorate
#> 16                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                Uttarakhand State Disaster Management Authority, Government of Uttarakhand
#> 17                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                State Secretary of Finance
#> 18                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 19                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             Piau� State Secretariat for Planning (SEPLAN)
#> 20                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        Public Works Roads Department, Government of Assam
#> 21                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             State Secretary for Family Agriculture (SEAF)
#> 22                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 Planning and Development Department, Government of Sikkim
#> 23                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 Tamil Nadu Urban Infrastructure Financial Services Limited, Tamil Nadu Municipal Administration & Water Supply Department
#> 24                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   Ministry of Citizenship
#> 25                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       Secretaria Municipal de Fazenda e Planejamento, Secretaria Municipal de Transportes
#> 26                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    SECRETARIAT OF EDUCATION - MATO GROSSO
#> 27                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       State Secretariat of Health (SESAPI), State Secretariat of Social Assistance, Labor and Human Rights (SASC), State Secretariat of Planning (SEPLAN)
#> 28                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           Secretariat of Finance of Piaui
#> 29                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       UGP
#> 30                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             State Secretariat of Planning
#> 31                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      Cyber Corporation of Manipur Limited
#> 32                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     Directorate of Energy, HimUrja, HPPCL (Himachal Pradesh Power Corporation Limited), HPSEBL (Himachal Pradesh State Electricity Board Limited), HPPTCL (Himachal Pradesh Power Transmission Corporation Limited), HPSLDC (Himachal Pradesh State Load Despatch Centre)
#> 33                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     State of Chhattisgarh
#> 34                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        Assam Health Infrastructure Development and Management Society (AHIDMS), Health and Family Welfare
#> 35                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       Department of Tribal Welfare, Government of Tripura
#> 36                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     Ministry of Education
#> 37                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      Government of Kerala
#> 38                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          DWRID, Government of West Bengal
#> 39                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 40                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             Ministry of Fisheries, Animal Husbandry & Dairying, Department of Animal Husbandry & Dairying
#> 41                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                DER-ES - Buildings and Roads Department of Esp�rito Santo, CEPDEC - State Coordination for Protection and Civil Defense, SEAMA - State Secretariat for the Environment and Water Resources
#> 42                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  Finance Department, Government of Odisha
#> 43                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              Rural Drinking Water and Sanitation Department, Government of Karnataka, Rural Development and Panchayat Department, Government of Karnataka
#> 44                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            Flood and River Erosion Management Agency of Assam, Government of Assam, Water Resources Department, Assam State Disaster Management Authority
#> 45                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           Banco do Brasil
#> 46                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        Ahmedabad Municipal Corporation, Gujarat Urban Development Mission, Urban Development and Urban Housing Department
#> 47                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 Government of Gujarat through Health and Family Welfare Department (HFWD)
#> 48                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               Department of Finance, Government of Punjab
#> 49                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      Secretariat of Finance - Mato Grosso
#> 50                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 Secretariat of Finance - State of Alagoas
#> 51                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       State Bank of India
#> 52                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           Department of Health and Family Welfare, Ministry of Health and Family Welfare, Government of India, Ministry of Health and Family Welfare, Government of India
#> 53                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     Ministry of Health and Family Welfare
#> 54                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               Education Department, Government of Gujarat
#> 55                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       Department of Fisheries, Ministry of Fisheries, Animal Husbandry and Dairying, National Fisheries Development Board
#> 56                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  Secretaria Municipal de Fazenda e Planejamento, Secretaria de Transporte
#> 57                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          Department for the Welfare of Differently Abled Persons (DfWDAP)
#> 58                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   Dedicated Freight Corridor Corporation of India Limited
#> 59                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     MINISTRY OF EDUCATION
#> 60                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           Secretariat of Planning and Structured Projects
#> 61                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    State Secretariat of Agriculture and Livestock (SEAPA)
#> 62                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               Capacity Building Commission, Department of Personnel and Training, Ministry of Personnel, Public Grievances and Pensions, Karmayogi Bharat
#> 63                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       West Bengal Women & Child Development and Social Welfare Department, West Bengal Finance Department
#> 64                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 Karnataka Urban Infrastructure Development & Finance Corporation (KUIDFC)
#> 65                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    Karnataka Department of of Agriculture, Department of Land Resources, Odisha Department of Agriculture
#> 66                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                West Bengal State Electricity Distribution Company Limited
#> 67                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         Urban Development Department, Government of Himachal Pradesh, Shimla Jal Prabandhan Nigam Limited
#> 68                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          Department of Health and Family Welfare, Government of Meghalaya
#> 69                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       State of Tamil Nadu
#> 70                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      Government of Kerala
#> 71                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   State of Andhra Pradesh
#> 72                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           Ministry of Micro, Small and Medium Enterprises
#> 73                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       Ludhiana Municipal Corporation, Amritsar Municipal Corporation, Punjab Municipal Infrastructure Development Company
#> 74                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               Health and Family Welfare Department, Government of Mizoram
#> 75                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               Education Department, Government of Gujarat
#> 76                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    Local Self Government Department, Government of Kerala
#> 77                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  Chhattisgarh, Department of Agriculture Development and Farmer Welfare and Biotechnology
#> 78                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 Nagaland (Department of School Education)
#> 79  Uttarakhand Jal Vidyut Nigam Ltd., Kerala State Electricity Board (KSEB), Tamil Nadu Generation and Distribution Corporation Limited (TANGEDCO), Government of Gujarat, Water Resources Department, Government of Chhattisgarh, Water Resources Department, Government of Kerala, Water Resources Department, Government of West Bengal, Irrigation and Waterways Department, Government of Uttar Pradesh, Irrigation and Water Resources Department, Meghalaya Power Generation Corporation Ltd. (MePGCL), Government of Maharasthra, Water Resources Department, Government of Manipur, Water Resources Department, Central Water Commission (CWC), Ministry of Jal Shakti, Government of Rajasthan, Water Resources Department, Government of Odisha, Water Resources Department, Government of Tamil Nadu, Water Resources Department, Government of Madhya Pradesh, Water Resources Department, Government of Karnataka, Water Resources Department
#> 80                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 Government of West Bengal
#> 81                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  Meghalaya Infrastructure Development Finance Corporation
#> 82                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                Casa Civil
#> 83                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 84                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  National Mission for Clean Ganga, Ministry of Jal Shakti
#> 85                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     Ministry of Education
#> 86                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             Minist�rio de Minas e Energia
#> 87                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          Tamil Nadu Urban and Habitat Development Board, Chennai Metropolitan Development Authority (CMDA), Tamil Nadu Infrastructure Fund Management Corporation Limited
#> 88                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              S�o Paulo Municipal Secretariat of Urban Infrastructure and Works, S�o Paulo Municipal Secretariat of Mobility and Transport
#> 89                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   Ministry of Road Transport and Highways
#> 90                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      Himachal Pradesh Road & Other Infrastructure Development Corporation
#> 91                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   Banco Regional de Desenvolvimento do Extremo Sul (BRDE)
#> 92                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               URBEL, SMPU, SMOBI, BHTRANS
#> 93                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      Department of Forest, Government of Himachal Pradesh
#> 94                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      Department of Agriculture, Government of Maharashtra
#> 95                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          Transport Dept., Govt. of Assam, Dispur, Guwahati (Assam), India
#> 96                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        Irrigation and Waterways Department of West Bengal
#> 97                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             Agricultural Promotion and Investment Corporation of Odisha Limited, Odisha Community Tank Development and Management Society,  Department of Water Resources
#> 98                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 Ceara Economic Research and Strategy Institute - IPECE, Ceara Water and Sanitation Utility - CAGECE, Secretariat of Water Resources - SRH
#> 99                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       Secretariat of Agrarian Development
#> 100                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                Department of Health, Medical and Family Welfare, Govt. of Andhra Pradesh
#> 101                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                Solar Energy Corporation of India Limited
#> 102                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    Ministry of Health and Family Welfare
#> 103                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         Rajasthan State Highway Authority (RSHA), The State of Rajasthan
#> 104                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            Finance Department, Government of Uttarakhand
#> 105                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              CAGEPA - State Water and Sanitation Company
#> 106                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           Finance Department, Government of Chhattisgarh
#> 107                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   SABESP
#> 108                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        Urban Development and Housing Department, Government of Jharkhand
#> 109                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             Government of Andhra Pradesh
#> 110                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   Jharkhand Urja Sancharan Nigam Ltd., Jharkhand Bijli Vitran Nigam Ltd.
#> 111                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      The Department of Water Resources, Ganga Rejuvenation and River Development, Ministry of Jal Shakti
#> 112                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     Department of Economic Affairs (MOF)
#> 113                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   Department of Drinking Water and Sanitation, Government of Uttarakhand
#> 114                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           Ministry of Education (Minist�rio da Educa��o)
#> 115                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                Water Resources Department, Public Works Department, GoTN
#> 116                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                Department of Rural Development & Panchayat Raj, Government of Tamil Nadu
#> 117                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                Projeto COOPERAR (SEAFDS)
#> 118                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 Assam Rural Infrastructure and Agricultural Services (ARIAS) Society, State Health Society, Government of Assam, Department of Health and Family Welfare
#> 119                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       Biotechnology Industry Research Assistance Council
#> 120                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                Secretaria Municipal de Urbanismo e Meio Ambiente (SEUMA), Secretaria Municipal de Infraestrutura (SEINF)
#> 121                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    Urban Development and Environment Department, Govt. of Madhya Pradesh
#> 122                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      Inland Waterways Authority of India
#> 123                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           Department of Water Resources, RD & GR, Ministry of Jal Shakti
#> 124                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               Department of Medical Health and Family Welfare, Government of Uttarakhand
#> 125                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      State Bank of India
#> 126                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                Karnataka Urban Infrastructure Development & Finance Corporation (KUIDFC)
#> 127                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 Water Resources Department (WRD), Rural Works Department (RWD), Bihar Aapada Punarwas Evam Punarnirman Society (BAPEPS), Bihar Rajya Pul Nirman Nigam Limited (BRPNNL), Animal and Fisheries Resources Department (AFRD)
#> 128                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              Project Implementing Entity
#> 129                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               THDC (Tehri Hydro Development Corporation)
#> 130                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 131                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 132                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 133                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 134                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 135                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 136                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 137                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            Social Welfare & Women Empowerment Department
#> 138                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 139                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 140                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 141                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 142                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 143                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 144                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 145                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 146                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 147                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 148                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 149                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     Ministry of New and Renewable Energy
#> 150                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 151                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 152                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 153                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 154                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 155                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   Complexo Industrial Portu�rio de Pec�m
#> 156                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        Government of Karnataka, Government of Tamil Nadu
#> 157                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 158                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 159                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           Department of Environment, Forests, and Climate Change, State of Uttar Pradesh
#> 160                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 161                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 162                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 163                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 164                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 165                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 166                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 167                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 168                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 169                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 170                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 171                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 172                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 173                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                Government of West Bengal
#> 174                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 175                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 176                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 177                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 178                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 179                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 180                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 181                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 182                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 183                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                State Secretariat of Administration and Management (SEAD)
#> 184                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 185                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 186                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 187                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 188                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 Haryana Mass Rapid Transport Corporation Limited (HMRTC)
#> 189                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 190                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 191                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 192                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 193                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 194                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 195                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 196                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 197                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 198                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 199                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 200 Uttarakhand Jal Vidyut Nigam Ltd., Kerala State Electricity Board (KSEB), Tamil Nadu Generation and Distribution Corporation Limited (TANGEDCO), Government of Gujarat, Water Resources Department, Government of Chhattisgarh, Water Resources Department, Government of Kerala, Water Resources Department, Government of West Bengal, Irrigation and Waterways Department, Government of Uttar Pradesh, Irrigation and Water Resources Department, Meghalaya Power Generation Corporation Ltd. (MePGCL), Government of Maharasthra, Water Resources Department, Government of Manipur, Water Resources Department, Central Water Commission (CWC), Ministry of Jal Shakti, Government of Rajasthan, Water Resources Department, Government of Odisha, Water Resources Department, Government of Tamil Nadu, Water Resources Department, Government of Madhya Pradesh, Water Resources Department, Government of Karnataka, Water Resources Department
#> 201                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 202                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                Funda��o Getulio Vargas, Ministry of Environment and Climate Change - MMA
#> 203                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      State Bank of India
#> 204                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   Ministry of Environment - MMA, Funda��o Getulio Vargas
#> 205                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 206                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      Small Industries Development Bank of India, EESL Energy Efficiency Services Limited
#> 207                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  Ministry of Environment
#> 208                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 209                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 210                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      Jameel Poverty Action Lab (J-PAL) South Asia at the Institute for Financial Management and Research
#> 211                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            Minist�rio do Meio Ambiente (MMA), Minist�rio da Agricultura, Pecu�ria e Abastecimento (MAPA)
#> 212                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        Ministry of Agriculture and  Livestock(MAPA), National Rural Learning Service, Ministry of Environment / Brazilian Forest Service
#>                                                                              url
#> 1   https://projects.worldbank.org/en/projects-operations/project-detail/P507508
#> 2   https://projects.worldbank.org/en/projects-operations/project-detail/P178253
#> 3   https://projects.worldbank.org/en/projects-operations/project-detail/P181463
#> 4   https://projects.worldbank.org/en/projects-operations/project-detail/P179935
#> 5   https://projects.worldbank.org/en/projects-operations/project-detail/P180429
#> 6   https://projects.worldbank.org/en/projects-operations/project-detail/P178254
#> 7   https://projects.worldbank.org/en/projects-operations/project-detail/P180555
#> 8   https://projects.worldbank.org/en/projects-operations/project-detail/P181501
#> 9   https://projects.worldbank.org/en/projects-operations/project-detail/P181195
#> 10  https://projects.worldbank.org/en/projects-operations/project-detail/P177965
#> 11  https://projects.worldbank.org/en/projects-operations/project-detail/P180430
#> 12  https://projects.worldbank.org/en/projects-operations/project-detail/P180462
#> 13  https://projects.worldbank.org/en/projects-operations/project-detail/P174825
#> 14  https://projects.worldbank.org/en/projects-operations/project-detail/P178557
#> 15  https://projects.worldbank.org/en/projects-operations/project-detail/P179357
#> 16  https://projects.worldbank.org/en/projects-operations/project-detail/P179749
#> 17  https://projects.worldbank.org/en/projects-operations/project-detail/P180497
#> 18  https://projects.worldbank.org/en/projects-operations/project-detail/P500524
#> 19  https://projects.worldbank.org/en/projects-operations/project-detail/P177474
#> 20  https://projects.worldbank.org/en/projects-operations/project-detail/P178581
#> 21  https://projects.worldbank.org/en/projects-operations/project-detail/P175723
#> 22  https://projects.worldbank.org/en/projects-operations/project-detail/P180634
#> 23  https://projects.worldbank.org/en/projects-operations/project-detail/P179189
#> 24  https://projects.worldbank.org/en/projects-operations/project-detail/P179365
#> 25  https://projects.worldbank.org/en/projects-operations/project-detail/P179182
#> 26  https://projects.worldbank.org/en/projects-operations/project-detail/P178993
#> 27  https://projects.worldbank.org/en/projects-operations/project-detail/P178567
#> 28  https://projects.worldbank.org/en/projects-operations/project-detail/P178663
#> 29  https://projects.worldbank.org/en/projects-operations/project-detail/P179088
#> 30  https://projects.worldbank.org/en/projects-operations/project-detail/P179046
#> 31  https://projects.worldbank.org/en/projects-operations/project-detail/P176733
#> 32  https://projects.worldbank.org/en/projects-operations/project-detail/P176032
#> 33  https://projects.worldbank.org/en/projects-operations/project-detail/P179249
#> 34  https://projects.worldbank.org/en/projects-operations/project-detail/P179337
#> 35  https://projects.worldbank.org/en/projects-operations/project-detail/P178418
#> 36  https://projects.worldbank.org/en/projects-operations/project-detail/P177917
#> 37  https://projects.worldbank.org/en/projects-operations/project-detail/P177980
#> 38  https://projects.worldbank.org/en/projects-operations/project-detail/P177876
#> 39  https://projects.worldbank.org/en/projects-operations/project-detail/P178072
#> 40  https://projects.worldbank.org/en/projects-operations/project-detail/P177671
#> 41  https://projects.worldbank.org/en/projects-operations/project-detail/P176982
#> 42  https://projects.worldbank.org/en/projects-operations/project-detail/P175811
#> 43  https://projects.worldbank.org/en/projects-operations/project-detail/P179039
#> 44  https://projects.worldbank.org/en/projects-operations/project-detail/P174593
#> 45  https://projects.worldbank.org/en/projects-operations/project-detail/P178888
#> 46  https://projects.worldbank.org/en/projects-operations/project-detail/P175728
#> 47  https://projects.worldbank.org/en/projects-operations/project-detail/P178252
#> 48  https://projects.worldbank.org/en/projects-operations/project-detail/P175261
#> 49  https://projects.worldbank.org/en/projects-operations/project-detail/P178339
#> 50  https://projects.worldbank.org/en/projects-operations/project-detail/P177070
#> 51  https://projects.worldbank.org/en/projects-operations/project-detail/P171750
#> 52  https://projects.worldbank.org/en/projects-operations/project-detail/P178146
#> 53  https://projects.worldbank.org/en/projects-operations/project-detail/P175676
#> 54  https://projects.worldbank.org/en/projects-operations/project-detail/P177915
#> 55  https://projects.worldbank.org/en/projects-operations/project-detail/P174798
#> 56  https://projects.worldbank.org/en/projects-operations/project-detail/P178729
#> 57  https://projects.worldbank.org/en/projects-operations/project-detail/P176404
#> 58  https://projects.worldbank.org/en/projects-operations/project-detail/P177856
#> 59  https://projects.worldbank.org/en/projects-operations/project-detail/P178563
#> 60  https://projects.worldbank.org/en/projects-operations/project-detail/P168634
#> 61  https://projects.worldbank.org/en/projects-operations/project-detail/P177632
#> 62  https://projects.worldbank.org/en/projects-operations/project-detail/P174067
#> 63  https://projects.worldbank.org/en/projects-operations/project-detail/P174564
#> 64  https://projects.worldbank.org/en/projects-operations/project-detail/P176107
#> 65  https://projects.worldbank.org/en/projects-operations/project-detail/P172187
#> 66  https://projects.worldbank.org/en/projects-operations/project-detail/P170590
#> 67  https://projects.worldbank.org/en/projects-operations/project-detail/P174732
#> 68  https://projects.worldbank.org/en/projects-operations/project-detail/P173589
#> 69  https://projects.worldbank.org/en/projects-operations/project-detail/P175221
#> 70  https://projects.worldbank.org/en/projects-operations/project-detail/P174778
#> 71  https://projects.worldbank.org/en/projects-operations/project-detail/P173978
#> 72  https://projects.worldbank.org/en/projects-operations/project-detail/P172226
#> 73  https://projects.worldbank.org/en/projects-operations/project-detail/P170811
#> 74  https://projects.worldbank.org/en/projects-operations/project-detail/P173958
#> 75  https://projects.worldbank.org/en/projects-operations/project-detail/P173704
#> 76  https://projects.worldbank.org/en/projects-operations/project-detail/P168633
#> 77  https://projects.worldbank.org/en/projects-operations/project-detail/P170645
#> 78  https://projects.worldbank.org/en/projects-operations/project-detail/P172213
#> 79  https://projects.worldbank.org/en/projects-operations/project-detail/P170873
#> 80  https://projects.worldbank.org/en/projects-operations/project-detail/P166020
#> 81  https://projects.worldbank.org/en/projects-operations/project-detail/P168097
#> 82  https://projects.worldbank.org/en/projects-operations/project-detail/P172605
#> 83  https://projects.worldbank.org/en/projects-operations/project-detail/P174312
#> 84  https://projects.worldbank.org/en/projects-operations/project-detail/P169111
#> 85  https://projects.worldbank.org/en/projects-operations/project-detail/P166868
#> 86  https://projects.worldbank.org/en/projects-operations/project-detail/P170850
#> 87  https://projects.worldbank.org/en/projects-operations/project-detail/P168590
#> 88  https://projects.worldbank.org/en/projects-operations/project-detail/P169140
#> 89  https://projects.worldbank.org/en/projects-operations/project-detail/P167350
#> 90  https://projects.worldbank.org/en/projects-operations/project-detail/P163328
#> 91  https://projects.worldbank.org/en/projects-operations/project-detail/P170682
#> 92  https://projects.worldbank.org/en/projects-operations/project-detail/P169134
#> 93  https://projects.worldbank.org/en/projects-operations/project-detail/P165129
#> 94  https://projects.worldbank.org/en/projects-operations/project-detail/P168310
#> 95  https://projects.worldbank.org/en/projects-operations/project-detail/P157929
#> 96  https://projects.worldbank.org/en/projects-operations/project-detail/P162679
#> 97  https://projects.worldbank.org/en/projects-operations/project-detail/P163533
#> 98  https://projects.worldbank.org/en/projects-operations/project-detail/P165055
#> 99  https://projects.worldbank.org/en/projects-operations/project-detail/P167455
#> 100 https://projects.worldbank.org/en/projects-operations/project-detail/P167581
#> 101 https://projects.worldbank.org/en/projects-operations/project-detail/P160379
#> 102 https://projects.worldbank.org/en/projects-operations/project-detail/P167523
#> 103 https://projects.worldbank.org/en/projects-operations/project-detail/P157141
#> 104 https://projects.worldbank.org/en/projects-operations/project-detail/P166923
#> 105 https://projects.worldbank.org/en/projects-operations/project-detail/P165683
#> 106 https://projects.worldbank.org/en/projects-operations/project-detail/P166578
#> 107 https://projects.worldbank.org/en/projects-operations/project-detail/P165695
#> 108 https://projects.worldbank.org/en/projects-operations/project-detail/P158502
#> 109 https://projects.worldbank.org/en/projects-operations/project-detail/P160463
#> 110 https://projects.worldbank.org/en/projects-operations/project-detail/P162086
#> 111 https://projects.worldbank.org/en/projects-operations/project-detail/P158119
#> 112 https://projects.worldbank.org/en/projects-operations/project-detail/P156869
#> 113 https://projects.worldbank.org/en/projects-operations/project-detail/P158146
#> 114 https://projects.worldbank.org/en/projects-operations/project-detail/P163868
#> 115 https://projects.worldbank.org/en/projects-operations/project-detail/P158522
#> 116 https://projects.worldbank.org/en/projects-operations/project-detail/P157702
#> 117 https://projects.worldbank.org/en/projects-operations/project-detail/P147158
#> 118 https://projects.worldbank.org/en/projects-operations/project-detail/P155617
#> 119 https://projects.worldbank.org/en/projects-operations/project-detail/P156241
#> 120 https://projects.worldbank.org/en/projects-operations/project-detail/P153012
#> 121 https://projects.worldbank.org/en/projects-operations/project-detail/P155303
#> 122 https://projects.worldbank.org/en/projects-operations/project-detail/P148775
#> 123 https://projects.worldbank.org/en/projects-operations/project-detail/P152698
#> 124 https://projects.worldbank.org/en/projects-operations/project-detail/P148531
#> 125 https://projects.worldbank.org/en/projects-operations/project-detail/P155007
#> 126 https://projects.worldbank.org/en/projects-operations/project-detail/P130544
#> 127 https://projects.worldbank.org/en/projects-operations/project-detail/P127725
#> 128 https://projects.worldbank.org/en/projects-operations/project-detail/P154990
#> 129 https://projects.worldbank.org/en/projects-operations/project-detail/P096124
#> 130 https://projects.worldbank.org/en/projects-operations/project-detail/P039027
#> 131 https://projects.worldbank.org/en/projects-operations/project-detail/P505866
#> 132 https://projects.worldbank.org/en/projects-operations/project-detail/P507322
#> 133 https://projects.worldbank.org/en/projects-operations/project-detail/P108190
#> 134 https://projects.worldbank.org/en/projects-operations/project-detail/P500380
#> 135 https://projects.worldbank.org/en/projects-operations/project-detail/P502493
#> 136 https://projects.worldbank.org/en/projects-operations/project-detail/P110539
#> 137 https://projects.worldbank.org/en/projects-operations/project-detail/P180699
#> 138 https://projects.worldbank.org/en/projects-operations/project-detail/P507340
#> 139 https://projects.worldbank.org/en/projects-operations/project-detail/P114890
#> 140 https://projects.worldbank.org/en/projects-operations/project-detail/P508840
#> 141 https://projects.worldbank.org/en/projects-operations/project-detail/P500252
#> 142 https://projects.worldbank.org/en/projects-operations/project-detail/P506955
#> 143 https://projects.worldbank.org/en/projects-operations/project-detail/P507029
#> 144 https://projects.worldbank.org/en/projects-operations/project-detail/P508202
#> 145 https://projects.worldbank.org/en/projects-operations/project-detail/P508363
#> 146 https://projects.worldbank.org/en/projects-operations/project-detail/P504126
#> 147 https://projects.worldbank.org/en/projects-operations/project-detail/P507066
#> 148 https://projects.worldbank.org/en/projects-operations/project-detail/P508221
#> 149 https://projects.worldbank.org/en/projects-operations/project-detail/P180716
#> 150 https://projects.worldbank.org/en/projects-operations/project-detail/P504276
#> 151 https://projects.worldbank.org/en/projects-operations/project-detail/P500570
#> 152 https://projects.worldbank.org/en/projects-operations/project-detail/P500469
#> 153 https://projects.worldbank.org/en/projects-operations/project-detail/P501071
#> 154 https://projects.worldbank.org/en/projects-operations/project-detail/P105370
#> 155 https://projects.worldbank.org/en/projects-operations/project-detail/P181511
#> 156 https://projects.worldbank.org/en/projects-operations/project-detail/P180932
#> 157 https://projects.worldbank.org/en/projects-operations/project-detail/P505235
#> 158 https://projects.worldbank.org/en/projects-operations/project-detail/P507629
#> 159 https://projects.worldbank.org/en/projects-operations/project-detail/P178053
#> 160 https://projects.worldbank.org/en/projects-operations/project-detail/P500564
#> 161 https://projects.worldbank.org/en/projects-operations/project-detail/P505590
#> 162 https://projects.worldbank.org/en/projects-operations/project-detail/P506976
#> 163 https://projects.worldbank.org/en/projects-operations/project-detail/P181767
#> 164 https://projects.worldbank.org/en/projects-operations/project-detail/P506329
#> 165 https://projects.worldbank.org/en/projects-operations/project-detail/P508489
#> 166 https://projects.worldbank.org/en/projects-operations/project-detail/P504543
#> 167 https://projects.worldbank.org/en/projects-operations/project-detail/P179349
#> 168 https://projects.worldbank.org/en/projects-operations/project-detail/P505914
#> 169 https://projects.worldbank.org/en/projects-operations/project-detail/P509041
#> 170 https://projects.worldbank.org/en/projects-operations/project-detail/P506142
#> 171 https://projects.worldbank.org/en/projects-operations/project-detail/P500614
#> 172 https://projects.worldbank.org/en/projects-operations/project-detail/P506861
#> 173 https://projects.worldbank.org/en/projects-operations/project-detail/P181244
#> 174 https://projects.worldbank.org/en/projects-operations/project-detail/P502499
#> 175 https://projects.worldbank.org/en/projects-operations/project-detail/P500151
#> 176 https://projects.worldbank.org/en/projects-operations/project-detail/P508719
#> 177 https://projects.worldbank.org/en/projects-operations/project-detail/P505563
#> 178 https://projects.worldbank.org/en/projects-operations/project-detail/P507628
#> 179 https://projects.worldbank.org/en/projects-operations/project-detail/P173090
#> 180 https://projects.worldbank.org/en/projects-operations/project-detail/P506272
#> 181 https://projects.worldbank.org/en/projects-operations/project-detail/P506321
#> 182 https://projects.worldbank.org/en/projects-operations/project-detail/P505177
#> 183 https://projects.worldbank.org/en/projects-operations/project-detail/P181608
#> 184 https://projects.worldbank.org/en/projects-operations/project-detail/P508025
#> 185 https://projects.worldbank.org/en/projects-operations/project-detail/P507910
#> 186 https://projects.worldbank.org/en/projects-operations/project-detail/P504899
#> 187 https://projects.worldbank.org/en/projects-operations/project-detail/P500501
#> 188 https://projects.worldbank.org/en/projects-operations/project-detail/P181020
#> 189 https://projects.worldbank.org/en/projects-operations/project-detail/P500168
#> 190 https://projects.worldbank.org/en/projects-operations/project-detail/P506320
#> 191 https://projects.worldbank.org/en/projects-operations/project-detail/P500431
#> 192 https://projects.worldbank.org/en/projects-operations/project-detail/P508453
#> 193 https://projects.worldbank.org/en/projects-operations/project-detail/P504897
#> 194 https://projects.worldbank.org/en/projects-operations/project-detail/P503872
#> 195 https://projects.worldbank.org/en/projects-operations/project-detail/P506340
#> 196 https://projects.worldbank.org/en/projects-operations/project-detail/P507236
#> 197 https://projects.worldbank.org/en/projects-operations/project-detail/P114896
#> 198 https://projects.worldbank.org/en/projects-operations/project-detail/P502491
#> 199 https://projects.worldbank.org/en/projects-operations/project-detail/P504253
#> 200 https://projects.worldbank.org/en/projects-operations/project-detail/P181524
#> 201 https://projects.worldbank.org/en/projects-operations/project-detail/P128921
#> 202 https://projects.worldbank.org/en/projects-operations/project-detail/P158000
#> 203 https://projects.worldbank.org/en/projects-operations/project-detail/P160018
#> 204 https://projects.worldbank.org/en/projects-operations/project-detail/P171257
#> 205 https://projects.worldbank.org/en/projects-operations/project-detail/P122387
#> 206 https://projects.worldbank.org/en/projects-operations/project-detail/P132620
#> 207 https://projects.worldbank.org/en/projects-operations/project-detail/P152285
#> 208 https://projects.worldbank.org/en/projects-operations/project-detail/P009585
#> 209 https://projects.worldbank.org/en/projects-operations/project-detail/P073882
#> 210 https://projects.worldbank.org/en/projects-operations/project-detail/P177159
#> 211 https://projects.worldbank.org/en/projects-operations/project-detail/P172497
#> 212 https://projects.worldbank.org/en/projects-operations/project-detail/P164602

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
#> 1   P111669
#> 2   P117081
#> 3   P120932
#> 4   P122687
#> 5   P123760
#> 6   P127201
#> 7   P154586
#> 8   P160268
#> 9   P154403
#> 10  P125669
#> 11  P127254
#> 12  P101076
#> 13  P128434
#> 14  P145345
#> 15  P125447
#> 16  P090731
#> 17  P122667
#> 18  P159600
#> 19  P125804
#> 20  P160267
#> 21  P151800
#> 22  P110849
#> 23  P144712
#> 24  P127015
#> 25  P160552
#> 26  P059161
#> 27  P145586
#> 28  P145482
#> 29  P157795
#> 30  P155968
#> 31  P124181
#> 32  P117956
#> 33  P125032
#> 34  P072554
#> 35  P100438
#> 36  P127486
#> 37  P158816
#> 38  P145316
#> 39  P143185
#> 40  P143334
#> 41  P160157
#> 42  P120134
#> 43  P129633
#> 44  P152805
#> 45  P115001
#> 46  P152797
#> 47  P154291
#> 48  P120313
#> 49  P160234
#> 50  P151604
#> 51  P112329
#> 52  P158987
#> 53  P160383
#> 54  P125542
#> 55  P121986
#> 56  P073389
#> 57  P078143
#> 58  P128268
#> 59  P132620
#> 60  P159217
#> 61  P126214
#> 62  P148620
#> 63  P099618
#> 64  P145765
#> 65  P074426
#> 66  P105229
#> 67  P128445
#> 68  P151363
#> 69  P160523
#> 70  P121006
#> 71  P148499
#> 72  P129182
#> 73  P127508
#> 74  P148125
#> 75  P160463
#> 76  P153420
#> 77  P116974
#> 78  P100530
#> 79  P105370
#> 80  P160408
#> 81  P155260
#> 82  P153404
#> 83  P145618
#> 84  P127088
#> 85  P157919
#> 86  P109687
#> 87  P160096
#> 88  P160658
#> 89  P106635
#> 90  P091979
#> 91  P145434
#> 92  P152039
#> 93  P008501
#> 94  P160033
#> 95  P064844
#> 96  P159901
#> 97  P160493
#> 98  P148183
#> 99  P155126
#> 100 P090058
#>                                                                                                                             project_name
#> 1                                                                                                Sao Tome - Adaptation to Climate Change
#> 2                                                                Integrating Climate Change in the Implementation of the Plan Maroc Vert
#> 3                                                                                                China Technology Needs Assessment (TNA)
#> 4                                                                           Yemen: Pilot Program for Climate Resilience Phase I (PPCR I)
#> 5                                                                                              Mexico Forests and Climate Change Project
#> 6                                                                                            Vietnam Climate Change Development Policy 2
#> 7                                                                                                         Kenya Climate Venture Facility
#> 8                                                                                            Rwanda Pilot Program for Climate Resilience
#> 9                                 IGAD - Building Disaster Resilience to Disasters through Risk Management and Climate Change Adaptation
#> 10                                                                                 Niger Community Action Project for Climate Resilience
#> 11                                                                               Zambia Strengthening Climate Resilience (PPCR Phase II)
#> 12                                                                                                     Climate Change Adaptation Program
#> 13                                                                                Mozambique Climate Change Development Policy Operation
#> 14                                                                   Dropped Andes Adaptation Impact of Climate Change in Water Resource
#> 15                                                                                                      Community Climate Change Project
#> 16                                                                      CARIB-GEF-Implementation of Adaptation Measures in Coastal Zones
#> 17                                                                                             Vietnam Climate Change Development Policy
#> 18                                                                               Preparation of Strategic Program for Climate Resilience
#> 19  Adaptation Fund: Increasing Climate Resilience & Enhancing Sustainable Land Management in the Southwest of the Buenos Aires Province
#> 20                                                                                       Forest Investment Program (FIP) Investment Plan
#> 21                                                                                                    SL- Climate finance for renewables
#> 22                                                                                       Mexico - Climate Change Development Policy Loan
#> 23                                                                        Strengthening Hydro-Meteorological and Climate Services in DRC
#> 24                                                               Climate Resilient Participatory Afforestation and Reforestation Project
#> 25                                                                                                     Climate Mitigation Action Support
#> 26                                                                                Introduction of Climate Friendly measures in Transport
#> 27                                                                                                China Partnership for Market Readiness
#> 28                                                               Accelerating Sustainable Private Investment in Renewable Energy Project
#> 29                                                                           Honduras Pilot Program for Climate Resilience Phase 1 Grant
#> 30                                                                                                            Climate Adaptation Project
#> 31                                                                        Sustainable Management of Natural Resources and Climate Change
#> 32                     Capacity Development for Sustainable Forest Management through Climate Change Mitigation in Non-Annex I Countries
#> 33                                                                                           Timor Leste Road Climate Resilience Project
#> 34                                                                          Global Environment Facility Climate Change Enabling Activity
#> 35                                                    Adaptation to Climate Change Impacts on the Coastal Wetlands in the Gulf of Mexico
#> 36                                                                   SUSTAINABLE AGRICULTURE AND CLIMATE CHANGE MITIGATION PROJECT (GEF)
#> 37                                                                               Madagascar Pilot Program for Climate Resilience Phase I
#> 38                                                                               Dedicated Grant Mechanism for Local Communities Project
#> 39                                  Development of systems to prevent forest fires and monitor vegetation cover in the Brazilian Cerrado
#> 40                                                             FIP: Environmental regularization of rural lands in the Cerrado of Brazil
#> 41                                                                                              KTDA Small Hydro Programme of Activities
#> 42                                                                               MX DPL Adaptation to Climate Change in the Water Sector
#> 43                                                                                     Improving Climate Data and Information Management
#> 44                                                                   Carbon Asset Development - Methane Recovery from Waste Mgmt Project
#> 45                                                                                                       RY-Climate Resilient ICZM (LDC)
#> 46                                                                                              Vietnam-Partnership for Market Readiness
#> 47                                                                                                           Indonesia Energy Sector DPL
#> 48                                                                                   Indonesia Climate Change Development Policy Project
#> 49                                                                                  Bangladesh - FIP Investment Plan Preparation Project
#> 50                                                                                        Mexico Dedicated Grant Mechanism for IP and LC
#> 51                                                                                              EarthCare Solid Waste Composting Project
#> 52                                                                               Multi-sector Investment Planning for Climate Resilience
#> 53                                                                               Zambia Scaling Renewable Energy Program Investment Plan
#> 54                                                                                                  Burkina Faso FIP Investment Strategy
#> 55                                                                                 Zambia Pilot Program for Climate Resilience - Phase I
#> 56                                                                                    Mainstreaming Adaptation to Climate Change Project
#> 57                     Enabling Activity for 2nd National Communication of Argentine Goverment to the Convention on Climate Change (GEF)
#> 58                                                                                 Maldives: Clean Energy for Climate Mitigation Project
#> 59                                                                                    Partial Risk Sharing Facility in Energy Efficiency
#> 60                                                                               Strengthening Hydro-Meteorological and Climate Services
#> 61                                                                                           DRC - FIP Investment Plan Preparation Grant
#> 62                                                                                              Large Enterprises Energy Efficiency Proj
#> 63                                                                                                                  MA-Energy Sector DPL
#> 64                                                                                                       Ghana Climate Innovation Center
#> 65                                                                                                      Jepirachi Carbon Off Set Project
#> 66                                                              Mainstreaming Climate Change Adaptation in Irrigated Agriculture Project
#> 67                                                                                                 Capacity Building & Secretariat BCCRF
#> 68                                                                 Climate Adaptation and Mitigation Program for Aral Sea Basin CAMP4ASB
#> 69                                                                                      Nepal - Forest Investment Plan Preparation Grant
#> 70                                                                Indigenous Wisdom and Biomathematics: Amazonians Tackle Climate Change
#> 71                                                                                              Saweto Dedicated Grant Mechanism in Peru
#> 72                                               Lao PDR - Mainstreaming  Disaster and Climate Risk Management into Investment Decisions
#> 73                                                                                        Building Resilience to Climate Related Hazards
#> 74                                                                     Disaster and Climate Risk Management Project Additional Financing
#> 75                                                                         AP Integrated Irrigation & Agriculture Transformation Project
#> 76                                                                                             Climate Smart Agriculture Support Project
#> 77                                                                                                AR Third National Communication UNFCCC
#> 78                                                                                          INDIA - Financing Energy Efficiency at MSMEs
#> 79                                                                                                Allian Duhangan Hydro Electric Project
#> 80                                                                                  Maharashtra Project on Climate Resilient Agriculture
#> 81                                                                                         Vietnam Climate Innovation Center (VCIC) RETF
#> 82                                                                                             Solar PV Demonstration & Scale Up Project
#> 83                                                                 MEXICO Sustainable Energy Technologies Development for Climate Change
#> 84                                                                           Adaptation of Nicaragua's  Water Supplies to Climate Change
#> 85                                                                                    TUNISIA FOREST INVESTMENT PLAN PREPARATION PROJECT
#> 86                                                                                               Carbon Partnership Facility development
#> 87                                                                    Pacific Resilience Project II under the Pacific Resilience Program
#> 88                                                                                                Rural Electrification Project Stage II
#> 89                                                                                                     CF Kengen, Kiambere, Tana, Eburru
#> 90                                                              Kenya: Adaptation to Climate Change in Arid and Semi-Arid Lands (KACCAL)
#> 91                                                                                            Yemen: Preparation of SREP Investment Plan
#> 92                                                                                               Geothermal Exploratory Drilling Project
#> 93                                                                                                Petroleum Technical Assistance Project
#> 94                                                                                                  Mozambique Forest Investment Project
#> 95                                                                                        Rural Electrification and Transmission Project
#> 96                                                                                            FODER - Argentina Renewable Fund Guarantee
#> 97                                                                                 Zambia Integrated Forest Landcape Program BioCF Grant
#> 98                                                                Ghana FIP - Enhancing Natural Forest and Agroforest Landscapes Project
#> 99                                                                                                       Small Islands ASPIRE Supplement
#> 100                                                                                                         Renewable Energy GEF Project
#>       status approval_date closing_date country_code
#> 1     Closed          <NA>   2017-12-31           ST
#> 2     Closed          <NA>   2015-10-15           MA
#> 3     Closed          <NA>   2016-06-30           CN
#> 4     Closed    2010-08-22         <NA>           RY
#> 5     Closed    2012-01-31   2018-02-28           MX
#> 6     Closed    2012-11-08   2013-09-30           VN
#> 7     Closed          <NA>   2020-06-25           KE
#> 8     Closed          <NA>   2019-04-30           RW
#> 9     Closed          <NA>   2021-05-31           3E
#> 10    Closed          <NA>   2021-05-31           NE
#> 11    Closed          <NA>   2022-12-31           ZM
#> 12    Closed          <NA>   2016-12-31           PH
#> 13    Closed    2013-01-24   2013-06-30           MZ
#> 14   Dropped          <NA>         <NA>           6A
#> 15    Closed          <NA>   2016-12-31           BD
#> 16    Closed          <NA>   2011-12-31           6R
#> 17    Closed    2012-02-02   2012-09-30           VN
#> 18    Closed          <NA>   2021-03-31           BT
#> 19    Closed          <NA>   2019-09-30           AR
#> 20    Closed          <NA>   2018-06-30           ZM
#> 21   Dropped          <NA>         <NA>           LK
#> 22    Closed    2008-04-08   2011-07-19           MX
#> 23   Dropped          <NA>         <NA>           ZR
#> 24    Closed          <NA>   2016-12-31           BD
#> 25    Closed          <NA>   2021-02-28           LK
#> 26    Closed          <NA>   2009-03-31           MX
#> 27    Closed          <NA>   2020-08-31           CN
#> 28    Active    2014-06-26   2025-06-30           MV
#> 29    Closed          <NA>   2020-06-30           HN
#> 30    Closed    2017-06-09   2023-09-30           MD
#> 31    Closed    2011-11-17   2021-11-16           UY
#> 32    Closed    2009-08-11         <NA>           1W
#> 33    Closed    2011-05-17   2022-12-31           TP
#> 34    Closed    2001-06-22   2003-06-30           BY
#> 35    Closed          <NA>   2016-10-31           MX
#> 36    Closed          <NA>   2018-03-31           UZ
#> 37    Closed          <NA>   2020-09-30           MG
#> 38    Closed          <NA>   2021-11-30           GH
#> 39    Closed          <NA>   2021-12-29           BR
#> 40    Closed          <NA>   2022-12-31           BR
#> 41    Active          <NA>         <NA>           KE
#> 42    Closed    2010-06-10   2012-12-31           MX
#> 43    Closed          <NA>   2022-08-31           JM
#> 44    Closed          <NA>   2021-04-30           PH
#> 45   Dropped          <NA>         <NA>           RY
#> 46    Closed          <NA>   2020-12-31           VN
#> 47    Closed    2015-12-01   2016-06-30           ID
#> 48    Closed    2010-05-25   2010-12-31           ID
#> 49    Closed          <NA>   2018-11-30           BD
#> 50    Closed          <NA>   2024-06-28           MX
#> 51    Closed    2010-06-29   2019-12-31           NG
#> 52    Closed          <NA>   2018-04-30           ET
#> 53    Closed          <NA>   2018-06-18           ZM
#> 54    Closed    2011-01-28         <NA>           BF
#> 55    Active          <NA>         <NA>           ZM
#> 56    Closed          <NA>   2009-03-30           6R
#> 57    Closed          <NA>   2007-03-31           AR
#> 58    Closed    2012-03-28   2014-11-30           MV
#> 59    Active          <NA>   2025-03-31           IN
#> 60    Closed          <NA>   2023-01-15           ZR
#> 61    Closed    2011-05-31         <NA>           ZR
#> 62   Dropped          <NA>         <NA>           ID
#> 63    Closed    2007-05-29   2007-12-31           MA
#> 64    Closed    2016-02-02   2020-11-30           GH
#> 65    Closed    2002-12-10   2020-05-31           CO
#> 66    Closed          <NA>   2012-06-30           CN
#> 67    Closed    2011-08-30   2014-12-31           BD
#> 68    Closed    2015-11-03   2024-05-31           7C
#> 69    Closed          <NA>   2018-09-30           NP
#> 70  Pipeline          <NA>   2012-12-31           PE
#> 71    Closed          <NA>   2021-06-25           PE
#> 72    Closed    2011-11-28   2016-01-30           LA
#> 73    Closed          <NA>   2020-11-15           NP
#> 74    Closed    2015-05-19         <NA>           MD
#> 75    Active    2018-10-23   2025-10-31           IN
#> 76    Closed    2016-05-26   2022-12-31           NE
#> 77    Closed          <NA>   2015-06-30           AR
#> 78    Closed          <NA>   2019-05-04           IN
#> 79  Pipeline          <NA>   2018-05-04           IN
#> 80    Closed    2018-02-27   2024-06-30           IN
#> 81    Closed          <NA>   2020-08-31           VN
#> 82    Closed          <NA>   2019-09-30           6O
#> 83    Closed          <NA>   2020-12-31           MX
#> 84    Closed          <NA>   2018-06-30           NI
#> 85    Closed          <NA>   2017-12-31           TN
#> 86  Pipeline          <NA>         <NA>           1W
#> 87    Active    2017-05-09   2026-06-30           MH
#> 88    Closed    2017-05-31   2022-06-30           VU
#> 89    Closed    2007-08-20   2019-06-30           KE
#> 90    Closed          <NA>   2017-06-30           KE
#> 91    Closed    2013-04-16         <NA>           RY
#> 92    Closed          <NA>   2019-05-31           AM
#> 93    Closed    1994-06-02   2000-03-31           KZ
#> 94    Closed    2017-03-07   2022-06-30           MZ
#> 95    Closed    2003-12-16   2012-01-31           KH
#> 96    Closed    2017-02-28   2022-06-30           AR
#> 97   Dropped          <NA>         <NA>           ZM
#> 98    Closed          <NA>   2024-06-14           GH
#> 99   Dropped          <NA>         <NA>           MV
#> 100   Closed          <NA>   2011-06-30           AM
#>                              country                       region
#> 1              Sao Tome and Principe  Eastern and Southern Africa
#> 2                            Morocco Middle East and North Africa
#> 3                              China        East Asia and Pacific
#> 4                 Yemen, Republic of Middle East and North Africa
#> 5                             Mexico  Latin America and Caribbean
#> 6                            Vietnam        East Asia and Pacific
#> 7                              Kenya  Eastern and Southern Africa
#> 8                             Rwanda  Eastern and Southern Africa
#> 9        Eastern and Southern Africa  Eastern and Southern Africa
#> 10                             Niger   Western and Central Africa
#> 11                            Zambia  Eastern and Southern Africa
#> 12                       Philippines        East Asia and Pacific
#> 13                        Mozambique  Eastern and Southern Africa
#> 14                  Andean Countries  Latin America and Caribbean
#> 15                        Bangladesh                   South Asia
#> 16                         Caribbean  Latin America and Caribbean
#> 17                           Vietnam        East Asia and Pacific
#> 18                            Bhutan                   South Asia
#> 19                         Argentina  Latin America and Caribbean
#> 20                            Zambia  Eastern and Southern Africa
#> 21                         Sri Lanka                   South Asia
#> 22                            Mexico  Latin America and Caribbean
#> 23     Congo, Democratic Republic of  Eastern and Southern Africa
#> 24                        Bangladesh                   South Asia
#> 25                         Sri Lanka                   South Asia
#> 26                            Mexico  Latin America and Caribbean
#> 27                             China        East Asia and Pacific
#> 28                          Maldives                   South Asia
#> 29                          Honduras  Latin America and Caribbean
#> 30                           Moldova      Europe and Central Asia
#> 31                           Uruguay  Latin America and Caribbean
#> 32                             World                        Other
#> 33                       Timor-Leste        East Asia and Pacific
#> 34                           Belarus      Europe and Central Asia
#> 35                            Mexico  Latin America and Caribbean
#> 36                        Uzbekistan      Europe and Central Asia
#> 37                        Madagascar  Eastern and Southern Africa
#> 38                             Ghana   Western and Central Africa
#> 39                            Brazil  Latin America and Caribbean
#> 40                            Brazil  Latin America and Caribbean
#> 41                             Kenya  Eastern and Southern Africa
#> 42                            Mexico  Latin America and Caribbean
#> 43                           Jamaica  Latin America and Caribbean
#> 44                       Philippines        East Asia and Pacific
#> 45                Yemen, Republic of Middle East and North Africa
#> 46                           Vietnam        East Asia and Pacific
#> 47                         Indonesia        East Asia and Pacific
#> 48                         Indonesia        East Asia and Pacific
#> 49                        Bangladesh                   South Asia
#> 50                            Mexico  Latin America and Caribbean
#> 51                           Nigeria   Western and Central Africa
#> 52                          Ethiopia  Eastern and Southern Africa
#> 53                            Zambia  Eastern and Southern Africa
#> 54                      Burkina Faso   Western and Central Africa
#> 55                            Zambia  Eastern and Southern Africa
#> 56                         Caribbean  Latin America and Caribbean
#> 57                         Argentina  Latin America and Caribbean
#> 58                          Maldives                   South Asia
#> 59                             India                   South Asia
#> 60     Congo, Democratic Republic of  Eastern and Southern Africa
#> 61     Congo, Democratic Republic of  Eastern and Southern Africa
#> 62                         Indonesia        East Asia and Pacific
#> 63                           Morocco Middle East and North Africa
#> 64                             Ghana   Western and Central Africa
#> 65                          Colombia  Latin America and Caribbean
#> 66                             China        East Asia and Pacific
#> 67                        Bangladesh                   South Asia
#> 68                      Central Asia      Europe and Central Asia
#> 69                             Nepal                   South Asia
#> 70                              Peru  Latin America and Caribbean
#> 71                              Peru  Latin America and Caribbean
#> 72  Lao People's Democratic Republic        East Asia and Pacific
#> 73                             Nepal                   South Asia
#> 74                           Moldova      Europe and Central Asia
#> 75                             India                   South Asia
#> 76                             Niger   Western and Central Africa
#> 77                         Argentina  Latin America and Caribbean
#> 78                             India                   South Asia
#> 79                             India                   South Asia
#> 80                             India                   South Asia
#> 81                           Vietnam        East Asia and Pacific
#> 82                    OECS Countries  Latin America and Caribbean
#> 83                            Mexico  Latin America and Caribbean
#> 84                         Nicaragua  Latin America and Caribbean
#> 85                           Tunisia Middle East and North Africa
#> 86                             World                        Other
#> 87                  Marshall Islands        East Asia and Pacific
#> 88                           Vanuatu        East Asia and Pacific
#> 89                             Kenya  Eastern and Southern Africa
#> 90                             Kenya  Eastern and Southern Africa
#> 91                Yemen, Republic of Middle East and North Africa
#> 92                           Armenia      Europe and Central Asia
#> 93                        Kazakhstan      Europe and Central Asia
#> 94                        Mozambique  Eastern and Southern Africa
#> 95                          Cambodia        East Asia and Pacific
#> 96                         Argentina  Latin America and Caribbean
#> 97                            Zambia  Eastern and Southern Africa
#> 98                             Ghana   Western and Central Africa
#> 99                          Maldives                   South Asia
#> 100                          Armenia      Europe and Central Asia
#>     total_commitment ibrd_commitment ida_commitment
#> 1           4.147800            0.00          0.000
#> 2           4.345454            0.00          0.000
#> 3           5.000000            0.00          0.000
#> 4           1.500000            0.00          0.000
#> 5         392.000000          350.00          0.000
#> 6          70.000000            0.00         70.000
#> 7           4.900000            0.00          0.000
#> 8           1.500000            0.00          0.000
#> 9           4.999999            0.00          0.000
#> 10         63.000000            0.00          0.000
#> 11         36.000000            0.00          0.000
#> 12          4.970000            0.00          0.000
#> 13         50.000000            0.00         50.000
#> 14          0.000000            0.00          0.000
#> 15         12.500000            0.00          0.000
#> 16          3.450000            0.00          0.000
#> 17         70.000000            0.00         70.000
#> 18          1.500000            0.00          0.000
#> 19          3.960200            0.00          0.000
#> 20          0.250000            0.00          0.000
#> 21          0.000000            0.00          0.000
#> 22        501.250000          501.25          0.000
#> 23          0.000000            0.00          0.000
#> 24         33.800000            0.00          0.000
#> 25          1.800000            0.00          0.000
#> 26          5.800000            0.00          0.000
#> 27          8.000000            0.00          0.000
#> 28         11.684000            0.00         16.000
#> 29          1.400000            0.00          0.000
#> 30         25.200000           12.40         12.800
#> 31         49.000000           49.00          0.000
#> 32          2.568060            0.00          0.000
#> 33         20.000000            0.00         20.000
#> 34          0.310825            0.00          0.000
#> 35          6.361000            0.00          0.000
#> 36         12.699000            0.00          0.000
#> 37          1.500000            0.00          0.000
#> 38          5.500000            0.00          0.000
#> 39          9.250000            0.00          0.000
#> 40         32.480000            0.00          0.000
#> 41          5.148000            0.00          0.000
#> 42        450.000000          450.00          0.000
#> 43          6.800000            0.00          0.000
#> 44          0.410000            0.00          0.000
#> 45          0.000000            0.00          0.000
#> 46          3.000000            0.00          0.000
#> 47        500.000000          500.00          0.000
#> 48        200.000000          200.00          0.000
#> 49          0.250000            0.00          0.000
#> 50          6.000000            0.00          0.000
#> 51          7.125000            0.00          0.000
#> 52          1.500000            0.00          0.000
#> 53          0.300000            0.00          0.000
#> 54          0.250000            0.00          0.000
#> 55          1.500000            0.00          0.000
#> 56          7.800000            0.00          0.000
#> 57          1.140000            0.00          0.000
#> 58          2.530000            0.00          0.000
#> 59         25.000000            0.00          0.000
#> 60          8.029452            0.00          0.000
#> 61          0.250000            0.00          0.000
#> 62          0.000000            0.00          0.000
#> 63        100.000000          100.00          0.000
#> 64         11.700000            0.00          0.000
#> 65          0.000000            0.00          0.000
#> 66          5.000000            0.00          0.000
#> 67          0.200000            0.00          0.000
#> 68         38.000000            0.00         38.000
#> 69          0.250000            0.00          0.000
#> 70          0.000000            0.00          0.000
#> 71          5.500000            0.00          0.000
#> 72          2.718000            0.00          0.000
#> 73         31.000000            0.00          0.000
#> 74          2.000000            0.00          2.000
#> 75        172.200000          172.20          0.000
#> 76        111.000000            0.00        111.000
#> 77          2.439210            0.00          0.000
#> 78         11.300000            0.00          0.000
#> 79          0.000000            0.00          0.000
#> 80        420.000000          420.00          0.000
#> 81          4.600000            0.00          0.000
#> 82          1.800000            0.00          0.000
#> 83         16.880734            0.00          0.000
#> 84          6.000000            0.00          0.000
#> 85          0.250000            0.00          0.000
#> 86          0.000000            0.00          0.000
#> 87         19.631000            0.00         19.631
#> 88          4.000000            0.00          4.000
#> 89          5.688900            0.00          0.000
#> 90          5.500000            0.00          0.000
#> 91          0.300000            0.00          0.000
#> 92          8.550000            0.00          0.000
#> 93         15.700000           15.70          0.000
#> 94         15.000000            0.00         15.000
#> 95         40.000000            0.00         40.000
#> 96        480.000000          480.00          0.000
#> 97          0.000000            0.00          0.000
#> 98         29.500000            0.00          0.000
#> 99          0.000000            0.00          0.000
#> 100         3.000000            0.00          0.000
#>               lending_instrument
#> 1   Investment Project Financing
#> 2   Investment Project Financing
#> 3   Investment Project Financing
#> 4      Technical Assistance Loan
#> 5   Investment Project Financing
#> 6     Development Policy Lending
#> 7   Investment Project Financing
#> 8   Investment Project Financing
#> 9   Investment Project Financing
#> 10  Investment Project Financing
#> 11  Investment Project Financing
#> 12  Investment Project Financing
#> 13    Development Policy Lending
#> 14  Investment Project Financing
#> 15  Investment Project Financing
#> 16      Specific Investment Loan
#> 17    Development Policy Lending
#> 18  Investment Project Financing
#> 19  Investment Project Financing
#> 20  Investment Project Financing
#> 21  Investment Project Financing
#> 22    Development Policy Lending
#> 23  Investment Project Financing
#> 24  Investment Project Financing
#> 25  Investment Project Financing
#> 26      Specific Investment Loan
#> 27  Investment Project Financing
#> 28    Development Policy Lending
#> 29  Investment Project Financing
#> 30  Investment Project Financing
#> 31  Investment Project Financing
#> 32      Specific Investment Loan
#> 33  Investment Project Financing
#> 34     Technical Assistance Loan
#> 35  Investment Project Financing
#> 36  Investment Project Financing
#> 37  Investment Project Financing
#> 38  Investment Project Financing
#> 39  Investment Project Financing
#> 40  Investment Project Financing
#> 41  Investment Project Financing
#> 42    Development Policy Lending
#> 43  Investment Project Financing
#> 44  Investment Project Financing
#> 45      Specific Investment Loan
#> 46  Investment Project Financing
#> 47    Development Policy Lending
#> 48    Development Policy Lending
#> 49  Investment Project Financing
#> 50  Investment Project Financing
#> 51  Investment Project Financing
#> 52  Investment Project Financing
#> 53  Investment Project Financing
#> 54     Technical Assistance Loan
#> 55  Investment Project Financing
#> 56      Specific Investment Loan
#> 57      Specific Investment Loan
#> 58      Specific Investment Loan
#> 59  Investment Project Financing
#> 60  Investment Project Financing
#> 61     Technical Assistance Loan
#> 62  Investment Project Financing
#> 63    Development Policy Lending
#> 64  Investment Project Financing
#> 65  Investment Project Financing
#> 66      Specific Investment Loan
#> 67     Technical Assistance Loan
#> 68  Investment Project Financing
#> 69  Investment Project Financing
#> 70     Technical Assistance Loan
#> 71  Investment Project Financing
#> 72     Technical Assistance Loan
#> 73  Investment Project Financing
#> 74  Investment Project Financing
#> 75  Investment Project Financing
#> 76  Investment Project Financing
#> 77  Investment Project Financing
#> 78  Investment Project Financing
#> 79                          <NA>
#> 80  Investment Project Financing
#> 81  Investment Project Financing
#> 82  Investment Project Financing
#> 83  Investment Project Financing
#> 84  Investment Project Financing
#> 85  Investment Project Financing
#> 86                          <NA>
#> 87  Investment Project Financing
#> 88  Investment Project Financing
#> 89  Investment Project Financing
#> 90  Investment Project Financing
#> 91     Technical Assistance Loan
#> 92  Investment Project Financing
#> 93      Specific Investment Loan
#> 94  Investment Project Financing
#> 95  Investment Project Financing
#> 96  Investment Project Financing
#> 97  Investment Project Financing
#> 98  Investment Project Financing
#> 99  Investment Project Financing
#> 100     Specific Investment Loan
#>                                                                                                                                                                     borrower
#> 1                                                                                                                              Ministry of Public Works, NR, and Environment
#> 2                                                                                                                                                      Government of Morocco
#> 3                                                                                                                                                 PEOPLE'S REPUBLIC OF CHINA
#> 4                                                                                                                                                                       <NA>
#> 5                                                                                                                                                        Ministry of Finance
#> 6                                                                                                                                                                       <NA>
#> 7                                                                                                                                            Kenya Climate Innovation Centre
#> 8                                                                                                                      Ministry of Finance and Economic Planning (MINECOFIN)
#> 9                                                                                                                                Inter-Governmental Authority on Development
#> 10                                                                                                          Ministry of Planning, Local Government and Community Development
#> 11                                                                                                                                                        Republic of Zambia
#> 12                                                                                                                           Department of Environment and Natural Resources
#> 13                                                                                                                                  The Ministry of Planning and Development
#> 14                                                                                                                                 Secretaria General de la Comunidad Andina
#> 15                                                                                                                          Economic Relations Division, Ministry of Finance
#> 16                                                                                                                                                                      <NA>
#> 17                                                                                                                                                                      <NA>
#> 18                                                                                                                                                Royal Government of Bhutan
#> 19                                                                                                                              The Argentine Republic, Ministry of Treasury
#> 20                                                                                                                                 Ministry of National Development Planning
#> 21                                                                                 Ministry of Power and  Renewable Energy, Ministry of Mahaweli Development and Environment
#> 22                                                                                                                                                                      <NA>
#> 23                                                                                                                                                                      <NA>
#> 24                                                                                                                                           People's Republic of Bangladesh
#> 25                                                                                                                                Democratic Socialist Republic of Sri Lanka
#> 26                                                                                                                                                                      <NA>
#> 27                                                                                                                                                People's Republic of China
#> 28                                                                                                                                                  Maryam Abdul Nasir (Ms.)
#> 29                                                                                                                                Secretaria de Finanzas de Honduras (SEFIN)
#> 30                                                                                                                                                       Republic of Moldova
#> 31                                                                                                                                              ORIENTAL REPUBLIC OF URUGUAY
#> 32                                                                                                                                                                      <NA>
#> 33                                                                                                                                        Democratic Republic of Timor-Leste
#> 34                                                                                                                                                                      <NA>
#> 35                                                                                                                           Secretaria de Hacienda y Credito Publico (SHCP)
#> 36                                                                                                                                                    Republic of Uzbekistan
#> 37                                                                                                                              Republic of Madagascar (Ministry of Finance)
#> 38                                                                                                                                               National Steering Committee
#> 39                                                                                                                                                                      <NA>
#> 40                                                                                                                                             Federative Republic of Brazil
#> 41                                                                                                                                                    KTDA Power Company Ltd
#> 42                                                                                                                                                                      <NA>
#> 43                                                                                                                                                                   Jamaica
#> 44                                                                                                                                              The Land Bank of Philippines
#> 45                                                                                                                                                                      <NA>
#> 46                                                                                                                                             Socialist Republic of Vietnam
#> 47                                                                                                                                                                      <NA>
#> 48                                                                                                                                                                      <NA>
#> 49                                                                                                                                       Ministry of Environment and Forests
#> 50                                                                                                                                                       Rainforest Alliance
#> 51                                                                                                                                                                      <NA>
#> 52                                                                                                                                   Federal Democratic Republic of Ethiopia
#> 53                                                                                                                                                       Ministry of Finance
#> 54                                                                                                                                                                      <NA>
#> 55                                                                                                                                                                      <NA>
#> 56                                                                                                                                                                      <NA>
#> 57                                                                                                                                                                      <NA>
#> 58                                                                                                                                                                      <NA>
#> 59                                                                                                                                                Government of India, India
#> 60                                                                                                                                              Democratic Republic of Congo
#> 61                                                                                                                                                                      <NA>
#> 62                                                                                                                                                      Ministry of Industry
#> 63                                                                                                                                                                      <NA>
#> 64                                                                                                                                                                      <NA>
#> 65                                                                                                                                                                      <NA>
#> 66                                                                                                                                                                      <NA>
#> 67                                                                                                                                                                      <NA>
#> 68  Executive Committee for International Fund for Saving the Aral Sea, Ministry of Finance of the Republic of Tajikistan, Ministry of Finance of the Republic of Uzbekistan
#> 69                                                                                                                    Government of Nepal represented by Ministry of Finance
#> 70                                                                                                                                                                      <NA>
#> 71                                                                                                                                                            AIDESEP, CONAP
#> 72                                                                                                                                                                      <NA>
#> 73                                                                                                                                                                     Nepal
#> 74                                                                                                                                                                      <NA>
#> 75                                                                                                                                                         Republic of India
#> 76                                                                                                                                                       Government of Niger
#> 77                                                                                                                                Ministerio de Economia y Finanzas Publicas
#> 78                                                                                                                                                         Republic of India
#> 79                                                                                                                                                                      <NA>
#> 80                                                                                                                                                         Republic of India
#> 81                                                                                                                                             Socialist Republic of Vietnam
#> 82                                                                          Government of Saint Lucia, Government of Grenada, Government of Saint Vincent and the Grenadines
#> 83                                                                                                                                                     United Mexican States
#> 84                                                                                                                                     Ministry of Finance and Public Credit
#> 85                                                                                                                                                     GOVERNMENT OF TUNISIA
#> 86                                                                                                                                                                      <NA>
#> 87                                                                                                                                          Republic of the Marshall Islands
#> 88                                                                                                                               Ministry of Finance and Economic Management
#> 89                                                                                                                                      Kenya Electricity Generation Company
#> 90                                                                                                                                                     The Republic of Kenya
#> 91                                                                                                                                                                      <NA>
#> 92                                                                                           MINISTRY OF FINANCE, Ministry of Territorial Administration and Infrastructures
#> 93                                                                                                                                                                      <NA>
#> 94                                                                                                                                                    Republic of Mozambique
#> 95                                                                                                                                                                      <NA>
#> 96                                                                                                                           Finance Ministry (Ministerio de Hacienda), BICE
#> 97                                                                                                                                                       Ministry of Finance
#> 98                                                                                                                                                         Republic of Ghana
#> 99                                                                                                                                    Ministry of Finance and Treasury, MoFT
#> 100                                                                                                                                                                     <NA>
#>                                                                                                                                                                                                      implementing_agency
#> 1                                                                                                              Directorate das Pesca, CONPREC, Institute Nacional da meteorologia, Directorate Geral do Ambiente, MARAPA
#> 2                                                                                                                                                                            Agence pour le Developpement Agricole (ADA)
#> 3                                                                                                                                                                                     Department of Climate Change, NDRC
#> 4                                                                                                                                                                                                                   <NA>
#> 5                                                                                                                                                                                                                CONAFOR
#> 6                                                                                                                                                                          Ministry of Natural Resources and Environment
#> 7                                                                                                                                                                                        Kenya Climate Innovation Centre
#> 8                                                                                                                                                                        National Climate and Environment Fund (FONERWA)
#> 9                                                                                                                                                                         IGAD Climate Prediction and Application Center
#> 10                                                                                                                                                                      Ministry of Planning - Project Coordination Unit
#> 11                                                                               Zambia Metrological Department, Disaster Management and Mitigation Unit, Ministry of Finance, Ministry of Green Economy and Environment
#> 12                                                                                                                Department of Science and Technology, Philippines Climate Change Commission, Department of Agriculture
#> 13                                                                                                                                                                                  Ministry of Planning and Development
#> 14                                                                                                                                                                             Secretaria General de la Comunidad Andina
#> 15                                                                                                                                                  Palli Karma Shayak Foundation, Palli Karma-Sahayak Foundation (PKSF)
#> 16                                                                                                                                                                                                                  <NA>
#> 17                                                                                                                                                                         Ministry of Natural Resources and Environment
#> 18                                                                                                                                                                                   Gross National Happiness Commission
#> 19                                                                                                                                                                   Ministry of Environment and Sustainable Development
#> 20                                                                                                                                                                                    Interim Climate Change Secretariat
#> 21                                                                                                                                         Ceylon Electricity Board, The Sri Lanka Climate Fund (Private) Limited (SLCF)
#> 22                                                                                                                                                                                                                  <NA>
#> 23                                                                                                                                                                                                                  <NA>
#> 24                                                                                                                                                                Arannayk Foundation (AF), Bangladesh Forest Department
#> 25                                                                                                                                                                                           The Ministry of Environment
#> 26                                                                                                                                                                                                                  <NA>
#> 27                                                                                                                  National Center for Climate Change Strategy and International Cooperation (NCSC), Department of Clim
#> 28                                                                                                                                                                                                        Ajwad Musthafa
#> 29                                                                                                                                                                       Honduran Strategic Investment Office (INVEST-H)
#> 30                                                                                                                      Ministry of Internal Affairs, Ministry of Agriculture and Food Industry, Ministry of Environment
#> 31                                                                                                                                                               Ministry of Livestock, Agriculture and Fisheries (MGAP)
#> 32                                                                                                                                                                                                                  <NA>
#> 33                                                                                                                                                                                              Ministry of Public Works
#> 34                                                                                                                                                                                                                  <NA>
#> 35                                                                                                               Instituto Nacional de Ecologia y Cambio Climatico (INECC), Mexican Institute of Water Technology (IMTA)
#> 36                                                                                             Ministry of Agriculture and Water Resources, Rural Restructuring Agency under Ministry of Agriculture and Water Resources
#> 37                                                                                                                                                                         Cellule de Prevention et Gestion des Urgences
#> 38                                                                                                                                                                                                           Solidaridad
#> 39                                                                                                                          Fundacao de Desenvolvimento da Pesquisa, Ministerio da Ciencia, Tecnologia e Inovacao (MCTI)
#> 40                                                                                                                                                  Ministry of Enviroment and Climate Change - Brazilian Forest Service
#> 41                                                                                                                                                                                                KTDA power company Ltd
#> 42                                                                                                                                                                                                                  <NA>
#> 43                                                                                                                                                                                         Planning Institute of Jamaica
#> 44                                                                                                                                                                                      The Land Bank of the Philippines
#> 45                                                                                                                                                                                                                  <NA>
#> 46                                                                                                                                                                         Ministry of Natural Resources and Environment
#> 47  Fiscal Policy Office, Ministry of Finance, Coordinating Ministry for Economic Affairs, Ministry of Finance, Ministry of Energy and Mineral Resources, Bioenergy Department, Ministry of Energy and Mineral Resources
#> 48                                                                                                                                                                                                                  <NA>
#> 49                                                                                                                                                                                          Bangladesh Forest Department
#> 50                                                                                                                                                                                                   Rainforest Alliance
#> 51                                                                                                                                                                                                                  <NA>
#> 52                                                                                                                                                                          Ministry of Finance and Economic Cooperation
#> 53                                                                                                                                                                              Ministry of Energy and Water Development
#> 54                                                                                                                                                                                                                  <NA>
#> 55                                                                                                                                                                                                                  <NA>
#> 56                                                                                                                                                                                                                  <NA>
#> 57                                                                                                                                                                                                                  <NA>
#> 58                                                                                                                                                                                                                  <NA>
#> 59                                                                                                                                   Small Industries Development Bank of India, EESL Energy Efficiency Services Limited
#> 60                                                                                                                                                                                                                  <NA>
#> 61                                                                                                                                                                                                                  <NA>
#> 62                                                                                                                                                                                                  Ministry of Industry
#> 63                                                                                                                                                                                                                  <NA>
#> 64                                                                                                                                                                                                                  <NA>
#> 65                                                                                                                                                                                         Empresas Publicas de Medellin
#> 66                                                                                                                                                                                                                  <NA>
#> 67                                                                                                                                                                                                                  <NA>
#> 68                                                                                                                                                       Committee for Environmental Protection, Ministry of Agriculture
#> 69                                                                                                                                                                                  Ministry of Forestry and Environment
#> 70                                                                                                                                                                                                                  <NA>
#> 71                                                                                                                                                                                              World Wildlife Fund, INC
#> 72                                                                                                                                                                                                                  <NA>
#> 73                                                                                                              Department of Hydrology and Meteorology (DHM), Ministry of Agriculture and Livestock Development (MoALD)
#> 74                                                                                                                                                                                                                  <NA>
#> 75                                                                                                                                                                                          Government of Andhra Pradesh
#> 76                                                                                                                                                                                               Ministry of Agriculture
#> 77                                                                                                                                                        Secretariat of Environment and Sustainable Development (SAyDS)
#> 78                                                                                            Small Industries Development Bank of India, Bureau of Energy Efficiency, Ministry of Environment Forest and Climate Change
#> 79                                                                                                                                                                                                                  <NA>
#> 80                                                                                                                                                                  Department of Agriculture, Government of Maharashtra
#> 81                                                                                                                                                                             Ministry of Science and Technology (MOST)
#> 82      Saint Lucia Project Coordination Unit, Ministry of Infrastructure, Energy Ports and Labour, Ministry of Finance, Planning, Sustainable Development and Information Technology, Grenada Project Coordination Unit
#> 83                                                                                                                                                                                                                 SENER
#> 84                                                                                                                           Ministry of Environment and Natural Resources, ANA, Emergency Social Investment Fund (FISE)
#> 85                                                                                                                                                                                         Direction G�n�rale des For�ts
#> 86                                                                                                                                                                                                                  <NA>
#> 87                                                                                                                                                                      Ministry of Finance, Banking and Postal Services
#> 88                                                                                            Department of Energy, Ministry is Ministry of Climate Change Adaptation, Meteorology & Geohazards, Environment, Energy and
#> 89                                                                                                                                                                                                                  <NA>
#> 90                                                                                                                                                                      Ministry of Agriculture, Livestock and Fisheries
#> 91                                                                                                                                                                                                                  <NA>
#> 92                                                                                                                                                                        Renewable Resources and Energy Efficiency Fund
#> 93                                                                                                                                                                                                                  <NA>
#> 94                                                                                                                                                                            Ministry Agriculture and Rural Development
#> 95                                                                                                                                                                                                                  <NA>
#> 96                                                                                                                                                                                                                  <NA>
#> 97                                                                                                                                                                                    Interim Climate Change Secretariat
#> 98                                                                                                                                                                               Ministry of Lands and Natural Resources
#> 99                                                                                                                                                                               Ministry of Environment and Energy, MEE
#> 100                                                                                                                                                                                                                 <NA>
#>                                                                              url
#> 1   https://projects.worldbank.org/en/projects-operations/project-detail/P111669
#> 2   https://projects.worldbank.org/en/projects-operations/project-detail/P117081
#> 3   https://projects.worldbank.org/en/projects-operations/project-detail/P120932
#> 4   https://projects.worldbank.org/en/projects-operations/project-detail/P122687
#> 5   https://projects.worldbank.org/en/projects-operations/project-detail/P123760
#> 6   https://projects.worldbank.org/en/projects-operations/project-detail/P127201
#> 7   https://projects.worldbank.org/en/projects-operations/project-detail/P154586
#> 8   https://projects.worldbank.org/en/projects-operations/project-detail/P160268
#> 9   https://projects.worldbank.org/en/projects-operations/project-detail/P154403
#> 10  https://projects.worldbank.org/en/projects-operations/project-detail/P125669
#> 11  https://projects.worldbank.org/en/projects-operations/project-detail/P127254
#> 12  https://projects.worldbank.org/en/projects-operations/project-detail/P101076
#> 13  https://projects.worldbank.org/en/projects-operations/project-detail/P128434
#> 14  https://projects.worldbank.org/en/projects-operations/project-detail/P145345
#> 15  https://projects.worldbank.org/en/projects-operations/project-detail/P125447
#> 16  https://projects.worldbank.org/en/projects-operations/project-detail/P090731
#> 17  https://projects.worldbank.org/en/projects-operations/project-detail/P122667
#> 18  https://projects.worldbank.org/en/projects-operations/project-detail/P159600
#> 19  https://projects.worldbank.org/en/projects-operations/project-detail/P125804
#> 20  https://projects.worldbank.org/en/projects-operations/project-detail/P160267
#> 21  https://projects.worldbank.org/en/projects-operations/project-detail/P151800
#> 22  https://projects.worldbank.org/en/projects-operations/project-detail/P110849
#> 23  https://projects.worldbank.org/en/projects-operations/project-detail/P144712
#> 24  https://projects.worldbank.org/en/projects-operations/project-detail/P127015
#> 25  https://projects.worldbank.org/en/projects-operations/project-detail/P160552
#> 26  https://projects.worldbank.org/en/projects-operations/project-detail/P059161
#> 27  https://projects.worldbank.org/en/projects-operations/project-detail/P145586
#> 28  https://projects.worldbank.org/en/projects-operations/project-detail/P145482
#> 29  https://projects.worldbank.org/en/projects-operations/project-detail/P157795
#> 30  https://projects.worldbank.org/en/projects-operations/project-detail/P155968
#> 31  https://projects.worldbank.org/en/projects-operations/project-detail/P124181
#> 32  https://projects.worldbank.org/en/projects-operations/project-detail/P117956
#> 33  https://projects.worldbank.org/en/projects-operations/project-detail/P125032
#> 34  https://projects.worldbank.org/en/projects-operations/project-detail/P072554
#> 35  https://projects.worldbank.org/en/projects-operations/project-detail/P100438
#> 36  https://projects.worldbank.org/en/projects-operations/project-detail/P127486
#> 37  https://projects.worldbank.org/en/projects-operations/project-detail/P158816
#> 38  https://projects.worldbank.org/en/projects-operations/project-detail/P145316
#> 39  https://projects.worldbank.org/en/projects-operations/project-detail/P143185
#> 40  https://projects.worldbank.org/en/projects-operations/project-detail/P143334
#> 41  https://projects.worldbank.org/en/projects-operations/project-detail/P160157
#> 42  https://projects.worldbank.org/en/projects-operations/project-detail/P120134
#> 43  https://projects.worldbank.org/en/projects-operations/project-detail/P129633
#> 44  https://projects.worldbank.org/en/projects-operations/project-detail/P152805
#> 45  https://projects.worldbank.org/en/projects-operations/project-detail/P115001
#> 46  https://projects.worldbank.org/en/projects-operations/project-detail/P152797
#> 47  https://projects.worldbank.org/en/projects-operations/project-detail/P154291
#> 48  https://projects.worldbank.org/en/projects-operations/project-detail/P120313
#> 49  https://projects.worldbank.org/en/projects-operations/project-detail/P160234
#> 50  https://projects.worldbank.org/en/projects-operations/project-detail/P151604
#> 51  https://projects.worldbank.org/en/projects-operations/project-detail/P112329
#> 52  https://projects.worldbank.org/en/projects-operations/project-detail/P158987
#> 53  https://projects.worldbank.org/en/projects-operations/project-detail/P160383
#> 54  https://projects.worldbank.org/en/projects-operations/project-detail/P125542
#> 55  https://projects.worldbank.org/en/projects-operations/project-detail/P121986
#> 56  https://projects.worldbank.org/en/projects-operations/project-detail/P073389
#> 57  https://projects.worldbank.org/en/projects-operations/project-detail/P078143
#> 58  https://projects.worldbank.org/en/projects-operations/project-detail/P128268
#> 59  https://projects.worldbank.org/en/projects-operations/project-detail/P132620
#> 60  https://projects.worldbank.org/en/projects-operations/project-detail/P159217
#> 61  https://projects.worldbank.org/en/projects-operations/project-detail/P126214
#> 62  https://projects.worldbank.org/en/projects-operations/project-detail/P148620
#> 63  https://projects.worldbank.org/en/projects-operations/project-detail/P099618
#> 64  https://projects.worldbank.org/en/projects-operations/project-detail/P145765
#> 65  https://projects.worldbank.org/en/projects-operations/project-detail/P074426
#> 66  https://projects.worldbank.org/en/projects-operations/project-detail/P105229
#> 67  https://projects.worldbank.org/en/projects-operations/project-detail/P128445
#> 68  https://projects.worldbank.org/en/projects-operations/project-detail/P151363
#> 69  https://projects.worldbank.org/en/projects-operations/project-detail/P160523
#> 70  https://projects.worldbank.org/en/projects-operations/project-detail/P121006
#> 71  https://projects.worldbank.org/en/projects-operations/project-detail/P148499
#> 72  https://projects.worldbank.org/en/projects-operations/project-detail/P129182
#> 73  https://projects.worldbank.org/en/projects-operations/project-detail/P127508
#> 74  https://projects.worldbank.org/en/projects-operations/project-detail/P148125
#> 75  https://projects.worldbank.org/en/projects-operations/project-detail/P160463
#> 76  https://projects.worldbank.org/en/projects-operations/project-detail/P153420
#> 77  https://projects.worldbank.org/en/projects-operations/project-detail/P116974
#> 78  https://projects.worldbank.org/en/projects-operations/project-detail/P100530
#> 79  https://projects.worldbank.org/en/projects-operations/project-detail/P105370
#> 80  https://projects.worldbank.org/en/projects-operations/project-detail/P160408
#> 81  https://projects.worldbank.org/en/projects-operations/project-detail/P155260
#> 82  https://projects.worldbank.org/en/projects-operations/project-detail/P153404
#> 83  https://projects.worldbank.org/en/projects-operations/project-detail/P145618
#> 84  https://projects.worldbank.org/en/projects-operations/project-detail/P127088
#> 85  https://projects.worldbank.org/en/projects-operations/project-detail/P157919
#> 86  https://projects.worldbank.org/en/projects-operations/project-detail/P109687
#> 87  https://projects.worldbank.org/en/projects-operations/project-detail/P160096
#> 88  https://projects.worldbank.org/en/projects-operations/project-detail/P160658
#> 89  https://projects.worldbank.org/en/projects-operations/project-detail/P106635
#> 90  https://projects.worldbank.org/en/projects-operations/project-detail/P091979
#> 91  https://projects.worldbank.org/en/projects-operations/project-detail/P145434
#> 92  https://projects.worldbank.org/en/projects-operations/project-detail/P152039
#> 93  https://projects.worldbank.org/en/projects-operations/project-detail/P008501
#> 94  https://projects.worldbank.org/en/projects-operations/project-detail/P160033
#> 95  https://projects.worldbank.org/en/projects-operations/project-detail/P064844
#> 96  https://projects.worldbank.org/en/projects-operations/project-detail/P159901
#> 97  https://projects.worldbank.org/en/projects-operations/project-detail/P160493
#> 98  https://projects.worldbank.org/en/projects-operations/project-detail/P148183
#> 99  https://projects.worldbank.org/en/projects-operations/project-detail/P155126
#> 100 https://projects.worldbank.org/en/projects-operations/project-detail/P090058
# }
```
