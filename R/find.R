#' Find if Typst is available
#'
#' @returns a logical if Typst or Quarto are found
#' @export
#'
#' @rdname find_typst
#'
#' @examples
#' has_any_typst()
#' has_typst_cli()
#' has_quarto_cli()
#' has_quarto_typst()
has_any_typst <- function() {
  has_typst_cli() || has_quarto_typst()
}

#' @rdname find_typst
#' @export
has_typst_cli <- function() {
  status <- NULL
  try({
    status <- processx::run('typst')$status
  }, silent = TRUE)
  !is.null(status)
}

#' @rdname find_typst
#' @export
has_quarto_typst <- function() {
  status <- NULL
  try({
    status <- processx::run('quarto', 'typst')$status
  }, silent = TRUE)
  !is.null(status)
}

#' @rdname find_typst
#' @export
has_quarto_cli <- function() {
  status <- NULL
  try(
    {
      status <- processx::run('quarto')$status
    },
    silent = TRUE
  )
  !is.null(status)
}

#' @rdname find_typst
#' @export
typr_has_typst <- has_any_typst

#' @rdname find_typst
#' @export
typr_has_quarto <- has_quarto_cli

#' @rdname find_typst
#' @export
typr_has_quarto_typst <- has_quarto_typst
