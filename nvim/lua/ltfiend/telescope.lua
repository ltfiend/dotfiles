local M = {}
M.search_dotfiles = function()
        require("telescope.builtin").find_files({
                prompt_title = "< VimRC >",
                cwd = "$HOME/.config",
        })
end

return M
