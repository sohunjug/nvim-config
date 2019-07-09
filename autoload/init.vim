let s:sysname = substitute(system('uname'), '\n', '', '')
if !exists('g:python_host_prog')
  if s:sysname =='Darwin'
    let g:python_host_prog  = '/usr/local/bin/python'
  elseif s:sysname == 'Linux'
    let g:python_host_prog  = '/usr/bin/python'
  endif
endif
if !exists('g:python3_host_prog')
  if s:sysname =='Darwin'
    let g:python3_host_prog  = '/usr/local/bin/python3'
  elseif s:sysname == 'Linux'
    let g:python3_host_prog  = '/usr/bin/python3'
  endif
endif
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/core/plugins.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/core/setting.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/core/mapping.vim'
