#' Compile a Typst document
#'
#' @param input either a path to a `.typ` file or text to use as the file
#' @param output_file file to output to
#' @param output_format format to use. One of `c('pdf', 'png', 'svg', 'html')`,
#' @param typst_args Additional arguments to pass to Typst. Can be listed with `typr_help('compile')`
#'
#' @returns a path to the created file
#' @export
#'
#' @examplesIf has_any_typst()
#' typr_compile('hello world')
#' typr_compile(
#'   input = 'Hello world', output_format = 'png',
#'   typst_args = c('--ppi', '300')
#' )
typr_compile <- function(input = NULL, output_file = NULL,
                         output_format = c('pdf', 'png', 'svg', 'html'),
                         typst_args = NULL) {
  output_format <- match.arg(output_format)

  if (is.null(input)) {
    cli::cli_abort('{.arg input} must not be {.val NULL}.')
  }

  if (is.character(input)) {
    if (!grepl('.typ$', input)[1]) {
      txt_input <- input
      input <- fs::file_temp(ext = 'typ')
      writeLines(txt_input, con = input)
    }
  }

  if (is.null(output_file)) {
    output_file <- input |>
      fs::path_ext_remove() |>
      fs::path_ext_set(output_format)
  }

  typr_run(args = c('compile', input, output_file, typst_args))

  output_file
}
