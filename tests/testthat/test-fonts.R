test_that('typr_fonts works', {
  skip_if_no_typst()

  expect_type(typr_fonts(), 'character')
})
