python3 import sys
python3 import vim
python3 sys.path.append(vim.eval('expand("<sfile>:h")'))

function! Vim_TodoList_Promote()
python3 << ENDOFPYTHON
from vim_todolist import promote_to_todo_item
promote_to_todo_item()
ENDOFPYTHON
endfunction


function! Vim_TodoList_Toggle()
python3 << ENDOFPYTHON
from vim_todolist import toggle
toggle()
ENDOFPYTHON
endfunction

noremap <leader>tt :call Vim_TodoList_Promote()<cr>
noremap <leader><space> :call Vim_TodoList_Toggle()<cr>

