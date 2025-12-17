#' Display Typst Debugging Information
#'
#' Support for this function was added in Typst 0.14.0. If an earlier version
#' is in used, an empty character vector is returned.
#'
#' @returns a character vector of debugging information
#' @export
#'
#' @examplesIf has_any_typst()
#' typr_info()
typr_info <- function() {
  if (typr_version() < '0.14.0') {
    return(character())
  }
  out <- typr_run(args = 'info')$stderr
  strsplit(out, '\n')[[1]]
}
