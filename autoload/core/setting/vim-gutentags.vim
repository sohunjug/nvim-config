let g:gutentags_cache_dir = expand(g:plugin_path . '/tags')
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_missing = 0
let g:gutentags_generate_on_new = 0
let g:gutentags_ctags_exclude_wildignore = 1
let g:gutentags_ctags_exclude = [
  \ '*/wp-admin', '*/wp-content', '*/wp-includes', '*/build', '*/node_modules',
  \ '*/application/vendor', '*/vendor/ckeditor', '*/media/vendor'
  \ ]
let g:gutentags_project_roots = ['.fslckout', 'compile_commands.json', '.ycm_extra_conf.py', '.vimrc']
