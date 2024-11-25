local M = {}

function M.jump_to_error()
  local line = vim.fn.getline "." -- 获取当前行内容
  local path, lineno, columnno = line:match "([^:%s]+):(%d+):(%d+)" -- 提取路径和行号
  if path and lineno and columnno then
    vim.cmd "wincmd k"
    vim.cmd("edit " .. path) -- 打开文件
    vim.api.nvim_win_set_cursor(0, { tonumber(lineno), tonumber(columnno) })
    -- vim.cmd(tostring(lineno)) -- 跳转到行号
  else
    print "No valid file and line number found!"
  end
end

return M
