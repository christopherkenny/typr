# Get Help Information for a Typst command

Prints a message to the terminal with help information. Silently returns
the content as character which can be printed with
[`cat()`](https://rdrr.io/r/base/cat.html).

## Usage

``` r
typr_help(command = NULL)
```

## Arguments

- command:

  name of a command to get help for, e.g. `'compile'`

## Value

a character vector of information, invisibly

## Examples

``` r
if (FALSE) { # has_any_typst()
typr_help('compile')
}
```
