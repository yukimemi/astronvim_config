return {
  "vim-denops/denops-shared-server.vim",
  enabled = jit.os:find "Windows",
  build = function() vim.fn["denops_shared_server#install"]() end,
  event = "VeryLazy",
}
