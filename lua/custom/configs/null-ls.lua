local present, null_ls = pcall(require, "null-ls")

if not present then
  print "Error loading null-ls"
  return
end

-- local b = null_ls.builtins
local augroup = vim.api.nvim_create_augroup("LspAutoFormat", {})
local formatting = null_ls.builtins.formatting
-- local lint = null_ls.builtins.diagnostics

local opts = {
  debug = true,
  sources = {

    -- webdev stuff
    formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
    formatting.prettier.with { filetypes = { "html", "markdown", "css" } }, -- so prettier works only on these filetypes

    -- Lua
    formatting.stylua,

    -- cpp
    formatting.clang_format,

    -- Go
    formatting.gofumpt,
    formatting.goimports_reviser,
    formatting.golines,
  },
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds {
        group = augroup,
        buffer = bufnr,
      }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format()
        end,
      })
    end
  end,
}
null_ls.setup(opts)
