test_that('has works', {
  expect_type(has_any_typst(), 'logical')

  expect_type(has_typst_cli(), 'logical')

  expect_type(has_quarto_cli(), 'logical')

  expect_type(has_quarto_typst(), 'logical')
})
