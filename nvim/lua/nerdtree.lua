local status_ok, nerdtree = pcall(require, "NERDTree")
if not status_ok then
	print('nerdtree.nvim did not load')
	return
end
