# Get or manage the worldbank API cache

`wb_cache_dir()` returns the path where cached API responses are stored.
`wb_cache_delete()` clears all cached responses.

## Usage

``` r
wb_cache_dir()

wb_cache_delete()
```

## Details

The cache is only used when enabled with
`options(worldbank.cache = TRUE)`. Cached responses are stored for 1 day
by default, but this can be customized with
`options(worldbank.cache_max_age = seconds)`.

## Examples

``` r
if (FALSE) { # \dontrun{
# enable caching
options(worldbank.cache = TRUE)

# view cache location
wb_cache_dir()

# clear the cache
wb_cache_delete()
} # }
```
