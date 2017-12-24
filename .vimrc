" ============================================================================
" $MYVIMRC
" ============================================================================
set nocompatible		" be iMproved, required
filetype off			" required
set hidden
set encoding=utf8
" ============================================================================
" Plugin management
" ============================================================================
" set the runtime path to include Vundle and intialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" select plugins
Plugin 'chriskempson/base16-vim'
Plugin 'maralla/completor.vim'
"Plugin 'davidhalter/jedi-vim'
Plugin 'w0rp/ale'
Plugin 'lervag/vimtex'
Plugin 'majutsushi/tagbar'
Plugin 'junegunn/goyo.vim'

call vundle#end()			" required
filetype plugin indent on	" required

" ============================================================================
" Basic configuration
" ============================================================================
set statusline=%F%m%r%<\ %=%l,%v\ [%L]\ %p%%

" Change the statusline highlighting so it stands out
hi statusline ctermbg=white ctermfg=black

" Make sure statusline always shows
set laststatus=2

" see command keys
set showcmd

" Relative line numbering
set number
set relativenumber

" Lazy redraw
set lazyredraw

" disable auto paren matching
"let g:loaded_matchparen = 1

" Tabulation
set tabstop=4
set softtabstop=4
set shiftwidth=4

" better indent
vnoremap < <gv
vnoremap > >gv

" new vim tab
nnoremap <C-t> :tabnew<cr>

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

" ============================================================================
" Appearance
" ============================================================================
" Access colors present in 256 colorspace
if filereadable(expand("~/.vimrc_background"))
	let base16colorspace=256
	source ~/.vimrc_background
endif

" disables opaque background
hi Normal ctermbg=none
hi NonText ctermbg=none

" make comments bold
hi Comment cterm=bold

" make variable names bold
hi Function cterm=bold

" ============================================================================
" Code linting (using ale)
" ============================================================================
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%severity%] %s'

" ============================================================================
" Python configuration 
" ============================================================================
let g:completor_python_binary = '/usr/bin/python3'
"let g:completor_python_binary = '/home/user/anaconda3/bin/python'
autocmd FileType python nnoremap <leader>b Iimport ipdb; ipdb.set_trace()<CR><Esc>
autocmd FileType python nnoremap <leader>c I# <Esc>
autocmd FIleType python vnoremap <leader>c <C-v>I# <Esc>

" ============================================================================
" LaTeX configuration
" ============================================================================
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
let g:vimtex_fold_enabled = 1
let g:vimtex_fold_manual = 1
