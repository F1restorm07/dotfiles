zstyle ':completion:*' completer _extensions _complete _approximate _ignored # define zsh completers

# enable cache for increased speed
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"

# customizing the completion menu ---
zstyle ':completion:*' menu select
zstyle ':completion:*:*:*:*:descriptions' format '%F{yellow}-- %D %d  --%f' # normal descriptions
zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f' # _approximate corrections

zstyle ':completion:*' group-name '' # place completion group headers with group
zstyle ':completion:*:*:-command-:*:*' group-order alias builtins functions commands # the completion group description order

zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS} # enable file and directory colors

zstyle ':completion:*' complete-options true # complete options instead of the directory stack
zstyle ':completion:*:approximate:*' max-errors 2 # maximum number of correction errors
zstyle ':completion:*' squeeze-slashes true # match multiple slashes as a single slash (foo//bar becomes foo/bar)
zstyle ':completion:*' ignore-parents parent pwd directory # when matching for ../ and ., don't show parents or the current directory as options

# first try case insensitive, then partial words
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'  'm:{[:upper:]}={[:lower:]}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# options ---
setopt LIST_PACKED # a more compact completion menu
setopt COMPLETE_IN_WORD # complete from both ends of a word
setopt ALWAYS_TO_END # move the cursor to the end of the completed word
setopt PATH_DIRS # perform path searching even when the command name has a slash
setopt AUTO_LIST # automatically list choices on an ambiguous match
setopt AUTO_PARAM_SLASH # add a trailing slash to a completed directory
setopt EXTENDED_GLOB #

unsetopt MENU_COMPLETE # do not autoselect the first completion entry

autoload -Uz compinit # enable completion
compinit
