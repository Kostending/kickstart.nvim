return {
  'sheodox/projectlaunch.nvim',
  config = function()
    projectlaunch = require 'projectlaunch'

    projectlaunch.setup {
      -- set a default width for split windows
      split_default_width = 80,
      -- if opening the split terminal should move focus to the split's window
      split_focus_on_open = false,
      -- the filename of configuration file which under root directory.
      config_path = '.projectlaunch.json',
      -- automatically reload config after loading a session or updating your ProjectLaunch config file
      auto_reload_config = true,
    }

    -- open the main menu
    vim.keymap.set('n', '<leader>lp', projectlaunch.toggle_main_menu, { desc = '[L]aunch [P]roject', noremap = true, expr = false, buffer = false })

    -- open the floating window terminal viewer
    vim.keymap.set('n', '<leader>lf', projectlaunch.toggle_float, { desc = '[L]aunch [F]loat', noremap = true, expr = false, buffer = false })

    -- open the split window terminal viewer
    vim.keymap.set('n', '<leader>ls', projectlaunch.toggle_split, { desc = '[L]aunch [S]plit', noremap = true, expr = false, buffer = false })

    -- show the next or previous terminals in the open viewer
    vim.keymap.set('n', '<leader>ln', projectlaunch.show_next, { desc = '[L]aunch [N]ext', noremap = true, expr = false, buffer = false })
    vim.keymap.set('n', '<leader>lm', projectlaunch.show_prev, { desc = '[L]aunch [M]Previus', noremap = true, expr = false, buffer = false })

    -- restart the command running in the currently open split terminal
    vim.keymap.set('n', '<leader>lr', projectlaunch.restart_command_in_split, { desc = '[L]aunch [R]estart', noremap = true, expr = false, buffer = false })
  end,
}
