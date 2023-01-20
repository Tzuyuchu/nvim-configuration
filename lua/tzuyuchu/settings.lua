local HOME = os.getenv("HOME")
local set = vim.opt

set.showmatch = true    -- show matching
set.ignorecase = true   -- case incsearch search
set.smartcase = true    -- noignorecase selectively
set.smartindent = true  -- testing if smartindent works
set.mouse = "v"         -- middle-click paste
set.hlsearch = false    -- highlight search
set.incsearch = true    -- incremental search
set.tabstop = 4         -- number of columns occupied by tab
set.softtabstop = 4     -- see multiple spaces as tabstops so <BS> works
set.expandtab = true    -- converts tab to whitespace
set.shiftwidth = 4      -- wifth for autoindentation
set.shiftround = true   -- when shifting lines, round the indentation
set.autoread = true     -- automatically update file if it is updated elsewhere
set.autowrite = true    -- automatically saves file on normal mode
set.number = true
set.relativenumber = true       -- add line numbers
-- get bash-like tab completions
set.wildmode = "list:longest"
set.cc = {100, 120}     -- set an 100/120 column border for good coding style
set.mouse = "a"           -- enable mouse click
-- set.clipboard+=unnamedplus using system clipboard
set.list = true         -- Display unprintable characters f12 - switches
-- Unprintable chars mapping
vim.cmd("set listchars=tab:•\\ ,trail:•,extends:»,precedes:«")
set.cursorline = true   -- highlight current cursorline
set.ttyfast = true      -- Speed up scrolling in Vim
-- set spell            -- enable spell check (may need to download language package)
set.swapfile = false    -- disable creating swap file
-- Directory to store backup files.set
set.backupdir = HOME .. "/.cache/nvim"
set.backup = false
set.writebackup = false
set.undodir = HOME .. '/.nvim/nvim/undodir'
set.undofile = true
set.belloff = 'all'     -- remove visual bell
set.titlestring = "%t"  -- Set title of tab to title of file
set.title = true
set.scrolloff = 2       -- Minimum lines above and below cursor
set.sidescrolloff = 5   -- Minimum columns left/right of cursor
set.laststatus = 2
set.wildmenu = true
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.startify_skiplist = {'^/mnt/c'}
vim.g.ale_disable_lsp = 1
set.signcolumn = 'yes'
set.updatetime = 100
