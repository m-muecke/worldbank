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
#>         id
#> 1  P163868
#> 2  P178993
#> 3  P178563
#> 4  P172605
#> 5  P179088
#> 6  P177070
#> 7  P179046
#> 8  P178663
#> 9  P179365
#> 10 P073882
#> 11 P153012
#> 12 P172497
#>                                                              project_name
#> 1                   Support to Upper Secondary Reform in Brazil Operation
#> 2      Mato Grosso Resilient, Inclusive, and Sustainable Learning Project
#> 3             RECOVERING LEARNING LOSSES FROM COVID-19 PANDEMIC IN BRAZIL
#> 4                Salvador Social Multi-Sector Service Delivery Project II
#> 5                Progestão Tocantins: Public Sector Management Efficiency
#> 6                  Progestão Alagoas: Public Sector Management Efficiency
#> 7                     Progestão Acre: Public Sector Management Efficiency
#> 8                    Progestão Piauí: Public Sector Management Efficiency
#> 9  Brazil: Support to New Bolsa Familia Conditional Cash Transfer Program
#> 10                         RF 2nd Amazon Fire Prevention and Mobilization
#> 11                        Fortaleza Sustainable Urban Development Project
#> 12                 Sustainable Multiple Use Landscape Consortia in Brazil
#>    status approval_date closing_date country_code country
#> 1  Active    2017-12-14   2024-12-31           BR  Brazil
#> 2  Active    2023-10-26   2028-12-31           BR  Brazil
#> 3  Active    2022-05-12   2027-12-31           BR  Brazil
#> 4  Active    2020-09-22   2025-12-30           BR  Brazil
#> 5  Active    2023-07-24   2028-12-29           BR  Brazil
#> 6  Active    2022-07-21   2028-03-31           BR  Brazil
#> 7  Active    2023-07-24   2028-12-29           BR  Brazil
#> 8  Active    2023-10-03   2029-06-29           BR  Brazil
#> 9  Active    2023-12-06   2026-04-30           BR  Brazil
#> 10 Active          <NA>   2004-09-30           BR  Brazil
#> 11 Active    2017-04-28   2025-03-31           BR  Brazil
#> 12 Active          <NA>   2027-11-30           BR  Brazil
#>                         region total_commitment ibrd_commitment ida_commitment
#> 1  Latin America and Caribbean        250.00000           250.0              0
#> 2  Latin America and Caribbean        100.00000           100.0              0
#> 3  Latin America and Caribbean        250.00000           250.0              0
#> 4  Latin America and Caribbean        125.00000           125.0              0
#> 5  Latin America and Caribbean         50.00000            50.0              0
#> 6  Latin America and Caribbean         40.00000            40.0              0
#> 7  Latin America and Caribbean         40.00000            40.0              0
#> 8  Latin America and Caribbean         50.00000            50.0              0
#> 9  Latin America and Caribbean        300.00000           300.0              0
#> 10 Latin America and Caribbean          1.10000             0.0              0
#> 11 Latin America and Caribbean         73.30000            73.3              0
#> 12 Latin America and Caribbean         24.57798             0.0              0
#>               lending_instrument
#> 1  Program-for-Results Financing
#> 2   Investment Project Financing
#> 3  Program-for-Results Financing
#> 4   Investment Project Financing
#> 5   Investment Project Financing
#> 6   Investment Project Financing
#> 7   Investment Project Financing
#> 8   Investment Project Financing
#> 9   Investment Project Financing
#> 10                          <NA>
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
#> 9                                              Federative Republic of Brazil
#> 10                                                                      <NA>
#> 11                                                 Municipality of Fortaleza
#> 12                                                                      IICA
#>                                                                                          implementing_agency
#> 1                                                             Ministry of Education (Minist�rio da Educa��o)
#> 2                                                                     SECRETARIAT OF EDUCATION - MATO GROSSO
#> 3                                                                                      MINISTRY OF EDUCATION
#> 4                                                                                                 Casa Civil
#> 5                                                                                                        UGP
#> 6                                                                  Secretariat of Finance - State of Alagoas
#> 7                                                                              State Secretariat of Planning
#> 8                                                                            Secretariat of Finance of Piaui
#> 9                                                                                    Ministry of Citizenship
#> 10                                                                                                      <NA>
#> 11 Secretaria Municipal de Urbanismo e Meio Ambiente (SEUMA), Secretaria Municipal de Infraestrutura (SEINF)
#> 12             Minist�rio do Meio Ambiente (MMA), Minist�rio da Agricultura, Pecu�ria e Abastecimento (MAPA)
#>                                                                             url
#> 1  https://projects.worldbank.org/en/projects-operations/project-detail/P163868
#> 2  https://projects.worldbank.org/en/projects-operations/project-detail/P178993
#> 3  https://projects.worldbank.org/en/projects-operations/project-detail/P178563
#> 4  https://projects.worldbank.org/en/projects-operations/project-detail/P172605
#> 5  https://projects.worldbank.org/en/projects-operations/project-detail/P179088
#> 6  https://projects.worldbank.org/en/projects-operations/project-detail/P177070
#> 7  https://projects.worldbank.org/en/projects-operations/project-detail/P179046
#> 8  https://projects.worldbank.org/en/projects-operations/project-detail/P178663
#> 9  https://projects.worldbank.org/en/projects-operations/project-detail/P179365
#> 10 https://projects.worldbank.org/en/projects-operations/project-detail/P073882
#> 11 https://projects.worldbank.org/en/projects-operations/project-detail/P153012
#> 12 https://projects.worldbank.org/en/projects-operations/project-detail/P172497

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
#> 22  P179189
#> 23  P180634
#> 24  P179365
#> 25  P179182
#> 26  P178993
#> 27  P178567
#> 28  P178663
#> 29  P179046
#> 30  P179088
#> 31  P176733
#> 32  P176032
#> 33  P179249
#> 34  P178418
#> 35  P179337
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
#> 51  P178146
#> 52  P175676
#> 53  P171750
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
#> 73  P173958
#> 74  P170811
#> 75  P173704
#> 76  P168633
#> 77  P172213
#> 78  P170645
#> 79  P170873
#> 80  P166020
#> 81  P168097
#> 82  P172605
#> 83  P169111
#> 84  P174312
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
#> 121 P148775
#> 122 P155303
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
#> 137 P181511
#> 138 P500469
#> 139 P501071
#> 140 P105370
#> 141 P173090
#> 142 P506272
#> 143 P506321
#> 144 P505177
#> 145 P181608
#> 146 P508025
#> 147 P500168
#> 148 P506320
#> 149 P500431
#> 150 P508453
#> 151 P504897
#> 152 P503872
#> 153 P506340
#> 154 P507236
#> 155 P500252
#> 156 P508840
#> 157 P506955
#> 158 P504126
#> 159 P507066
#> 160 P508221
#> 161 P507029
#> 162 P508202
#> 163 P508363
#> 164 P180716
#> 165 P504276
#> 166 P500570
#> 167 P181244
#> 168 P502499
#> 169 P500151
#> 170 P508719
#> 171 P505563
#> 172 P507628
#> 173 P179349
#> 174 P504543
#> 175 P505914
#> 176 P509041
#> 177 P506142
#> 178 P500614
#> 179 P506861
#> 180 P507910
#> 181 P504899
#> 182 P500501
#> 183 P181020
#> 184 P180699
#> 185 P507340
#> 186 P114890
#> 187 P180932
#> 188 P505235
#> 189 P178053
#> 190 P507629
#> 191 P506976
#> 192 P500564
#> 193 P505590
#> 194 P181767
#> 195 P506329
#> 196 P508489
#> 197 P114896
#> 198 P504253
#> 199 P502491
#> 200 P181524
#> 201 P171257
#> 202 P132620
#> 203 P122387
#> 204 P152285
#> 205 P009585
#> 206 P073882
#> 207 P177159
#> 208 P172497
#> 209 P164602
#> 210 P128921
#> 211 P158000
#> 212 P160018
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
#> 22                                                           Tamil Nadu Climate Resilient Urban Development Program
#> 23                             Sikkim: Integrated Service Provision and Innovation for Reviving Economies Operation
#> 24                                           Brazil: Support to New Bolsa Familia Conditional Cash Transfer Program
#> 25                                         Rio de Janeiro Fiscal Management and Sustainable Development Policy Loan
#> 26                                               Mato Grosso Resilient, Inclusive, and Sustainable Learning Project
#> 27                                                           Piauí Health and Social Protection Development Project
#> 28                                                             Progestão Piauí: Public Sector Management Efficiency
#> 29                                                              Progestão Acre: Public Sector Management Efficiency
#> 30                                                         Progestão Tocantins: Public Sector Management Efficiency
#> 31                                                                 IN: Manipur Infotech eNabled Development Project
#> 32                                                                Himachal Pradesh Power Sector Development Program
#> 33                                                       Chhattisgarh: Accelerated Learning for a Knowledge-Economy
#> 34                                                       Tripura Rural Economic Growth and Service Delivery Project
#> 35                 Assam State Secondary Healthcare Initiative for Service Delivery Transformation (ASSIST) Project
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
#> 51                                                                 India's Enhanced Health Service Delivery Program
#> 52                              PHSPP: Transforming India’s Public Health Systems for Pandemic Preparedness Program
#> 53                                               Additional Financing: Rooftop Solar Program for Residential sector
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
#> 73                                                                     Mizoram Health Systems Strengthening Project
#> 74                                                                    Punjab Municipal Services Improvement Project
#> 75                                                                 Gujarat Outcomes for Accelerated Learning (GOAL)
#> 76                                                                            Kerala Solid Waste Management Project
#> 77                                                             Nagaland: Enhancing Classroom Teaching and Resources
#> 78                                          Chhattisgarh Inclusive Rural and Accelerated Agriculture Growth Project
#> 79                             Second Dam Rehabilitation and Improvement Project - Additional Financing (DRIP-2 AF)
#> 80                                    West Bengal Inland Water Transport, Logistics and Spatial Development Project
#> 81                                                                           Meghalaya Integrated Transport Project
#> 82                                                         Salvador Social Multi-Sector Service Delivery Project II
#> 83                                                                        Second National Ganga River Basin Project
#> 84                                                                      Second National Ganga River Basin Guarantee
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
#> 121                                     Capacity Augmentation of the National Waterway- 1 (JAL MARG VIKAS)  Project
#> 122                                                                        Madhya Pradesh Urban Development Project
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
#> 137                                                   Expanding Clean Hydrogen in Brazil - Ceara Green Hydrogen Hub
#> 138  Brazil Proactive, Safe and Resilient Road Asset Management Program - State of Espirito Santo Project - Phase 2
#> 139                                                          Rajasthan Highway Modernization Project (RHMP) Phase-2
#> 140                                                                          Allian Duhangan Hydro Electric Project
#> 141                                         Second Amazona Fiscal and Environmental Sustainability Programmatic DPF
#> 142                                                                 Karnataka Water Security and Resilience Program
#> 143                                                                                                   Bahia SIP DPL
#> 144                                                            India - Enhancing Innovation among ICMR Institutions
#> 145                                                      Progestão Program - MPA Phase 1 State of Rio Grande do Sul
#> 146                                                                                                             SS3
#> 147                                                                                                     IPF Regular
#> 148                                                         Accelerating the Energy Transition in the Amazon (AETA)
#> 149                                                     Agroecology and Sustainable Rural Development in Pernambuco
#> 150                                                                                                            MEGA
#> 151                                                                  Bahia Urban Socio-Productive Inclusion Project
#> 152                                                                       Kerala Health Systems Improvement Program
#> 153                                                                                                            MRDP
#> 154                                                                   Assam Governance and Service Delivery Program
#> 155                                                                                                             IPF
#> 156                                                                              Institutions MPA – Phase 1 (Assam)
#> 157                                                                                                    PPP SP Rails
#> 158                                                                                       Brazil: ASL Xingu project
#> 159                   Meghalaya Multisectoral Project for Adolescent Wellbeing, Empowerment and Resilience (MPOWER)
#> 160                                                                                                   SC Resilience
#> 161                                  Brazil Electromobility Multiphase Programmatic Approach – MPA Phase 2 Salvador
#> 162                        Amazon and Cerrado Bioeconomy, Forest Restoration, and Climate-Smart Agriculture Project
#> 163                                                                                                      BR Digital
#> 164                                                                               Promoting Green Hydrogen in India
#> 165                                                                                                 SP Metro Line 2
#> 166                                                                  Sergipe Efficient Digital Acceleration project
#> 167                                                                  India-West Bengal Health System Reform Program
#> 168                                                                            Surat Resilience Enhancement Project
#> 169                                                                                                   PForR Project
#> 170                                                                                                           AHEAD
#> 171                                                                                                        PoCRA-II
#> 172                                                             Energy Transition of the Northeast Region of Brazil
#> 173                                        Electric Vehicle Operations and Lending for a Vibrant Ecosystem (EVOLVE)
#> 174                                                    Brazil Electromobility and Energy Transition Finance Project
#> 175                                                          IN: Digital Empowerment and Services to Harness Growth
#> 176                                                                                                 Tocantins PRIDP
#> 177                                      Santa Catarina Rural Development Project for Sustainability and Innovation
#> 178                                                         BR State of Alagoas Sustainable Development Policy Loan
#> 179                                                                                                  AM Sustainable
#> 180                                                                        Skills: National ITI Upgradation Program
#> 181                                Strengthening Social Assistance Delivery System in the Municipality of São Paulo
#> 182                                        Electrification and Improvement of the São Paulo Urban Transport Program
#> 183                                                                      Gurugram Metro Huda to Cyber City, Haryana
#> 184                                                    Tamil Nadu Women Employment and Safety (TN WESAFE) Operation
#> 185                                                               Himachal Disaster Recovery and Resilience Project
#> 186                                                         Combining income and forest protection: açaí production
#> 187                                                                Strengthening Coastal Resilience and the Economy
#> 188                BR State of Rio Grande do Sul Sustainable Recovery and Climate Resilient Development Policy Loan
#> 189                                                                      Uttar Pradesh Clean Air Management Program
#> 190                                                Brazil: Decarbonization of Energy-Intensive Value Chains Project
#> 191                                                                        West Bengal Health System Reform Program
#> 192                                                      Punjab Outcomes-Acceleration In School Education Operation
#> 193                                                                                                    MS Pro-Roads
#> 194                                                        Hybrid PPP - São Paulo Commuter Rail Lines 11, 12 and 13
#> 195                                                    Private-Delivered Metro Sao Paulo Line 4 Phase III Extension
#> 196                                                                                                         SRH P4R
#> 197                                                                       Collective Land Ownership Model for Women
#> 198 Brazil Proactive, Safe, and Resilient Road Asset Management Program - State of Santa Catarina Project - Phase 3
#> 199                                                           Haryana Clean Air and Sustainable Development Program
#> 200                              Second Dam Rehabilitation and Improvement Project - Additional Financing (DRIP -3)
#> 201                                                            Brazil Amazon Sustainable Landscapes Project Phase 2
#> 202                                                              Partial Risk Sharing Facility in Energy Efficiency
#> 203                                                                     DFID TF III Supervision and Fiduciary Costs
#> 204                                                                     Brazil Investment Plan Coordination Project
#> 205                                                                                                           ODS I
#> 206                                                                  RF 2nd Amazon Fire Prevention and Mobilization
#> 207                                                       Monitoring and Evaluation capacity building in South Asia
#> 208                                                          Sustainable Multiple Use Landscape Consortia in Brazil
#> 209                                                    Integrated Landscape Management in the Cerrado Biome Project
#> 210                                                              Partial Risk Sharing Facility in Energy Efficiency
#> 211                                                                           Amazon Sustainable Landscapes Project
#> 212                                                   Additional Financing for Grid-Connected Rooftop Solar Program
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
#> 34    Active    2023-06-26   2029-06-30           IN   India
#> 35    Active    2023-06-26   2029-11-30           IN   India
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
#> 51    Active    2022-06-28   2027-06-30           IN   India
#> 52    Active    2022-06-28   2027-12-31           IN   India
#> 53    Active    2022-06-28         <NA>           IN   India
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
#> 73    Active    2021-03-31   2026-03-31           IN   India
#> 74    Active    2021-03-31   2026-09-30           IN   India
#> 75    Active    2021-03-24   2027-09-30           IN   India
#> 76    Active    2021-03-09   2027-06-30           IN   India
#> 77    Active    2020-12-15   2026-06-30           IN   India
#> 78    Active    2020-12-15   2026-07-31           IN   India
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
#> 121   Active    2017-04-12   2025-12-24           IN   India
#> 122   Active    2017-04-12   2024-12-30           IN   India
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
#> 137 Pipeline          <NA>         <NA>           BR  Brazil
#> 138 Pipeline          <NA>         <NA>           BR  Brazil
#> 139 Pipeline          <NA>         <NA>           IN   India
#> 140 Pipeline          <NA>   2018-05-04           IN   India
#> 141 Pipeline          <NA>         <NA>           BR  Brazil
#> 142 Pipeline          <NA>         <NA>           IN   India
#> 143 Pipeline          <NA>         <NA>           BR  Brazil
#> 144 Pipeline          <NA>         <NA>           IN   India
#> 145 Pipeline          <NA>         <NA>           BR  Brazil
#> 146 Pipeline          <NA>         <NA>           BR  Brazil
#> 147 Pipeline          <NA>         <NA>           IN   India
#> 148 Pipeline          <NA>         <NA>           BR  Brazil
#> 149 Pipeline          <NA>         <NA>           BR  Brazil
#> 150 Pipeline          <NA>         <NA>           IN   India
#> 151 Pipeline          <NA>         <NA>           BR  Brazil
#> 152 Pipeline          <NA>         <NA>           IN   India
#> 153 Pipeline          <NA>         <NA>           IN   India
#> 154 Pipeline          <NA>         <NA>           IN   India
#> 155 Pipeline          <NA>         <NA>           IN   India
#> 156 Pipeline          <NA>         <NA>           IN   India
#> 157 Pipeline          <NA>         <NA>           BR  Brazil
#> 158 Pipeline          <NA>         <NA>           BR  Brazil
#> 159 Pipeline          <NA>         <NA>           IN   India
#> 160 Pipeline          <NA>         <NA>           BR  Brazil
#> 161 Pipeline          <NA>         <NA>           BR  Brazil
#> 162 Pipeline          <NA>         <NA>           BR  Brazil
#> 163 Pipeline          <NA>         <NA>           BR  Brazil
#> 164 Pipeline          <NA>         <NA>           IN   India
#> 165 Pipeline          <NA>         <NA>           BR  Brazil
#> 166 Pipeline          <NA>         <NA>           BR  Brazil
#> 167 Pipeline          <NA>         <NA>           IN   India
#> 168 Pipeline          <NA>         <NA>           IN   India
#> 169 Pipeline          <NA>         <NA>           IN   India
#> 170 Pipeline          <NA>         <NA>           IN   India
#> 171 Pipeline          <NA>         <NA>           IN   India
#> 172 Pipeline          <NA>         <NA>           BR  Brazil
#> 173 Pipeline          <NA>         <NA>           IN   India
#> 174 Pipeline          <NA>         <NA>           BR  Brazil
#> 175 Pipeline          <NA>         <NA>           IN   India
#> 176 Pipeline          <NA>         <NA>           BR  Brazil
#> 177 Pipeline          <NA>         <NA>           BR  Brazil
#> 178 Pipeline          <NA>         <NA>           BR  Brazil
#> 179 Pipeline          <NA>         <NA>           BR  Brazil
#> 180 Pipeline          <NA>         <NA>           IN   India
#> 181 Pipeline          <NA>         <NA>           BR  Brazil
#> 182 Pipeline          <NA>         <NA>           BR  Brazil
#> 183 Pipeline          <NA>         <NA>           IN   India
#> 184 Pipeline          <NA>         <NA>           IN   India
#> 185 Pipeline          <NA>         <NA>           IN   India
#> 186 Pipeline          <NA>   2011-10-01           BR  Brazil
#> 187 Pipeline          <NA>         <NA>           IN   India
#> 188 Pipeline          <NA>         <NA>           BR  Brazil
#> 189 Pipeline          <NA>         <NA>           IN   India
#> 190 Pipeline          <NA>         <NA>           BR  Brazil
#> 191 Pipeline          <NA>         <NA>           IN   India
#> 192 Pipeline          <NA>         <NA>           IN   India
#> 193 Pipeline          <NA>         <NA>           BR  Brazil
#> 194 Pipeline          <NA>         <NA>           BR  Brazil
#> 195 Pipeline          <NA>         <NA>           BR  Brazil
#> 196 Pipeline          <NA>         <NA>           IN   India
#> 197 Pipeline          <NA>   2011-10-01           IN   India
#> 198 Pipeline          <NA>         <NA>           BR  Brazil
#> 199 Pipeline          <NA>         <NA>           IN   India
#> 200 Pipeline          <NA>         <NA>           IN   India
#> 201   Active          <NA>         <NA>           BR  Brazil
#> 202   Active          <NA>   2025-03-31           IN   India
#> 203   Active          <NA>         <NA>           IN   India
#> 204   Active          <NA>   2024-11-30           BR  Brazil
#> 205   Active          <NA>         <NA>           IN   India
#> 206   Active          <NA>   2004-09-30           BR  Brazil
#> 207   Active          <NA>   2025-06-30           IN   India
#> 208   Active          <NA>   2027-11-30           BR  Brazil
#> 209   Active          <NA>   2025-11-30           BR  Brazil
#> 210   Active          <NA>   2025-03-31           IN   India
#> 211   Active          <NA>   2026-12-31           BR  Brazil
#> 212   Active          <NA>   2026-11-30           IN   India
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
#> 22                   South Asia       300.000000        300.0000           0.00
#> 23                   South Asia       100.000000        100.0000           0.00
#> 24  Latin America and Caribbean       300.000000        300.0000           0.00
#> 25  Latin America and Caribbean       135.238245        135.2382           0.00
#> 26  Latin America and Caribbean       100.000000        100.0000           0.00
#> 27  Latin America and Caribbean        50.000000         50.0000           0.00
#> 28  Latin America and Caribbean        50.000000         50.0000           0.00
#> 29  Latin America and Caribbean        40.000000         40.0000           0.00
#> 30  Latin America and Caribbean        50.000000         50.0000           0.00
#> 31                   South Asia        46.000000         46.0000           0.00
#> 32                   South Asia       200.000000        200.0000           0.00
#> 33                   South Asia       300.000000        300.0000           0.00
#> 34                   South Asia       140.000000        140.0000           0.00
#> 35                   South Asia       251.030000        251.0300           0.00
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
#> 51                   South Asia       500.000000        500.0000           0.00
#> 52                   South Asia       500.000000        500.0000           0.00
#> 53                   South Asia       165.000000        150.0000           0.00
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
#> 73                   South Asia        32.000000         32.0000           0.00
#> 74                   South Asia       210.000000        105.0000           0.00
#> 75                   South Asia       750.000000        500.0000           0.00
#> 76                   South Asia       210.000000        105.0000           0.00
#> 77                   South Asia        68.000000         68.0000           0.00
#> 78                   South Asia       167.000000        100.0000           0.00
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
#> 121                  South Asia       375.000000        375.0000           0.00
#> 122                  South Asia       116.200000        116.2000           0.00
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
#> 137 Latin America and Caribbean        90.000000         90.0000           0.00
#> 138 Latin America and Caribbean       162.400000          0.0000         162.40
#> 139                  South Asia       250.000000          0.0000         250.00
#> 140                  South Asia         0.000000          0.0000           0.00
#> 141 Latin America and Caribbean       200.000000        200.0000           0.00
#> 142                  South Asia         0.000000          0.0000           0.00
#> 143 Latin America and Caribbean         0.000000          0.0000           0.00
#> 144                  South Asia         1.000000          1.0000           0.00
#> 145 Latin America and Caribbean        50.000000         50.0000           0.00
#> 146 Latin America and Caribbean         0.000000          0.0000           0.00
#> 147                  South Asia         0.000000          0.0000           0.00
#> 148 Latin America and Caribbean         0.000000          0.0000           0.00
#> 149 Latin America and Caribbean        50.000000          0.0000          50.00
#> 150                  South Asia         0.000000          0.0000           0.00
#> 151 Latin America and Caribbean        30.000000          0.0000          30.00
#> 152                  South Asia       280.000000          0.0000         280.00
#> 153                  South Asia         0.000000          0.0000           0.00
#> 154                  South Asia         0.000000          0.0000           0.00
#> 155                  South Asia         0.000000          0.0000           0.00
#> 156                  South Asia         0.000000          0.0000           0.00
#> 157 Latin America and Caribbean         0.000000          0.0000           0.00
#> 158 Latin America and Caribbean         8.560000          0.0000           8.56
#> 159                  South Asia         0.000000          0.0000           0.00
#> 160 Latin America and Caribbean         0.000000          0.0000           0.00
#> 161 Latin America and Caribbean         0.000000          0.0000           0.00
#> 162 Latin America and Caribbean         0.000000          0.0000           0.00
#> 163 Latin America and Caribbean         0.000000          0.0000           0.00
#> 164                  South Asia      1000.000000       1000.0000           0.00
#> 165 Latin America and Caribbean       900.000000          0.0000         900.00
#> 166 Latin America and Caribbean        13.400000         13.4000           0.00
#> 167                  South Asia       315.000000        315.0000           0.00
#> 168                  South Asia       196.000000          0.0000         196.00
#> 169                  South Asia         0.000000          0.0000           0.00
#> 170                  South Asia         0.000000          0.0000           0.00
#> 171                  South Asia       490.000000          0.0000         490.00
#> 172 Latin America and Caribbean         0.000000          0.0000           0.00
#> 173                  South Asia         0.000000          0.0000           0.00
#> 174 Latin America and Caribbean         0.000000          0.0000           0.00
#> 175                  South Asia      5400.000000          0.0000        5400.00
#> 176 Latin America and Caribbean         0.000000          0.0000           0.00
#> 177 Latin America and Caribbean         0.000000          0.0000           0.00
#> 178 Latin America and Caribbean         0.000000          0.0000           0.00
#> 179 Latin America and Caribbean         0.000000          0.0000           0.00
#> 180                  South Asia         0.000000          0.0000           0.00
#> 181 Latin America and Caribbean         0.000000          0.0000           0.00
#> 182 Latin America and Caribbean      2300.000000       2300.0000           0.00
#> 183                  South Asia       131.000000        131.0000           0.00
#> 184                  South Asia       150.000000        150.0000           0.00
#> 185                  South Asia         0.000000          0.0000           0.00
#> 186 Latin America and Caribbean         0.000000          0.0000           0.00
#> 187                  South Asia       212.640000        212.6400           0.00
#> 188 Latin America and Caribbean         0.000000          0.0000           0.00
#> 189                  South Asia       350.000000        350.0000           0.00
#> 190 Latin America and Caribbean         0.000000          0.0000           0.00
#> 191                  South Asia         0.000000          0.0000           0.00
#> 192                  South Asia       135.000000          0.0000         135.00
#> 193 Latin America and Caribbean       200.000000          0.0000         200.00
#> 194 Latin America and Caribbean       100.000000        100.0000           0.00
#> 195 Latin America and Caribbean         0.000000          0.0000           0.00
#> 196                  South Asia         0.000000          0.0000           0.00
#> 197                  South Asia         0.000000          0.0000           0.00
#> 198 Latin America and Caribbean       375.000000          0.0000         375.00
#> 199                  South Asia      2830.250000        128.0000        2702.25
#> 200                  South Asia       420.000000        420.0000           0.00
#> 201 Latin America and Caribbean        19.284404          0.0000           0.00
#> 202                  South Asia        25.000000          0.0000           0.00
#> 203                  South Asia         1.160000          0.0000           0.00
#> 204 Latin America and Caribbean         1.000000          0.0000           0.00
#> 205                  South Asia         1.300000          0.0000           0.00
#> 206 Latin America and Caribbean         1.100000          0.0000           0.00
#> 207                  South Asia         0.852516          0.0000           0.00
#> 208 Latin America and Caribbean        24.577982          0.0000           0.00
#> 209 Latin America and Caribbean        21.000000          0.0000           0.00
#> 210                  South Asia        18.000000          0.0000           0.00
#> 211 Latin America and Caribbean        60.330000          0.0000           0.00
#> 212                  South Asia        22.935780          0.0000           0.00
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
#> 131    Development Policy Lending
#> 132    Development Policy Lending
#> 133      Specific Investment Loan
#> 134  Investment Project Financing
#> 135  Investment Project Financing
#> 136                          <NA>
#> 137  Investment Project Financing
#> 138  Investment Project Financing
#> 139  Investment Project Financing
#> 140                          <NA>
#> 141    Development Policy Lending
#> 142 Program-for-Results Financing
#> 143    Development Policy Lending
#> 144  Investment Project Financing
#> 145  Investment Project Financing
#> 146 Program-for-Results Financing
#> 147  Investment Project Financing
#> 148  Investment Project Financing
#> 149  Investment Project Financing
#> 150  Investment Project Financing
#> 151  Investment Project Financing
#> 152 Program-for-Results Financing
#> 153  Investment Project Financing
#> 154  Investment Project Financing
#> 155  Investment Project Financing
#> 156 Program-for-Results Financing
#> 157  Investment Project Financing
#> 158  Investment Project Financing
#> 159  Investment Project Financing
#> 160  Investment Project Financing
#> 161  Investment Project Financing
#> 162  Investment Project Financing
#> 163  Investment Project Financing
#> 164 Program-for-Results Financing
#> 165  Investment Project Financing
#> 166  Investment Project Financing
#> 167 Program-for-Results Financing
#> 168  Investment Project Financing
#> 169 Program-for-Results Financing
#> 170 Program-for-Results Financing
#> 171  Investment Project Financing
#> 172  Investment Project Financing
#> 173  Investment Project Financing
#> 174  Investment Project Financing
#> 175  Investment Project Financing
#> 176  Investment Project Financing
#> 177  Investment Project Financing
#> 178    Development Policy Lending
#> 179    Development Policy Lending
#> 180 Program-for-Results Financing
#> 181  Investment Project Financing
#> 182 Program-for-Results Financing
#> 183  Investment Project Financing
#> 184 Program-for-Results Financing
#> 185  Investment Project Financing
#> 186      Specific Investment Loan
#> 187  Investment Project Financing
#> 188    Development Policy Lending
#> 189 Program-for-Results Financing
#> 190  Investment Project Financing
#> 191 Program-for-Results Financing
#> 192 Program-for-Results Financing
#> 193  Investment Project Financing
#> 194  Investment Project Financing
#> 195  Investment Project Financing
#> 196 Program-for-Results Financing
#> 197      Specific Investment Loan
#> 198  Investment Project Financing
#> 199 Program-for-Results Financing
#> 200  Investment Project Financing
#> 201  Investment Project Financing
#> 202  Investment Project Financing
#> 203  Investment Project Financing
#> 204  Investment Project Financing
#> 205      Specific Investment Loan
#> 206                          <NA>
#> 207  Investment Project Financing
#> 208  Investment Project Financing
#> 209  Investment Project Financing
#> 210  Investment Project Financing
#> 211  Investment Project Financing
#> 212 Program-for-Results Financing
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
#> 22                                                                                                Ministry of Finance
#> 23                                                                                                              India
#> 24                                                                                      Federative Republic of Brazil
#> 25                                                                                     Municipality of Rio de Janeiro
#> 26                                                                                               STATE OF MATO GROSSO
#> 27                                                                                                               <NA>
#> 28                                                                                                     State of Piaui
#> 29                                                                                                      State of Acre
#> 30                                                                             State Secretariat of Planning (SEPLAN)
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
#> 52                                                                                                              India
#> 53                                                                                                State Bank of India
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
#> 73                                                        India (Department of Economic Affairs, Government of India)
#> 74                                                                                                              India
#> 75                                                                                                Ministry of Finance
#> 76                                                                                                              India
#> 77                                                                                                              India
#> 78                                                                                                Ministry of Finance
#> 79                                                                Ministry of Finance, Department of Economic Affairs
#> 80                                                                                                  Republic of India
#> 81                                                                                                              India
#> 82                                                                                           Municipality of Salvador
#> 83                                                                                                              India
#> 84                                                                                                               <NA>
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
#> 121                                                               Department of Economic Affairs, Government of India
#> 122                                                                                                             India
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
#> 137                                                                     Complexo Industrial Portuario de Pecem (CIPP)
#> 138                                                                                                              <NA>
#> 139                                                                                                              <NA>
#> 140                                                                                                              <NA>
#> 141                                                                                                              <NA>
#> 142                                                                                                              <NA>
#> 143                                                                                                              <NA>
#> 144                                                                                                              <NA>
#> 145                                                                                                 State of Amazonas
#> 146                                                                                                              <NA>
#> 147                                                                                                              <NA>
#> 148                                                                                                              <NA>
#> 149                                                                                                              <NA>
#> 150                                                                                                              <NA>
#> 151                                                                                                              <NA>
#> 152                                                                                                              <NA>
#> 153                                                                                                              <NA>
#> 154                                                                                                              <NA>
#> 155                                                                                                              <NA>
#> 156                                                                                                              <NA>
#> 157                                                                                                              <NA>
#> 158                                                                                                              <NA>
#> 159                                                                                                              <NA>
#> 160                                                                                                              <NA>
#> 161                                                                                                              <NA>
#> 162                                                                                                              <NA>
#> 163                                                                                                              <NA>
#> 164                                                                                               Ministry of Finance
#> 165                                                                                                              <NA>
#> 166                                                                                                              <NA>
#> 167                                                                                               Ministry of Finance
#> 168                                                                                                              <NA>
#> 169                                                                                                              <NA>
#> 170                                                                                                              <NA>
#> 171                                                                                                              <NA>
#> 172                                                                                                              <NA>
#> 173                                                                                                              <NA>
#> 174                                                                                                              <NA>
#> 175                                                                                                              <NA>
#> 176                                                                                                              <NA>
#> 177                                                                                                              <NA>
#> 178                                                                                                              <NA>
#> 179                                                                                                              <NA>
#> 180                                                                                                              <NA>
#> 181                                                                                                              <NA>
#> 182                                                                                                              <NA>
#> 183                                                                                               Government of India
#> 184                                                                                                             India
#> 185                                                                                                              <NA>
#> 186                                                                                                              <NA>
#> 187                                                                                                             India
#> 188                                                                                                              <NA>
#> 189                                                                                                 Republic of India
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
#> 201 Fundo Brasileiro de Biodiversidade - FUNBIO, Fundacao Getulio Vargas - FGV, Conservacao Internacional - CI Brazil
#> 202                                                                                        Government of India, India
#> 203                                                                                                              <NA>
#> 204                                                                                  Funda��o Pro-Natureza - FUNATURA
#> 205                                                                                                              <NA>
#> 206                                                                                                              <NA>
#> 207                                                            Institute for Financial Management and Research (IFMR)
#> 208                                                                                                              IICA
#> 209                                       Brazil - Deutsche Gesellschaft f�r Internationale Zusammenarbeit GmbH (GIZ)
#> 210                                                                                                              <NA>
#> 211 Fundo Brasileiro de Biodiversidade - FUNBIO, Conserva��o Internacional - CI Brazil, Funda��o Get�lio Vargas - FGV
#> 212                                                                                               State Bank of India
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
#> 22                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 Tamil Nadu Urban Infrastructure Financial Services Limited, Tamil Nadu Municipal Administration & Water Supply Department
#> 23                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 Planning and Development Department, Government of Sikkim
#> 24                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   Ministry of Citizenship
#> 25                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       Secretaria Municipal de Fazenda e Planejamento, Secretaria Municipal de Transportes
#> 26                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    SECRETARIAT OF EDUCATION - MATO GROSSO
#> 27                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       State Secretariat of Health (SESAPI), State Secretariat of Social Assistance, Labor and Human Rights (SASC), State Secretariat of Planning (SEPLAN)
#> 28                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           Secretariat of Finance of Piaui
#> 29                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             State Secretariat of Planning
#> 30                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       UGP
#> 31                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      Cyber Corporation of Manipur Limited
#> 32                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     Directorate of Energy, HimUrja, HPPCL (Himachal Pradesh Power Corporation Limited), HPSEBL (Himachal Pradesh State Electricity Board Limited), HPPTCL (Himachal Pradesh Power Transmission Corporation Limited), HPSLDC (Himachal Pradesh State Load Despatch Centre)
#> 33                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     State of Chhattisgarh
#> 34                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       Department of Tribal Welfare, Government of Tripura
#> 35                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        Assam Health Infrastructure Development and Management Society (AHIDMS), Health and Family Welfare
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
#> 51                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           Department of Health and Family Welfare, Ministry of Health and Family Welfare, Government of India, Ministry of Health and Family Welfare, Government of India
#> 52                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     Ministry of Health and Family Welfare
#> 53                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       State Bank of India
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
#> 73                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               Health and Family Welfare Department, Government of Mizoram
#> 74                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       Ludhiana Municipal Corporation, Amritsar Municipal Corporation, Punjab Municipal Infrastructure Development Company
#> 75                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               Education Department, Government of Gujarat
#> 76                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    Local Self Government Department, Government of Kerala
#> 77                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 Nagaland (Department of School Education)
#> 78                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  Chhattisgarh, Department of Agriculture Development and Farmer Welfare and Biotechnology
#> 79  Uttarakhand Jal Vidyut Nigam Ltd., Kerala State Electricity Board (KSEB), Tamil Nadu Generation and Distribution Corporation Limited (TANGEDCO), Government of Gujarat, Water Resources Department, Government of Chhattisgarh, Water Resources Department, Government of Kerala, Water Resources Department, Government of West Bengal, Irrigation and Waterways Department, Government of Uttar Pradesh, Irrigation and Water Resources Department, Meghalaya Power Generation Corporation Ltd. (MePGCL), Government of Maharasthra, Water Resources Department, Government of Manipur, Water Resources Department, Central Water Commission (CWC), Ministry of Jal Shakti, Government of Rajasthan, Water Resources Department, Government of Odisha, Water Resources Department, Government of Tamil Nadu, Water Resources Department, Government of Madhya Pradesh, Water Resources Department, Government of Karnataka, Water Resources Department
#> 80                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 Government of West Bengal
#> 81                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  Meghalaya Infrastructure Development Finance Corporation
#> 82                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                Casa Civil
#> 83                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  National Mission for Clean Ganga, Ministry of Jal Shakti
#> 84                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      <NA>
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
#> 121                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      Inland Waterways Authority of India
#> 122                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    Urban Development and Environment Department, Govt. of Madhya Pradesh
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
#> 137                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   Complexo Industrial Portu�rio de Pec�m
#> 138                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 139                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 140                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 141                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 142                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 143                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 144                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 145                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                State Secretariat of Administration and Management (SEAD)
#> 146                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 147                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 148                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 149                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 150                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 151                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 152                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 153                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 154                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 155                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 156                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 157                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 158                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 159                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 160                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 161                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 162                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 163                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 164                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     Ministry of New and Renewable Energy
#> 165                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 166                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 167                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                Government of West Bengal
#> 168                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 169                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 170                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 171                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 172                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 173                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 174                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 175                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 176                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 177                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 178                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 179                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 180                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 181                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 182                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 183                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 Haryana Mass Rapid Transport Corporation Limited (HMRTC)
#> 184                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            Social Welfare & Women Empowerment Department
#> 185                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 186                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 187                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        Government of Karnataka, Government of Tamil Nadu
#> 188                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 189                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           Department of Environment, Forests, and Climate Change, State of Uttar Pradesh
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
#> 201                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   Ministry of Environment - MMA, Funda��o Getulio Vargas
#> 202                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      Small Industries Development Bank of India, EESL Energy Efficiency Services Limited
#> 203                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 204                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  Ministry of Environment
#> 205                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 206                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 207                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      Jameel Poverty Action Lab (J-PAL) South Asia at the Institute for Financial Management and Research
#> 208                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            Minist�rio do Meio Ambiente (MMA), Minist�rio da Agricultura, Pecu�ria e Abastecimento (MAPA)
#> 209                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        Ministry of Agriculture and  Livestock(MAPA), National Rural Learning Service, Ministry of Environment / Brazilian Forest Service
#> 210                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 211                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                Funda��o Getulio Vargas, Ministry of Environment and Climate Change - MMA
#> 212                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      State Bank of India
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
#> 22  https://projects.worldbank.org/en/projects-operations/project-detail/P179189
#> 23  https://projects.worldbank.org/en/projects-operations/project-detail/P180634
#> 24  https://projects.worldbank.org/en/projects-operations/project-detail/P179365
#> 25  https://projects.worldbank.org/en/projects-operations/project-detail/P179182
#> 26  https://projects.worldbank.org/en/projects-operations/project-detail/P178993
#> 27  https://projects.worldbank.org/en/projects-operations/project-detail/P178567
#> 28  https://projects.worldbank.org/en/projects-operations/project-detail/P178663
#> 29  https://projects.worldbank.org/en/projects-operations/project-detail/P179046
#> 30  https://projects.worldbank.org/en/projects-operations/project-detail/P179088
#> 31  https://projects.worldbank.org/en/projects-operations/project-detail/P176733
#> 32  https://projects.worldbank.org/en/projects-operations/project-detail/P176032
#> 33  https://projects.worldbank.org/en/projects-operations/project-detail/P179249
#> 34  https://projects.worldbank.org/en/projects-operations/project-detail/P178418
#> 35  https://projects.worldbank.org/en/projects-operations/project-detail/P179337
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
#> 51  https://projects.worldbank.org/en/projects-operations/project-detail/P178146
#> 52  https://projects.worldbank.org/en/projects-operations/project-detail/P175676
#> 53  https://projects.worldbank.org/en/projects-operations/project-detail/P171750
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
#> 73  https://projects.worldbank.org/en/projects-operations/project-detail/P173958
#> 74  https://projects.worldbank.org/en/projects-operations/project-detail/P170811
#> 75  https://projects.worldbank.org/en/projects-operations/project-detail/P173704
#> 76  https://projects.worldbank.org/en/projects-operations/project-detail/P168633
#> 77  https://projects.worldbank.org/en/projects-operations/project-detail/P172213
#> 78  https://projects.worldbank.org/en/projects-operations/project-detail/P170645
#> 79  https://projects.worldbank.org/en/projects-operations/project-detail/P170873
#> 80  https://projects.worldbank.org/en/projects-operations/project-detail/P166020
#> 81  https://projects.worldbank.org/en/projects-operations/project-detail/P168097
#> 82  https://projects.worldbank.org/en/projects-operations/project-detail/P172605
#> 83  https://projects.worldbank.org/en/projects-operations/project-detail/P169111
#> 84  https://projects.worldbank.org/en/projects-operations/project-detail/P174312
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
#> 121 https://projects.worldbank.org/en/projects-operations/project-detail/P148775
#> 122 https://projects.worldbank.org/en/projects-operations/project-detail/P155303
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
#> 137 https://projects.worldbank.org/en/projects-operations/project-detail/P181511
#> 138 https://projects.worldbank.org/en/projects-operations/project-detail/P500469
#> 139 https://projects.worldbank.org/en/projects-operations/project-detail/P501071
#> 140 https://projects.worldbank.org/en/projects-operations/project-detail/P105370
#> 141 https://projects.worldbank.org/en/projects-operations/project-detail/P173090
#> 142 https://projects.worldbank.org/en/projects-operations/project-detail/P506272
#> 143 https://projects.worldbank.org/en/projects-operations/project-detail/P506321
#> 144 https://projects.worldbank.org/en/projects-operations/project-detail/P505177
#> 145 https://projects.worldbank.org/en/projects-operations/project-detail/P181608
#> 146 https://projects.worldbank.org/en/projects-operations/project-detail/P508025
#> 147 https://projects.worldbank.org/en/projects-operations/project-detail/P500168
#> 148 https://projects.worldbank.org/en/projects-operations/project-detail/P506320
#> 149 https://projects.worldbank.org/en/projects-operations/project-detail/P500431
#> 150 https://projects.worldbank.org/en/projects-operations/project-detail/P508453
#> 151 https://projects.worldbank.org/en/projects-operations/project-detail/P504897
#> 152 https://projects.worldbank.org/en/projects-operations/project-detail/P503872
#> 153 https://projects.worldbank.org/en/projects-operations/project-detail/P506340
#> 154 https://projects.worldbank.org/en/projects-operations/project-detail/P507236
#> 155 https://projects.worldbank.org/en/projects-operations/project-detail/P500252
#> 156 https://projects.worldbank.org/en/projects-operations/project-detail/P508840
#> 157 https://projects.worldbank.org/en/projects-operations/project-detail/P506955
#> 158 https://projects.worldbank.org/en/projects-operations/project-detail/P504126
#> 159 https://projects.worldbank.org/en/projects-operations/project-detail/P507066
#> 160 https://projects.worldbank.org/en/projects-operations/project-detail/P508221
#> 161 https://projects.worldbank.org/en/projects-operations/project-detail/P507029
#> 162 https://projects.worldbank.org/en/projects-operations/project-detail/P508202
#> 163 https://projects.worldbank.org/en/projects-operations/project-detail/P508363
#> 164 https://projects.worldbank.org/en/projects-operations/project-detail/P180716
#> 165 https://projects.worldbank.org/en/projects-operations/project-detail/P504276
#> 166 https://projects.worldbank.org/en/projects-operations/project-detail/P500570
#> 167 https://projects.worldbank.org/en/projects-operations/project-detail/P181244
#> 168 https://projects.worldbank.org/en/projects-operations/project-detail/P502499
#> 169 https://projects.worldbank.org/en/projects-operations/project-detail/P500151
#> 170 https://projects.worldbank.org/en/projects-operations/project-detail/P508719
#> 171 https://projects.worldbank.org/en/projects-operations/project-detail/P505563
#> 172 https://projects.worldbank.org/en/projects-operations/project-detail/P507628
#> 173 https://projects.worldbank.org/en/projects-operations/project-detail/P179349
#> 174 https://projects.worldbank.org/en/projects-operations/project-detail/P504543
#> 175 https://projects.worldbank.org/en/projects-operations/project-detail/P505914
#> 176 https://projects.worldbank.org/en/projects-operations/project-detail/P509041
#> 177 https://projects.worldbank.org/en/projects-operations/project-detail/P506142
#> 178 https://projects.worldbank.org/en/projects-operations/project-detail/P500614
#> 179 https://projects.worldbank.org/en/projects-operations/project-detail/P506861
#> 180 https://projects.worldbank.org/en/projects-operations/project-detail/P507910
#> 181 https://projects.worldbank.org/en/projects-operations/project-detail/P504899
#> 182 https://projects.worldbank.org/en/projects-operations/project-detail/P500501
#> 183 https://projects.worldbank.org/en/projects-operations/project-detail/P181020
#> 184 https://projects.worldbank.org/en/projects-operations/project-detail/P180699
#> 185 https://projects.worldbank.org/en/projects-operations/project-detail/P507340
#> 186 https://projects.worldbank.org/en/projects-operations/project-detail/P114890
#> 187 https://projects.worldbank.org/en/projects-operations/project-detail/P180932
#> 188 https://projects.worldbank.org/en/projects-operations/project-detail/P505235
#> 189 https://projects.worldbank.org/en/projects-operations/project-detail/P178053
#> 190 https://projects.worldbank.org/en/projects-operations/project-detail/P507629
#> 191 https://projects.worldbank.org/en/projects-operations/project-detail/P506976
#> 192 https://projects.worldbank.org/en/projects-operations/project-detail/P500564
#> 193 https://projects.worldbank.org/en/projects-operations/project-detail/P505590
#> 194 https://projects.worldbank.org/en/projects-operations/project-detail/P181767
#> 195 https://projects.worldbank.org/en/projects-operations/project-detail/P506329
#> 196 https://projects.worldbank.org/en/projects-operations/project-detail/P508489
#> 197 https://projects.worldbank.org/en/projects-operations/project-detail/P114896
#> 198 https://projects.worldbank.org/en/projects-operations/project-detail/P504253
#> 199 https://projects.worldbank.org/en/projects-operations/project-detail/P502491
#> 200 https://projects.worldbank.org/en/projects-operations/project-detail/P181524
#> 201 https://projects.worldbank.org/en/projects-operations/project-detail/P171257
#> 202 https://projects.worldbank.org/en/projects-operations/project-detail/P132620
#> 203 https://projects.worldbank.org/en/projects-operations/project-detail/P122387
#> 204 https://projects.worldbank.org/en/projects-operations/project-detail/P152285
#> 205 https://projects.worldbank.org/en/projects-operations/project-detail/P009585
#> 206 https://projects.worldbank.org/en/projects-operations/project-detail/P073882
#> 207 https://projects.worldbank.org/en/projects-operations/project-detail/P177159
#> 208 https://projects.worldbank.org/en/projects-operations/project-detail/P172497
#> 209 https://projects.worldbank.org/en/projects-operations/project-detail/P164602
#> 210 https://projects.worldbank.org/en/projects-operations/project-detail/P128921
#> 211 https://projects.worldbank.org/en/projects-operations/project-detail/P158000
#> 212 https://projects.worldbank.org/en/projects-operations/project-detail/P160018

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
# }
```
