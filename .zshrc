# Path to your oh-my-zsh installation.
export ZSH=/home/req/.oh-my-zsh

ZSH_THEME="agnoster"

plugins=(git colored-man-pages)

# User configuration

export PATH="/home/req/bin:/usr/local/bin:/home/req/bin:/usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/req/.scripts/:/usr/bin/ghc-mod"
# export MANPATH="/usr/local/man:$MANPATH"
source $ZSH/oh-my-zsh.sh
# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nvim'
 else
   export EDITOR='nvim'
 fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases




### ZSH alias

alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias zshsource="source ~/.zshrc"

### Pacman Alias
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

### Random alias

alias vim="nvim"

### Yaourt Alias
alias yup="yaourt -Syua"
alias yin="yaourt -S"
alias ysr="yaourt -Ss"
alias yarinfo="yaourt -Siv"

### I3 Alias
alias i3="vim ~/.config/i3/config"

# Music
alias music="ncmpcpp"
alias fixbluetooth="sudo rmmod btusb ; sudo modprobe btusb"

### Nvidia Settings
alias nvidia="optirun -b none nvidia-settings -c :8"

# Surfraw alias
alias yt="surfraw youtube"
alias g="surfraw google"

neofetch
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias config='/usr/bin/git --git-dir=/home/req/.cfg/ --work-tree=/home/req'
