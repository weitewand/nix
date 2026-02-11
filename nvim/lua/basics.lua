-- Display line numbers:
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.termguicolors = true
vim.cmd [[colorscheme onedark ]]

-- List of filetypes to set 2-space indentation
local config_filetypes_2 = { "nix", "yaml", "toml", "json", "sh", "bash", "dockerfile" }

-- List of filetypes to set 4-space indentation
local config_filetypes_4 = { "py"}

-- Autocmd for these filetypes
vim.api.nvim_create_autocmd("FileType", {
  pattern = config_filetypes_2,
  callback = function()
    vim.opt_local.shiftwidth = 2      -- indentation width for << or >>
    vim.opt_local.tabstop = 2         -- width of a real Tab character
    vim.opt_local.softtabstop = 2     -- how many spaces Tab inserts in insert mode
    vim.opt_local.expandtab = true    -- use spaces instead of real Tab
  end
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = config_filetypes_4,
  callback = function()
    vim.opt_local.shiftwidth = 4      -- indentation width for << or >>
    vim.opt_local.tabstop = 4         -- width of a real Tab character
    vim.opt_local.softtabstop = 4     -- how many spaces Tab inserts in insert mode
    vim.opt_local.expandtab = true    -- use spaces instead of real Tab
  end
})

