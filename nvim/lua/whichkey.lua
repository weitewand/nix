local status_ok, whichkey = pcall(require, "which-key")
if not status_ok then
	print('which-key.nvim did not load')
	return
end
-- As an example, we will create the following mappings:
--  * <leader>ff find files
--  * <leader>fr show recent files
--  * <leader>fb Foobar
-- we'll document:
--  * <leader>fn new file
--  * <leader>fe edit file
-- and hide <leader>1

-- set the time [in ms] nvim is waiting for a sequential combination of keys ((which-key.nvim only triggers the popup with possible keys afterwards):
vim.opt.timeoutlen = 100

-- Set the <leader>-key to space:
vim.g.mapleader = ' '

-- Create the following mappings:
-- 	* <leader>gg -> start Lazygit
whichkey.register({
	g = {
		name = "Git", -- optional group name
		g = { "<cmd>lua _lazygitTerminal()<cr>", "Lazygit" }, -- create a binding with label
		f = { "<cmd>lua print('Hello')<cr>", "Guten Tag" }, 
		r = { "<cmd>lua _test()<cr>", "Guten Tag" }, 
    		-- r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File", noremap=false, buffer = 123 }, -- additional options for creating the keymap
    		-- n = { "New File" }, -- just a label. don't create any mapping
    		-- e = "Edit File", -- same as above
    		-- ["1"] = "which_key_ignore",  -- special label to hide it in the popup
    		-- b = { function() print("bar") end, "Foobar" } -- you can also pass functions!
  },
}, { prefix = "<leader>" })

