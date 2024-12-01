return {{
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  keys = {
    {'<Leader>ff', '<cmd>Telescope find_files<cr>' , desc="Telescope find_files"}
  }
}}
