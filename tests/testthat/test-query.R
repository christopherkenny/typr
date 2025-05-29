test_that('typr_query works', {
  skip_if_no_typst()

  query <- suppressWarnings({
    typr_query('../test.typ', '<my-sec>')
  })

  expect_true(
    is.data.frame(query) || is.character(query)
  )
})
