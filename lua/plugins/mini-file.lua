return {
  "echasnovski/mini.files",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["<Leader><Leader>e"] = {
              function()
                if not require("mini.files").close() then require("mini.files").open() end
              end,
              desc = "Explorer",
            },
          },
        },
      },
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
  opts = {},
}
