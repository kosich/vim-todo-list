import vim
import re

todo_item_regex = re.compile("(^\s*\[)(.)(\].*$)")
brackets_string = "[ ]"

def append_todo_line():
    cb = vim.current.buffer
    (row, col) = vim.current.window.cursor
    cb.append(brackets_string, row)

def promote_to_todo_item():
    line = vim.current.line
    if is_todo_item(line):
        return 
    vim.current.line = brackets_string + " " + vim.current.line

def mark_as_done():
    line = vim.current.line
    if not is_todo_item(line):
        return
    vim.current.line = re.sub(todo_item_regex, r'\g<1>x\g<3>', line)

def mark_as_undone():
    line = vim.current.line
    if not is_todo_item(line):
        return
    vim.current.line = re.sub(todo_item_regex, r'\g<1> \g<3>', line)

def is_todo_item(line):
    return todo_item_regex.match(line)

def is_done(line):
    if not is_todo_item(line):
        return
    match = re.match(todo_item_regex, line)
    if match == None:
        return
    return not re.match(r'\s', match.group(2))

def toggle():
    line = vim.current.line

    if not is_todo_item(line):
        return

    if is_done(line):
        mark_as_undone()
    else:
        mark_as_done()

