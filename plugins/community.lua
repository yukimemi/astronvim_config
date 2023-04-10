return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- example of imporing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity

  { import = "astrocommunity.bars-and-lines.smartcolumn-nvim", enabled = true },
  { import = "astrocommunity.colorscheme.catppuccin",          enabled = true },
  { import = "astrocommunity.colorscheme.everforest",          enabled = true },
  { import = "astrocommunity.colorscheme.gruvbox",             enabled = true },
  { import = "astrocommunity.colorscheme.kanagawa",            enabled = true },
  { import = "astrocommunity.colorscheme.nightfox",            enabled = true },
  { import = "astrocommunity.colorscheme.oxocarbon",           enabled = true },
  { import = "astrocommunity.colorscheme.rose-pine",           enabled = true },
  { import = "astrocommunity.colorscheme.tokyonight",          enabled = true },
  { import = "astrocommunity.editing-support.dial-nvim",       enabled = true },
  { import = "astrocommunity.motion.vim-matchup",              enabled = true },
  { import = "astrocommunity.pack.markdown",                   enabled = true },
  { import = "astrocommunity.pack.rust",                       enabled = true },
  { import = "astrocommunity.project.project-nvim",            enabled = true },

  { "catppuccin",                                              lazy = false },
  { "everforest",                                              lazy = false },
  { "gruvbox.nvim",                                            lazy = false },
  { "kanagawa.nvim",                                           lazy = false },
  { "nightfox.nvim",                                           lazy = false },
  { "oxocarbon.nvim",                                          lazy = false },
  { "rose-pine",                                               lazy = false },
  { "tokyonight.nvim",                                         lazy = false },
}
