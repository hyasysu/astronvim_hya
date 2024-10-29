return {
  "linux-cultist/venv-selector.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "nvim-telescope/telescope.nvim",
    "mfussenegger/nvim-dap-python",
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        local maps = opts.mappings
        local prefix = "<Leader>v"
        maps.n[prefix] = { desc = require("astroui").get_icon("List", 1, true) .. "PythonVenvSelect" }

        maps.n[prefix .. "s"] = { "<cmd>VenvSelect<CR>", desc = "Select VirtualEnv" }
        maps.n[prefix .. "c"] = { "<cmd>VenvSelectCached<CR>", desc = "Select Cached VirtualEnv" }
      end,
    },
  },
  config = function()
    require("venv-selector").setup {
      settings = {
        options = {
          cached_venv_automatic_activation = false, -- enable VenvSelectCached
        },
      },
    }
  end,
  cmd = {
    "VenvSelect",
    "VenvSelectCached",
  },
}
