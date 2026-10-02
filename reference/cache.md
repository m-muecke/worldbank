# Get or manage the worldbank API cache

`wb_cache_dir()` returns the path where cached API responses are stored.
`wb_cache_clear()` clears all cached responses.

## Usage

``` r
wb_cache_dir()

wb_cache_clear()

wb_cache_delete()
```

## Value

`wb_cache_dir()` returns a string with the path to the cache directory.

`wb_cache_clear()` is called for its side effect of clearing the cached
responses and returns `NULL` invisibly.

## Details

The cache is only used when enabled with
`options(worldbank.cache = TRUE)`.

Each API's caching headers decide whether and for how long a cached
response is reused, so the cache helps more with some APIs than others.
Indicators API responses are reused for up to a day. Projects and
Documents & Reports API responses are checked with the API on every
call, which only saves downloading them again. Finances One and PIP API
responses are never cached.

Cached responses older than 1 day are deleted. Change this with
`options(worldbank.cache_max_age = seconds)`. A higher value doesn't
make responses be reused for longer than the API allows.

## Examples

``` r
if (FALSE) { # \dontrun{
# enable caching
options(worldbank.cache = TRUE)

# view cache location
wb_cache_dir()

# clear the cache
wb_cache_clear()
} # }
```
