test_that('typr_version works', {
  skip_if_no_typst()

  expect_type(typr_version(), 'character')
})
