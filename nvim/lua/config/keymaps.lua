local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<Leader>co", "ggVGy:tabnew<cr>:set syntax=qf<cr>pgg", opts)
vim.keymap.set("n", "<Leader>cd", ":lcd %:p:h<cr>", opts)
vim.keymap.set("n", "<Leader>m", "mmHmt:%s/<C-V><CR>//ge<CR>'tzt'm", opts)
vim.keymap.set("n", "<Leader>e", ":silent tabnew ~/.config/nvim/init.lua<cr>:tcd %:p:h<cr>", opts)

-- TODO: Add zz mappings when this issue is fixed
-- Issue: https://github.com/neovim/neovim/issues/28106
-- vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
-- vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)
vim.keymap.set("x", "<leader>p", '"_dP', opts)

vim.keymap.set("n", "<Leader>bd", ":%bd!<cr>", opts)

-- -- Reference: https://github.com/justinmk/config/blob/39097a1840decd6daccc340ed56e7efbc618702d/.config/nvim/lua/plugins.lua#L15
vim.cmd([[
  let g:loaded_netrwPlugin = 0
  nnoremap <silent> <Plug>NetrwBrowseX :call netrw#BrowseX(expand((exists("g:netrw_gx")? g:netrw_gx : '<cfile>')),netrw#CheckIfRemote())<CR>
  nmap gx <Plug>NetrwBrowseX
]])
