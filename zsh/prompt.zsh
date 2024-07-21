#!/usr/bin/env zsh

is_git_workspace() {
        [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == true ]]
}

path() {
        local dir="${PWD:A}"
        if is_git_workspace; then
                local git_root=$(git rev-parse --show-toplevel)
                local git_trunc="${dir#$~~git_root}" # remove $git_root path from head of $dir

                dir="$git_root:t$git_trunc" # display only tail (:t) of $git_root
        else
                dir="%3~" # display last three components of path
        fi

        echo -n $dir
}

git_status() {
        local git_status="$(LC_ALL=C GIT_OPTIONAL_LOCKS=0 git status)"

        local git_symbols=
        case $git_status in
                *'have diverged,'*) git_symbols+='<>' ;;
        esac
        case $git_status in
                *'Your branch is behind '*) git_symbols+='<' ;;
        esac
        case $git_status in
                *'Your branch is ahead '*) git_symbols+='>' ;;
        esac
        case $git_status in
                *'new file:'*) git_symbols+='+' ;;
        esac
        case $git_status in
                *'renamed:'*) git_symbols+='r' ;;
        esac
        case $git_status in
                *'deleted:'*) git_symbols+='x' ;;
        esac
        case $git_status in
                *'modified:'*) git_symbols+='!' ;;
        esac
        case $git_status in
                *'Untracked files:'*) git_symbols+='?' ;;
        esac

        echo -n $git_symbols
}

git_branch() {
        local branch="$(git symbolic-ref HEAD 2>/dev/null)"
        echo -n ${branch#refs/heads/}
}

prompt_precmd() {
        git_prompt=
        if is_git_workspace; then
                PROMPT_GIT_branch="$(git_branch)"
                PROMPT_GIT_status="$(git_status)"

                git_prompt+="%F{magenta}$PROMPT_GIT_branch%f"
                git_prompt+=" "
                git_prompt+="[%F{blue}$PROMPT_GIT_status%f]"
        fi

        PROMPT_dir="$(path)"
        newline=$'\n' # to get around zsh screen redraw tendencies
        
        PS1=
        PS1+=$newline
        PS1+="%F{cyan}$PROMPT_dir%f"
        PS1+=" "
        PS1+=$git_prompt
        PS1+=$newline
        PS1+="%B%(?.%F{green}>.%F{red}X)%f%b "
}

prompt_set() {
        setopt prompt_subst

        reset="$(tput sgr0)"
        red="$(tput setaf 1)"
        green="$(tput setaf 2)"
        yellow="$(tput setaf 3)"
        blue="$(tput setaf 4)"
        magenta="$(tput setaf 5)"
        cyan="$(tput setaf 6)"
        gray="$(tput setaf 8)"

        PS1=
        PS1+="\n"
        PS1+="$cyan$PROMPT_dir$reset"
        PS1+=" "
        PS1+="$magenta$PROMPT_GIT_branch$reset"
        PS1+=" "
        PS1+="[$blue$PROMPT_GIT_status$reset]"
        PS1+=" "
        PS1+="$yellow$PROMPT_EXEC_TIME_dur$reset"
        PS1+="\n"
        PS1+="$green$bold>$reset"
        PS1+=" "

        PS2="$gray...$reset$green>$reset "
}
prompt_set

autoload -Uz add-zsh-hook
add-zsh-hook precmd prompt_precmd
