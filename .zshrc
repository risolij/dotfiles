# Path to your oh-my-zsh installation.
export ZSH=/home/req/.oh-my-zsh

ZSH_THEME="gentoo"
plugins=(git colored-man-pages)

# User configuration
export BROWSER=/usr/bin/qutebrowser
export TERMINAL=/usr/bin/alacritty
export PATH="/home/req/bin:/usr/local/bin:/home/req/bin:/usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/req/.scripts/:/usr/bin/ghc-mod"

source $ZSH/oh-my-zsh.sh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nvim'
 else
   export EDITOR='nvim'
 fi

### ZSH 

alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias zshsource="source ~/.zshrc"

### Pacman 

alias pacup="sudo pacman -Syu"
alias pacsync="sudo pacman -Syy"
alias pacin="sudo pacman -S"
alias pacrm="sudo pacman -Rns"
alias pacsr="pacman -Ss"
alias pacls="pacman -Q"
alias pacq="pacman -Qi"
alias pacinfo="pacman -Siv"
alias pacorph="sudo pacman -Rns $(pacman -Qtdq)"
alias pacclean="sudo pacman -Sc"

### Random 

alias gwork="cd ~/Work/Groff"
alias rwork="cd ~/Work/Rust"
alias lwork="cd ~/Work/Latex"
alias vim="nvim"
alias ls="exa"

### I3 

alias i3="vim ~/.config/i3/config"

# Music

alias music="ncmpcpp"

### Git

alias config='/usr/bin/git --git-dir=/home/req/.cfg/ --work-tree=/home/req'
