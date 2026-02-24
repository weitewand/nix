if exists('g:vscode')
	" VSCode extension
else
	vim.notify("initOld.vim is still sourced at startup")
	" ordinary Neovim
	source ~/.vimrc

	" Change the tab-completion of commands to a bash-like behaviour
	" (first tab comletes as much as possible, second shows a list and
	" third and more cycle through the list):
	set wildmode=longest,list,full
	" Setting up the colour scheme:
	set termguicolors
	colorscheme onedark

	" ===============================================================
	" indent-blankline plugin
	" setting the colours for the different indent-rainbow-lines:
	highlight IndentBlanklineIndent1 guifg=#E06C75 blend=nocombine
	highlight IndentBlanklineIndent2 guifg=#E5C07B blend=nocombine
	highlight IndentBlanklineIndent3 guifg=#98C379 blend=nocombine
	highlight IndentBlanklineIndent4 guifg=#56B6C2  blend=nocombine
	highlight IndentBlanklineIndent5 guifg=#61AFEF  blend=nocombine
	highlight IndentBlanklineIndent6 guifg=#C678DD  blend=nocombine

	let g:indent_blankline_char_highlight_list = [ "IndentBlanklineIndent1", "IndentBlanklineIndent2", "IndentBlanklineIndent3", "IndentBlanklineIndent4", "IndentBlanklineIndent5", "IndentBlanklineIndent6"]
	let g:indent_blankline_space_char_blankline = " "
	" ToDo: Remove indent-lines at empty-lines in the last identation
	" level
	" ===============================================================
	" which-key.nvim plugin
	" set the time [in ms] nvim is waiting for a sequential combination of keys
	" (which-key.nvim only triggers the popup with possible keys
	" afterwards):
	let &timeoutlen = 100
	" set <leader> to space so all extra mappings can be started with
	" space:
	let mapleader = " "
	lua require('startWithLua')
	" ===============================================================
endif
