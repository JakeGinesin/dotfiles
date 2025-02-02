-- buh https://gist.github.com/mrpmohiburrahman/b7ec0d47cd043d3a2ed4c10a20504d4e

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  vim.keymap.set("n", "+", api.tree.change_root_to_node, opts "CD")
  vim.keymap.set("n", "?", api.tree.toggle_help, opts "Help")
  vim.keymap.set("n", "<ESC>", api.tree.close, opts "Close")

  -- custom mappings
  -- vim.keymap.set('n', '<C-o>', api.tree.open(),        opts('Up'))
  -- vim.keymap.set('n', '<C-o>', api.tree.close(),        opts('Up'))
  -- vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
end

vim.keymap.set("n", "<C-o>", "<cmd>NvimTreeToggle<CR>", {
  desc = "Toggle NvimTree"
})

require('nvim-tree').setup()

require('nvim-tree').setup({
  on_attach = my_on_attach,
  sort_by = 'case_sensitive',
  view = {
    adaptive_size = false,
    -- mappings = {
      -- list = {
        -- { key = 'u', action = 'dir_up' },
      -- },
    -- },
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
    exclude = {".git", ".jpg", ".mp4", ".ogg", ".iso", ".pdf", ".odt", ".png", ".gif", ".db", ".class"},
  },
  actions = {
    open_file = {
        resize_window = false
    }
  },
})

-- require('nvim-tree').setup()

-- require('nvim-tree').setup({
  -- sort_by = 'case_sensitive',
  -- view = {
    -- adaptive_size = false,
    -- mappings = {
      -- list = {
        -- { key = 'u', action = 'dir_up' },
      -- },
    -- },
    -- width = 30,
  -- },
  -- renderer = {
    -- group_empty = true,
  -- },
  -- filters = {
    -- dotfiles = true,
    -- exclude = {".git", ".jpg", ".mp4", ".ogg", ".iso", ".pdf", ".odt", ".png", ".gif", ".db", ".class"},
  -- },
  -- actions = {
    -- open_file = {
        -- resize_window = false
    -- }
  -- },
-- })
