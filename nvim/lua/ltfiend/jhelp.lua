local M = {}
M.datestamp = function()
    local pos = vim.api.nvim_win_get_cursor(0)[2]
    local line = vim.api.nvim_get_current_line()
    print(os.date("%Y-%m-%d"))
end
