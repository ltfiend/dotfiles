local M = {}
M.search_dotfiles = function()
        require("telescope.builtin").find_files({
                prompt_title = "< VimRC >",
                cwd = "$HOME/Git/dotfiles/nvim",
        })
end

return M
