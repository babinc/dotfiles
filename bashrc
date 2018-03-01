# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$(parse_git_branch)\[\033[00m\] $ "
export PS1="\[\033[38;5;37m\]\u:\[$(tput sgr0)\]\[\033[38;5;11m\]\W\[$(tput sgr0)\]\[\033[38;5;15m\]\$(parse_git_branch) \\$ \[$(tput sgr0)\]"

if [ -z "$SSH_AUTH_SOCK" ] ; then
  eval `ssh-agent -s`
  ssh-add
fi

test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias vim="nvim"
export AWS_REGION=us-west-2
export PORT=3000
export PATH=/home/ubuntu/.local/bin:/home/ubuntu/bin:/home/ubuntu/.local/bin:/usr/local/nvm/versions/node/v8.1.4/bin:/home/ubuntu/bin:/home/ubuntu/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/snap/bin
alias sudo='sudo env PATH=$PATH'
[ -z "$PS1" ] && return

function cd {
  builtin cd "$@" && ls -F
}
export PATH=/home/carman/.local/bin:/home/carman/.nvm/versions/node/v8.1.4/bin:/home/ubuntu/.local/bin:/home/ubuntu/bin:/home/ubuntu/.local/bin:/usr/local/nvm/versions/node/v8.1.4/bin:/home/ubuntu/bin:/home/ubuntu/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/snap/bin

export NODE_ENV=development
export PORT=3001

export NVM_DIR=~/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
# export PATH="$PATH:$HOME/.rvm/bin"
# source ~/.rvm/scripts/rvm
# export PATH="$HOME/.rbenv/bin:$PATH"
# eval "$(rbenv init -)"
# export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
