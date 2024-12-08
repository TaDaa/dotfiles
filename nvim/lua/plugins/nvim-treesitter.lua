return {{
  'nvim-treesitter/nvim-treesitter',
  opts = {
    ensure_installed = {
      'c',
      'cpp',
      'html',
      'java',
      'javascript',
      'json',
      'java',
      'javascript',
      'lua',
      'markdown',
      'python',
      'typescript',
      'vim',
      'vimdoc',
    },
    sync_install = false,
    auto_install = true,
    highlight = {
      enable =true,
    }
  }
}}
