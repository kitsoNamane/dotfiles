
 require("flutter-tools").setup{
    experimental = {
      derive_lsp_paths = true,
    },
    flutter_outline = {
        highlight = "NonText",
        enabled = true,
    },

    lsp = {
      on_attach = require('lsp').common_on_attach,
    }
  } -- use defaults
