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
  opts = function()
    local actions, get_icon = require "telescope.actions", require("astroui").get_icon
    local function open_selected(prompt_bufnr)
      local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
      local selected = picker:get_multi_selection()
      if vim.tbl_isempty(selected) then
        actions.select_default(prompt_bufnr)
      else
        actions.close(prompt_bufnr)
        for _, file in pairs(selected) do
          if file.path then vim.cmd("edit" .. (file.lnum and " +" .. file.lnum or "") .. " " .. file.path) end
        end
      end
    end
    local function open_all(prompt_bufnr)
      actions.select_all(prompt_bufnr)
      open_selected(prompt_bufnr)
    end
    return {
      defaults = {
        git_worktrees = require("astrocore").config.git_worktrees,
        prompt_prefix = get_icon("Selected", 1),
        selection_caret = get_icon("Selected", 1),
        multi_icon = get_icon("Selected", 1),
        path_display = { "truncate" },
        dynamic_preview_title = true,
        sorting_strategy = "ascending",
        layout_config = {
          horizontal = { prompt_position = "top", preview_width = 0.55 },
          vertical = { mirror = false },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },
        mappings = {
          i = {
            ["<C-J>"] = actions.move_selection_next,
            ["<C-K>"] = actions.move_selection_previous,
            ["<C-n>"] = actions.cycle_history_next,
            ["<C-p>"] = actions.cycle_history_prev,
            ["<CR>"] = open_selected,
            ["<M-CR>"] = open_all,
          },
          n = {
            q = actions.close,
            ["<CR>"] = open_selected,
            ["<M-CR>"] = open_all,
          },
        },
      },
    }
  end,
  config = function(...) require "astronvim.plugins.configs.telescope"(...) end,
}
