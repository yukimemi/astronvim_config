return {
  "yukimemi/dps-autocursor",
  enabled = true,
  dev = false,
  lazy = false,
  dependencies = {
    "vim-denops/denops.vim",
  },
  init = function()
    vim.g.autocursor_debug = false
    vim.g.autocursor_cursorline = {
      enable = true,
      events = {
        {
          name = {
            "FocusGained",
            "FocusLost",
            "WinEnter",
            "VimResized",
            "BufEnter",
            "CmdwinLeave",
            "CursorHold",
            "CursorHoldI",
            "InsertLeave",
            "ModeChanged",
            "TextChanged",
          },
          set = true,
          wait = 0,
        },
        {
          name = { "CursorMoved", "CursorMovedI", "InsertEnter" },
          set = false,
          wait = 0,
        },
      },
    }
    vim.g.autocursor_cursorcolumn = {
      enable = true,
      events = {
        {
          name = {
            "FocusGained",
            "FocusLost",
            "WinEnter",
            "VimResized",
            "BufEnter",
            "CmdwinLeave",
            "CursorHold",
            "CursorHoldI",
            "InsertLeave",
            "ModeChanged",
            "TextChanged",
          },
          set = true,
          wait = 50,
        },
        {
          name = { "CursorMoved", "CursorMovedI", "InsertEnter" },
          set = false,
          wait = 0,
        },
      },
    }
  end,
}
