#!/bin/sh

file_cmd="rg --files --hidden --follow --glob '!.git'"
dir_cmd="rg --files --hidden --null 2> /dev/null | xargs -0 dirname | sort -u"

selection=$(
find -type d | fzf --multi --height=80% --border=sharp \
--preview='tree -C {}' --preview-window='45%,border-sharp' \
--prompt='Dirs> ' \
--bind='del:execute(rm -ri {+})' \
--bind='ctrl-p:toggle-preview' \
--bind='ctrl-d:change-prompt(Dirs> )' \
--bind='ctrl-d:+reload(rg --files --hidden --null 2> /dev/null | xargs -0 dirname | sort -u)' \
--bind='ctrl-d:+change-preview(tree -C {})' \
--bind='ctrl-d:+refresh-preview' \
--bind='ctrl-f:change-prompt(Files> )' \
--bind='ctrl-f:+reload(rg --files --hidden --follow --glob "!.git")' \
--bind='ctrl-f:+change-preview(cat {})' \
--bind='ctrl-f:+refresh-preview' \
--bind='ctrl-a:select-all' \
--bind='ctrl-x:deselect-all' \
--header='
CTRL-D to display directories | CTRL-F to display files
CTRL-A to select all | CTRL-X to deselect all
ENTER to edit | DEL to delete
CTRL-P to toggle preview
'
)

if [ -d "$selection" ]; then
    cd "$selection" || exit
else
    eval "$EDITOR $selection"
fi
