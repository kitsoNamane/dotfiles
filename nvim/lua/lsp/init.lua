-- TODO figure out why this don't work
local nvim_lsp = require('lspconfig')
vim.fn.sign_define("LspDiagnosticsSignError", {
    texthl = "LspDiagnosticsSignError",
    text = "",
    numhl = "LspDiagnosticsSignError"
})
vim.fn.sign_define("LspDiagnosticsSignWarning", {
    texthl = "LspDiagnosticsSignWarning",
    text = "",
    numhl = "LspDiagnosticsSignWarning"
})
vim.fn.sign_define("LspDiagnosticsSignInformation", {
    texthl = "LspDiagnosticsSignInformation",
    text = "",
    numhl = "LspDiagnosticsSignInformation"
})
vim.fn.sign_define("LspDiagnosticsSignHint", {
    texthl = "LspDiagnosticsSignHint",
    text = "",
    numhl = "LspDiagnosticsSignHint"
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    virtual_text = true,
    signs = true,
    update_in_insert = true,
  }
)

local servers = {
  'kotlin_language_server',
  'angularls', 'pyright',
  'gopls', 'clangd', 'dartls',
  'html', 'cssls', 'intelephense',
  'solargraph', 'texlab',
  'tsserver', 'vimls',
  'clangd', 'bashls',
  'yamlls',
}

for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
      on_attach = require('lsp').common_on_attach,
    }
end
