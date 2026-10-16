require("nvchad.configs.lspconfig").defaults()

local vue_plugin = {
  name = "@vue/typescript-plugin",
  location = vim.fn.stdpath("data")
    .. "/mason/packages/vue-language-server/node_modules/@vue/typescript-plugin",
  languages = { "vue" },
}

vim.lsp.config("ts_ls", {
  init_options = { plugins = { vue_plugin } },
  filetypes = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "vue",
  },
})

vim.lsp.enable({ "html", "cssls", "vue_ls", "ts_ls", "jdtls" })
