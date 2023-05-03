return {
  "yukimemi/dps-hitori",
  dev = false,
  enabled = not (vim.fn.has "wsl" > 0),
  lazy = false,
  dependencies = {
    "vim-denops/denops.vim",
  },
  init = function()
    vim.g.hitori_debug = false
    vim.g.hitori_enable = true
    vim.g.hitori_quit = true

    vim.g.hitori_blacklist_patterns = { "\\.tmp$", "\\.diff$", "(COMMIT_EDIT|TAG_EDIT|MERGE_|SQUASH_)MSG$" }
  end,
}
