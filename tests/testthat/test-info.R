test_that('typr_info works', {
  skip_if_no_typst()

  expect_type(typr_info(), 'character')
})
