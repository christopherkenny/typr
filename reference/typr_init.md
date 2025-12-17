# Create a project from a template

Create a project from a template

## Usage

``` r
typr_init(template = NULL, version = NULL, dir = NULL, typst_args = NULL)
```

## Arguments

- template:

  a template to use, can be local or on Typst Universe. If the string
  does not specify `@preview` or `@local`, `'@preview'` will be
  prepended.

- version:

  a version string, e.g. `0.1.0`

- dir:

  The project directory

- typst_args:

  Additional arguments to pass to Typst. Can be listed with
  `typr_help('init')`

## Value

a directory, invisibly

## Examples

``` r
if (FALSE) { # has_any_typst()
typr_init('charged-ieee', dir = paste0(tempdir(), '/typr_example'))
}
```
