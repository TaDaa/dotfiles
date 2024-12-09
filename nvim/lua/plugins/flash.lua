return {{
  'folke/flash.nvim',
  ---@type Flash.Config
  config = function()
    require('flash').setup({
       modes = {search = {enabled = false}, char = {enabled = false}}
    })
    require('flash').toggle()
  end,
  -- stylua: ignore
  keys = {
    --{ "/", mode = { "n", "v"}, function() require("flash").jump() end, desc = "Flash" },
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  }
}}
