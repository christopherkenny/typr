test_that('typr_watch works', {
  skip_if_no_typst()

  p <- typr_watch('../test.typ')

  expect_true(p$is_alive())

  typr_watch_stop()

  expect_false(p$is_alive())
})
