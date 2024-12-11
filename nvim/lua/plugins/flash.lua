return {{
  'folke/flash.nvim',
  enabled = false,
  ---@type Flash.Config
  config = function()
    require('flash').setup({
       search = {
         multi_window = true,
         mode = 'search',
         wrap = true,
         incremental = true
       },
       modes = {
         search = {
           enabled = true,
           highlight = { backdrop = false },
           jump = { history = true, register = true, nohlsearch = true },
         },
         char = {
           enabled = true,
           -- autohide makes things behave more like default vim bindings,
           -- prefer this approach as other modes have tradeoffs
           autohide = true,
         }
     }
    })
    -- below ties into search and makes this work well
    --require('flash').toggle()
    require('flash').toggle(true)
  end,
  -- stylua: ignore
  keys = {
    --{ "/", mode = { "n", "v"}, function() require("flash").jump({search = {forward = true, wrap = true, multi_window=true}}) end, desc = "Flash" },
    --{ "n", mode = { "n", "v"}, function() require("flash").jump({search = {forward = true, wrap = false, multi_window=false}}) end, desc = "Flash" },
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  }
}}
