" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2019 Jan 26
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings, bail
" out.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
"  set backup		" keep a backup file (restore to previous version)
"  if has('persistent_undo')
"    set undofile	" keep an undo file (undo changes after closing)
"  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

set nowrap
set nu
set ts=4

set guifont=D2Coding_ligature:h10:cHANGEUL:qDRAFT
color torte
"
"" Fix backspace indent
set backspace=indent,eol,start

"
"*****************************************************************************
"" Convenience variables
"*****************************************************************************
" vim-airline
"let g:airline_theme = 'powerlineish'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1

" vim-airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep          = '¢º'
  let g:airline_left_alt_sep      = '¡í'
  let g:airline_right_sep         = '¢¸'
  let g:airline_right_alt_sep     = '¡ì'
  let g:airline#extensions#branch#prefix     = '?' "?, ?, ?
  let g:airline#extensions#readonly#symbol   = '?'
  let g:airline#extensions#linecolumn#prefix = '¢Ò'
  let g:airline#extensions#paste#symbol      = '¥ñ'
  let g:airline_symbols.linenr    = '?'
  let g:airline_symbols.branch    = '?'
  let g:airline_symbols.paste     = '¥ñ'
  let g:airline_symbols.paste     = '¨­'
  let g:airline_symbols.paste     = '¡«'
  let g:airline_symbols.whitespace = '¥Î'
else
  let g:airline#extensions#tabline#left_sep = 'þó'
  let g:airline#extensions#tabline#left_alt_sep = 'þô'

  " powerline symbols
  let g:airline_left_sep = 'þó'
  let g:airline_left_alt_sep = 'þô'
  let g:airline_right_sep = 'þõ'
  let g:airline_right_alt_sep = 'þö'
  let g:airline_symbols.branch = 'þã'
  let g:airline_symbols.readonly = 'þå'
  let g:airline_symbols.linenr = 'þä'
endif

