local mapping = {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map

    -- navigate buffer tabs
    ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
    ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

    -- mappings seen under group name "Buffer"
    ["<Leader>bd"] = {
      function()
        require("astroui.status.heirline").buffer_picker(function(bufnr) require("astrocore.buffer").close(bufnr) end)
      end,
      desc = "Close buffer from tabline",
    },

    -- tables with just a `desc` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    -- ["<Leader>b"] = { desc = "Buffers" },

    -- setting a mapping to false will disable it
    -- ["<C-S>"] = false,
    ["<C-_>"] = {
      "gcc",
      remap = true,
      desc = "Toggle comment",
    },
    ["<F4>"] = {
      "<leader>lS",
      remap = true,
      desc = "Search Symbols",
    },
    ["<A-o>"] = {
      "<Cmd>ClangdSwitchSourceHeader<CR>",
      desc = "Switch source/header file",
    },
    ["<F12>"] = {
      "gd",
      remap = true,
      desc = "Show the definition of current symbol",
    },
    ["<C-p>"] = {
      'viw"_dP',
    },
    ["<F2>"] = {
      "<leader>lr",
      remap = true,
      desc = "Rename current symbol",
    },
    ["<C-LeftMouse>"] = {
      "gd",
      remap = true,
      desc = "Same to gd",
    },
    ["<C-f>"] = {
      "*#",
    },
  },
  i = {
    ["<C-_>"] = {
      "<Esc>gcc",
      remap = true,
      desc = "Toggle comment",
    },
  },
  v = {
    ["<C-_>"] = {
      "gb",
      remap = true,
      desc = "Toggle comment block",
    },
    ["<C-p>"] = {
      '"_dP',
    },
  },
}

if vim.fn.executable "rg" == 1 then
  -- telescope keymap
  mapping.n["<leader>fg"] = {
    function() require("telescope").extensions.live_grep_args.live_grep_args() end,
    desc = "Find words with args",
  }
end

return mapping
