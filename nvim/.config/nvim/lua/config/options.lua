-- UI
vim.g.netrw_banner = 0
vim.opt.termguicolors = true
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
-- Draw signs and hybrid line numbers ourselves. Gitsigns (and nvim 0.12
-- statuscolumn) can otherwise leave the number column blank.
vim.opt.statuscolumn = "%s%=%{v:relnum?v:relnum:v:lnum} "
vim.opt.scrolloff = 8
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.wrap = true
vim.opt.cmdheight = 0
-- vim.opt.colorcolumn = "80"

-- folding
vim.o.foldenable = true
vim.o.foldmethod = "manual"
vim.o.foldlevel = 99
vim.o.foldcolumn = "0"

-- indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = false

-- backup and undo
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.stdpath("data") .. "/undodir"
vim.opt.undofile = true

-- search
vim.opt.incsearch = true
vim.opt.inccommand = "split"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true

-- misc
vim.opt.isfname:append("@-@")
vim.opt.guicursor = ""
vim.opt.clipboard:append("unnamedplus")
vim.opt.mouse = "a"
