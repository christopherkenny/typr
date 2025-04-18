#' Identify Install Typst to Use
#'
#' @returns a character vector or `NULL` if no Typst is found
#' @export
#'
#' @examples
#' typr_which_typst()
typr_which_typst <- function() {
  opt <- getOption('typr.typst')

  if (!is.null(opt)) {
    if (length(opt) == 1 && opt == 'quarto') {
      opt <- c('quarto', 'typst')
    }
    return(opt)
  }

  if (has_typst_cli()) {
    'typst'
  } else if (has_quarto_typst()) {
    c('quarto', 'typst')
  } else {
    NULL
  }
}
