skip_if_no_typst <- function() {
  testthat::skip_if_not(has_any_typst())
}

skip_if_no_internet <- function(site) {
  out <- NULL

  try({
    out <- curlGetHeaders(url = site)
  })

  if (is.null(out)) {
    testthat::skip('No internet connection')
  }
}

random_folder <- function(length = 8L) {
  paste0(sample(LETTERS, size = length), collapse = '')
}
