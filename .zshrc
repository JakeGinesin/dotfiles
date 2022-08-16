# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Init commands
#clear
#echo It is currently `date`.
#echo Running `uname -s -r`.

# Path to oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Theme
#ZSH_THEME="af-magic"
ZSH_THEME="powerlevel10k/powerlevel10k" 

# ------------------- Plugins
plugins=(
    fzf
    git
    history-substring-search
    colored-man-pages
    zsh-syntax-highlighting
    zsh-z
)
source $ZSH/oh-my-zsh.sh

# ------------------- Aliases
# misc
alias python='python3'
alias pls='sudo'
alias zshrc='nvim /home/synchronous/.zshrc' 
alias vi='nvim'
alias vim='nvim'
alias pq="ping google.com -c 5"
alias lock="sudo systemctl restart lightdm"
alias compp="g++" 

# dotfile alias
alias config='/usr/bin/git --git-dir=/home/synchronous/.cfg/ --work-tree=/home/synchronous'

# local stuff (you'll prob want to remove these if you're copying my dots)
alias site="cd /home/synchronous/Programming/jake_site_static"
alias website="cd /home/synchronous/Programming/jake_site_static"
alias jakesite="cd /home/synchronous/Programming/jake_site_static"

# Ported from windows because I'm a scrub
alias cls="clear"

## Curl Aliases for easy info

alias weather="curl https://wttr.in; echo"
alias myip="curl https://ipecho.net/plain; echo"
alias crypto="curl https://usd.rate.sx"

## Arch aliases 
alias search="pacman -Ss"
alias update="sudo pacman -Syu"
alias install="sudo pacman -S"

## iwctl aliases
alias sl="iwctl station list"
alias sgn="iwctl station wlan0 scan; iwctl station wlan0 get-networks"
alias sc="iwctl station wlan0 connect"

## directory control
alias ..="cd .."
alias ...="cd ../.."
alias .4="cd ../../.."

# replacing ls with exa & lsd
alias ls="lsd --group-dirs first"
alias l="exa -al --color=always --git --group-directories-first"
alias l.="exa -a --colour=always --git -u | egrep '^\.'"

# Lolcats!!
alias neofetch="neofetch | lolcat"

# ------------------- fzf configuration
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fdfind --type f'
export FZF_DEFAULT_OPTS="--layout=reverse --inline-info --height=80%"

# ------------------- Key Binding
bindkey "\e[1~" beginning-of-line # Home
bindkey "\e[4~" end-of-line # End
bindkey "\e[3~" delete-char #Del
bindkey "\e[2~" overwrite-mode # Ins
bindkey "\e[6~" end-of-history # PageDown
bindkey "\e[5~" beginning-of-history #PageUp

# ------------------- More Widgets
run_ranger () {
    echo
    ranger --choosedir=$HOME/.rangedir < $TTY
    LASTDIR='cat $HOME/.rangerdir'
    cd "$LASTDIR"
    zle reset-prompt
}
zle -N run_ranger

bindkey '^o' run_ranger

export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

alias compp="g++ \\!* ~/Programming/cpp/a.out"

# ------ DEFAULT NOTES:

# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='nvim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
