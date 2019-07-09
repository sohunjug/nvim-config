let g:neoformat_try_formatprg = 1
let g:jsx_ext_required = 0
let g:neoformat_enabled_javascript = ['prettier']
let g:neoformat_enabled_html = ['js-beautify']
let g:neoformat_enabled_cpp = ['clangformat']
let g:neoformat_cpp_clangformat = {
    \ 'exe': '/usr/local/bin/clang-format',
    \ 'args': ['-style=file'],
    \ 'stdin': 1,
    \ }
