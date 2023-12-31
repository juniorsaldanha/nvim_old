local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd =",
})
vim.opt.termguicolors = true
vim.wo.relativenumber = true
vim.opt.colorcolumn = "80"
vim.opt.cursorline = true
