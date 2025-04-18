# creates the process that needs to be managed
typr_background <- function(args = character(0), typst = typr_which_typst()) {
  cmd <- typst[1]
  args <- c(typst[-1], args)

  if (!'--port' %in% args) {
    # pick a random port
    excluded <- c(
      1719, 1720, 1723, 2049, 3659, 4045,
      5060, 5061, 6000, 6566,
      6665:6669, 6697, 10080
    )
    port <- sample(setdiff(1024:9999, excluded), 1)
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
}
