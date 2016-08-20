#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'
VISUAL='gvim --nofork'
EDITOR='gvim --nofork'
#PS1='[\u@\h \W]\$ '  # Default
#PS1='\[\e[1;32m\][\u@\h \W]\$\[\e[0m\] ' # Green User
#VISUAL='vim'
#EDITOR='vim --remote-tab-silent'
#PAGER='gvim'

## Use less for viewing colored man pages
man() {
    env LESS_TERMCAP_mb=$'\E[01;31m' \
    LESS_TERMCAP_md=$'\E[01;38;5;74m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[38;5;246m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[04;38;5;146m' \
    man "$@"
}

alias less='/usr/share/vim/vim74/macros/less.sh'    # Use vim instead of less as a pager
#alias v='vim --remote-silent'

# don't forget to:
# source ~/.bashrc

function runvim() 
{
  count=`ps aux | grep -c vim`
  if [ $count -eq 1 ]; then
    vim --servername VIM $@
  else
    vim --remote-tab-silent $@
    tmux find-window vim # write something to focus on vim window    i3-msg "[title=VIM] focus"
  fi   
}
#alias vim=runvim
#alias vi=runvim
alias v=runvim
#alias onlyvim=vim
