return {
  "Shougo/ddc.vim",
  enabled = true,
  lazy = false,
  dependencies = {
    "vim-denops/denops.vim",

    -- matcher, sorter, converter
    "tani/ddc-fuzzy",
    "Shougo/ddc-filter-matcher_head",
    "Shougo/ddc-filter-matcher_length",
    "Shougo/ddc-filter-matcher_vimregexp",
    "Shougo/ddc-filter-sorter_rank",
    "Shougo/ddc-filter-converter_remove_overlap",
    "Shougo/ddc-filter-converter_truncate_abbr",

    -- ui
    {
      "Shougo/pum.vim",
      config = function()
        -- vim.fn["pum#set_option"]("border", "single")
        -- vim.fn["pum#set_option"]("horizontal_menu", false)
        vim.fn["pum#set_option"]("max_height", 30)
        vim.fn["pum#set_option"]("max_width", 100)
        vim.fn["pum#set_option"]("min_width", 3)
        vim.fn["pum#set_option"]("padding", false)
        vim.fn["pum#set_option"]("scrollbar_char", "")
        vim.fn["pum#set_option"]("use_complete", false)
        vim.fn["pum#set_option"]("use_setline", false)
      end,
    },
    "Shougo/ddc-ui-inline",
    "Shougo/ddc-ui-native",
    "Shougo/ddc-ui-none",
    "Shougo/ddc-ui-pum",

    -- snippet
    "hrsh7th/vim-vsnip",

    -- sources
    "LumaKernel/ddc-file",
    "LumaKernel/ddc-run",
    "Shougo/ddc-source-around",
    "matsui54/ddc-buffer",
    "Shougo/ddc-source-omni",
    "Shougo/ddc-source-cmdline",
    "Shougo/ddc-source-input",
    "Shougo/ddc-source-cmdline-history",
    "Shougo/ddc-source-line",
    "Shougo/ddc-source-nvim-lua",
    {
      "Milly/windows-clipboard-history.vim",
      enabled = vim.fn.has "win32" > 0,
    },
    {
      "Shougo/ddc-source-mocword",
      build = "cargo install mocword",
    },
    {
      "Shougo/ddc-source-rg",
      enabled = vim.fn.executable "rg" > 0,
    },
    {
      "Shougo/ddc-source-nvim-lsp",
      dependencies = {
        "neovim/nvim-lspconfig",
      },
    },
    {
      "delphinus/ddc-treesitter",
      dependencies = {
        "nvim-treesitter/nvim-treesitter",
      },
    },
    {
      "hokorobi/ddc-source-plantuml",
      init = function() vim.g.ddc_source_plantuml_cmd = vim.fn.expand "~/.local/bin/plantuml.jar" end,
    },
    -- popup, signature
    {
      "matsui54/denops-popup-preview.vim",
      init = function()
        vim.g.popup_preview_config = {
          delay = 50,
          border = true,
          supportVsnip = true,
        }
      end,
      config = function() vim.fn["popup_preview#enable"]() end,
    },
    {
      "matsui54/denops-signature_help",
      enabled = false,
      config = function() vim.fn["signature_help#enable"]() end,
    },
  },
  cmdline_pre = function(mode)
    vim.b.prev_buffer_config = vim.fn["ddc#custom#get_buffer"]()
    if mode == ":" then vim.fn["ddc#custom#patch_buffer"]("keywordPattern", "[0-9a-zA-Z_:#-]*") end
    vim.api.nvim_create_autocmd("User DDCCmdlineLeave", {
      group = vim.api.nvim_create_augroup("MyDdcAutocmd:cmdline_pre", { clear = true }),
      once = true,
      callback = require("user.plugins.ddc").cmdline_post,
    })
  end,
  cmdline_post = function()
    if vim.b.prev_buffer_config ~= nil then
      vim.fn["ddc#custom#set_buffer"](vim.b.prev_buffer_config)
    else
      vim.fn["ddc#custom#set_buffer"]()
    end
  end,
  patch_global = {
    ui = "pum",
    autoCompleteEvents = {
      "InsertEnter",
      "TextChangedI",
      "TextChangedP",
      "CmdlineEnter",
      "CmdlineChanged",
      "TextChangedT",
    },
    sources = {
      "nvim-lsp",
      "around",
      "vsnip",
      "file",
      "rg",
      "mocword",
    },
    cmdlineSources = {
      [":"] = { "cmdline", "cmdline-history", "around" },
      ["@"] = { "cmdline-history", "input", "file", "around" },
      [">"] = { "cmdline-history", "input", "file", "around" },
      ["/"] = { "around", "line" },
      ["?"] = { "around", "line" },
      ["-"] = { "around", "line" },
      ["="] = { "input" },
    },
    sourceOptions = {
      ["_"] = {
        ignoreCase = true,
        matchers = { "matcher_head", "matcher_length" },
        sorters = { "sorter_rank" },
        converters = { "converter_remove_overlap", "converter_truncate_abbr" },
      },
      around = {
        mark = "around",
      },
      buffer = { mark = "buffer" },
      plantuml = { mark = "uml" },
      cmdline = {
        mark = "cmdline",
        forceCompletionPattern = "S/S*|.w*",
        dup = "force",
      },
      input = {
        mark = "input",
        forceCompletionPattern = "S/S*",
        isVolatile = true,
        dup = "force",
      },
      line = {
        mark = "line",
        matchers = { "matcher_vimregexp" },
      },
      mocword = {
        mark = "word",
        minAutoCompleteLength = 3,
        isVolatile = true,
      },
      ["nvim-lsp"] = {
        mark = "lsp",
        forceCompletionPattern = ".w*|=w*|->w*",
        dup = "force",
      },
      file = {
        mark = "file",
        isVolatile = true,
        minAutoCompleteLength = 3,
        forceCompletionPattern = "S/S*",
      },
      ["cmdline-history"] = { mark = "cmdhist", sorters = {} },
      rg = {
        mark = "rg",
        minAutoCompleteLength = 3,
        enabledIf = "finddir('.git', ';') != ''",
      },
      ["windows-clipboard-history"] = {
        mark = "clip",
      },
    },
    sourceParams = {
      buffer = {
        requireSameFiletype = false,
        limitBytes = 50000,
        fromAltBuf = true,
        forceCollect = true,
      },
      file = {
        filenameChars = "[:keyword:].",
      },
    },
  },
  patch_filetype = {
    plantuml = {
      sources = { "plantuml", "nvim-lsp", "around", "vsnip", "file", "rg", "mocword" },
    },
    ["ddu-ff-filter"] = {
      keywordPattern = "[0-9a-zA-Z_:#-]*",
      sources = { "line", "buffer" },
      specialBufferCompletion = true,
    },
    FineCmdlinePrompt = {
      keywordPattern = "[0-9a-zA-Z_:#-]*",
      sources = { "cmdline-history", "around" },
      specialBufferCompletion = true,
    },
  },
  polish = function()
    -- normal mode completion.
    vim.keymap.set({ "n", "x" }, ":", "<cmd>lua require('user.plugins.ddc').cmdline_pre(':')<cr>:")
    vim.keymap.set("n", "/", "<cmd>lua require('user.plugins.ddc').cmdline_pre('/')<cr>/")
    vim.keymap.set("n", "?", "<cmd>lua require('user.plugins.ddc').cmdline_pre('?')<cr>?")
    -- insert mode completion.
    vim.keymap.set("i", "<c-n>", function() vim.fn["pum#map#insert_relative"](1) end)
    vim.keymap.set("i", "<c-p>", function() vim.fn["pum#map#insert_relative"](-1) end)
    vim.keymap.set("i", "<c-k>", function() vim.fn["pum#map#extend"](vim.fn["pum#map#confirm"]) end, { expr = true })
    vim.keymap.set("i", "<c-space>", function() vim.fn["ddc#map#manual_complete"]() end)
    -- command line mode completion.
    vim.keymap.set("c", "<tab>", function()
      if vim.fn.wildmenumode() then
        vim.fn.nr2char(vim.o.wildcharm)
      else
        if vim.fn["pum#visible"]() then
          vim.fn["pum#map#insert_relative"](1)
        else
          vim.fn["ddc#map#manual_complete"]()
        end
      end
    end)
    vim.keymap.set("c", "<s-tab>", function() vim.fn["pum#map#insert_relative"](-1) end)
  end,
  config = function()
    local patch_global = require("user.plugins.ddc").patch_global
    if vim.fn.has "win32" > 0 then
      table.insert(patch_global.sources, "windows-clipboard-history")
      patch_global.sourceParams["windows-clipboard-history"] = { maxAbbrWidth = 100 }
    end
    vim.fn["ddc#custom#patch_global"](patch_global)
    for k, v in pairs(require("user.plugins.ddc").patch_filetype) do
      vim.fn["ddc#custom#patch_filetype"](k, v)
    end
    vim.fn["ddc#enable"]()
  end,
}
