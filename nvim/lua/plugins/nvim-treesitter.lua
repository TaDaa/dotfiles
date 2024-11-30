return {{
  'nvim-treesitter/nvim-treesitter',
  opts = {
    ensure_installed = {'c', 'cpp', 'java', 'javascript', 'json', 'lua', 'html', 'markdown', 'python', 'typescript', 'vim', 'vimdoc', 'java'},
    sync_install = false,
    auto_install = true,
    highlight = {
      enable =true,
    }
  }
}}
