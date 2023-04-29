return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    -- add more things to the ensure_installed table protecting against community packs modifying it
    if not opts.ensure_installed then opts.ensure_installed = {} end
    require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
      "bash",
      "javascript",
      "json",
      -- "jsonc",
      "lua",
      "markdown",
      "markdown_inline",
      "regex",
      "rust",
      "toml",
      "typescript",
      "vim",
    })
    opts.highlight = {
      enable = true,
    }
    return opts
  end,
}
