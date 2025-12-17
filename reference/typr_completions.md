# Retrieve shell completions

Support for this function was added in Typst 0.14.0. If an earlier
version is in used, an empty character vector is returned.

## Usage

``` r
typr_completions(shell = c("bash", "elvish", "fish", "powershell", "zsh"))
```

## Arguments

- shell:

  The shell to generate completions for. One of
  `c('bash', 'elvish', 'fish', 'powershell', 'zsh')`.

## Value

a character vector of debugging information

## Examples

``` r
if (FALSE) { # has_any_typst()
typr_completions(shell = 'powershell')
}
```
