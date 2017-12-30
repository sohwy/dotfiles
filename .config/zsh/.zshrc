# Created by newuser for 5.4.1

# zsh history
HISTFILE=${ZDOTDIR}/.histfile
HISTSIZE=1000
SAVEHIST=1000

# colors
BASE16_SHELL_SET_BACKGROUND=false
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# add TeX to PATH
export PATH="/home/user/texlive/2017/bin/x86_64-linux:$PATH"
export MANPATH="/home/user/texlive/2017/texmf-dist/doc/man:$MANPATH"
export INFOPATH="/home/user/texlive/2017/texmf-dist/doc/info:$INFOPATH"

# enable vi mode
bindkey -v

# vi mode bindings
bindkey -a '^[[3~' delete-char
bindkey '^[[3~' delete-char
bindkey "^?" backward-delete-char

# zsh prompt
function zle-line-init zle-keymap-select {
    PROMPT="${${KEYMAP/vicmd/[N]}/(main|viins)/[I]}%F{38}%B[%c]%f%b%# "
	RPROMPT="%F{81}%~%f"
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

# no idea what this is
zstyle :compinstall filename '/home/user/.zshrc'

# enable auto-complete
autoload -Uz compinit
compinit

# aliases
alias i3config="vim ~/.config/i3/config"
alias zshrc="vim ~/.config/zsh/.zshrc"
alias bashrc="vim ~/.bashrc"
alias vimrc="vim ~/.vimrc"
alias ..="cd .."
