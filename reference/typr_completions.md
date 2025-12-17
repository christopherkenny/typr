# Retrieve shell completions

Retrieve shell completions

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
