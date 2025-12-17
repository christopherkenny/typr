# Watch a Typst document

Watch a Typst document

## Usage

``` r
typr_watch(
  input = NULL,
  output_file = NULL,
  output_format = c("pdf", "png", "svg", "html"),
  typst_args = NULL
)

typr_watch_stop()
```

## Arguments

- input:

  either a path to a `.typ` file or text to use as the file

- output_file:

  file to output to

- output_format:

  format to use. One of `c('pdf', 'png', 'svg', 'html')`,

- typst_args:

  Additional arguments to pass to Typst. Can be listed with
  `typr_help('watch')`

## Value

a path to the created file

## Examples

``` r
if (FALSE) { # has_any_typst()
tf <- fs::file_temp(ext = 'typ')
writeLines(text = '= test', con = tf)
typr_watch(tf)
writeLines(text = c('= test', 'hello'), con = tf)
}
```
