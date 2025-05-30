#' Watch a Typst document
#'
#' @param input either a path to a `.typ` file or text to use as the file
#' @param output_file file to output to
#' @param output_format format to use. One of `c('pdf', 'png', 'svg', 'html')`,
#' @param typst_args Additional arguments to pass to Typst. Can be listed with `typr_help('watch')`
#'
#' @returns a path to the created file
#' @export
#'
#' @examplesIf has_any_typst()
#' tf <- fs::file_temp(ext = 'typ')
#' writeLines(text = '= test', con = tf)
#' typr_watch(tf)
#' writeLines(text = c('= test', 'hello'), con = tf)
typr_watch <- function(input = NULL, output_file = NULL,
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

  # if (!any(grepl(typst_args, pattern = '--port'))) {
  #   typst_args <- c(typst_args, '--port', port)
  # }

  # start process

  # 1. Kill existing process if it exists
  typr_watch_stop()

  # 2. Start the process
  p <- typr_background(args = c('watch', input, output_file, typst_args))

  # 3. Store the process in the environment
  typr$proc <- p

  # # 4. Get the port
  # cmd <- p$get_cmdline()
  # port <- cmd[which(cmd == '--port') + 1]
  #
  # watch_url <- paste0('http://localhost:', port)

  cli::cli_inform(c(
    'Typst watch process started.',
    #   'You can view the output at {.url {watch_url}}.',
    'Run {.fn typr_watch_stop} to stop the process.'
  ))

  # 5. Open the output file in the viewer
  if (requireNamespace('rstudioapi', quietly = TRUE) &&
    rstudioapi::isAvailable() && interactive()) {
    rstudioapi::viewer(output_file)
  } else if (interactive()) {
    utils::browseURL(output_file)
  }

  # # 6. Start refreshing
  # refresh_viewer()

  # return something
  # invisible(list(
  #   process = p,
  #   port = port,
  #   url = watch_url,
  #   output = output_file
  # ))
  invisible(p)
}


#' @rdname typr_watch
#' @export
typr_watch_stop <- function() {
  if (!is.null(typr$proc)) {
    if (typr$proc$is_alive()) {
      cli::cli_inform('Stopping previous Typst watch process...')
      typr$proc$kill()
    }
    rm('proc', envir = typr)
  }

  invisible(NULL)
}

# # Function to open and refresh PDF in viewer
# refresh_viewer <- function(path) {
#
#   # Use rstudioapi if available, otherwise fall back to default viewer
#   if (requireNamespace("rstudioapi", quietly = TRUE) && rstudioapi::isAvailable()) {
#     # Use RStudio's viewer to display the PDF
#     rstudioapi::viewer(path)
#   } else {
#     # Fall back to regular viewer
#     viewer <- getOption("viewer")
#     if (!is.null(viewer)) {
#       viewer(path)
#     } else {
#       utils::browseURL(path)
#     }
#   }
#
#   # Schedule next refresh
#   later::later(refresh_viewer, delay = 2) # Refresh every 2 seconds
# }
