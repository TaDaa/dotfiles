return {{
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  keys = {
    {'<Leader>ff', '<cmd>Telescope find_files<cr>' , desc="Telescope find_files"},
    {'<Leader>fg', '<cmd>Telescope live_grep<cr>' , desc="Telescope live_grep"},
    {'<Leader>fb', '<cmd>Telescope buffers<cr>' , desc="Telescope buffers"},
  }
}}
