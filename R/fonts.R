#' List Available Typst Fonts
#'
#' @returns a character vector of font names
#' @export
#'
#' @examplesIf has_any_typst()
#' typr_fonts()
typr_fonts <- function() {
  out <- typr_run(args = 'fonts')$stdout
  strsplit(out, '\n')[[1]]
}
