vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

require('nvim-tree').setup()

require('nvim-tree').setup({
  sort_by = 'case_sensitive',
  view = {
    adaptive_size = false,
    mappings = {
      list = {
        { key = 'u', action = 'dir_up' },
      },
    },
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
