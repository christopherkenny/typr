#' Create a project from a template
#'
#' @param template a template to use, can be local or on Typst Universe. If the
#' string does not specify `@preview` or `@local`, `'@preview'` will be prepended.
#' @param version a version string, e.g. `0.1.0`
#' @param dir The project directory
#' @param typst_args Additional arguments to pass to Typst. Can be listed with `typr_help('init')`
#'
#' @returns a path, invisibly
#' @export
#'
#' @examplesIf has_any_typst()
#' typr_init('charged-ieee', dir = paste0(tempdir(), '/typr_example'))
typr_init <- function(template = NULL, version = NULL, dir = NULL, typst_args = NULL) {
  # TODO check web availability for example

  if (is.null(template)) {
    cli::cli_abort('{.arg template} must not be {.val NULL}.')
  }

  if (substr(template, 1, 1) != '@') {
    template <- paste0('@preview/', template)
  }
  if (!is.null(version)) {
    if (substr(version, 1, 1) != ':') {
      version <- paste0(':', version)
    }

    template <- paste0(template, version)
  }

  out <- typr_run(args = c('init', template, dir, typst_args))$stdout

  # TODO check if any additional processing is needed
  out
}
