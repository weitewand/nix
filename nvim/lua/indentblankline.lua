local status_ok, ibl = pcall(require, "ibl")
if not status_ok then
	vim.notify('WARNING: indent-blankline.nvim faild to load')
	return
end

-- Define the highlight groups:
-- vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

ibl.setup {
  indent = {
    char = "|", -- indent charakter
    highlight = {
      "IndentBlanklineIndent1",
      "IndentBlanklineIndent2",
      "IndentBlanklineIndent3",
      
      "IndentBlanklineIndent4",
      "IndentBlanklineIndent5",
      "IndentBlanklineIndent6",
    },
    tab_char = "|", -- optional, for tabs
  },
  scope = {
    enabled = true,      -- enable scope highlighting
    highlight = "IblScope", -- highlight group to use
    show_start = true,   -- whether to underline start of scope
    show_end = true,     -- underline end of scope
  },
  whitespace = {
    highlight = "IblWhitespace",
    remove_blankline_trail = true;

  },
}
