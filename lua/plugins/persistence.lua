-- Configure tab bar persistence (cooperating with barbar.nvim)
require'persistence'.setup {
  options = {'globals'},
  pre_save = function()
    vim.api.nvim_exec_autocmds('User', {pattern = 'SessionSavePre'})
  end,
}

-- Autoload saved session when opening in a directory (without args).
local persistence_group = vim.api.nvim_create_augroup(
  "Persistence", { clear = true }
)
vim.api.nvim_create_autocmd({ "VimEnter" }, {
  group = persistence_group,
  callback = function()
    if vim.fn.argc() == 0 and not vim.g.started_with_stdin then
      -- Load saved session.
      require("persistence").load()
      -- Refresh nvim-tree.
      require("nvim-tree.api").tree.toggle({
        find_file = false, focus = false,
      })
      -- Workaround bug for barbar offset.
      -- Ref: https://github.com/romgrk/barbar.nvim/issues/421
      vim.api.nvim_exec_autocmds('BufWinEnter', {
        buffer = require('nvim-tree.view').get_bufnr()
      })
    else
      require("persistence").stop()
    end
  end,
  nested = true,
})
