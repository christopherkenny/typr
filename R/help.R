#' Get Help Information for a Typst command
#'
#' Prints a message to the terminal with help information.
#' Silently returns the content as character which can be printed with `cat()`.
#'
#' @param command name of a command to get help for, e.g. `'compile'`
#'
#' @returns a character vector of information, invisibly
#' @export
#'
#' @examplesIf has_any_typst()
#' typr_help('compile')
typr_help <- function(command = NULL) {
  out <- typr_run(args = c('help', command))$stdout
  message(out)
  invisible(out)
}
