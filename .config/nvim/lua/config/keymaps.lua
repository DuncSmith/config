-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

local nvim_tmux_nav = require("nvim-tmux-navigation")
map("n", "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft, { desc = "Go to left window" })
map("n", "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown, { desc = "Go to lower window" })
map("n", "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp, { desc = "Go to upper window" })
map("n", "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight, { desc = "Go to right window" })
