python3 import sys
python3 import vim
python3 sys.path.append(vim.eval('expand("<sfile>:h")'))


function! Vim_TodoList_Toggle()
python3 << ENDOFPYTHON
from vim_todolist import toggle_item
toggle_item()
ENDOFPYTHON
endfunction


function! Vim_TodoList_ToggleMark()
python3 << ENDOFPYTHON
from vim_todolist import toggle_mark
toggle_mark()
ENDOFPYTHON
endfunction


noremap <leader>tt :call Vim_TodoList_Toggle()<cr>
noremap <leader><space> :call Vim_TodoList_ToggleMark()<cr>

