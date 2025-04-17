#' Get installed Typst version
#'
#' @param keep_hash description
#'
#' @returns a version, numeric if `!keep_hash`
#' @export
#'
#' @examplesIf has_any_typst()
#' typr_version()
typr_version <- function(keep_hash = FALSE) {
  vers <- typr_run(args = '--version')$stdout

  if (keep_hash) {
    substr(vers, 7, nchar(vers) - 1)
  } else {
    extract_version(vers)
  }
}

extract_version <- function(x) {
  regmatches(
    x = x,
    m = regexpr(
      pattern = '\\d+.\\d+.\\d+',
      text = x
    )
  )
}
