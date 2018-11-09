# Created by newuser for 5.4.1

# zsh history
HISTFILE=${ZDOTDIR}/.histfile
HISTSIZE=1000
SAVEHIST=1000

# colors
BASE16_SHELL_SET_BACKGROUND=false
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
(cat ~/.cache/wal/sequences &)

# PATH
export PATH="$HOME/.local/bin:/home/user/texlive/2017/bin/x86_64-linux:$PATH"
export MANPATH="/home/user/texlive/2017/texmf-dist/doc/man:$MANPATH"
export INFOPATH="/home/user/texlive/2017/texmf-dist/doc/info:$INFOPATH"
export GOPATH=$HOME/go

# enable vi mode
bindkey -v

# vi mode bindings
bindkey -a '^[[3~' delete-char
bindkey '^[[3~' delete-char
bindkey "^?" backward-delete-char

# zsh prompt
function zle-line-init zle-keymap-select {
	# left prompt
    PROMPT="${${KEYMAP/vicmd/[N]}/(main|viins)/[I]}%F{54}%B[%c]%f%b%# "
	# right prompt
	RPROMPT="%F{81}%~%f %F{48}$VIRTUAL_ENV%f"
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
alias yattc="source ~/Projects/envs/yattc/bin/activate; cd ~/Projects/yattc"
alias taxcalc="source ~/Projects/envs/Tax-Calculator/bin/activate"
