return {{
  'ibhagwan/fzf-lua',
  dependencies = {
    {'junegunn/fzf'},
    "nvim-tree/nvim-web-devicons",
  },
  config = function ()
    local fzf = require('fzf-lua')
    fzf.setup({})
    vim.keymap.set('n', '<Leader>ff', fzf.files, {desc = 'Fzf Files'})
    vim.keymap.set('n', '<Leader>fg', fzf.live_grep, {desc = 'Fzf Grep'})
    vim.keymap.set('n', '<Leader>fb', fzf.buffers, {desc = 'Fzf Buffers'})
    vim.keymap.set('n', '<Leader>fq', fzf.buffers, {desc = 'Fzf Quickfix'})
    vim.keymap.set('n', '<Leader>fl', fzf.buffers, {desc = 'Fzf Loclist'})
    vim.keymap.set('n', '<Leader>ft', fzf.buffers, {desc = 'Fzf Tabs'})
  end
}}
