local formatter = require('formatter')

formatter.setup {
  filetype = {
    cpp = {
      function()
        return {
          exe = 'clang-format-12',
          stdin = true,
        }
      end
    },
  },
}
