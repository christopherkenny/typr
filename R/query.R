#' Query within a Typst file
#'
#' @param input a path to a `.typ` file
#' @param selector a string to search for, e.g. a `"<label>"`
#' @param typst_args Additional arguments to pass to Typst. Can be listed with `typr_help('query')`
#' @param as_json if `TRUE`, return a list, otherwise a character string
#'
#' @returns a length one character with json syntax if `!as_json`, otherwise a list
#' @export
#'
#' @examplesIf has_any_typst()
#' tf <- fs::file_temp(ext = 'typ')
#' writeLines(text = '= test <lbl>', con = tf)
#' typr_query(input = tf, selector = '<lbl>')
typr_query <- function(input = NULL, selector = NULL, typst_args = NULL,
                       as_json = !rlang::is_installed('jsonlite')) {
  if (is.null(input)) {
    cli::cli_abort('{.arg input} must not be {.val NULL}.')
  }

  if (is.null(selector)) {
    cli::cli_abort('{.arg selector} must not be {.val NULL}.')
  }

  out <- typr_run(args = c('query', input, selector, typst_args))$stdout

  if (as_json) {
    out
  } else {
    if (!rlang::is_installed('jsonlite')) {
      cli::cli_warn(c(
        x = '{.pkg jsonlite} is required when {.arg as_json = FALSE}.',
        i = 'Returning raw `json`.'
      ))
      out
    } else {
      jsonlite::fromJSON(txt = out, simplifyVector = TRUE)
    }
  }
}
