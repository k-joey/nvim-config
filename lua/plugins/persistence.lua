-- Configure tab bar persistence (cooperating with barbar.nvim)
require'persistence'.setup {
  options = {'globals'},
  pre_save = function() vim.api.nvim_exec_autocmds('User', {pattern = 'SessionSavePre'}) end,
}
