local status_ok, fterm = pcall(require, "fterm")
if not status_ok then
	vim.notify('WARNING: FTerm.nvim faild to load')
	return
end

print('lala')

function _LAZYGIT_TOGGLE()
	require('FTerm').toggle()
end


