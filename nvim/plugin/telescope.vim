" lua require("ltfiend")

nnoremap <Leader>f :lua require'telescope.builtin'.fd()<CR>
nnoremap <Leader>F :lua require'telescope.builtin'.file_browser()<CR>
" nnoremap <Leader>g :lua require'telescope.builtin'.git_files()<CR>
nnoremap <Leader>s :lua require'telescope.builtin'.live_grep()<CR>
nnoremap <Leader>r :lua require("telescope").extensions.live_grep_raw.live_grep_raw()<CR>
nnoremap <Leader>go :lua require'telescope.builtin'.live_grep({grep_open_files = true})<CR>
nnoremap <Leader>g :lua require'telescope.builtin'.grep_string()<CR>
nnoremap <Leader>; :lua require'telescope.builtin'.buffers()<CR>
nnoremap <Leader>1 :lua require'telescope.builtin'.current_buffer_fuzzy_find()<CR>
" nnoremap <Leader>; :lua require'telescope.builtin'.buffers{path_display={"shorten"}}<CR>
nnoremap <Leader>h :lua require'telescope.builtin'.oldfiles()<CR>
nnoremap <Leader>H :lua require'telescope.builtin'.help_tags()<CR>
nnoremap <Leader>m :lua require'telescope.builtin'.marks()<CR>
nnoremap <Leader>M :lua require'telescope.builtin'.man_pages()<CR>
nnoremap <Leader>Mt :Telescope metals commands<CR>
nnoremap <Leader>k :lua require'telescope.builtin'.keymaps()<CR>
nnoremap <Leader>vrc :lua require('ltfiend.telescope').search_dotfiles()<CR>
" nnoremap <C-p> :lua require'telescope.builtin'.fd()<CR>
" nnoremap <Leader>d :lua require'telescope.builtin'.buffers(require('telescope.themes').get_dropdown({}))<CR>
