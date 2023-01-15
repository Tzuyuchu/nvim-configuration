local function map(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs)
end

vim.g.mapleader = ";"

-- Allows fast visual select + move
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
-- Keeps target word on center while searching
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
-- Special paste which retains clipboard
map("x", "<leader>p", [["_dP]])
-- Replace the word that cursor is on
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Allows using jk and kj as alternative Esc
map('i', 'jk', '<Esc>')
map('i', 'kj', '<Esc>')

map('n', 'tn', ':tabnew<Enter>')
map('n', '<c-w>t', '<c-w>ji')
-- Creates a new terminal
map('n', 'tt', '<c-w>s<c-w>5+<c-w><c-j>:term<enter>i')
-- Escapes from terminal mode
map('t', '<C-w>', '<c-\\><c-n><c-w>')
map('t', '<Esc>', '<c-\\><c-n>')

map('n', '<c-q>', ':wq<enter>')
map('n', 'gn', ':bn<CR>')

-- Runs a file
map('n', '<F8>c', ':make %< && ./%<<CR>')
map('n', '<F8>r', ':w<cr><c-w>s<c-w>5+<c-w><c-j>:term<enter>icargo run<CR>')
map('n', '<F8>p', ':w<CR>:!python3.9 %<CR>')

-- Select all
map('n', '<c-a>', 'gg^vG$')
map('n', 'gb', ':bn<CR>')
map('n', 'gB', ':bN<CR>')

map('n', '<F3>', ':AirlineToggle<CR>:set linebreak<CR>')
map('n', '<leader>st2', ':set tabstop=2<CR>:set shiftwidth=2<CR>')
map('n', '<leader>st4', ':set tabstop=4<CR>:set shiftwidth=4<CR>')
