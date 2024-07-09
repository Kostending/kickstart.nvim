return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'theHamsta/nvim-dap-virtual-text',
    'rcarriga/nvim-dap-ui',
    'leoluz/nvim-dap-go',
    'nvim-neotest/nvim-nio',
  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

    require('dapui').setup()
    require('dap-go').setup()

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    vim.keymap.set('n', '<leader>dc', dap.continue, { desc = '[C]ontinue' })

    vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = 'Toggle [B]reakpoint' })
  end,
}
