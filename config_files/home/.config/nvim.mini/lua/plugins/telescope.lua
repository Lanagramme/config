return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.4',  -- or 'latest'
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('telescope').setup{
        defaults = {
          layout_config = {
            prompt_position = "top",
          },
          sorting_strategy = "ascending",
          winblend = 10,
        }
      }
    end,
  },
}
