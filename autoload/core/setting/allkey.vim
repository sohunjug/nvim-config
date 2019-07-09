"Plugin key settings

if dein#tap('denite.nvim')
  nnoremap <silent><localleader>da  :TodoAdd 
  nnoremap <silent><localleader>m :<C-u>Denite menu<CR>

  noremap zl :<C-u>call <SID>my_denite_outline(&filetype)<CR>
  noremap zL :<C-u>call <SID>my_denite_decls(&filetype)<CR>
  noremap zT :<C-u>call <SID>my_denite_file_rec_goroot()<CR>

  nnoremap <silent> <LocalLeader>gl :<C-u>Denite gitlog:all<CR>
  nnoremap <silent> <LocalLeader>gh :<C-u>Denite gitbranch<CR>
endif

function! s:my_denite_outline(filetype) abort
  execute 'Denite' a:filetype ==# 'go' ? "decls:'%:p'" : 'outline'
endfunction

function! s:my_denite_decls(filetype) abort
  if a:filetype ==# 'go'
    Denite decls
  else
    call denite#util#print_error('decls does not support filetypes except go')
  endif
endfunction

function! s:my_denite_file_rec_goroot() abort
  if !executable('go')
    call denite#util#print_error('`go` executable not found')
    return
  endif
  let out = system('go env | grep ''^GOROOT='' | cut -d\" -f2')
  let goroot = substitute(out, '\n', '', '')
  call denite#start([{'name': 'file/rec', 'args': [goroot]}], {'input': '.go'})
endfunction

if dein#tap('Neoformat')
  nnoremap <leader>bf     :Neoformat<CR>
endif

if dein#tap('vim-session')
  nnoremap <leader>so :OpenSession<Space>
  nnoremap <leader>ss :SaveSession<Space>
  nmap <leader>sl :SessionList<CR>
  nmap <leader>sa :SSave<CR>
  nnoremap <leader>sc :CloseSession<CR>
endif

if dein#tap('coc.nvim')
  " Using CocList
  " Show all diagnostics
  nnoremap <silent> <leader>od  :<C-u>CocList diagnostics<cr>
  " Manage extensions
  nnoremap <silent> <leader>oe  :<C-u>CocList extensions<cr>
  " Show commands
  nnoremap <silent> <leader>oc  :<C-u>CocList commands<cr>
  " Find symbol of current document
  nnoremap <silent> <leader>oo  :<C-u>CocList outline<cr>
  " Search workspace symbols
  nnoremap <silent> <leader>os  :<C-u>CocList -I symbols<cr>
  " Do default action for next item.
  nnoremap <silent> <leader>oj  :<C-u>CocNext<CR>
  " Do default action for previous item.
  nnoremap <silent> <leader>ok  :<C-u>CocPrev<CR>
  " Resume latest coc list
  nnoremap <silent> <leader>or  :<C-u>CocListResume<CR>
  " Use `[c` and `]c` for navigate diagnostics
  nmap <silent> ]c <Plug>(coc-diagnostic-prev)
  nmap <silent> [c <Plug>(coc-diagnostic-next)
  " Remap for rename current word
  nmap <leader>on <Plug>(coc-rename)
  " Remap for format selected region
  vmap <leader>of  <Plug>(coc-format-selected)
  nmap <leader>of  <Plug>(coc-format-selected)
  " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
  xmap <leader>oa  <Plug>(coc-codeaction-selected)
  nmap <leader>oa  <Plug>(coc-codeaction-selected)
  " Remap for do codeAction of current line
  nmap <leader>ol  <Plug>(coc-codeaction)
  " Fix autofix problem of current line
  nmap <leader>oq  <Plug>(coc-fix-current)
  " Remap keys for gotos
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)
  " Use K for show documentation in preview window
  nnoremap <silent> K :call <sid>show_documentation()<cr>
  " use <c-space> for trigger completion.
  inoremap <silent><expr> <c-space> coc#refresh()
  nmap [g <Plug>(coc-git-prevchunk)
  nmap ]g <Plug>(coc-git-nextchunk)
  " show chunk diff at current position
  nmap gs <Plug>(coc-git-chunkinfo)
  nnoremap <silent> <leader>og  :<C-u>CocList --normal gstatus<CR>
  " float window scroll
  nnoremap <expr><C-f> coc#util#has_float() ? coc#util#float_scroll(1) : "\<C-f>"
  nnoremap <expr><C-b> coc#util#has_float() ? coc#util#float_scroll(0) : "\<C-b>"
  nmap <silent> <TAB> <Plug>(coc-range-select)
  xmap <silent> <TAB> <Plug>(coc-range-select)
  xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)
endif

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

if dein#tap('fzf.vim')
  nnoremap <silent> <leader>fc :Colors<CR>
  nnoremap <silent> <leader>fb :Buffers<CR>
  nnoremap <silent> <leader>ff :call Fzf_dev()<CR>
  nnoremap <silent> <leader>fr :Rg<CR>
  nnoremap <silent> <leader>fw :Rg <C-R><C-W><CR>
endif

if dein#tap('vim-easy-align')
  " Start interactive EasyAlign in visual mode (e.g. vipga)
  xmap ga <Plug>(EasyAlign)
  " Start interactive EasyAlign for a motion/text object (e.g. gaip)
  nmap ga <Plug>(EasyAlign)
endif


if dein#tap('vim-go')
  autocmd AutoCmd FileType go
    \  nmap <Leader>gov <Plug>(go-def-vertical)
    \ | nmap <Leader>goi <Plug>(go-info)
    \ | nmap <Leader>god <Plug>(go-doc)
    \ | nmap <leader>gor <Plug>(go-run)
    \ | nmap <leader>gob <Plug>(go-build)
    \ | nmap <leader>got <Plug>(go-test)
    \ | nmap <leader>goc <Plug>(go-coverage)
    \ | nmap <Leader>gr  <Plug>(go-rename)
endif

if dein#tap('vim-easygit')
  nnoremap <silent> <localleader>gd :Gdiff<CR>
  nnoremap <silent> <localleader>gc :Gcommit<CR>
  nnoremap <silent> <localleader>gb :Gblame<CR>
  nnoremap <silent> <localleader>gB :Gbrowse<CR>
  nnoremap <silent> <localleader>gS :Gstatus<CR>
  nnoremap <silent> <localleader>gp :Gpush<CR>
endif


if dein#tap('vim-mundo')
  nnoremap <silent> <leader>m :MundoToggle<CR>
endif

if dein#tap('vim-choosewin')
  nmap - <Plug>(choosewin)
  nmap <Leader>- :<C-u>ChooseWinSwapStay<CR>
endif

if dein#tap('accelerated-jk')
  nmap <silent>j <Plug>(accelerated_jk_gj)
  nmap <silent>k <Plug>(accelerated_jk_gk)
endif

if dein#tap('caw.vim')
  function! InitCaw() abort
    if !&l:modifiable
      silent! nunmap <buffer> gc
      silent! xunmap <buffer> gc
      silent! nunmap <buffer> gcc
      silent! xunmap <buffer> gcc
    else
      nmap <buffer> gc <Plug>(caw:prefix)
      xmap <buffer> gc <Plug>(caw:prefix)
      nmap <buffer> gcc <Plug>(caw:hatpos:toggle)
      xmap <buffer> gcc <Plug>(caw:hatpos:toggle)
    endif
  endfunction
  autocmd AutoCmd FileType * call InitCaw()
  call InitCaw()
endif


if dein#tap('comfortable-motion.vim')
  nnoremap <silent> [d :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * 2)<CR>
  nnoremap <silent> [u :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -2)<CR>
  nnoremap <silent> <C-f> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * 4)<CR>
  nnoremap <silent> <C-b> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -4)<CR>
endif

if dein#tap('python_match.vim')
  nmap <buffer> {{ [%
  nmap <buffer> }} ]%
endif

if dein#tap('goyo.vim')
  nnoremap <Leader>G :Goyo<CR>
endif

if dein#tap('defx.nvim')
  nnoremap <silent> <leader>ft :<C-u>Defx -toggle -buffer-name=tab`tabpagenr()`<CR>
  nnoremap <silent> <leader>fd :<C-u>Defx -split=floating -winwidth=100 -buffer-name=tab`tabpagenr()`<CR>
  nnoremap <silent> <localleader>e :<C-u>Defx -toggle -buffer-name=tab`tabpagenr()`<CR>
  nnoremap <silent> <localleader>a :<C-u>Defx -toggle -buffer-name=tab`tabpagenr()` -search=`expand('%:p')`<CR>
endif

if dein#tap('nerdcommenter')
  nmap <silent><leader>; <Plug>CommenterToggle
endif

if dein#tap('vim-startify')
  nnoremap <silent> <leader>bh :Startify<CR>
endif

if dein#tap('vim-quickrun')
  nnoremap <silent> <localleader>r :QuickRun<CR>
endif

if dein#tap('dash.vim')
  nnoremap <silent><leader>d :Dash<CR>
endif

if dein#tap('vim-expand-region')
  xmap v <Plug>(expand_region_expand)
  xmap V <Plug>(expand_region_shrink)
endif

if dein#tap('splitjoin.vim')
  let g:splitjoin_join_mapping = ''
  let g:splitjoin_split_mapping = ''
  nmap sj :SplitjoinJoin<CR>
  nmap sk :SplitjoinSplit<CR>
endif

if dein#tap('vista.vim')
  nnoremap <silent><localleader>v :Vista!!<CR>
  nnoremap <silent><leader>tv :Vista!!<CR>
  nnoremap <silent><leader>tc :Vista finder coc<CR>
endif

if dein#tap('tagbar')
  nnoremap <silent><localleader>t :TagbarToggle<CR>
  nnoremap <silent><leader>tt :TagbarToggle<CR>
endif

if dein#tap('ale')
  nmap [a <Plug>(ale_next_wrap)
  nmap ]a <Plug>(ale_previous_wrap)
endif

if dein#tap('vim-easymotion')
  nmap f <Plug>(easymotion-f)
  nmap <leader><leader>/ <Plug>(easymotion-sn)
  nmap <leader><leader>w <Plug>(easymotion-w)
  nmap <leader><leader>f <Plug>(easymotion-f)
  nmap <leader><leader>b <Plug>(easymotion-b)
endif

if dein#tap('vim-which-key')
  nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
  nnoremap <silent> <localleader> :<c-u>WhichKey  ';'<CR>
  nnoremap <silent>[              :<c-u>WhichKey  '['<CR>
  nnoremap <silent>]              :<c-u>WhichKey  ']'<CR>
endif

if dein#tap('vim-smartchr')
  inoremap <expr> , smartchr#one_of(', ', ',')
  augroup AutoCmd
    autocmd FileType go inoremap <buffer><expr> ;
      \ smartchr#loop(':=',';')
    autocmd FileType go inoremap <buffer> <expr> .
      \ smartchr#loop('.', '->', '<-','...')
  augroup end
endif

if dein#tap('vim-niceblock')
  xmap I  <Plug>(niceblock-I)
  xmap A  <Plug>(niceblock-A)
endif

if dein#tap('vim-sandwich')
  nmap <silent> sa <Plug>(operator-sandwich-add)
  xmap <silent> sa <Plug>(operator-sandwich-add)
  omap <silent> sa <Plug>(operator-sandwich-g@)
  nmap <silent> sd <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
  xmap <silent> sd <Plug>(operator-sandwich-delete)
  nmap <silent> sr <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
  xmap <silent> sr <Plug>(operator-sandwich-replace)
  nmap <silent> sdb <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
  nmap <silent> srb <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
  omap ib <Plug>(textobj-sandwich-auto-i)
  xmap ib <Plug>(textobj-sandwich-auto-i)
  omap ab <Plug>(textobj-sandwich-auto-a)
  xmap ab <Plug>(textobj-sandwich-auto-a)
  omap is <Plug>(textobj-sandwich-query-i)
  xmap is <Plug>(textobj-sandwich-query-i)
  omap as <Plug>(textobj-sandwich-query-a)
  xmap as <Plug>(textobj-sandwich-query-a)
endif

if dein#tap('vim-operator-replace')
  xmap p <Plug>(operator-replace)
endif

if dein#tap('vim-textobj-multiblock')
  omap <silent> ab <Plug>(textobj-multiblock-a)
  omap <silent> ib <Plug>(textobj-multiblock-i)
  xmap <silent> ab <Plug>(textobj-multiblock-a)
  xmap <silent> ib <Plug>(textobj-multiblock-i)
endif

if dein#tap('LeaderF')
  noremap <leader>pf :LeaderfMru<cr>
  noremap <leader>pp :LeaderfFunction!<cr>
  noremap <leader>pb :LeaderfBuffer<cr>
  noremap <leader>pt :LeaderfTag<cr>
endif


" if dein#tap('vim-operator-surround')
"   map <silent>sa <Plug>(operator-surround-append)
"   map <silent>sd <Plug>(operator-surround-delete)
"   map <silent>sr <Plug>(operator-surround-replace)
"   nmap <silent>saa <Plug>(operator-surround-append)<Plug>(textobj-multiblock-i)
"   nmap <silent>sdd <Plug>(operator-surround-delete)<Plug>(textobj-multiblock-a)
"   nmap <silent>srr <Plug>(operator-surround-replace)<Plug>(textobj-multiblock-a)
" endif
