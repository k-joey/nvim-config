vim.g.barbar_auto_setup = false -- disable auto-setup

require'barbar'.setup {
  -- Set the filetypes which barbar will offset itself for
  sidebar_filetypes = {
    -- Use the default values: {event = 'BufWinLeave', text = nil}
    NvimTree = true,
  }
}
