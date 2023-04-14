return {
  "yukimemi/dps-walk",
  dev = false,
  lazy = false,
  dependencies = {
    "vim-denops/denops.vim",
  },
  init = function()
    vim.g.walk_debug = false

    vim.keymap.set("n", "<space>Wa", "<cmd>DenopsWalk<cr>")
    vim.keymap.set("n", "<space>Ws", "<cmd>DenopsWalk --path=~/src<cr>")
    vim.keymap.set("n", "<space>Wd", "<cmd>DenopsWalk --path=~/.dotfiles<cr>")
    vim.keymap.set("n", "<space>Wc", "<cmd>DenopsWalk --path=~/.cache<cr>")
    vim.keymap.set("n", "<space>Wj", "<cmd>DenopsWalk --path=~/.cache/junkfile<cr>")
    vim.keymap.set("n", "<space>Wm", "<cmd>DenopsWalk --path=~/.memolist<cr>")
    vim.keymap.set("n", "<space>WD", "<cmd>DenopsWalkBufferDir<cr>")
  end,
}
