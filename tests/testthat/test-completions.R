test_that('typr_completions works', {
  skip_if_no_typst()

  expect_type(typr_completions(shell = 'bash'), 'character')
})
