return {
    'vim-airline/vim-airline',
    dependencies = {
        'vim-airline/vim-airline-themes',
    },
    config = function()
        vim.cmd('let g:netrw_liststyle = 3')
        vim.cmd("let g:airline_theme='blood_red'")
        vim.cmd("let g:airline_left_sep = ''")
        vim.cmd("let g:airline#extensions#lsp#enabled = 1")
    end,
}
