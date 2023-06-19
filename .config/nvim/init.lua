local g = vim.g
local o = vim.o


-- PLUGINS --

require('packer').startup(function(use)
    -- Plugin manager
	use 'wbthomason/packer.nvim'
    -- The best plugin for navigation. It's the reason I use vim
	use 'easymotion/vim-easymotion'
    -- Clipboard
	use 'EtiamNullam/deferred-clipboard.nvim'
    -- Scrolling
	use 'yuttie/comfortable-motion.vim'
    -- 'gcc' for commenting
	use 'tpope/vim-commentary'
    -- Statusline
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	}
end)
require('deferred-clipboard').setup { fallback = 'unnamedplus' }
require('lualine').setup{options = { theme = 'nightfly' }}


-- KEYBINDS --

local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

-- Leader key
g.mapleader = ' '
g.maplocalleader = ' '

-- From input mode to normal mode
map('i', 'kj', '<ESC>')

-- Go to the beggining or the end of a line
map('', 'H', '^')
map('', 'L', '$')

-- Better jk
map('', 'j', 'gj')
map('', 'k', 'gk')

-- Write and quit
map('n', '<leader>w', '<CMD>x<CR>')
map('i', '<leader>w', '<CMD>x<CR>')
map('v', '<leader>w', '<CMD>x<CR>')
map('c', '<leader>w', '<CMD>x<CR>')

-- Quit
map('n', '<leader>q', '<CMD>q!<CR>')
map('i', '<leader>q', '<CMD>q!<<CR>')
map('v', '<leader>q', '<CMD>q!<<CR>')
map('c', '<leader>q', '<CMD>q!<<CR>')

-- Write
map('n', '<leader>s', '<CMD>w<CR>')
map('i', '<leader>s', '<CMD>w<CR>')
map('v', '<leader>s', '<CMD>w<CR>')
map('c', '<leader>s', '<CMD>w<CR>')

-- Switch to normal mode
map('n', '<leader>n', '<ESC>')
map('i', '<leader>n', '<ESC>')
map('v', '<leader>n', '<ESC>')
map('c', '<leader>n', '<ESC>')

-- Go to a character or a line with EasyMotion
map('n', 'f', '<Plug>(easymotion-overwin-f)')
map('n', '<leader>l', '<Plug>(easymotion-overwin-line)')


-- MISC --

o.timeoutlen = 300
o.scrolloff = 8

-- Line numbers
vim.opt.number = true

-- As you might've already guessed, I hate configuring vim
vim.cmd([[
	noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(3)<CR>
	noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(-3)<CR>
	let g:EasyMotion_smartcase = 1
	set tabstop=4 shiftwidth=4 expandtab
    set hidden
    set nobackup
]])

-- Text wrapping
o.wrap = true

-- Search
o.ignorecase = true
o.smartcase = true
vim.opt.hlsearch = false

