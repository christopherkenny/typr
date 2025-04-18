test_that('typr_compile works', {
  skip_if_no_typst()

  path <- typr_compile('hello world')

  expect_true(file.exists(path))

  path <- typr_compile('../test.typ') # , output_file = fs::file_temp(ext = 'pdf'))

  expect_true(file.exists(path))
})
