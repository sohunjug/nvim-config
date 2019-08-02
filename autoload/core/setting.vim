set nobackup
set noswapfile
set autoread
set autowrite
set confirm
set splitbelow
set bsdir=buffer
set mouse=a
set mousemodel=popup
if has('vim_starting')
  set encoding=UTF-8
  scriptencoding UTF-8
endif
set cursorline
set cursorcolumn
set laststatus=2
set showtabline=2
set statusline=-        " hide file name in statusline
set fillchars+=vert:\|  " add a bar for vertical splits
if has('nvim')
  set fcs=eob:\           " hide ~
endif
if has('python3')
  " set pyxversion=3
  let g:python_version = 3
else
  " set pyxversion=2
  let g:python_version = 2
endif
if has('mac')
  let g:clipboard = {
        \   'name': 'macOS-clipboard',
        \   'copy': {
        \      '+': 'pbcopy',
        \      '*': 'pbcopy',
        \    },
        \   'paste': {
        \      '+': 'pbpaste',
        \      '*': 'pbpaste',
        \   },
        \   'cache_enabled': 0,
        \ }
endif

" if has('clipboard')
"  set clipboard& clipboard+=unnamedplus
" endif
set history=200
set number
set timeout ttimeout
set cmdheight=2         " Height of the command line
set timeoutlen=500
set ttimeoutlen=10
set updatetime=100
set undofile
set undodir=/tmp/undo
set relativenumber
set backspace=indent,eol,start
" Tabs and Indents {{{
" ----------------
set ttyfast
set lazyredraw
set synmaxcol=128
syntax sync minlines=128
set re=1
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smarttab
set autoindent
set smartindent
set cindent
set shiftround
" }}}
set hidden
set shortmess=aFc
set signcolumn=yes
set completefunc=emoji#complete
set completeopt=longest,menu
set completeopt-=preview
set list
set listchars=tab:»·,nbsp:+,trail:·,extends:→,precedes:←

set sessionoptions-=buffers
set sessionoptions-=options
set sessionoptions-=blank
set sessionoptions-=tabpages
set sessionoptions-=help
set ignorecase      " Search ignoring case
set smartcase       " Keep case when searching with *
set infercase       " Adjust case in insert completion mode
set incsearch       " Incremental search
set hlsearch        " Highlight search results
set wrapscan        " Searches wrap around the end of the file
set showmatch       " Jump to matching bracket
set matchpairs+=<:> " Add HTML brackets to pair matching
set matchtime=1     " Tenths of a second to show the matching paren
set cpoptions-=m    " showmatch will wait 0.5s or until a char is typed
set grepprg=rg\ --vimgrep\ $*
set wildmenu
set wildmode=list:full
set wildignore+=*.so,*~,*/.git/*,*/.svn/*,*/.DS_Store,*/tmp/*
"set fileencoding=utf-8
"set fileencodings=utf-8,gbk,gb18030,gk2312,chinese,latin-1

if has('conceal')
  set conceallevel=3 concealcursor=niv
endif

execute 'autocmd AutoCmd BufWritePost '.$VIMPATH.'/core/*,vimrc nested' . ' source $MYVIMRC | redraw | silent doautocmd ColorScheme'

augroup AutoCmd
  autocmd Syntax * if 5000 < line('$') | syntax sync minlines=128 | endif
  "autocmd WinEnter,InsertLeave * set cursorline
  "autocmd WinLeave,InsertEnter * set nocursorline
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | endif
  autocmd BufWritePre *.js,*.jsx,*.less,*.css,*.html Neoformat
  " HTML (.gohtml and .tpl for server side)
  autocmd BufNewFile,BufRead *.html,*.htm,*.gohtml,*.tpl  setf html
  autocmd InsertLeave,TextChanged,FocusLost *.go silent! wall
  autocmd FileType css setlocal equalprg=csstidy\ -\ --silent=true
  autocmd FileType json syntax match Comment +\/\/.\+$+
  " Go (Google)
  autocmd FileType go let b:coc_pairs_disabled = ['<']
  " https://webpack.github.io/docs/webpack-dev-server.html#working-with-editors-ides-supporting-safe-write
  autocmd FileType css,javascript,jsx,javascript.jsx setlocal backupcopy=yes | setlocal equalprg=jslint
augroup END

" FastFold
" Credits: https://github.com/Shougo/shougo-s-github
autocmd AutoCmd TextChangedI,TextChanged *
      \ if &l:foldenable && &l:foldmethod !=# 'manual' |
      \   let b:foldmethod_save = &l:foldmethod |
      \   let &l:foldmethod = 'manual' |
      \ else |
      \   echom 'Changed' |
      \ endif

autocmd AutoCmd BufWritePost *
      \ if &l:foldmethod ==# 'manual' && exists('b:foldmethod_save') |
      \   let &l:foldmethod = b:foldmethod_save |
      \   execute 'normal! zx' |
      \ else |
      \   echom 'Writed' |
      \ endif

if has('folding')
  set foldenable
  set foldmethod=syntax
  set foldlevelstart=99
  set foldtext=FoldText()
endif

" Improved Vim fold-text
" See: http://www.gregsexton.org/2011/03/improving-the-text-displayed-in-a-fold/
function! FoldText()
  " Get first non-blank line
  let fs = v:foldstart
  while getline(fs) =~? '^\s*$' | let fs = nextnonblank(fs + 1)
  endwhile
  if fs > v:foldend
    let line = getline(v:foldstart)
  else
    let line = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')
  endif

  let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
  let foldSize = 1 + v:foldend - v:foldstart
  let foldSizeStr = ' ' . foldSize . ' lines '
  let foldLevelStr = repeat('+--', v:foldlevel)
  let lineCount = line('$')
  let foldPercentage = printf('[%.1f', (foldSize*1.0)/lineCount*100) . '%] '
  let expansionString = repeat('.', w - strwidth(foldSizeStr.line.foldLevelStr.foldPercentage))
  return line . expansionString . foldSizeStr . foldPercentage . foldLevelStr
endfunction

" Theme

" Enable 256 color terminal
set t_Co=256

" Enable true color
if has('termguicolors')
  set termguicolors
endif

set background=dark

" Colorscheme settings
" ---------------------------------------------------------
let g:gruvbox_filetype_hi_groups = 1
let g:gruvbox_plugin_hi_groups = 1
let g:gruvbox_transp_bg = 1
let g:gruvbox_italicize_strings = 0

let g:space_vim_transp_bg = 1
let g:vim_json_syntax_conceal = 0
" colorscheme space_vim_theme

" Vim Colors
" ---------------------------------------------------------
hi Whitespace ctermfg=96 guifg=#725972 guibg=NONE ctermbg=NONE
hi VertSplit  ctermfg=Black  guifg=Black
"hi Normal guibg=NONE ctermbg=NONE
"hi LineNr ctermbg=NONE guibg=NONE
"hi SignColumn ctermfg=187 ctermbg=NONE guifg=#ebdbb2 guibg=NONE guisp=NONE cterm=NONE gui=NONE
highlight! link pythonSpaceError  NONE
highlight! link pythonIndentError NONE

"Pmenu Colors
" ---------------------------------------------------------
hi PMenuSel ctermfg=252 ctermbg=106 guifg=#d0d0d0 guibg=#859900 guisp=#859900 cterm=NONE gui=NONE

"coc highlight setting
" ---------------------------------------------------------
hi default CocHighlightText  guibg=#725972 ctermbg=96
hi CocWarningSign  ctermfg=32 ctermbg=NONE guifg=#0087d7 guibg=NONE

"GitGutter Coc-git Highlight
" ---------------------------------------------------------
highlight GitGutterAdd ctermfg=22 guifg=#006000 ctermbg=NONE guibg=NONE
highlight GitGutterChange ctermfg=58 guifg=#5F6000 ctermbg=NONE guibg=NONE
highlight GitGutterDelete ctermfg=52 guifg=#600000 ctermbg=NONE guibg=NONE
highlight GitGutterChangeDelete ctermfg=52 guifg=#600000 ctermbg=NONE guibg=NONE

" Defx Highlight
" ---------------------------------------------------------
highlight Defx_filename_3_Modified  ctermfg=1  guifg=#D370A3
highlight Defx_filename_3_Staged    ctermfg=10 guifg=#A3D572
highlight Defx_filename_3_Ignored   ctermfg=8  guifg=#404660
highlight def link Defx_filename_3_Untracked Comment
highlight def link Defx_filename_3_Unknown Comment
highlight def link Defx_filename_3_Renamed Title
highlight def link Defx_filename_3_Unmerged Label
" highlight Defx_git_Deleted   ctermfg=13 guifg=#b294bb

" buftabline highlight
" ---------------------------------------------------------
highlight BufTabLineCurrent ctermbg=96 guibg=#5d4d7a

"GetColorSynatxGroup
" --------------------------------<F10>-------------------------
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
      \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
      \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

command! -nargs=? -complete=buffer -bang BOnly :call BufOnly('<args>', '<bang>')


function! BufOnly(buffer, bang)
  if a:buffer == ''
    " No buffer provided, use the current buffer.
    let buffer = bufnr('%')
  elseif (a:buffer + 0) > 0
    " A buffer number was provided.
    let buffer = bufnr(a:buffer + 0)
  else
    " A buffer name was provided.
    let buffer = bufnr(a:buffer)
  endif

  if buffer == -1
    echohl ErrorMsg
    echomsg "No matching buffer for" a:buffer
    echohl None
    return
  endif

  let last_buffer = bufnr('$')

  let delete_count = 0
  let n = 1
  while n <= last_buffer
    if n != buffer && buflisted(n)
      if a:bang == '' && getbufvar(n, '&modified')
        echohl ErrorMsg
        echomsg 'No write since last change for buffer'
              \ n '(add ! to override)'
        echohl None
      else
        silent exe 'bdel' . a:bang . ' ' . n
        if ! buflisted(n)
          let delete_count = delete_count+1
        endif
      endif
    endif
    let n = n+1
  endwhile

  if delete_count == 1
    echomsg delete_count "buffer deleted"
  elseif delete_count > 1
    echomsg delete_count "buffers deleted"
  endif

endfunction

" javascript
let g:javascript_enable_domhtmlcss = 1

" vim-javascript
augroup vimrc-javascript
  autocmd!
  autocmd FileType javascript setl tabstop=2|setl shiftwidth=2|setl expandtab softtabstop=2
augroup END

augroup vimrc-kkf2
  autocmd!
  autocmd BufWrite,BufRead *.kkf2 set filetype=lua
  autocmd FileType lua setl tabstop=2|setl shiftwidth=2|setl expandtab softtabstop=2
augroup END

