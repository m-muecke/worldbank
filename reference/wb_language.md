# World Bank available languages

List all languages supported by the World Bank API.

## Usage

``` r
wb_language()
```

## Source

<https://api.worldbank.org/v2/languages>

## Value

A [`data.frame()`](https://rdrr.io/r/base/data.frame.html) with the
available languages. The columns are:

- code:

  The language code.

- name:

  The language name.

- native_form:

  The native form of the language name.

## See also

Other indicators data:
[`wb_country()`](https://m-muecke.github.io/worldbank/reference/wb_country.md),
[`wb_income_level()`](https://m-muecke.github.io/worldbank/reference/wb_income_level.md),
[`wb_indicator()`](https://m-muecke.github.io/worldbank/reference/wb_indicator.md),
[`wb_lending_type()`](https://m-muecke.github.io/worldbank/reference/wb_lending_type.md),
[`wb_region()`](https://m-muecke.github.io/worldbank/reference/wb_region.md),
[`wb_source()`](https://m-muecke.github.io/worldbank/reference/wb_source.md),
[`wb_topic()`](https://m-muecke.github.io/worldbank/reference/wb_topic.md)

## Examples

``` r
# \donttest{
wb_language()
#>    code       name      native_form
#> 1    en    English          English
#> 2    es    Spanish          Español
#> 3    fr     French         Français
#> 4    ar     Arabic             عربي
#> 5    zh    Chinese             中文
#> 6    bg  Bulgarian        Български
#> 7    de     German          Deutsch
#> 8    hi      Hindi             हिंदी
#> 9    id Indonesian Bahasa indonesia
#> 10   ja   Japanese           日本語
#> 11   km      Khmer             ខ្មែរ
#> 12   ko     Korean           한국어
#> 13   mk Macedonian       Македонски
#> 14   mn  Mongolian       Монгол хэл
#> 15   pl     Polish           polski
#> 16   pt Portuguese        português
#> 17   ro   Romanian           Română
#> 18   ru    Russian          Pyccĸий
#> 19   sq   Albanian            shqip
#> 20   th       Thai          ภาษาไทย
#> 21   tr    Turkish           Tϋrkçe
#> 22   uk  Ukrainian       Українська
#> 23   vi Vietnamese       Tiếng Việt
# }
```
