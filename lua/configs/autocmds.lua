vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "term://*", -- 匹配所有终端类型窗口
  callback = function()
    local bufnr = vim.api.nvim_get_current_buf() -- 获取当前缓冲区编号

    -- 判断是否属于 toggleterm 打开的窗口
    if vim.bo.filetype == "toggleterm" then
      -- 为该缓冲区设置快捷键
      vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-LeftMouse>", "", {
        callback = function() require("configs.custom-function").jump_to_error() end,
        noremap = true,
        silent = true,
        desc = "Jump to error in toggleterm",
      })
      vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>j", "", {
        callback = function() require("configs.custom-function").jump_to_error() end,
        noremap = true,
        silent = true,
        desc = "Jump to error in toggleterm",
      })
    end
  end,
})
