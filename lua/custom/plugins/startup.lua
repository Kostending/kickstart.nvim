return {
  'startup-nvim/startup.nvim',
  dependencies = {
    { 'nvim-telescope/telescope.nvim' }, -- Use telescope for help actions
    { 'nvim-lua/plenary.nvim' },
  },
  config = function()
    require('startup').setup { theme = 'dashboard' } -- put theme name here  end,
  end,
}
