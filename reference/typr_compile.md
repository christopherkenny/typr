# Compile a Typst document

Compile a Typst document

## Usage

``` r
typr_compile(
  input = NULL,
  output_file = NULL,
  output_format = c("pdf", "png", "svg", "html"),
  typst_args = NULL
)
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
  `typr_help('compile')`

## Value

a path to the created file

## Examples

``` r
if (FALSE) { # has_any_typst()
typr_compile('hello world')
typr_compile(
  input = 'Hello world', output_format = 'png',
  typst_args = c('--ppi', '300')
)
}
```
