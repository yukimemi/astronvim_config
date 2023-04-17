return {
  "skanehira/denops-translate.vim",
  enabled = true,
  lazy = false,
  init = function() vim.keymap.set({ "n", "x" }, "<space>T", "<Plug>(Translate)", { desc = "Translate" }) end,
  dependencies = {
    "vim-denops/denops.vim",
  },
}
