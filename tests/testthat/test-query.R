test_that('typr_query works', {
  skip_if_no_typst()

  expect_true(is.list(typr_query('../test.typ', '<my-sec>')))
})
