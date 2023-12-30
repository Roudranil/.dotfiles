local lspconfig = require("lspconfig")
require("lspconfig.ui.windows").default_options.border = "rounded"
-- setup astro
lspconfig.astro.setup({})
