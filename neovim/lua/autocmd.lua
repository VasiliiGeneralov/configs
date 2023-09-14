local cpplint = require('lint').linters.cpplint
cpplint.args = {
  '--filter=-legal',
}

vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
  callback = function()
    require('lint').try_lint(
      {
        cpp = 'cpplint',
      }
    )
  end,
})
