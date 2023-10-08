local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local present, lspconfig = pcall(require, "lspconfig")
if not present then
  print("Error on loading lspconfig")
  return
end
local util = lspconfig.util

local servers = { "html", "cssls", "tsserver", "clangd" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.mod", ".git"),
  settings = {
    gopls = {
      analyses = {
        unusedparam = true,
      },
      staticcheck = true,
      completeUnimported = true,
      usePlaceholders = true,
      gofumpt = true,
    },
  },
}
