syntax on

filetype on
filetype plugin on
filetype indent on

set sw=2
set iskeyword+=:
set shellslash
set grepprg=grep\ -nH\ $*
set paste
set nowrap
set mouse=a
set ttymouse=xterm2
set number

map <F2> :NERDTreeToggle<CR>

let b:tex_flavor = 'pdflatex'
:compiler tex
:set makeprg=pdflatex\ \-file\-line\-error\ \-interaction=nonstopmode
:set errorformat=%f:%l:\ %m

map ;c :w<CR>:make %<<CR>
map ;b :!bibtex %<<CR>
" map ;v :!xpdf -z page %<.pdf &<CR>
map ;v :!evince %<.pdf &<CR>
map ;o :!open %<.pdf &<CR>
map ;f ;c ;v
map ;i ;t ;r
map ;x :!latex %<.tex &<CR>
map ;dv :!xdvi %<.dvi &<CR>
map ;p :cprev<CR>
map ;n :cnext<CR>
map ;l :clist<CR>
map ;s :w<CR>:!ispell -x -t %<CR>:e<CR>

au BufNewFile,BufRead *.tex map! \be \begin{equation}
au BufNewFile,BufRead *.tex map! \ee \end{equation}

map \gq ?^$\\|^\s*\(\\begin\\|\\end\\|\\label\)?1<CR>gq//-1<CR>
omap lp ?^$\\|^\s*\(\\begin\\|\\end\\|\\label\)?1<CR>//-1<CR>.<CR>

map ;q gqlp

autocmd BufWritePre * :%s/\s\+$//e

au BufNewFile,BufRead *.cu set ft=cuda

let g:centerinscreen_active = 0

function! ToggleCenterInScreen(desired_width)
    if g:centerinscreen_active == 0
        let l:window_width = winwidth(winnr())
        let l:sidepanel_width = (l:window_width - a:desired_width) / 2

        exec("silent leftabove " . l:sidepanel_width . "vsplit new")
        wincmd l
        exec("silent rightbelow " . l:sidepanel_width . "vsplit new")
        wincmd h
        let g:centerinscreen_active = 1
    else
        wincmd h
        close
        wincmd l
        close

        let g:centerinscreen_active = 0
    endif
endfunction

nnoremap <Leader>r :exec ToggleCenterInScreen(100)<CR>

autocmd BufWritePre * :%s/\s\+$//e

colorscheme blacklight
