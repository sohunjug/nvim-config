let $GTAGSLABEL = 'native-pygments'
let $GTAGSCONF = '/usr/local/share/gtags/gtags.conf'
let g:gutentags_cache_dir = expand(g:plugin_path . '/tags')
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_missing = 0
let g:gutentags_generate_on_new = 0

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 如果使用 universal ctags 需要增加下面一行
let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

" 禁用 gutentags 自动加载 gtags 数据库的行为
let g:gutentags_auto_add_gtags_cscope = 0
let g:gutentags_plus_switch = 1
let g:gutentags_ctags_exclude_wildignore = 1
let g:gutentags_ctags_exclude = [
      \ '*/wp-admin', '*/wp-content', '*/wp-includes', '*/build', '*/node_modules',
      \ '*/application/vendor', '*/vendor/ckeditor', '*/media/vendor'
      \ ]
let g:gutentags_project_roots = ['.fslckout', 'compile_commands.json', '.ycm_extra_conf.py', '.vimrc']
