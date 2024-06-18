return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    require('toggleterm').setup {
      size = 20,
      open_mapping = [[<C-\>]],
      start_in_insert = true,
      persist_size = true,
      direction = 'horizontal',
      close_on_exit = true,
    }

    local Terminal = require('toggleterm.terminal').Terminal
    local lazygit = Terminal:new {
      cmd = 'lazygit',
      dir = 'git_dir',
      direction = 'float',
      float_opts = {
        border = 'double',
      },
      -- function to run on opening the terminal
      on_open = function(term)
        vim.cmd 'startinsert!'
        vim.api.nvim_buf_set_keymap(term.bufnr, 'n', 'q', '<cmd>close<CR>', { noremap = true, silent = true })
      end,
      -- function to run on closing the terminal
      on_close = function()
        vim.cmd 'startinsert!'
      end,
    }

    function _lazygit_toggle()
      lazygit:toggle()
    end

    vim.api.nvim_set_keymap('n', '<leader>lg', '<cmd>lua _lazygit_toggle()<CR>', { noremap = true, silent = true, desc = '[L]azy[g]it' })

    local k9s = Terminal:new {
      cmd = 'k9s',
      direction = 'float',
      float_opts = {
        border = 'double',
      },
      -- function to run on opening the terminal
      on_open = function(term)
        vim.cmd 'startinsert!'
        vim.api.nvim_buf_set_keymap(term.bufnr, 'n', 'q', '<cmd>close<CR>', { noremap = true, silent = true })
      end,
      -- function to run on closing the terminal
      on_close = function()
        vim.cmd 'startinsert!'
      end,
    }

    function _k9s_toggle()
      k9s:toggle()
    end

    vim.api.nvim_set_keymap('n', '<leader>k', '<cmd>lua _k9s_toggle()<CR>', { noremap = true, silent = true, desc = '[K]9s' })
  end,
}
