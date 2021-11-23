local lsp_config = {}
function lsp_config.common_on_attach(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings
  local opts = { noremap=true, silent=true }

  -- Definition and Reference
  --buf_set_keymap('n', 'gr', "<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>", opts)

  -- Hover Doc
  --buf_set_keymap('n', 'K', "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>", opts)
  --buf_set_keymap('n', '<C-f>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", opts)
  --buf_set_keymap('n', '<C-b>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", opts)


  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)

  -- Signature Help
  --buf_set_keymap('n', 'gs', "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>", opts)

  -- Rename
  -- ctrl + F2
  --buf_set_keymap('n', '<F26>', "<cmd>lua require('lspsaga.rename').rename()<CR>", opts)

  -- Definition Preview
  --buf_set_keymap('n', 'gd', "<cmd>lua require'lspsaga.provider'.preview_definition()<CR>", opts)

  buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)

  -- CodeAction
  --buf_set_keymap('n', 'ca', "<cmd>lua require('lspsaga.codeaction').code_action()<CR>", opts)
  buf_set_keymap('v', 'ca', "<cmd>'<,'>lua require('lspsaga.codeaction').range_code_action()<CR>", opts)

  -- Show and Jump Diagnostics
  --buf_set_keymap('n', '<leader>e', "<cmd>lua require('lspsaga.diagnostic').show_line_diagnostics()<CR>", opts)


  buf_set_keymap('n', '[e', "<leader>e require('lspsaga.diagnostic').lsp_jump_diagnostic_prev()<CR>", opts)
  buf_set_keymap('n', ']e', "<leader>e require('lspsaga.diagnostic').lsp_jump_diagnostic_next()<CR>", opts)

  buf_set_keymap('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)


  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
      buf_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.resolved_capabilities.document_range_formatting then
      buf_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  end

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec([[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=#464646
      hi LspReferenceText cterm=bold ctermbg=red guibg=#464646
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=#464646
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end

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

  require('nv-lspkind')
end

function lsp_config.config_all_ls()
  local nvim_lsp = require('lspconfig')
  local servers = {
    --'kotlin_language_server',
    --'angularls', 'pyright',
    --'gopls', 'clangd', 'dartls',
    --'html', 'cssls', 'intelephense',
    --'solargraph', 'texlab',
    --'tsserver', 'vimls',
    --'clangd', 'bashls',
    --'yamlls', 'dockerls',
    'vimls', 'bashls',
  }

  for _, lsp in ipairs(servers) do
      nvim_lsp[lsp].setup {
        on_attach = lsp_config.common_on_attach,
      }
  end
end

return lsp_config
