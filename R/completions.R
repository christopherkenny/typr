#' Retrieve shell completions
#'
#' @param shell The shell to generate completions for. One of
#' `c('bash', 'elvish', 'fish', 'powershell', 'zsh')`.
#'
#' @returns a character vector of debugging information
#' @export
#'
#' @examplesIf has_any_typst()
#' typr_completions(shell = 'powershell')
typr_completions <- function(shell = c('bash', 'elvish', 'fish',
                                       'powershell', 'zsh')) {
  shell <- match.arg(shell)
  out <- typr_run(args = c('completions', shell))$stdout
  strsplit(out, '\n')[[1]]
}
