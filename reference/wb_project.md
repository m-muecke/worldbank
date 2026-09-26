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
#> 17  P500524
#> 18  P180497
#> 19  P177474
#> 20  P178581
#> 21  P175723
#> 22  P179189
#> 23  P180634
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
#> 42  P179039
#> 43  P175811
#> 44  P174593
#> 45  P178888
#> 46  P175728
#> 47  P178252
#> 48  P175261
#> 49  P178339
#> 50  P177070
#> 51  P178146
#> 52  P171750
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
#> 77  P172213
#> 78  P170873
#> 79  P170645
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
#> 102 P157141
#> 103 P167523
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
#> 131 P180699
#> 132 P507340
#> 133 P114890
#> 134 P108190
#> 135 P505866
#> 136 P507322
#> 137 P500380
#> 138 P502493
#> 139 P110539
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
#> 152 P173090
#> 153 P505177
#> 154 P506272
#> 155 P506321
#> 156 P181608
#> 157 P508025
#> 158 P105370
#> 159 P500469
#> 160 P501071
#> 161 P181511
#> 162 P507910
#> 163 P504899
#> 164 P500501
#> 165 P181020
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
#> 179 P178053
#> 180 P500564
#> 181 P505590
#> 182 P180932
#> 183 P505235
#> 184 P507629
#> 185 P506976
#> 186 P181767
#> 187 P506329
#> 188 P508489
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
#> 207 P073882
#> 208 P177159
#> 209 P172497
#> 210 P164602
#> 211 P152285
#> 212 P009585
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
#> 17                                                       Sustainable Human Development Project in the State of Pará
#> 18                                                            BR State of Ceará Sustainable Development Policy Loan
#> 19                                                           Piauí Pillars of Growth and Social Inclusion Project 2
#> 20                                                                            Assam Resilient Rural Bridges Program
#> 21                                                            Mato Grosso Sustainable Development of Family Farming
#> 22                                                           Tamil Nadu Climate Resilient Urban Development Program
#> 23                             Sikkim: Integrated Service Provision and Innovation for Reviving Economies Operation
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
#> 42                                                                 Karnataka Sustainable Rural Water Supply Program
#> 43                                                             Odisha State Capability and Resilient Growth Program
#> 44                                                                  Assam Integrated River Basin Management Program
#> 45                                                                                   Brazil Climate Finance Project
#> 46                                          Gujarat Resilient Cities Partnership: Ahmedabad City Resilience Project
#> 47                              Systems Reform Endeavours for Transformed Health Achievement in Gujarat (SRESTHA-G)
#> 48                                                             Punjab: Building Fiscal and Institutional Resilience
#> 49                                                       Progestão Mato Grosso: Public Sector Management Efficiency
#> 50                                                           Progestão Alagoas: Public Sector Management Efficiency
#> 51                                                                 India's Enhanced Health Service Delivery Program
#> 52                                               Additional Financing: Rooftop Solar Program for Residential sector
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
#> 77                                                             Nagaland: Enhancing Classroom Teaching and Resources
#> 78                             Second Dam Rehabilitation and Improvement Project - Additional Financing (DRIP-2 AF)
#> 79                                          Chhattisgarh Inclusive Rural and Accelerated Agriculture Growth Project
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
#> 102                                                                 Rajasthan State Highways Development Program II
#> 103                                                                     Program Towards Elimination of Tuberculosis
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
#> 131                                                    Tamil Nadu Women Employment and Safety (TN WESAFE) Operation
#> 132                                                               Himachal Disaster Recovery and Resilience Project
#> 133                                                         Combining income and forest protection: açaí production
#> 134                                                            Subterranean Arsenic Removal: Experiment to Delivery
#> 135                                                                                                       BR PE DPL
#> 136                                                 Brazil Enhancing Productivity, Sustainability and Inclusion DPF
#> 137  India Supporting Socioeconomic Development and Livelihood Security among Particularly Vulnerable Tribal Groups
#> 138                                             Rio Grande do Norte: Sustainable Development and Governance Project
#> 139                                                                    India: FaL-G High Capacity Automation Plants
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
#> 152                                         Second Amazona Fiscal and Environmental Sustainability Programmatic DPF
#> 153                                                            India - Enhancing Innovation among ICMR Institutions
#> 154                                                                 Karnataka Water Security and Resilience Program
#> 155                                                                                                   Bahia SIP DPL
#> 156                                                      Progestão Program - MPA Phase 1 State of Rio Grande do Sul
#> 157                                                                                                             SS3
#> 158                                                                          Allian Duhangan Hydro Electric Project
#> 159  Brazil Proactive, Safe and Resilient Road Asset Management Program - State of Espirito Santo Project - Phase 2
#> 160                                                          Rajasthan Highway Modernization Project (RHMP) Phase-2
#> 161                                                   Expanding Clean Hydrogen in Brazil - Ceara Green Hydrogen Hub
#> 162                                                                        Skills: National ITI Upgradation Program
#> 163                                Strengthening Social Assistance Delivery System in the Municipality of São Paulo
#> 164                                        Electrification and Improvement of the São Paulo Urban Transport Program
#> 165                                                                      Gurugram Metro Huda to Cyber City, Haryana
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
#> 179                                                                      Uttar Pradesh Clean Air Management Program
#> 180                                                      Punjab Outcomes-Acceleration In School Education Operation
#> 181                                                                                                    MS Pro-Roads
#> 182                                                                Strengthening Coastal Resilience and the Economy
#> 183                BR State of Rio Grande do Sul Sustainable Recovery and Climate Resilient Development Policy Loan
#> 184                                                Brazil: Decarbonization of Energy-Intensive Value Chains Project
#> 185                                                                        West Bengal Health System Reform Program
#> 186                                                        Hybrid PPP - São Paulo Commuter Rail Lines 11, 12 and 13
#> 187                                                    Private-Delivered Metro Sao Paulo Line 4 Phase III Extension
#> 188                                                                                                         SRH P4R
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
#> 207                                                                  RF 2nd Amazon Fire Prevention and Mobilization
#> 208                                                       Monitoring and Evaluation capacity building in South Asia
#> 209                                                          Sustainable Multiple Use Landscape Consortia in Brazil
#> 210                                                    Integrated Landscape Management in the Cerrado Biome Project
#> 211                                                                     Brazil Investment Plan Coordination Project
#> 212                                                                                                           ODS I
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
#> 17    Active    2024-03-28   2029-04-30           BR  Brazil
#> 18    Active    2024-03-28   2025-12-31           BR  Brazil
#> 19    Active    2024-03-14   2029-07-31           BR  Brazil
#> 20    Active    2024-03-01   2030-06-28           IN   India
#> 21    Active    2024-02-05   2030-05-15           BR  Brazil
#> 22    Active    2023-12-21   2030-12-31           IN   India
#> 23    Active    2023-12-21   2029-04-30           IN   India
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
#> 42    Active    2023-03-28   2028-06-01           IN   India
#> 43    Active    2023-03-28   2028-04-26           IN   India
#> 44    Active    2023-03-24   2027-07-31           IN   India
#> 45    Active    2022-12-22   2028-04-30           BR  Brazil
#> 46    Active    2022-11-22   2028-12-31           IN   India
#> 47    Active    2022-09-21   2028-03-31           IN   India
#> 48    Active    2022-09-19   2027-06-30           IN   India
#> 49    Active    2022-08-23   2028-06-30           BR  Brazil
#> 50    Active    2022-07-21   2028-03-31           BR  Brazil
#> 51    Active    2022-06-28   2027-06-30           IN   India
#> 52    Active    2022-06-28         <NA>           IN   India
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
#> 77    Active    2020-12-15   2026-06-30           IN   India
#> 78    Active    2020-12-15   2027-12-31           IN   India
#> 79    Active    2020-12-15   2026-07-31           IN   India
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
#> 102   Active    2019-03-29   2024-12-31           IN   India
#> 103   Active    2019-03-29   2025-03-31           IN   India
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
#> 131 Pipeline          <NA>         <NA>           IN   India
#> 132 Pipeline          <NA>         <NA>           IN   India
#> 133 Pipeline          <NA>   2011-10-01           BR  Brazil
#> 134 Pipeline          <NA>   2008-12-31           IN   India
#> 135 Pipeline          <NA>         <NA>           BR  Brazil
#> 136 Pipeline          <NA>         <NA>           BR  Brazil
#> 137 Pipeline          <NA>         <NA>           IN   India
#> 138 Pipeline          <NA>         <NA>           BR  Brazil
#> 139 Pipeline          <NA>         <NA>           IN   India
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
#> 154 Pipeline          <NA>         <NA>           IN   India
#> 155 Pipeline          <NA>         <NA>           BR  Brazil
#> 156 Pipeline          <NA>         <NA>           BR  Brazil
#> 157 Pipeline          <NA>         <NA>           BR  Brazil
#> 158 Pipeline          <NA>   2018-05-04           IN   India
#> 159 Pipeline          <NA>         <NA>           BR  Brazil
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
#> 179 Pipeline          <NA>         <NA>           IN   India
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
#> 207   Active          <NA>   2004-09-30           BR  Brazil
#> 208   Active          <NA>   2025-06-30           IN   India
#> 209   Active          <NA>   2027-11-30           BR  Brazil
#> 210   Active          <NA>   2025-11-30           BR  Brazil
#> 211   Active          <NA>   2024-11-30           BR  Brazil
#> 212   Active          <NA>         <NA>           IN   India
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
#> 17  Latin America and Caribbean       350.000000         70.0000         280.00
#> 18  Latin America and Caribbean       541.880000        541.8800           0.00
#> 19  Latin America and Caribbean        50.000000         50.0000           0.00
#> 20                   South Asia       452.000000        452.0000           0.00
#> 21  Latin America and Caribbean        80.000000         80.0000           0.00
#> 22                   South Asia       300.000000        300.0000           0.00
#> 23                   South Asia       100.000000        100.0000           0.00
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
#> 42                   South Asia       363.000000        363.0000           0.00
#> 43                   South Asia       100.000000        100.0000           0.00
#> 44                   South Asia       108.000000        108.0000           0.00
#> 45  Latin America and Caribbean       500.000000        500.0000           0.00
#> 46                   South Asia       280.000000        280.0000           0.00
#> 47                   South Asia       350.000000        350.0000           0.00
#> 48                   South Asia       150.000000        150.0000           0.00
#> 49  Latin America and Caribbean        40.000000         40.0000           0.00
#> 50  Latin America and Caribbean        40.000000         40.0000           0.00
#> 51                   South Asia       500.000000        500.0000           0.00
#> 52                   South Asia       165.000000        150.0000           0.00
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
#> 77                   South Asia        68.000000         68.0000           0.00
#> 78                   South Asia       500.000000        250.0000           0.00
#> 79                   South Asia       167.000000        100.0000           0.00
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
#> 102                  South Asia       250.000000        250.0000           0.00
#> 103                  South Asia       400.000000        400.0000           0.00
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
#> 131                  South Asia       150.000000        150.0000           0.00
#> 132                  South Asia         0.000000          0.0000           0.00
#> 133 Latin America and Caribbean         0.000000          0.0000           0.00
#> 134                  South Asia         0.000000          0.0000           0.00
#> 135 Latin America and Caribbean         0.000000          0.0000           0.00
#> 136 Latin America and Caribbean         0.000000          0.0000           0.00
#> 137                  South Asia         0.000000          0.0000           0.00
#> 138 Latin America and Caribbean        45.000000          0.0000          45.00
#> 139                  South Asia         0.000000          0.0000           0.00
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
#> 152 Latin America and Caribbean       200.000000        200.0000           0.00
#> 153                  South Asia         1.000000          1.0000           0.00
#> 154                  South Asia         0.000000          0.0000           0.00
#> 155 Latin America and Caribbean         0.000000          0.0000           0.00
#> 156 Latin America and Caribbean        50.000000         50.0000           0.00
#> 157 Latin America and Caribbean         0.000000          0.0000           0.00
#> 158                  South Asia         0.000000          0.0000           0.00
#> 159 Latin America and Caribbean       162.400000          0.0000         162.40
#> 160                  South Asia       250.000000          0.0000         250.00
#> 161 Latin America and Caribbean        90.000000         90.0000           0.00
#> 162                  South Asia         0.000000          0.0000           0.00
#> 163 Latin America and Caribbean         0.000000          0.0000           0.00
#> 164 Latin America and Caribbean      2300.000000       2300.0000           0.00
#> 165                  South Asia       131.000000        131.0000           0.00
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
#> 179                  South Asia       350.000000        350.0000           0.00
#> 180                  South Asia       135.000000          0.0000         135.00
#> 181 Latin America and Caribbean       200.000000          0.0000         200.00
#> 182                  South Asia       212.640000        212.6400           0.00
#> 183 Latin America and Caribbean         0.000000          0.0000           0.00
#> 184 Latin America and Caribbean         0.000000          0.0000           0.00
#> 185                  South Asia         0.000000          0.0000           0.00
#> 186 Latin America and Caribbean       100.000000        100.0000           0.00
#> 187 Latin America and Caribbean         0.000000          0.0000           0.00
#> 188                  South Asia         0.000000          0.0000           0.00
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
#> 207 Latin America and Caribbean         1.100000          0.0000           0.00
#> 208                  South Asia         0.852516          0.0000           0.00
#> 209 Latin America and Caribbean        24.577982          0.0000           0.00
#> 210 Latin America and Caribbean        21.000000          0.0000           0.00
#> 211 Latin America and Caribbean         1.000000          0.0000           0.00
#> 212                  South Asia         1.300000          0.0000           0.00
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
#> 17   Investment Project Financing
#> 18     Development Policy Lending
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
#> 102  Investment Project Financing
#> 103 Program-for-Results Financing
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
#> 131 Program-for-Results Financing
#> 132  Investment Project Financing
#> 133      Specific Investment Loan
#> 134      Specific Investment Loan
#> 135    Development Policy Lending
#> 136    Development Policy Lending
#> 137  Investment Project Financing
#> 138  Investment Project Financing
#> 139                          <NA>
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
#> 152    Development Policy Lending
#> 153  Investment Project Financing
#> 154 Program-for-Results Financing
#> 155    Development Policy Lending
#> 156  Investment Project Financing
#> 157 Program-for-Results Financing
#> 158                          <NA>
#> 159  Investment Project Financing
#> 160  Investment Project Financing
#> 161  Investment Project Financing
#> 162 Program-for-Results Financing
#> 163  Investment Project Financing
#> 164 Program-for-Results Financing
#> 165  Investment Project Financing
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
#> 179 Program-for-Results Financing
#> 180 Program-for-Results Financing
#> 181  Investment Project Financing
#> 182  Investment Project Financing
#> 183    Development Policy Lending
#> 184  Investment Project Financing
#> 185 Program-for-Results Financing
#> 186  Investment Project Financing
#> 187  Investment Project Financing
#> 188 Program-for-Results Financing
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
#> 207                          <NA>
#> 208  Investment Project Financing
#> 209  Investment Project Financing
#> 210  Investment Project Financing
#> 211  Investment Project Financing
#> 212      Specific Investment Loan
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
#> 17                                                                                                               <NA>
#> 18                                                                                           State Government of Cear
#> 19                                                                                                      State of Piau
#> 20                                                                                                              India
#> 21                                                                                               State of Mato Grosso
#> 22                                                                                                Ministry of Finance
#> 23                                                                                                              India
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
#> 51                                                                                                              India
#> 52                                                                                                State Bank of India
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
#> 77                                                                                                              India
#> 78                                                                Ministry of Finance, Department of Economic Affairs
#> 79                                                                                                Ministry of Finance
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
#> 102                                                                                                             India
#> 103                                                                                                 Republic of India
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
#> 131                                                                                                             India
#> 132                                                                                                              <NA>
#> 133                                                                                                              <NA>
#> 134                                                                                                              <NA>
#> 135                                                                                                              <NA>
#> 136                                                                                                              <NA>
#> 137                                                                                                              <NA>
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
#> 155                                                                                                              <NA>
#> 156                                                                                                 State of Amazonas
#> 157                                                                                                              <NA>
#> 158                                                                                                              <NA>
#> 159                                                                                                              <NA>
#> 160                                                                                                              <NA>
#> 161                                                                     Complexo Industrial Portuario de Pecem (CIPP)
#> 162                                                                                                              <NA>
#> 163                                                                                                              <NA>
#> 164                                                                                                              <NA>
#> 165                                                                                               Government of India
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
#> 179                                                                                                 Republic of India
#> 180                                                                                                              <NA>
#> 181                                                                                                              <NA>
#> 182                                                                                                             India
#> 183                                                                                                              <NA>
#> 184                                                                                                              <NA>
#> 185                                                                                                              <NA>
#> 186                                                                                                              <NA>
#> 187                                                                                                              <NA>
#> 188                                                                                                              <NA>
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
#> 207                                                                                                              <NA>
#> 208                                                            Institute for Financial Management and Research (IFMR)
#> 209                                                                                                              IICA
#> 210                                       Brazil - Deutsche Gesellschaft f�r Internationale Zusammenarbeit GmbH (GIZ)
#> 211                                                                                  Funda��o Pro-Natureza - FUNATURA
#> 212                                                                                                              <NA>
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
#> 17                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
#> 18                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                State Secretary of Finance
#> 19                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             Piau� State Secretariat for Planning (SEPLAN)
#> 20                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        Public Works Roads Department, Government of Assam
#> 21                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             State Secretary for Family Agriculture (SEAF)
#> 22                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 Tamil Nadu Urban Infrastructure Financial Services Limited, Tamil Nadu Municipal Administration & Water Supply Department
#> 23                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 Planning and Development Department, Government of Sikkim
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
#> 42                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              Rural Drinking Water and Sanitation Department, Government of Karnataka, Rural Development and Panchayat Department, Government of Karnataka
#> 43                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  Finance Department, Government of Odisha
#> 44                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            Flood and River Erosion Management Agency of Assam, Government of Assam, Water Resources Department, Assam State Disaster Management Authority
#> 45                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           Banco do Brasil
#> 46                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        Ahmedabad Municipal Corporation, Gujarat Urban Development Mission, Urban Development and Urban Housing Department
#> 47                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 Government of Gujarat through Health and Family Welfare Department (HFWD)
#> 48                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               Department of Finance, Government of Punjab
#> 49                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      Secretariat of Finance - Mato Grosso
#> 50                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 Secretariat of Finance - State of Alagoas
#> 51                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           Department of Health and Family Welfare, Ministry of Health and Family Welfare, Government of India, Ministry of Health and Family Welfare, Government of India
#> 52                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       State Bank of India
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
#> 77                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 Nagaland (Department of School Education)
#> 78  Uttarakhand Jal Vidyut Nigam Ltd., Kerala State Electricity Board (KSEB), Tamil Nadu Generation and Distribution Corporation Limited (TANGEDCO), Government of Gujarat, Water Resources Department, Government of Chhattisgarh, Water Resources Department, Government of Kerala, Water Resources Department, Government of West Bengal, Irrigation and Waterways Department, Government of Uttar Pradesh, Irrigation and Water Resources Department, Meghalaya Power Generation Corporation Ltd. (MePGCL), Government of Maharasthra, Water Resources Department, Government of Manipur, Water Resources Department, Central Water Commission (CWC), Ministry of Jal Shakti, Government of Rajasthan, Water Resources Department, Government of Odisha, Water Resources Department, Government of Tamil Nadu, Water Resources Department, Government of Madhya Pradesh, Water Resources Department, Government of Karnataka, Water Resources Department
#> 79                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  Chhattisgarh, Department of Agriculture Development and Farmer Welfare and Biotechnology
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
#> 102                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         Rajasthan State Highway Authority (RSHA), The State of Rajasthan
#> 103                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    Ministry of Health and Family Welfare
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
#> 131                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            Social Welfare & Women Empowerment Department
#> 132                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 133                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 134                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 135                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 136                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 137                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
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
#> 155                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 156                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                State Secretariat of Administration and Management (SEAD)
#> 157                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 158                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 159                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 160                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 161                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   Complexo Industrial Portu�rio de Pec�m
#> 162                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 163                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 164                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 165                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 Haryana Mass Rapid Transport Corporation Limited (HMRTC)
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
#> 179                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           Department of Environment, Forests, and Climate Change, State of Uttar Pradesh
#> 180                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 181                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 182                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        Government of Karnataka, Government of Tamil Nadu
#> 183                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 184                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 185                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 186                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 187                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 188                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
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
#> 207                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 208                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      Jameel Poverty Action Lab (J-PAL) South Asia at the Institute for Financial Management and Research
#> 209                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            Minist�rio do Meio Ambiente (MMA), Minist�rio da Agricultura, Pecu�ria e Abastecimento (MAPA)
#> 210                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        Ministry of Agriculture and  Livestock(MAPA), National Rural Learning Service, Ministry of Environment / Brazilian Forest Service
#> 211                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  Ministry of Environment
#> 212                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
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
#> 17  https://projects.worldbank.org/en/projects-operations/project-detail/P500524
#> 18  https://projects.worldbank.org/en/projects-operations/project-detail/P180497
#> 19  https://projects.worldbank.org/en/projects-operations/project-detail/P177474
#> 20  https://projects.worldbank.org/en/projects-operations/project-detail/P178581
#> 21  https://projects.worldbank.org/en/projects-operations/project-detail/P175723
#> 22  https://projects.worldbank.org/en/projects-operations/project-detail/P179189
#> 23  https://projects.worldbank.org/en/projects-operations/project-detail/P180634
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
#> 42  https://projects.worldbank.org/en/projects-operations/project-detail/P179039
#> 43  https://projects.worldbank.org/en/projects-operations/project-detail/P175811
#> 44  https://projects.worldbank.org/en/projects-operations/project-detail/P174593
#> 45  https://projects.worldbank.org/en/projects-operations/project-detail/P178888
#> 46  https://projects.worldbank.org/en/projects-operations/project-detail/P175728
#> 47  https://projects.worldbank.org/en/projects-operations/project-detail/P178252
#> 48  https://projects.worldbank.org/en/projects-operations/project-detail/P175261
#> 49  https://projects.worldbank.org/en/projects-operations/project-detail/P178339
#> 50  https://projects.worldbank.org/en/projects-operations/project-detail/P177070
#> 51  https://projects.worldbank.org/en/projects-operations/project-detail/P178146
#> 52  https://projects.worldbank.org/en/projects-operations/project-detail/P171750
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
#> 77  https://projects.worldbank.org/en/projects-operations/project-detail/P172213
#> 78  https://projects.worldbank.org/en/projects-operations/project-detail/P170873
#> 79  https://projects.worldbank.org/en/projects-operations/project-detail/P170645
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
#> 102 https://projects.worldbank.org/en/projects-operations/project-detail/P157141
#> 103 https://projects.worldbank.org/en/projects-operations/project-detail/P167523
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
#> 131 https://projects.worldbank.org/en/projects-operations/project-detail/P180699
#> 132 https://projects.worldbank.org/en/projects-operations/project-detail/P507340
#> 133 https://projects.worldbank.org/en/projects-operations/project-detail/P114890
#> 134 https://projects.worldbank.org/en/projects-operations/project-detail/P108190
#> 135 https://projects.worldbank.org/en/projects-operations/project-detail/P505866
#> 136 https://projects.worldbank.org/en/projects-operations/project-detail/P507322
#> 137 https://projects.worldbank.org/en/projects-operations/project-detail/P500380
#> 138 https://projects.worldbank.org/en/projects-operations/project-detail/P502493
#> 139 https://projects.worldbank.org/en/projects-operations/project-detail/P110539
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
#> 152 https://projects.worldbank.org/en/projects-operations/project-detail/P173090
#> 153 https://projects.worldbank.org/en/projects-operations/project-detail/P505177
#> 154 https://projects.worldbank.org/en/projects-operations/project-detail/P506272
#> 155 https://projects.worldbank.org/en/projects-operations/project-detail/P506321
#> 156 https://projects.worldbank.org/en/projects-operations/project-detail/P181608
#> 157 https://projects.worldbank.org/en/projects-operations/project-detail/P508025
#> 158 https://projects.worldbank.org/en/projects-operations/project-detail/P105370
#> 159 https://projects.worldbank.org/en/projects-operations/project-detail/P500469
#> 160 https://projects.worldbank.org/en/projects-operations/project-detail/P501071
#> 161 https://projects.worldbank.org/en/projects-operations/project-detail/P181511
#> 162 https://projects.worldbank.org/en/projects-operations/project-detail/P507910
#> 163 https://projects.worldbank.org/en/projects-operations/project-detail/P504899
#> 164 https://projects.worldbank.org/en/projects-operations/project-detail/P500501
#> 165 https://projects.worldbank.org/en/projects-operations/project-detail/P181020
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
#> 179 https://projects.worldbank.org/en/projects-operations/project-detail/P178053
#> 180 https://projects.worldbank.org/en/projects-operations/project-detail/P500564
#> 181 https://projects.worldbank.org/en/projects-operations/project-detail/P505590
#> 182 https://projects.worldbank.org/en/projects-operations/project-detail/P180932
#> 183 https://projects.worldbank.org/en/projects-operations/project-detail/P505235
#> 184 https://projects.worldbank.org/en/projects-operations/project-detail/P507629
#> 185 https://projects.worldbank.org/en/projects-operations/project-detail/P506976
#> 186 https://projects.worldbank.org/en/projects-operations/project-detail/P181767
#> 187 https://projects.worldbank.org/en/projects-operations/project-detail/P506329
#> 188 https://projects.worldbank.org/en/projects-operations/project-detail/P508489
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
#> 207 https://projects.worldbank.org/en/projects-operations/project-detail/P073882
#> 208 https://projects.worldbank.org/en/projects-operations/project-detail/P177159
#> 209 https://projects.worldbank.org/en/projects-operations/project-detail/P172497
#> 210 https://projects.worldbank.org/en/projects-operations/project-detail/P164602
#> 211 https://projects.worldbank.org/en/projects-operations/project-detail/P152285
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
#> 1   P111669
#> 2   P120932
#> 3   P122687
#> 4   P127201
#> 5   P154586
#> 6   P117081
#> 7   P123760
#> 8   P125669
#> 9   P154403
#> 10  P160268
#> 11  P127254
#> 12  P101076
#> 13  P128434
#> 14  P145345
#> 15  P090731
#> 16  P110849
#> 17  P122667
#> 18  P125447
#> 19  P159600
#> 20  P125804
#> 21  P144712
#> 22  P160552
#> 23  P127015
#> 24  P151800
#> 25  P117956
#> 26  P059161
#> 27  P145586
#> 28  P155968
#> 29  P160267
#> 30  P157795
#> 31  P124181
#> 32  P072554
#> 33  P158816
#> 34  P145482
#> 35  P127486
#> 36  P143185
#> 37  P125032
#> 38  P120134
#> 39  P151604
#> 40  P100438
#> 41  P129633
#> 42  P152805
#> 43  P143334
#> 44  P145316
#> 45  P115001
#> 46  P152797
#> 47  P125542
#> 48  P160157
#> 49  P160234
#> 50  P121986
#> 51  P120313
#> 52  P112329
#> 53  P078143
#> 54  P073389
#> 55  P158987
#> 56  P128268
#> 57  P132620
#> 58  P154291
#> 59  P074426
#> 60  P126214
#> 61  P148620
#> 62  P099618
#> 63  P145765
#> 64  P160383
#> 65  P160523
#> 66  P151363
#> 67  P159217
#> 68  P116974
#> 69  P105229
#> 70  P127508
#> 71  P148125
#> 72  P128445
#> 73  P160408
#> 74  P148499
#> 75  P153404
#> 76  P145618
#> 77  P121006
#> 78  P155260
#> 79  P109687
#> 80  P127088
#> 81  P160463
#> 82  P152039
#> 83  P155827
#> 84  P160658
#> 85  P157919
#> 86  P129182
#> 87  P145434
#> 88  P100530
#> 89  P159901
#> 90  P105370
#> 91  P148183
#> 92  P091979
#> 93  P153420
#> 94  P145298
#> 95  P008501
#> 96  P106133
#> 97  P155126
#> 98  P160493
#> 99  P090058
#> 100 P158119
#>                                                                                                                             project_name
#> 1                                                                                                Sao Tome - Adaptation to Climate Change
#> 2                                                                                                China Technology Needs Assessment (TNA)
#> 3                                                                           Yemen: Pilot Program for Climate Resilience Phase I (PPCR I)
#> 4                                                                                            Vietnam Climate Change Development Policy 2
#> 5                                                                                                         Kenya Climate Venture Facility
#> 6                                                                Integrating Climate Change in the Implementation of the Plan Maroc Vert
#> 7                                                                                              Mexico Forests and Climate Change Project
#> 8                                                                                  Niger Community Action Project for Climate Resilience
#> 9                                 IGAD - Building Disaster Resilience to Disasters through Risk Management and Climate Change Adaptation
#> 10                                                                                           Rwanda Pilot Program for Climate Resilience
#> 11                                                                               Zambia Strengthening Climate Resilience (PPCR Phase II)
#> 12                                                                                                     Climate Change Adaptation Program
#> 13                                                                                Mozambique Climate Change Development Policy Operation
#> 14                                                                   Dropped Andes Adaptation Impact of Climate Change in Water Resource
#> 15                                                                      CARIB-GEF-Implementation of Adaptation Measures in Coastal Zones
#> 16                                                                                       Mexico - Climate Change Development Policy Loan
#> 17                                                                                             Vietnam Climate Change Development Policy
#> 18                                                                                                      Community Climate Change Project
#> 19                                                                               Preparation of Strategic Program for Climate Resilience
#> 20  Adaptation Fund: Increasing Climate Resilience & Enhancing Sustainable Land Management in the Southwest of the Buenos Aires Province
#> 21                                                                        Strengthening Hydro-Meteorological and Climate Services in DRC
#> 22                                                                                                     Climate Mitigation Action Support
#> 23                                                               Climate Resilient Participatory Afforestation and Reforestation Project
#> 24                                                                                                    SL- Climate finance for renewables
#> 25                     Capacity Development for Sustainable Forest Management through Climate Change Mitigation in Non-Annex I Countries
#> 26                                                                                Introduction of Climate Friendly measures in Transport
#> 27                                                                                                China Partnership for Market Readiness
#> 28                                                                                                            Climate Adaptation Project
#> 29                                                                                       Forest Investment Program (FIP) Investment Plan
#> 30                                                                           Honduras Pilot Program for Climate Resilience Phase 1 Grant
#> 31                                                                        Sustainable Management of Natural Resources and Climate Change
#> 32                                                                          Global Environment Facility Climate Change Enabling Activity
#> 33                                                                               Madagascar Pilot Program for Climate Resilience Phase I
#> 34                                                               Accelerating Sustainable Private Investment in Renewable Energy Project
#> 35                                                                   SUSTAINABLE AGRICULTURE AND CLIMATE CHANGE MITIGATION PROJECT (GEF)
#> 36                                  Development of systems to prevent forest fires and monitor vegetation cover in the Brazilian Cerrado
#> 37                                                                                           Timor Leste Road Climate Resilience Project
#> 38                                                                               MX DPL Adaptation to Climate Change in the Water Sector
#> 39                                                                                        Mexico Dedicated Grant Mechanism for IP and LC
#> 40                                                    Adaptation to Climate Change Impacts on the Coastal Wetlands in the Gulf of Mexico
#> 41                                                                                     Improving Climate Data and Information Management
#> 42                                                                   Carbon Asset Development - Methane Recovery from Waste Mgmt Project
#> 43                                                             FIP: Environmental regularization of rural lands in the Cerrado of Brazil
#> 44                                                                               Dedicated Grant Mechanism for Local Communities Project
#> 45                                                                                                       RY-Climate Resilient ICZM (LDC)
#> 46                                                                                              Vietnam-Partnership for Market Readiness
#> 47                                                                                                  Burkina Faso FIP Investment Strategy
#> 48                                                                                              KTDA Small Hydro Programme of Activities
#> 49                                                                                  Bangladesh - FIP Investment Plan Preparation Project
#> 50                                                                                 Zambia Pilot Program for Climate Resilience - Phase I
#> 51                                                                                   Indonesia Climate Change Development Policy Project
#> 52                                                                                              EarthCare Solid Waste Composting Project
#> 53                     Enabling Activity for 2nd National Communication of Argentine Goverment to the Convention on Climate Change (GEF)
#> 54                                                                                    Mainstreaming Adaptation to Climate Change Project
#> 55                                                                               Multi-sector Investment Planning for Climate Resilience
#> 56                                                                                 Maldives: Clean Energy for Climate Mitigation Project
#> 57                                                                                    Partial Risk Sharing Facility in Energy Efficiency
#> 58                                                                                                           Indonesia Energy Sector DPL
#> 59                                                                                                      Jepirachi Carbon Off Set Project
#> 60                                                                                           DRC - FIP Investment Plan Preparation Grant
#> 61                                                                                              Large Enterprises Energy Efficiency Proj
#> 62                                                                                                                  MA-Energy Sector DPL
#> 63                                                                                                       Ghana Climate Innovation Center
#> 64                                                                               Zambia Scaling Renewable Energy Program Investment Plan
#> 65                                                                                      Nepal - Forest Investment Plan Preparation Grant
#> 66                                                                 Climate Adaptation and Mitigation Program for Aral Sea Basin CAMP4ASB
#> 67                                                                               Strengthening Hydro-Meteorological and Climate Services
#> 68                                                                                                AR Third National Communication UNFCCC
#> 69                                                              Mainstreaming Climate Change Adaptation in Irrigated Agriculture Project
#> 70                                                                                        Building Resilience to Climate Related Hazards
#> 71                                                                     Disaster and Climate Risk Management Project Additional Financing
#> 72                                                                                                 Capacity Building & Secretariat BCCRF
#> 73                                                                                  Maharashtra Project on Climate Resilient Agriculture
#> 74                                                                                              Saweto Dedicated Grant Mechanism in Peru
#> 75                                                                                             Solar PV Demonstration & Scale Up Project
#> 76                                                                 MEXICO Sustainable Energy Technologies Development for Climate Change
#> 77                                                                Indigenous Wisdom and Biomathematics: Amazonians Tackle Climate Change
#> 78                                                                                         Vietnam Climate Innovation Center (VCIC) RETF
#> 79                                                                                               Carbon Partnership Facility development
#> 80                                                                           Adaptation of Nicaragua's  Water Supplies to Climate Change
#> 81                                                                         AP Integrated Irrigation & Agriculture Transformation Project
#> 82                                                                                               Geothermal Exploratory Drilling Project
#> 83                                           EASTERN PROVINCE JURISDICTIONAL SUSTAINABLE LANDSCAPE PROGRAM - EMISSIONS REDUCTION PROJECT
#> 84                                                                                                Rural Electrification Project Stage II
#> 85                                                                                    TUNISIA FOREST INVESTMENT PLAN PREPARATION PROJECT
#> 86                                               Lao PDR - Mainstreaming  Disaster and Climate Risk Management into Investment Decisions
#> 87                                                                                            Yemen: Preparation of SREP Investment Plan
#> 88                                                                                          INDIA - Financing Energy Efficiency at MSMEs
#> 89                                                                                            FODER - Argentina Renewable Fund Guarantee
#> 90                                                                                                Allian Duhangan Hydro Electric Project
#> 91                                                                Ghana FIP - Enhancing Natural Forest and Agroforest Landscapes Project
#> 92                                                              Kenya: Adaptation to Climate Change in Arid and Semi-Arid Lands (KACCAL)
#> 93                                                                                             Climate Smart Agriculture Support Project
#> 94                                                                                                     Algeria Energy Efficiency Project
#> 95                                                                                                Petroleum Technical Assistance Project
#> 96                                                                                                Yunnan Whitewaters Hydro Project (ICF)
#> 97                                                                                                       Small Islands ASPIRE Supplement
#> 98                                                                                 Zambia Integrated Forest Landcape Program BioCF Grant
#> 99                                                                                                          Renewable Energy GEF Project
#> 100                                                                Atal Bhujal Yojana (Abhy)-National Groundwater Management Improvement
#>       status approval_date closing_date country_code
#> 1     Closed          <NA>   2017-12-31           ST
#> 2     Closed          <NA>   2016-06-30           CN
#> 3     Closed    2010-08-22         <NA>           RY
#> 4     Closed    2012-11-08   2013-09-30           VN
#> 5     Closed          <NA>   2020-06-25           KE
#> 6     Closed          <NA>   2015-10-15           MA
#> 7     Closed    2012-01-31   2018-02-28           MX
#> 8     Closed          <NA>   2021-05-31           NE
#> 9     Closed          <NA>   2021-05-31           3E
#> 10    Closed          <NA>   2019-04-30           RW
#> 11    Closed          <NA>   2022-12-31           ZM
#> 12    Closed          <NA>   2016-12-31           PH
#> 13    Closed    2013-01-24   2013-06-30           MZ
#> 14   Dropped          <NA>         <NA>           6A
#> 15    Closed          <NA>   2011-12-31           6R
#> 16    Closed    2008-04-08   2011-07-19           MX
#> 17    Closed    2012-02-02   2012-09-30           VN
#> 18    Closed          <NA>   2016-12-31           BD
#> 19    Closed          <NA>   2021-03-31           BT
#> 20    Closed          <NA>   2019-09-30           AR
#> 21   Dropped          <NA>         <NA>           ZR
#> 22    Closed          <NA>   2021-02-28           LK
#> 23    Closed          <NA>   2016-12-31           BD
#> 24   Dropped          <NA>         <NA>           LK
#> 25    Closed    2009-08-11         <NA>           1W
#> 26    Closed          <NA>   2009-03-31           MX
#> 27    Closed          <NA>   2020-08-31           CN
#> 28    Closed    2017-06-09   2023-09-30           MD
#> 29    Closed          <NA>   2018-06-30           ZM
#> 30    Closed          <NA>   2020-06-30           HN
#> 31    Closed    2011-11-17   2021-11-16           UY
#> 32    Closed    2001-06-22   2003-06-30           BY
#> 33    Closed          <NA>   2020-09-30           MG
#> 34    Active    2014-06-26   2025-06-30           MV
#> 35    Closed          <NA>   2018-03-31           UZ
#> 36    Closed          <NA>   2021-12-29           BR
#> 37    Closed    2011-05-17   2022-12-31           TP
#> 38    Closed    2010-06-10   2012-12-31           MX
#> 39    Closed          <NA>   2024-06-28           MX
#> 40    Closed          <NA>   2016-10-31           MX
#> 41    Closed          <NA>   2022-08-31           JM
#> 42    Closed          <NA>   2021-04-30           PH
#> 43    Closed          <NA>   2022-12-31           BR
#> 44    Closed          <NA>   2021-11-30           GH
#> 45   Dropped          <NA>         <NA>           RY
#> 46    Closed          <NA>   2020-12-31           VN
#> 47    Closed    2011-01-28         <NA>           BF
#> 48    Active          <NA>         <NA>           KE
#> 49    Closed          <NA>   2018-11-30           BD
#> 50    Active          <NA>         <NA>           ZM
#> 51    Closed    2010-05-25   2010-12-31           ID
#> 52    Closed    2010-06-29   2019-12-31           NG
#> 53    Closed          <NA>   2007-03-31           AR
#> 54    Closed          <NA>   2009-03-30           6R
#> 55    Closed          <NA>   2018-04-30           ET
#> 56    Closed    2012-03-28   2014-11-30           MV
#> 57    Active          <NA>   2025-03-31           IN
#> 58    Closed    2015-12-01   2016-06-30           ID
#> 59    Closed    2002-12-10   2020-05-31           CO
#> 60    Closed    2011-05-31         <NA>           ZR
#> 61   Dropped          <NA>         <NA>           ID
#> 62    Closed    2007-05-29   2007-12-31           MA
#> 63    Closed    2016-02-02   2020-11-30           GH
#> 64    Closed          <NA>   2018-06-18           ZM
#> 65    Closed          <NA>   2018-09-30           NP
#> 66    Closed    2015-11-03   2024-05-31           7C
#> 67    Closed          <NA>   2023-01-15           ZR
#> 68    Closed          <NA>   2015-06-30           AR
#> 69    Closed          <NA>   2012-06-30           CN
#> 70    Closed          <NA>   2020-11-15           NP
#> 71    Closed    2015-05-19         <NA>           MD
#> 72    Closed    2011-08-30   2014-12-31           BD
#> 73    Closed    2018-02-27   2024-06-30           IN
#> 74    Closed          <NA>   2021-06-25           PE
#> 75    Closed          <NA>   2019-09-30           6O
#> 76    Closed          <NA>   2020-12-31           MX
#> 77  Pipeline          <NA>   2012-12-31           PE
#> 78    Closed          <NA>   2020-08-31           VN
#> 79  Pipeline          <NA>         <NA>           1W
#> 80    Closed          <NA>   2018-06-30           NI
#> 81    Active    2018-10-23   2025-10-31           IN
#> 82    Closed          <NA>   2019-05-31           AM
#> 83    Active          <NA>   2030-10-31           ZM
#> 84    Closed    2017-05-31   2022-06-30           VU
#> 85    Closed          <NA>   2017-12-31           TN
#> 86    Closed    2011-11-28   2016-01-30           LA
#> 87    Closed    2013-04-16         <NA>           RY
#> 88    Closed          <NA>   2019-05-04           IN
#> 89    Closed    2017-02-28   2022-06-30           AR
#> 90  Pipeline          <NA>   2018-05-04           IN
#> 91    Closed          <NA>   2024-06-14           GH
#> 92    Closed          <NA>   2017-06-30           KE
#> 93    Closed    2016-05-26   2022-12-31           NE
#> 94   Dropped          <NA>         <NA>           DZ
#> 95    Closed    1994-06-02   2000-03-31           KZ
#> 96  Pipeline          <NA>   2017-12-18           CN
#> 97   Dropped          <NA>         <NA>           MV
#> 98   Dropped          <NA>         <NA>           ZM
#> 99    Closed          <NA>   2011-06-30           AM
#> 100   Active    2018-06-05   2025-09-28           IN
#>                              country                       region
#> 1              Sao Tome and Principe  Eastern and Southern Africa
#> 2                              China        East Asia and Pacific
#> 3                 Yemen, Republic of Middle East and North Africa
#> 4                            Vietnam        East Asia and Pacific
#> 5                              Kenya  Eastern and Southern Africa
#> 6                            Morocco Middle East and North Africa
#> 7                             Mexico  Latin America and Caribbean
#> 8                              Niger   Western and Central Africa
#> 9        Eastern and Southern Africa  Eastern and Southern Africa
#> 10                            Rwanda  Eastern and Southern Africa
#> 11                            Zambia  Eastern and Southern Africa
#> 12                       Philippines        East Asia and Pacific
#> 13                        Mozambique  Eastern and Southern Africa
#> 14                  Andean Countries  Latin America and Caribbean
#> 15                         Caribbean  Latin America and Caribbean
#> 16                            Mexico  Latin America and Caribbean
#> 17                           Vietnam        East Asia and Pacific
#> 18                        Bangladesh                   South Asia
#> 19                            Bhutan                   South Asia
#> 20                         Argentina  Latin America and Caribbean
#> 21     Congo, Democratic Republic of  Eastern and Southern Africa
#> 22                         Sri Lanka                   South Asia
#> 23                        Bangladesh                   South Asia
#> 24                         Sri Lanka                   South Asia
#> 25                             World                        Other
#> 26                            Mexico  Latin America and Caribbean
#> 27                             China        East Asia and Pacific
#> 28                           Moldova      Europe and Central Asia
#> 29                            Zambia  Eastern and Southern Africa
#> 30                          Honduras  Latin America and Caribbean
#> 31                           Uruguay  Latin America and Caribbean
#> 32                           Belarus      Europe and Central Asia
#> 33                        Madagascar  Eastern and Southern Africa
#> 34                          Maldives                   South Asia
#> 35                        Uzbekistan      Europe and Central Asia
#> 36                            Brazil  Latin America and Caribbean
#> 37                       Timor-Leste        East Asia and Pacific
#> 38                            Mexico  Latin America and Caribbean
#> 39                            Mexico  Latin America and Caribbean
#> 40                            Mexico  Latin America and Caribbean
#> 41                           Jamaica  Latin America and Caribbean
#> 42                       Philippines        East Asia and Pacific
#> 43                            Brazil  Latin America and Caribbean
#> 44                             Ghana   Western and Central Africa
#> 45                Yemen, Republic of Middle East and North Africa
#> 46                           Vietnam        East Asia and Pacific
#> 47                      Burkina Faso   Western and Central Africa
#> 48                             Kenya  Eastern and Southern Africa
#> 49                        Bangladesh                   South Asia
#> 50                            Zambia  Eastern and Southern Africa
#> 51                         Indonesia        East Asia and Pacific
#> 52                           Nigeria   Western and Central Africa
#> 53                         Argentina  Latin America and Caribbean
#> 54                         Caribbean  Latin America and Caribbean
#> 55                          Ethiopia  Eastern and Southern Africa
#> 56                          Maldives                   South Asia
#> 57                             India                   South Asia
#> 58                         Indonesia        East Asia and Pacific
#> 59                          Colombia  Latin America and Caribbean
#> 60     Congo, Democratic Republic of  Eastern and Southern Africa
#> 61                         Indonesia        East Asia and Pacific
#> 62                           Morocco Middle East and North Africa
#> 63                             Ghana   Western and Central Africa
#> 64                            Zambia  Eastern and Southern Africa
#> 65                             Nepal                   South Asia
#> 66                      Central Asia      Europe and Central Asia
#> 67     Congo, Democratic Republic of  Eastern and Southern Africa
#> 68                         Argentina  Latin America and Caribbean
#> 69                             China        East Asia and Pacific
#> 70                             Nepal                   South Asia
#> 71                           Moldova      Europe and Central Asia
#> 72                        Bangladesh                   South Asia
#> 73                             India                   South Asia
#> 74                              Peru  Latin America and Caribbean
#> 75                    OECS Countries  Latin America and Caribbean
#> 76                            Mexico  Latin America and Caribbean
#> 77                              Peru  Latin America and Caribbean
#> 78                           Vietnam        East Asia and Pacific
#> 79                             World                        Other
#> 80                         Nicaragua  Latin America and Caribbean
#> 81                             India                   South Asia
#> 82                           Armenia      Europe and Central Asia
#> 83                            Zambia  Eastern and Southern Africa
#> 84                           Vanuatu        East Asia and Pacific
#> 85                           Tunisia Middle East and North Africa
#> 86  Lao People's Democratic Republic        East Asia and Pacific
#> 87                Yemen, Republic of Middle East and North Africa
#> 88                             India                   South Asia
#> 89                         Argentina  Latin America and Caribbean
#> 90                             India                   South Asia
#> 91                             Ghana   Western and Central Africa
#> 92                             Kenya  Eastern and Southern Africa
#> 93                             Niger   Western and Central Africa
#> 94                           Algeria Middle East and North Africa
#> 95                        Kazakhstan      Europe and Central Asia
#> 96                             China        East Asia and Pacific
#> 97                          Maldives                   South Asia
#> 98                            Zambia  Eastern and Southern Africa
#> 99                           Armenia      Europe and Central Asia
#> 100                            India                   South Asia
#>     total_commitment ibrd_commitment ida_commitment
#> 1           4.147800            0.00            0.0
#> 2           5.000000            0.00            0.0
#> 3           1.500000            0.00            0.0
#> 4          70.000000            0.00           70.0
#> 5           4.900000            0.00            0.0
#> 6           4.345454            0.00            0.0
#> 7         392.000000          350.00            0.0
#> 8          63.000000            0.00            0.0
#> 9           4.999999            0.00            0.0
#> 10          1.500000            0.00            0.0
#> 11         36.000000            0.00            0.0
#> 12          4.970000            0.00            0.0
#> 13         50.000000            0.00           50.0
#> 14          0.000000            0.00            0.0
#> 15          3.450000            0.00            0.0
#> 16        501.250000          501.25            0.0
#> 17         70.000000            0.00           70.0
#> 18         12.500000            0.00            0.0
#> 19          1.500000            0.00            0.0
#> 20          3.960200            0.00            0.0
#> 21          0.000000            0.00            0.0
#> 22          1.800000            0.00            0.0
#> 23         33.800000            0.00            0.0
#> 24          0.000000            0.00            0.0
#> 25          2.568060            0.00            0.0
#> 26          5.800000            0.00            0.0
#> 27          8.000000            0.00            0.0
#> 28         25.200000           12.40           12.8
#> 29          0.250000            0.00            0.0
#> 30          1.400000            0.00            0.0
#> 31         49.000000           49.00            0.0
#> 32          0.310825            0.00            0.0
#> 33          1.500000            0.00            0.0
#> 34         11.684000            0.00           16.0
#> 35         12.699000            0.00            0.0
#> 36          9.250000            0.00            0.0
#> 37         20.000000            0.00           20.0
#> 38        450.000000          450.00            0.0
#> 39          6.000000            0.00            0.0
#> 40          6.361000            0.00            0.0
#> 41          6.800000            0.00            0.0
#> 42          0.410000            0.00            0.0
#> 43         32.480000            0.00            0.0
#> 44          5.500000            0.00            0.0
#> 45          0.000000            0.00            0.0
#> 46          3.000000            0.00            0.0
#> 47          0.250000            0.00            0.0
#> 48          5.148000            0.00            0.0
#> 49          0.250000            0.00            0.0
#> 50          1.500000            0.00            0.0
#> 51        200.000000          200.00            0.0
#> 52          7.125000            0.00            0.0
#> 53          1.140000            0.00            0.0
#> 54          7.800000            0.00            0.0
#> 55          1.500000            0.00            0.0
#> 56          2.530000            0.00            0.0
#> 57         25.000000            0.00            0.0
#> 58        500.000000          500.00            0.0
#> 59          0.000000            0.00            0.0
#> 60          0.250000            0.00            0.0
#> 61          0.000000            0.00            0.0
#> 62        100.000000          100.00            0.0
#> 63         11.700000            0.00            0.0
#> 64          0.300000            0.00            0.0
#> 65          0.250000            0.00            0.0
#> 66         38.000000            0.00           38.0
#> 67          8.029452            0.00            0.0
#> 68          2.439210            0.00            0.0
#> 69          5.000000            0.00            0.0
#> 70         31.000000            0.00            0.0
#> 71          2.000000            0.00            2.0
#> 72          0.200000            0.00            0.0
#> 73        420.000000          420.00            0.0
#> 74          5.500000            0.00            0.0
#> 75          1.800000            0.00            0.0
#> 76         16.880734            0.00            0.0
#> 77          0.000000            0.00            0.0
#> 78          4.600000            0.00            0.0
#> 79          0.000000            0.00            0.0
#> 80          6.000000            0.00            0.0
#> 81        172.200000          172.20            0.0
#> 82          8.550000            0.00            0.0
#> 83          0.000000            0.00            0.0
#> 84          4.000000            0.00            4.0
#> 85          0.250000            0.00            0.0
#> 86          2.718000            0.00            0.0
#> 87          0.300000            0.00            0.0
#> 88         11.300000            0.00            0.0
#> 89        480.000000          480.00            0.0
#> 90          0.000000            0.00            0.0
#> 91         29.500000            0.00            0.0
#> 92          5.500000            0.00            0.0
#> 93        111.000000            0.00          111.0
#> 94          0.000000            0.00            0.0
#> 95         15.700000           15.70            0.0
#> 96          0.000000            0.00            0.0
#> 97          0.000000            0.00            0.0
#> 98          0.000000            0.00            0.0
#> 99          3.000000            0.00            0.0
#> 100       450.000000          450.00            0.0
#>                lending_instrument
#> 1    Investment Project Financing
#> 2    Investment Project Financing
#> 3       Technical Assistance Loan
#> 4      Development Policy Lending
#> 5    Investment Project Financing
#> 6    Investment Project Financing
#> 7    Investment Project Financing
#> 8    Investment Project Financing
#> 9    Investment Project Financing
#> 10   Investment Project Financing
#> 11   Investment Project Financing
#> 12   Investment Project Financing
#> 13     Development Policy Lending
#> 14   Investment Project Financing
#> 15       Specific Investment Loan
#> 16     Development Policy Lending
#> 17     Development Policy Lending
#> 18   Investment Project Financing
#> 19   Investment Project Financing
#> 20   Investment Project Financing
#> 21   Investment Project Financing
#> 22   Investment Project Financing
#> 23   Investment Project Financing
#> 24   Investment Project Financing
#> 25       Specific Investment Loan
#> 26       Specific Investment Loan
#> 27   Investment Project Financing
#> 28   Investment Project Financing
#> 29   Investment Project Financing
#> 30   Investment Project Financing
#> 31   Investment Project Financing
#> 32      Technical Assistance Loan
#> 33   Investment Project Financing
#> 34     Development Policy Lending
#> 35   Investment Project Financing
#> 36   Investment Project Financing
#> 37   Investment Project Financing
#> 38     Development Policy Lending
#> 39   Investment Project Financing
#> 40   Investment Project Financing
#> 41   Investment Project Financing
#> 42   Investment Project Financing
#> 43   Investment Project Financing
#> 44   Investment Project Financing
#> 45       Specific Investment Loan
#> 46   Investment Project Financing
#> 47      Technical Assistance Loan
#> 48   Investment Project Financing
#> 49   Investment Project Financing
#> 50   Investment Project Financing
#> 51     Development Policy Lending
#> 52   Investment Project Financing
#> 53       Specific Investment Loan
#> 54       Specific Investment Loan
#> 55   Investment Project Financing
#> 56       Specific Investment Loan
#> 57   Investment Project Financing
#> 58     Development Policy Lending
#> 59   Investment Project Financing
#> 60      Technical Assistance Loan
#> 61   Investment Project Financing
#> 62     Development Policy Lending
#> 63   Investment Project Financing
#> 64   Investment Project Financing
#> 65   Investment Project Financing
#> 66   Investment Project Financing
#> 67   Investment Project Financing
#> 68   Investment Project Financing
#> 69       Specific Investment Loan
#> 70   Investment Project Financing
#> 71   Investment Project Financing
#> 72      Technical Assistance Loan
#> 73   Investment Project Financing
#> 74   Investment Project Financing
#> 75   Investment Project Financing
#> 76   Investment Project Financing
#> 77      Technical Assistance Loan
#> 78   Investment Project Financing
#> 79                           <NA>
#> 80   Investment Project Financing
#> 81   Investment Project Financing
#> 82   Investment Project Financing
#> 83   Investment Project Financing
#> 84   Investment Project Financing
#> 85   Investment Project Financing
#> 86      Technical Assistance Loan
#> 87      Technical Assistance Loan
#> 88   Investment Project Financing
#> 89   Investment Project Financing
#> 90                           <NA>
#> 91   Investment Project Financing
#> 92   Investment Project Financing
#> 93   Investment Project Financing
#> 94      Technical Assistance Loan
#> 95       Specific Investment Loan
#> 96                           <NA>
#> 97   Investment Project Financing
#> 98   Investment Project Financing
#> 99       Specific Investment Loan
#> 100 Program-for-Results Financing
#>                                                                                                                                                                     borrower
#> 1                                                                                                                              Ministry of Public Works, NR, and Environment
#> 2                                                                                                                                                 PEOPLE'S REPUBLIC OF CHINA
#> 3                                                                                                                                                                       <NA>
#> 4                                                                                                                                                                       <NA>
#> 5                                                                                                                                            Kenya Climate Innovation Centre
#> 6                                                                                                                                                      Government of Morocco
#> 7                                                                                                                                                        Ministry of Finance
#> 8                                                                                                           Ministry of Planning, Local Government and Community Development
#> 9                                                                                                                                Inter-Governmental Authority on Development
#> 10                                                                                                                     Ministry of Finance and Economic Planning (MINECOFIN)
#> 11                                                                                                                                                        Republic of Zambia
#> 12                                                                                                                           Department of Environment and Natural Resources
#> 13                                                                                                                                  The Ministry of Planning and Development
#> 14                                                                                                                                 Secretaria General de la Comunidad Andina
#> 15                                                                                                                                                                      <NA>
#> 16                                                                                                                                                                      <NA>
#> 17                                                                                                                                                                      <NA>
#> 18                                                                                                                          Economic Relations Division, Ministry of Finance
#> 19                                                                                                                                                Royal Government of Bhutan
#> 20                                                                                                                              The Argentine Republic, Ministry of Treasury
#> 21                                                                                                                                                                      <NA>
#> 22                                                                                                                                Democratic Socialist Republic of Sri Lanka
#> 23                                                                                                                                           People's Republic of Bangladesh
#> 24                                                                                 Ministry of Power and  Renewable Energy, Ministry of Mahaweli Development and Environment
#> 25                                                                                                                                                                      <NA>
#> 26                                                                                                                                                                      <NA>
#> 27                                                                                                                                                People's Republic of China
#> 28                                                                                                                                                       Republic of Moldova
#> 29                                                                                                                                 Ministry of National Development Planning
#> 30                                                                                                                                Secretaria de Finanzas de Honduras (SEFIN)
#> 31                                                                                                                                              ORIENTAL REPUBLIC OF URUGUAY
#> 32                                                                                                                                                                      <NA>
#> 33                                                                                                                              Republic of Madagascar (Ministry of Finance)
#> 34                                                                                                                                                  Maryam Abdul Nasir (Ms.)
#> 35                                                                                                                                                    Republic of Uzbekistan
#> 36                                                                                                                                                                      <NA>
#> 37                                                                                                                                        Democratic Republic of Timor-Leste
#> 38                                                                                                                                                                      <NA>
#> 39                                                                                                                                                       Rainforest Alliance
#> 40                                                                                                                           Secretaria de Hacienda y Credito Publico (SHCP)
#> 41                                                                                                                                                                   Jamaica
#> 42                                                                                                                                              The Land Bank of Philippines
#> 43                                                                                                                                             Federative Republic of Brazil
#> 44                                                                                                                                               National Steering Committee
#> 45                                                                                                                                                                      <NA>
#> 46                                                                                                                                             Socialist Republic of Vietnam
#> 47                                                                                                                                                                      <NA>
#> 48                                                                                                                                                    KTDA Power Company Ltd
#> 49                                                                                                                                       Ministry of Environment and Forests
#> 50                                                                                                                                                                      <NA>
#> 51                                                                                                                                                                      <NA>
#> 52                                                                                                                                                                      <NA>
#> 53                                                                                                                                                                      <NA>
#> 54                                                                                                                                                                      <NA>
#> 55                                                                                                                                   Federal Democratic Republic of Ethiopia
#> 56                                                                                                                                                                      <NA>
#> 57                                                                                                                                                Government of India, India
#> 58                                                                                                                                                                      <NA>
#> 59                                                                                                                                                                      <NA>
#> 60                                                                                                                                                                      <NA>
#> 61                                                                                                                                                      Ministry of Industry
#> 62                                                                                                                                                                      <NA>
#> 63                                                                                                                                                                      <NA>
#> 64                                                                                                                                                       Ministry of Finance
#> 65                                                                                                                    Government of Nepal represented by Ministry of Finance
#> 66  Executive Committee for International Fund for Saving the Aral Sea, Ministry of Finance of the Republic of Tajikistan, Ministry of Finance of the Republic of Uzbekistan
#> 67                                                                                                                                              Democratic Republic of Congo
#> 68                                                                                                                                Ministerio de Economia y Finanzas Publicas
#> 69                                                                                                                                                                      <NA>
#> 70                                                                                                                                                                     Nepal
#> 71                                                                                                                                                                      <NA>
#> 72                                                                                                                                                                      <NA>
#> 73                                                                                                                                                         Republic of India
#> 74                                                                                                                                                            AIDESEP, CONAP
#> 75                                                                          Government of Saint Lucia, Government of Grenada, Government of Saint Vincent and the Grenadines
#> 76                                                                                                                                                     United Mexican States
#> 77                                                                                                                                                                      <NA>
#> 78                                                                                                                                             Socialist Republic of Vietnam
#> 79                                                                                                                                                                      <NA>
#> 80                                                                                                                                     Ministry of Finance and Public Credit
#> 81                                                                                                                                                         Republic of India
#> 82                                                                                           MINISTRY OF FINANCE, Ministry of Territorial Administration and Infrastructures
#> 83                                                                                                                                                       Ministry of Finance
#> 84                                                                                                                               Ministry of Finance and Economic Management
#> 85                                                                                                                                                     GOVERNMENT OF TUNISIA
#> 86                                                                                                                                                                      <NA>
#> 87                                                                                                                                                                      <NA>
#> 88                                                                                                                                                         Republic of India
#> 89                                                                                                                           Finance Ministry (Ministerio de Hacienda), BICE
#> 90                                                                                                                                                                      <NA>
#> 91                                                                                                                                                         Republic of Ghana
#> 92                                                                                                                                                     The Republic of Kenya
#> 93                                                                                                                                                       Government of Niger
#> 94                                                                                                                                                                      <NA>
#> 95                                                                                                                                                                      <NA>
#> 96                                                                                                                                                                      <NA>
#> 97                                                                                                                                    Ministry of Finance and Treasury, MoFT
#> 98                                                                                                                                                       Ministry of Finance
#> 99                                                                                                                                                                      <NA>
#> 100                                                                                                 Department of Economic Affairs, Ministry of Finance, Government of India
#>                                                                                                                                                                                                      implementing_agency
#> 1                                                                                                              Directorate das Pesca, CONPREC, Institute Nacional da meteorologia, Directorate Geral do Ambiente, MARAPA
#> 2                                                                                                                                                                                     Department of Climate Change, NDRC
#> 3                                                                                                                                                                                                                   <NA>
#> 4                                                                                                                                                                          Ministry of Natural Resources and Environment
#> 5                                                                                                                                                                                        Kenya Climate Innovation Centre
#> 6                                                                                                                                                                            Agence pour le Developpement Agricole (ADA)
#> 7                                                                                                                                                                                                                CONAFOR
#> 8                                                                                                                                                                       Ministry of Planning - Project Coordination Unit
#> 9                                                                                                                                                                         IGAD Climate Prediction and Application Center
#> 10                                                                                                                                                                       National Climate and Environment Fund (FONERWA)
#> 11                                                                               Zambia Metrological Department, Disaster Management and Mitigation Unit, Ministry of Finance, Ministry of Green Economy and Environment
#> 12                                                                                                                Department of Science and Technology, Philippines Climate Change Commission, Department of Agriculture
#> 13                                                                                                                                                                                  Ministry of Planning and Development
#> 14                                                                                                                                                                             Secretaria General de la Comunidad Andina
#> 15                                                                                                                                                                                                                  <NA>
#> 16                                                                                                                                                                                                                  <NA>
#> 17                                                                                                                                                                         Ministry of Natural Resources and Environment
#> 18                                                                                                                                                  Palli Karma Shayak Foundation, Palli Karma-Sahayak Foundation (PKSF)
#> 19                                                                                                                                                                                   Gross National Happiness Commission
#> 20                                                                                                                                                                   Ministry of Environment and Sustainable Development
#> 21                                                                                                                                                                                                                  <NA>
#> 22                                                                                                                                                                                           The Ministry of Environment
#> 23                                                                                                                                                                Arannayk Foundation (AF), Bangladesh Forest Department
#> 24                                                                                                                                         Ceylon Electricity Board, The Sri Lanka Climate Fund (Private) Limited (SLCF)
#> 25                                                                                                                                                                                                                  <NA>
#> 26                                                                                                                                                                                                                  <NA>
#> 27                                                                                                                  National Center for Climate Change Strategy and International Cooperation (NCSC), Department of Clim
#> 28                                                                                                                      Ministry of Internal Affairs, Ministry of Agriculture and Food Industry, Ministry of Environment
#> 29                                                                                                                                                                                    Interim Climate Change Secretariat
#> 30                                                                                                                                                                       Honduran Strategic Investment Office (INVEST-H)
#> 31                                                                                                                                                               Ministry of Livestock, Agriculture and Fisheries (MGAP)
#> 32                                                                                                                                                                                                                  <NA>
#> 33                                                                                                                                                                         Cellule de Prevention et Gestion des Urgences
#> 34                                                                                                                                                                                                        Ajwad Musthafa
#> 35                                                                                             Ministry of Agriculture and Water Resources, Rural Restructuring Agency under Ministry of Agriculture and Water Resources
#> 36                                                                                                                          Fundacao de Desenvolvimento da Pesquisa, Ministerio da Ciencia, Tecnologia e Inovacao (MCTI)
#> 37                                                                                                                                                                                              Ministry of Public Works
#> 38                                                                                                                                                                                                                  <NA>
#> 39                                                                                                                                                                                                   Rainforest Alliance
#> 40                                                                                                               Instituto Nacional de Ecologia y Cambio Climatico (INECC), Mexican Institute of Water Technology (IMTA)
#> 41                                                                                                                                                                                         Planning Institute of Jamaica
#> 42                                                                                                                                                                                      The Land Bank of the Philippines
#> 43                                                                                                                                                  Ministry of Enviroment and Climate Change - Brazilian Forest Service
#> 44                                                                                                                                                                                                           Solidaridad
#> 45                                                                                                                                                                                                                  <NA>
#> 46                                                                                                                                                                         Ministry of Natural Resources and Environment
#> 47                                                                                                                                                                                                                  <NA>
#> 48                                                                                                                                                                                                KTDA power company Ltd
#> 49                                                                                                                                                                                          Bangladesh Forest Department
#> 50                                                                                                                                                                                                                  <NA>
#> 51                                                                                                                                                                                                                  <NA>
#> 52                                                                                                                                                                                                                  <NA>
#> 53                                                                                                                                                                                                                  <NA>
#> 54                                                                                                                                                                                                                  <NA>
#> 55                                                                                                                                                                          Ministry of Finance and Economic Cooperation
#> 56                                                                                                                                                                                                                  <NA>
#> 57                                                                                                                                   Small Industries Development Bank of India, EESL Energy Efficiency Services Limited
#> 58  Fiscal Policy Office, Ministry of Finance, Coordinating Ministry for Economic Affairs, Ministry of Finance, Ministry of Energy and Mineral Resources, Bioenergy Department, Ministry of Energy and Mineral Resources
#> 59                                                                                                                                                                                         Empresas Publicas de Medellin
#> 60                                                                                                                                                                                                                  <NA>
#> 61                                                                                                                                                                                                  Ministry of Industry
#> 62                                                                                                                                                                                                                  <NA>
#> 63                                                                                                                                                                                                                  <NA>
#> 64                                                                                                                                                                              Ministry of Energy and Water Development
#> 65                                                                                                                                                                                  Ministry of Forestry and Environment
#> 66                                                                                                                                                       Committee for Environmental Protection, Ministry of Agriculture
#> 67                                                                                                                                                                                                                  <NA>
#> 68                                                                                                                                                        Secretariat of Environment and Sustainable Development (SAyDS)
#> 69                                                                                                                                                                                                                  <NA>
#> 70                                                                                                              Department of Hydrology and Meteorology (DHM), Ministry of Agriculture and Livestock Development (MoALD)
#> 71                                                                                                                                                                                                                  <NA>
#> 72                                                                                                                                                                                                                  <NA>
#> 73                                                                                                                                                                  Department of Agriculture, Government of Maharashtra
#> 74                                                                                                                                                                                              World Wildlife Fund, INC
#> 75      Saint Lucia Project Coordination Unit, Ministry of Infrastructure, Energy Ports and Labour, Ministry of Finance, Planning, Sustainable Development and Information Technology, Grenada Project Coordination Unit
#> 76                                                                                                                                                                                                                 SENER
#> 77                                                                                                                                                                                                                  <NA>
#> 78                                                                                                                                                                             Ministry of Science and Technology (MOST)
#> 79                                                                                                                                                                                                                  <NA>
#> 80                                                                                                                           Ministry of Environment and Natural Resources, ANA, Emergency Social Investment Fund (FISE)
#> 81                                                                                                                                                                                          Government of Andhra Pradesh
#> 82                                                                                                                                                                        Renewable Resources and Energy Efficiency Fund
#> 83                                                                                                                                                                             Ministry of Green Economy and Environment
#> 84                                                                                            Department of Energy, Ministry is Ministry of Climate Change Adaptation, Meteorology & Geohazards, Environment, Energy and
#> 85                                                                                                                                                                                         Direction G�n�rale des For�ts
#> 86                                                                                                                                                                                                                  <NA>
#> 87                                                                                                                                                                                                                  <NA>
#> 88                                                                                            Small Industries Development Bank of India, Bureau of Energy Efficiency, Ministry of Environment Forest and Climate Change
#> 89                                                                                                                                                                                                                  <NA>
#> 90                                                                                                                                                                                                                  <NA>
#> 91                                                                                                                                                                               Ministry of Lands and Natural Resources
#> 92                                                                                                                                                                      Ministry of Agriculture, Livestock and Fisheries
#> 93                                                                                                                                                                                               Ministry of Agriculture
#> 94                                                                                                                                                                                                                  <NA>
#> 95                                                                                                                                                                                                                  <NA>
#> 96                                                                                                                                                                                                                  <NA>
#> 97                                                                                                                                                                               Ministry of Environment and Energy, MEE
#> 98                                                                                                                                                                                    Interim Climate Change Secretariat
#> 99                                                                                                                                                                                                                  <NA>
#> 100                                                                                                                  The Department of Water Resources, Ganga Rejuvenation and River Development, Ministry of Jal Shakti
#>                                                                              url
#> 1   https://projects.worldbank.org/en/projects-operations/project-detail/P111669
#> 2   https://projects.worldbank.org/en/projects-operations/project-detail/P120932
#> 3   https://projects.worldbank.org/en/projects-operations/project-detail/P122687
#> 4   https://projects.worldbank.org/en/projects-operations/project-detail/P127201
#> 5   https://projects.worldbank.org/en/projects-operations/project-detail/P154586
#> 6   https://projects.worldbank.org/en/projects-operations/project-detail/P117081
#> 7   https://projects.worldbank.org/en/projects-operations/project-detail/P123760
#> 8   https://projects.worldbank.org/en/projects-operations/project-detail/P125669
#> 9   https://projects.worldbank.org/en/projects-operations/project-detail/P154403
#> 10  https://projects.worldbank.org/en/projects-operations/project-detail/P160268
#> 11  https://projects.worldbank.org/en/projects-operations/project-detail/P127254
#> 12  https://projects.worldbank.org/en/projects-operations/project-detail/P101076
#> 13  https://projects.worldbank.org/en/projects-operations/project-detail/P128434
#> 14  https://projects.worldbank.org/en/projects-operations/project-detail/P145345
#> 15  https://projects.worldbank.org/en/projects-operations/project-detail/P090731
#> 16  https://projects.worldbank.org/en/projects-operations/project-detail/P110849
#> 17  https://projects.worldbank.org/en/projects-operations/project-detail/P122667
#> 18  https://projects.worldbank.org/en/projects-operations/project-detail/P125447
#> 19  https://projects.worldbank.org/en/projects-operations/project-detail/P159600
#> 20  https://projects.worldbank.org/en/projects-operations/project-detail/P125804
#> 21  https://projects.worldbank.org/en/projects-operations/project-detail/P144712
#> 22  https://projects.worldbank.org/en/projects-operations/project-detail/P160552
#> 23  https://projects.worldbank.org/en/projects-operations/project-detail/P127015
#> 24  https://projects.worldbank.org/en/projects-operations/project-detail/P151800
#> 25  https://projects.worldbank.org/en/projects-operations/project-detail/P117956
#> 26  https://projects.worldbank.org/en/projects-operations/project-detail/P059161
#> 27  https://projects.worldbank.org/en/projects-operations/project-detail/P145586
#> 28  https://projects.worldbank.org/en/projects-operations/project-detail/P155968
#> 29  https://projects.worldbank.org/en/projects-operations/project-detail/P160267
#> 30  https://projects.worldbank.org/en/projects-operations/project-detail/P157795
#> 31  https://projects.worldbank.org/en/projects-operations/project-detail/P124181
#> 32  https://projects.worldbank.org/en/projects-operations/project-detail/P072554
#> 33  https://projects.worldbank.org/en/projects-operations/project-detail/P158816
#> 34  https://projects.worldbank.org/en/projects-operations/project-detail/P145482
#> 35  https://projects.worldbank.org/en/projects-operations/project-detail/P127486
#> 36  https://projects.worldbank.org/en/projects-operations/project-detail/P143185
#> 37  https://projects.worldbank.org/en/projects-operations/project-detail/P125032
#> 38  https://projects.worldbank.org/en/projects-operations/project-detail/P120134
#> 39  https://projects.worldbank.org/en/projects-operations/project-detail/P151604
#> 40  https://projects.worldbank.org/en/projects-operations/project-detail/P100438
#> 41  https://projects.worldbank.org/en/projects-operations/project-detail/P129633
#> 42  https://projects.worldbank.org/en/projects-operations/project-detail/P152805
#> 43  https://projects.worldbank.org/en/projects-operations/project-detail/P143334
#> 44  https://projects.worldbank.org/en/projects-operations/project-detail/P145316
#> 45  https://projects.worldbank.org/en/projects-operations/project-detail/P115001
#> 46  https://projects.worldbank.org/en/projects-operations/project-detail/P152797
#> 47  https://projects.worldbank.org/en/projects-operations/project-detail/P125542
#> 48  https://projects.worldbank.org/en/projects-operations/project-detail/P160157
#> 49  https://projects.worldbank.org/en/projects-operations/project-detail/P160234
#> 50  https://projects.worldbank.org/en/projects-operations/project-detail/P121986
#> 51  https://projects.worldbank.org/en/projects-operations/project-detail/P120313
#> 52  https://projects.worldbank.org/en/projects-operations/project-detail/P112329
#> 53  https://projects.worldbank.org/en/projects-operations/project-detail/P078143
#> 54  https://projects.worldbank.org/en/projects-operations/project-detail/P073389
#> 55  https://projects.worldbank.org/en/projects-operations/project-detail/P158987
#> 56  https://projects.worldbank.org/en/projects-operations/project-detail/P128268
#> 57  https://projects.worldbank.org/en/projects-operations/project-detail/P132620
#> 58  https://projects.worldbank.org/en/projects-operations/project-detail/P154291
#> 59  https://projects.worldbank.org/en/projects-operations/project-detail/P074426
#> 60  https://projects.worldbank.org/en/projects-operations/project-detail/P126214
#> 61  https://projects.worldbank.org/en/projects-operations/project-detail/P148620
#> 62  https://projects.worldbank.org/en/projects-operations/project-detail/P099618
#> 63  https://projects.worldbank.org/en/projects-operations/project-detail/P145765
#> 64  https://projects.worldbank.org/en/projects-operations/project-detail/P160383
#> 65  https://projects.worldbank.org/en/projects-operations/project-detail/P160523
#> 66  https://projects.worldbank.org/en/projects-operations/project-detail/P151363
#> 67  https://projects.worldbank.org/en/projects-operations/project-detail/P159217
#> 68  https://projects.worldbank.org/en/projects-operations/project-detail/P116974
#> 69  https://projects.worldbank.org/en/projects-operations/project-detail/P105229
#> 70  https://projects.worldbank.org/en/projects-operations/project-detail/P127508
#> 71  https://projects.worldbank.org/en/projects-operations/project-detail/P148125
#> 72  https://projects.worldbank.org/en/projects-operations/project-detail/P128445
#> 73  https://projects.worldbank.org/en/projects-operations/project-detail/P160408
#> 74  https://projects.worldbank.org/en/projects-operations/project-detail/P148499
#> 75  https://projects.worldbank.org/en/projects-operations/project-detail/P153404
#> 76  https://projects.worldbank.org/en/projects-operations/project-detail/P145618
#> 77  https://projects.worldbank.org/en/projects-operations/project-detail/P121006
#> 78  https://projects.worldbank.org/en/projects-operations/project-detail/P155260
#> 79  https://projects.worldbank.org/en/projects-operations/project-detail/P109687
#> 80  https://projects.worldbank.org/en/projects-operations/project-detail/P127088
#> 81  https://projects.worldbank.org/en/projects-operations/project-detail/P160463
#> 82  https://projects.worldbank.org/en/projects-operations/project-detail/P152039
#> 83  https://projects.worldbank.org/en/projects-operations/project-detail/P155827
#> 84  https://projects.worldbank.org/en/projects-operations/project-detail/P160658
#> 85  https://projects.worldbank.org/en/projects-operations/project-detail/P157919
#> 86  https://projects.worldbank.org/en/projects-operations/project-detail/P129182
#> 87  https://projects.worldbank.org/en/projects-operations/project-detail/P145434
#> 88  https://projects.worldbank.org/en/projects-operations/project-detail/P100530
#> 89  https://projects.worldbank.org/en/projects-operations/project-detail/P159901
#> 90  https://projects.worldbank.org/en/projects-operations/project-detail/P105370
#> 91  https://projects.worldbank.org/en/projects-operations/project-detail/P148183
#> 92  https://projects.worldbank.org/en/projects-operations/project-detail/P091979
#> 93  https://projects.worldbank.org/en/projects-operations/project-detail/P153420
#> 94  https://projects.worldbank.org/en/projects-operations/project-detail/P145298
#> 95  https://projects.worldbank.org/en/projects-operations/project-detail/P008501
#> 96  https://projects.worldbank.org/en/projects-operations/project-detail/P106133
#> 97  https://projects.worldbank.org/en/projects-operations/project-detail/P155126
#> 98  https://projects.worldbank.org/en/projects-operations/project-detail/P160493
#> 99  https://projects.worldbank.org/en/projects-operations/project-detail/P090058
#> 100 https://projects.worldbank.org/en/projects-operations/project-detail/P158119
# }
```
