" if has('python3')
" endif
" ==========================================================
" $MYVIMRC
" ==========================================================
set nocompatible		" be iMproved, required
filetype off			" required
set hidden
set encoding=utf8

" ==========================================================
" Plugin management
" ==========================================================
" set the runtime path to include Vundle and intialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" select plugins
Plugin 'chriskempson/base16-vim'
Plugin 'maralla/completor.vim'
Plugin 'w0rp/ale'
Plugin 'lervag/vimtex'
Plugin 'majutsushi/tagbar'
Plugin 'junegunn/goyo.vim'
Plugin 'jpalardy/vim-slime'

call vundle#end()			" required
filetype plugin indent on	" required

" ==========================================================
" Vim configuration
" ==========================================================
set statusline=%F%m%r%<\ %=%l,%v\ [%L]\ %p%%
set laststatus=2
set showcmd
set number
set lazyredraw
set tabstop=4
set softtabstop=4
set shiftwidth=4
set clipboard=unnamedplus
set t_ut= 

" ==========================================================
" Shortcuts
" ==========================================================
" better indent
vnoremap < <gv
vnoremap > >gv

" new vim tab
nnoremap <C-t> :tabnew<cr>

" new line in normal mode
nnoremap <leader>o o<esc>
nnoremap <leader>O O<esc>

" spell check in insert mode
imap <F5> <C-o>:setlocal spell! spelllang=en_us<CR>

" Move between buffers
nmap <leader>l :bnext<CR>
nmap <leader>h :bprevious<CR>
nmap <leader>bq :bp <BAR> bd #<CR>
nmap <leader>bl :ls<CR>
nmap <leader>T :enew<cr>
nnoremap gb :ls<CR>:b<Space>

" Tagbar
nmap <F8> :TagbarToggle<CR>

" add things around highlighted text
vnoremap <leader>' <Esc>`>a'<Esc>`<i'<Esc>f'
vnoremap <leader>" <Esc>`>a"<Esc>`<i"<Esc>f"
vnoremap <leader>( <Esc>`>a)<Esc>`<i(<Esc>f)
vnoremap <leader>[ <Esc>`>a]<Esc>`<i[<Esc>f]
vnoremap <leader>{ <Esc>`>a}<Esc>`<i{<Esc>f}

" ==========================================================
" Appearance
" ==========================================================
" Access colors present in 256 colorspace
if filereadable(expand("~/.vimrc_background"))
	let base16colorspace=256
	source ~/.vimrc_background
endif

hi Normal ctermbg=none
hi NonText ctermbg=none
hi clear LineNr
hi clear SignColumn
hi LineNr ctermfg=grey
hi statusline ctermbg=none cterm=none
hi Comment cterm=italic
hi Function cterm=bold

" ==========================================================
" Linter
" ==========================================================
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] [%severity%] %s'

" ==========================================================
" Python 
" ==========================================================
let g:completor_python_binary = '/usr/bin/python3'
autocmd FileType python nnoremap <buffer> <leader>b Iimport ipdb; ipdb.set_trace()<CR><Esc>
autocmd FileType python nnoremap <buffer> <leader>c I# <Esc>
autocmd FileType python vnoremap <buffer> <leader>c <C-v>I# <Esc>
autocmd FileType python nnoremap <buffer> <f8> :exec '!python3' shellescape(@%, 1)<cr>
autocmd FileType python vnoremap <buffer> <f5> :w !python3<cr>
autocmd FileType python set cc=80

let g:slime_target = "tmux"
let g:slime_paste_file = "$HOME/tmp/.slime_paste"
let g:slime_python_ipython = 1

" ==========================================================
" LaTeX 
" ==========================================================
" Some useful shortcuts
" \ll Start compiling the document
" \lv Open pdf viewer and/or do forward searching
" \ll Stop running the compilation
" \le Parse the log file for errors and warnings
" \lc Clean auxilliary files
" \lC Remove pdfs

" use zathura to view pdfs
let g:vimtex_view_method = 'zathura'

" vim in CLI does not start with a server by default so put this to avoid
" warnings
let g:vimtex_compiler_latexmk = {'callback' : 0}

" code folding
let g:vimtex_fold_enabled=1
let g:vimtex_fold_manual=1


