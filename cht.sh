#!/usr/bin/env bash
languages=`echo "golang lua cpp c typescript nodejs" | tr ' ' '\n'`
core_utils=`echo "xargs find mv sed awk alias tmux" | tr ' ' '\n'`

selected=`printf "$languages\n$core_utils" | fzf`

read -p "Enter Query: " query

if printf "$languages" | grep -qs $selected; then
    query=`echo $query | tr ' ' '+'`
    tmux neww bash -c "echo \"curl cht.sh/$selected/$query/\" & curl cht.sh/$selected/$query & while [ : ]; do sleep 1; done"
else
    query=`echo $query | tr ' ' '+'`
    tmux neww bash -c "curl -s cht.sh/$selected~$query | less"
fi
