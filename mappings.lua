-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    --
    -- Open current buffer dir.
    ["<leader>O"] = {
      function()
        local bufname = vim.fn.bufname()
        local bufdir = vim.fn.fnamemodify(bufname, ":p:h")
        if jit.os:find "Windows" then
          local bufdir_backslash = string.gsub(bufdir, "/", "\\")
          vim.cmd("!explorer " .. bufdir_backslash)
        else
          vim.cmd("!open " .. bufdir)
        end
      end,
      desc = "Open buffer dir",
    },
    ["ued"] = {
      function() vim.cmd [[e! ++ff=dos]] end,
      desc = "ff to dos",
    },
    ["ueu"] = {
      function() vim.cmd [[e! ++ff=unix]] end,
      desc = "ff to unix",
    },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
  i = {
    ["<c-l>"] = { "<C-g>U<Right>", desc = "Right move" },
  },
  c = {
    ["<c-p>"] = { "<up>", desc = "History up" },
    ["<c-n>"] = { "<down>", desc = "History down" },
  },
}
