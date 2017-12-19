# .bashrc

# Activate vi mode with <Escape>:
set -o vi
bind ^l:clear-screen

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
BASE16_SHELL_SET_BACKGROUND=false
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# added by Anaconda3 installer
#export PATH="/home/user/anaconda3/bin:$PATH"

# add TeX to PATH
export PATH="/home/user/texlive/2017/bin/x86_64-linux:$PATH"
export MANPATH="/home/user/texlive/2017/texmf-dist/doc/man:$MANPATH"
export INFOPATH="/home/user/texlive/2017/texmf-dist/doc/info:$INFOPATH"

# aliases
alias i3config="vim ~/.config/i3/config"
