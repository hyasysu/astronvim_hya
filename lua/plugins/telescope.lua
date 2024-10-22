return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-telescope/telescope-live-grep-args.nvim",
    lazy = true,
    config = function()
      local astrocore = require "astrocore"
      astrocore.on_load("telescope.nvim", function()
        local ok, err = pcall(require("telescope").load_extension, "live_grep_args")
        if not ok then astrocore.notify("Failed to load live_grep_args:" .. err, vim.log.levels.ERROR) end
      end)
    end,
  },
}
