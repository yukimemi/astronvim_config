-- customize mason plugins
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = function(_, opts)
      opts.ensure_installed = { "lua_ls" }
      return opts
    end,
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = function(_, opts)
      opts.ensure_installed = { "prettier", "stylua" }
      return opts
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    enabled = vim.fn.has "win32" == 0,
    -- overrides `require("mason-nvim-dap").setup(...)`
    -- opts = {
    -- ensure_installed = { "python" },
    -- },
  },
}
