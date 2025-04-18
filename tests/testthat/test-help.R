test_that('typr_help works', {
  skip_if_no_typst()

  expect_type(typr_help('compile'), 'character')

  expect_error(typr_help('fakecommand'))
})
