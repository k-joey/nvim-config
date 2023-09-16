local usrcmd = vim.api.nvim_create_user_command

-- Persistence plugin
usrcmd('SessionRestoreCurrentDir', 'lua require("persistence").load()', {})
usrcmd('SessionRestoreLast', 'lua require("persistence").load({ last = true })', {})
usrcmd('SessionStop', 'lua require("persistence").stop()', {})
