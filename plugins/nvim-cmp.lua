return {
  "hrsh7th/nvim-cmp",
  enabled = false,
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-emoji",
    "hrsh7th/cmp-cmdline",
    "dmitmel/cmp-cmdline-history",
    "lukas-reineke/cmp-rg",
    "ray-x/cmp-treesitter",
    "yutkat/cmp-mocword",
    "chrisgrieser/cmp-nerdfont",
    {
      "hrsh7th/cmp-nvim-lsp-signature-help",
      enabled = false,
    },
    {
      "KentoOgata/cmp-tsnip",
      dependencies = {
        "yuki-yano/tsnip.nvim",
      },
    },
  },
  opts = function(_, opts)
    local cmp = require "cmp"

    opts.mapping["<C-u>"] = cmp.mapping.scroll_docs(-4)
    opts.mapping["<C-d>"] = cmp.mapping.scroll_docs(4)
    opts.mapping["<C-Space>"] = cmp.mapping.complete()
    opts.mapping["<C-c>"] = cmp.mapping.abort()
    opts.mapping["<CR>"] = cmp.mapping.confirm { select = false }
    opts.mapping["<C-e>"] = cmp.mapping.confirm { select = true }
    opts.mapping["<C-k>"] = cmp.mapping.confirm { select = false }
    opts.mapping["<C-f>"] = cmp.mapping(function(fallback)
      if cmp.visible() then return cmp.complete_common_string() end
      fallback()
    end)

    opts.sources = cmp.config.sources {
      { name = "nvim_lsp",               priority = 1000 },
      { name = "luasnip",                priority = 750 },
      { name = "buffer",                 priority = 500 },
      { name = "path",                   priority = 250 },
      { name = "emoji" },
      { name = "mocword" },
      { name = "nerdfont" },
      { name = "nvim_lsp_signature_help" },
      { name = "rg" },
      { name = "treesitter" },
      { name = "tsnip" },
    }

    opts.window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    }

    return opts
  end,
  config = function(plugin, opts)
    local cmp = require "cmp"

    cmp.setup(opts)

    -- Use buffer source for `/` and `?`
    cmp.setup.cmdline({ "/", "?" }, {
      mapping = cmp.mapping.preset.cmdline {
        ["<C-n>"] = cmp.mapping(function(fallback) fallback() end, { "c" }),
        ["<C-p>"] = cmp.mapping(function(fallback) fallback() end, { "c" }),
      },
      sources = {
        { name = "buffer" },
      },
    })

    -- Use cmdline & path source for ':'
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline {
        ["<C-n>"] = cmp.mapping(function(fallback) fallback() end, { "c" }),
        ["<C-p>"] = cmp.mapping(function(fallback) fallback() end, { "c" }),
      },
      sources = cmp.config.sources({
        { name = "path" },
      }, {
        { name = "cmdline" },
      }),
    })
  end,
}
