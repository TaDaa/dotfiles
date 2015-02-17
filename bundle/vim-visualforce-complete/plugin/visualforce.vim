let g:visualforce_plugin_current_directory = resolve(expand('<sfile>:p:h').'/../lib')
python << EOF
import sys,vim
sys.path.append(vim.eval('g:visualforce_plugin_current_directory'))
EOF
