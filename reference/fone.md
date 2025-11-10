# Return Finances One API Data

Return Finances One API Data

## Usage

``` r
fone_dataset(dataset_id, resource_id, ..., limit = NULL)

fone_view(view_id, ..., limit = NULL)
```

## Source

<https://financesone.worldbank.org/data>

## Arguments

- dataset_id:

  (`character(1)`)  
  The id of the associated dataset.

- resource_id:

  (`character(1)`)  
  Id of the associated resource.

- ...:

  (`any`)  
  Additional arguments passed to the request.

- limit:

  (`NULL` \| `integer(1)`)  
  The maximum number of rows to return. Default is `NULL`. If `NULL`,
  all rows are returned.

- view_id:

  (`character(1)`)  
  The Id of the view.

## Value

A [`data.frame()`](https://rdrr.io/r/base/data.frame.html) with the
requested dataset.

## Examples

``` r
if (FALSE) { # \dontrun{
# get dataset data
dataset <- fone_dataset(dataset_id = "DS00047", resource_id = "RS00005")
head(dataset)

# get view data
view <- fone_view(view_id = "DS01538")
head(view)
} # }
```
