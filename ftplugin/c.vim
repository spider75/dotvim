set autoindent
set cindent

set tabstop=2
set expandtab
set shiftwidth=2
set softtabstop=2

"C Project settings
augroup project
    autocmd!
    autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
augroup END

let &path.="src/include,/usr/include/AL,"

set makeprg=make\ -C\ ../build\ -j9

nnoremap <F4> :make!<cr>

" Set Clang-format
let g:clang_format#code_style = "google"
let g:clang_format#auto_format = 1
let g:clang_format#auto_format_on_insert_leave = 1
let g:clang_format#auto_formatexpr = 1

let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -1,
            \ "AllowShortIfStatementsOnASingleLine" : "false",
            \ "AllowShortBlocksOnASingleLine": "false",
            \ "AllowShortFunctionsOnASingleLine": "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "IndentWidth": "2",
            \ "BreakBeforeBraces": "Linux",
            \ "Standard" : "C++11"}

" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
" if you install vim-operator-user
autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
" Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>

" vim-clang conf
let g:clang_c_options = '-std=gnu11'
let g:clang_cpp_options = '-std=c++11 -stdlib=libc++'
let g:clang_c_completeopt = 'longest,menuone'

" Set ColorColumn to 80 char, color DarkRed
set colorcolumn=80
hi ColorColumn cterm=NONE ctermbg=52 ctermfg=None

" If in TMUX open a shell below
nnoremap <leader>sh :VtrOpenRunner {'orientation': 'v', 'percentage': 20}<cr>


