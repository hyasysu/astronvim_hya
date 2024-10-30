return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = function(_, opts)
    opts.filesystem.filtered_items.hide_hidden = false
    opts.filesystem.filtered_items.hide_dotfiles = false
    opts.filesystem.filtered_items.hide_gitignored = false
  end,
}
