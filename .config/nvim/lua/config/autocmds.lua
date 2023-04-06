-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds hereby

-- Run gofmt + goimport on save
local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    require("go.format").goimport()
  end,
  group = format_sync_grp,
})

-- Work around for https://github.com/nvim-treesitter/nvim-treesitter/issues/3363
-- remove '.' from the indentkeys
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "ruby" },
  callback = function()
    vim.opt.indentkeys =
      -- "0{,0},0),0],!^F,o,O,e,:,=end,=else,=elsif,=when,=in ,=ensure,=rescue,==begin,==end,=private,=protected,=public"
      "0},0),0],!^F,o,O,e,:,=end,=else,=elsif,=when,=in ,=ensure,=rescue,==begin,==end,=private,=protected,=public"
  end,
})
