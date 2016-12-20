#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    startx
fi

# base16 shell
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

export VISUAL=nvim
export EDITOR="$VISUAL"
export XDG_MUSIC_DIR="~/music/"

txtblk='\e[0;30m' # Black - Regular
txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
txtylw='\e[0;33m' # Yellow
txtblu='\e[0;34m' # Blue
txtpur='\e[0;35m' # Purple
txtcyn='\e[0;36m' # Cyan
txtwht='\e[0;37m' # White
bldblk='\e[1;30m' # Black - Bold
bldred='\e[1;31m' # Red
bldgrn='\e[1;32m' # Green
bldylw='\e[1;33m' # Yellow
bldblu='\e[1;34m' # Blue
bldpur='\e[1;35m' # Purple
bldcyn='\e[1;36m' # Cyan
bldwht='\e[1;37m' # White
unkblk='\e[4;30m' # Black - Underline
undred='\e[4;31m' # Red
undgrn='\e[4;32m' # Green
undylw='\e[4;33m' # Yellow
undblu='\e[4;34m' # Blue
undpur='\e[4;35m' # Purple
undcyn='\e[4;36m' # Cyan
undwht='\e[4;37m' # White
bakblk='\e[40m'   # Black - Background
bakred='\e[41m'   # Red
bakgrn='\e[42m'   # Green
bakylw='\e[43m'   # Yellow
bakblu='\e[44m'   # Blue
bakpur='\e[45m'   # Purple
bakcyn='\e[46m'   # Cyan
bakwht='\e[47m'   # White
txtrst='\e[0m'    # Text Reset

alias ls='ls --color=auto'
alias juice='mpc ls Files | grep Juicy | mpc add; mpc repeat on; mpc play'
alias random='mpc ls Files | mpc add; mpc random on; mpc play; mpc repeat on'

alias gs='git status'
alias gc='git commit'
alias ga='git add'
alias gst='git stash'
alias gdi='git diff'
alias gco='git checkout'
alias gpu='git push'
alias gpl='git push'
alias grb='git rebase'
alias grm='git rm'

function git_color {
  local git_status="$(git status 2> /dev/null)"

  if [[ $git_status =~ "Changes not staged" ]]; then
    echo -e $txtred
  elif [[ $git_status =~ "nothing added to commit but untracked files" ]]; then
    echo -e $txtwht
  elif [[ $git_status =~ "Your branch is ahead of" ]]; then
    echo -e $txtylw
  elif [[ $git_status =~ "nothing to commit" ]]; then
    echo -e $txtcyn
  fi
}

function git_branch {
  local git_status="$(git status 2> /dev/null)"
  local on_branch="On branch ([^${IFS}]*)"
  local on_commit="HEAD detached at ([^${IFS}]*)"

  if [[ $git_status =~ $on_branch ]]; then
    local branch=${BASH_REMATCH[1]}
    echo "($branch)"
  elif [[ $git_status =~ $on_commit ]]; then
    local commit=${BASH_REMATCH[1]}
    echo "($commit)"
  fi
}


PS1="\[$bldblu\][\[$txtgrn\]\u \[$txtpur\]\w "
PS1+="\[\$(git_color)\]"            # colors git status
PS1+="\$(git_branch)"               # prints current branch
PS1+="\[$bldblu\]]\$ \[$txtrst\]"    

export PS1

alias p='sudo pacman'

source "$HOME/.homesick/repos/homeshick/homeshick.sh"

alias hs='homeshick'

PATH=$PATH:~/src/bin
PATH=$PATH:~/.gem/ruby/2.3.0/bin

homeshick --quiet refresh

export PATH="$HOME/.cargo/bin:$PATH"

export RUST_SRC_PATH=~/.multirust/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

set -o vi
