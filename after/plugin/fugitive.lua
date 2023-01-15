vim.keymap.set('n', '<leader>gg', vim.cmd.Git)
vim.keymap.set('n', '<leader>gs', function() vim.cmd.Git('status') end)
vim.keymap.set('n', '<leader>gp', function() vim.cmd.Git('push origin main') end)
