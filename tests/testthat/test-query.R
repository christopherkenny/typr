test_that('typr_query works', {
  skip_if_no_typst()

  expect_true(is.data.frame(typr_query('../test.typ', '<my-sec>')))
})
