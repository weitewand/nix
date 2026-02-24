
-- lua/neo-tree.lua

-- disable netrw (important: must happen before neo-tree loads)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

return {
  close_if_last_window = true,
  popup_border_style = "rounded",
  enable_git_status = true,
  enable_diagnostics = true,

  filesystem = {
    follow_current_file = {
      enabled = true,
    },
    hijack_netrw_behavior = "open_default",
    use_libuv_file_watcher = true,
  },

  buffers = {
    follow_current_file = {
      enabled = true,
    },
  },

  git_status = {
    window = {
      position = "float",
    },
  },
}
