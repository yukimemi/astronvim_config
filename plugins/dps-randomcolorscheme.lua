return {
  "yukimemi/dps-randomcolorscheme",
  lazy = false,
  dev = false,
  dependencies = {
    "vim-denops/denops.vim",
  },
  init = function()
    vim.g.randomcolorscheme_debug = false
    vim.g.randomcolorscheme_echo = true
    vim.g.randomcolorscheme_interval = 100
    vim.g.randomcolorscheme_disables = { "evening", "default" }
    vim.g.randomcolorscheme_path = vim.fn.expand "~/.config/randomcolorscheme/colorscheme.toml"
    vim.g.randomcolorscheme_background = "dark"
    vim.keymap.set("n", "<space>co", "<cmd>ChangeColorscheme<cr>")
    vim.keymap.set("n", "<space>cn", "<cmd>DisableThisColorscheme<cr>")
    vim.keymap.set("n", "<space>cl", "<cmd>LikeThisColorscheme<cr>")
    vim.keymap.set("n", "<space>ch", "<cmd>HateThisColorscheme<cr>")
  end,
}
