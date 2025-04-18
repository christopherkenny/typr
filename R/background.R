# creates the process that needs to be managed
typr_background <- function(args = character(0), typst = typr_which_typst()) {
  cmd <- typst[1]
  args <- c(typst[-1], args)

  if (!'--port' %in% args) {
    # pick a random port
    port <- sample(10000:65535, 1)
    args <- c(args, '--port', port)
  }

  p <- tryCatch(
    {
      processx::process$new(
        command = cmd,
        args = args,
        stdout = '|',
        stderr = '|',
        cleanup = TRUE
      )
    },
    error = function(e) {
      cli::cli_abort('Problem running `typst`.', parent = e)
    }
  )

  p
}
