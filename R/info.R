#' Display Typst Debugging Information
#'
#' @returns a character vector of debugging information
#' @export
#'
#' @examplesIf has_any_typst()
#' typr_info()
typr_info <- function() {
  out <- typr_run(args = 'info')$stderr
  strsplit(out, '\n')[[1]]
}
