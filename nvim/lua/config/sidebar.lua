
require("sidebar-nvim").setup({
    open = false;
    sections = { "datetime", "git", "diagnostics", "containers", "symbols", "buffers" };
    containers = {
        icon = "",
        use_podman = false,
        attach_shell = "/bin/sh",
        show_all = true, -- whether to run `docker ps` or `docker ps -a`
        interval = 5000, -- the debouncer time frame to limit requests to the docker daemon
    };
    symbols = {
        icon = "ƒ",
    };
    buffers = {
        icon = "",
        ignored_buffers = {}, -- ignore buffers by regex
        sorting = "id", -- alternatively set it to "name" to sort by buffer name instead of buf id
        show_numbers = true, -- whether to also show the buffer numbers
    }
    -- todos = {
    --     icon = "",
    --     ignored_paths = {'~'}, -- ignore certain paths, this will prevent huge folders like $HOME to hog Neovim with TODO searching
    --     initially_closed = false, -- whether the groups should be initially closed on start. You can manually open/close groups later.
    -- }
})
