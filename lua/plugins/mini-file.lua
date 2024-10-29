return {
  "echasnovski/mini.files",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        local maps = opts.mappings
        local prefix = "<Leader><Leader>"
        maps.n[prefix] = { desc = require("astroui").get_icon("FolderOpen", 1, true) .. "Mini File" }
        maps.n[prefix .. "e"] = {
          function()
            if not require("mini.files").close() then require("mini.files").open() end
          end,
          desc = "Mini File Explorer",
        }
      end,
    },
  },
  specs = {
    { "neo-tree.nvim", optional = true, enabled = true },
    {
      "catppuccin",
      optional = true,
      ---@type CatppuccinOptions
      opts = { integrations = { mini = true } },
    },
  },
  opts = {
    windows = {
      preview = true,
    },
  },
}
