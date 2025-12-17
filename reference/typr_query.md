# Query within a Typst file

Query within a Typst file

## Usage

``` r
typr_query(
  input = NULL,
  selector = NULL,
  typst_args = NULL,
  as_json = rlang::is_installed("jsonlite")
)
```

## Arguments

- input:

  a path to a `.typ` file

- selector:

  a string to search for, e.g. a `"<label>"`

- typst_args:

  Additional arguments to pass to Typst. Can be listed with
  `typr_help('query')`

- as_json:

  if `TRUE`, return a list, otherwise a character string

## Value

a length one character with json syntax if `!as_json`, otherwise a list

## Examples

``` r
if (FALSE) { # has_any_typst()
tf <- fs::file_temp(ext = 'typ')
writeLines(text = '= test <lbl>\n', con = tf)
typr_query(input = tf, selector = '<lbl>')
}
```
