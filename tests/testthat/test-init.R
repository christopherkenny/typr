test_that('typr_init works', {
  skip_if_no_typst()
  skip_if_no_internet('github.com')

  dir <- random_folder()

  typr_init('charged-ieee', dir = paste0(tempdir(), '/', dir))

  expect_true(dir.exists(paste0(tempdir(), '/', dir)))
})
