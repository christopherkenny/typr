# internal runner for rest of package
typr_run <- function(args = character(0), typst = typr_which_typst()) {

  cmd <- typst[1]
  args <- c(typst[-1], args)

  out <- tryCatch({
    processx::run(
      command = cmd, args = args
    )
  }, error = function(e) {
    cli::cli_abort('Problem running `typst`.', parent = e)
  })

  out
}
