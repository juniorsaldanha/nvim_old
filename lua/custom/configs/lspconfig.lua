local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local present, lspconfig = pcall(require, "lspconfig")
if not present then
  print "Error on loading lspconfig"
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
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      analyses = {
        unusedparam = true,
      },
      staticcheck = true,
      completeUnimported = true,
      usePlaceholders = true,
      gofumpt = true,
      codelenses = {
        generate = false,
        gc_details = true,
        test = true,
        tidy = true,
      },
    },
  },
}

-- lspconfig.jsonls.setup {
--   one_new_config = function(new_config)
--     new_config.settings.json.schemas = new_config.settings.json.schemas or {}
--     vim.list_extend(new_config.settings.json.schemas, require("schemastore").json.schemas())
--   end,
--   settings = {
--     json = {
--       format = {
--         enable = true,
--       },
--       validate = { enable = true },
--     },
--   },
-- }
