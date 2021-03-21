require'lspconfig'.sqls.setup {
  on_attach = require('lsp.lsp-common').common_on_attach,
  settings = {
    sqls = {
      connections = {
        {
          driver = 'postgresql',
          dataSourceName = 'host=127.0.0.1 port=5432 user=postgres password=kitso20#! dbname=postgres sslmode=disable',
        },
      },
    },
  },
}
