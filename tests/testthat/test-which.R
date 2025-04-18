test_that('typr_which works', {
  typ <- typr_which_typst()

  expect_true(is.null(typ) || 'typst' %in% typ)
})
