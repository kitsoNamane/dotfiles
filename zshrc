# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/home/kitso/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#plugins=(
#git zsh-syntax-highlighting
#)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
export EDITOR='nvim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias ohmyzsh="mate ~/.oh-my-zsh"
#alias mux="tmuxinator"
alias zshconfig="nvim ~/.zshrc"
alias cat="bat"
alias ls="exa"
alias bin="cd ${HOME}/Documents/bin && ls"

# Homebrew Configurations
export HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew"
export HOMEBREW_CELLAR="/home/linuxbrew/.linuxbrew/Cellar"
export HOMEBREW_REPOSITORY="/home/linuxbrew/.linuxbrew/Homebrew"
export PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH"
export MANPATH="/home/linuxbrew/.linuxbrew/share/man${MANPATH+:$MANPATH}:"
export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:${INFOPATH:-}"

export GOROOT="$HOME/.golang/go"
export PATH="$GOROOT/bin:$PATH"
export GOPATH="$HOME/.golang"
export GOBIN="$GOPATH/bin"
export PATH="$GOBIN:$PATH"

#################################################################################################
#-----------------------------------------------------------------------------------------------#
#################################################################################################

# git-update updates master/main with upstream changes, and optionally creates a feature branch.
function git-update() {
    local default_br=$(git symbolic-ref refs/remotes/origin/HEAD | cut -d '/' -f4)
    git checkout ${default_br} && git pull upstream ${default_br} && git push origin ${default_br}

    local br=${1}
    if [[ $br != "" ]]; then
        local br_base=${br}_base
        git branch ${br_base}
        git checkout -b ${br}
    fi
}

# git-rebase rebases current branch on master, or the specified target.
# $1    target
# $2+   args passed to rebase command
#
# Note: if there's a merge conflict, after handling the merge conflict,
# you need to finish by running git-rebase-finish.
function git-rebase() {
    local default_br = $(git symbolic-ref refs/remotes/origin/HEAD | cut -d '/' -f4)
    local to=${1:-default_br}
    local args=${@:2}
    local br=$(git branch --show-current)
    local br_base=${br}_base

    # Save values to file in case rebase fails
    echo "${to} ${br} ${br_base}" > ~/.gitrebase

    git rebase --onto ${to} ${br_base} ${br} ${args} && git checkout ${br_base} && git reset --hard ${to} && git checkout ${br}
}

# git-rebase-finish completes the rebase started by git-rebase.
function git-rebase-finish() {
    local vals
    read -r -a vals < ~/.gitrebase
    local to=${vals[0]}
    local br=${vals[1]}
    local br_base=${vals[2]}
    git checkout ${br_base} && git reset --hard ${to} && git checkout ${br}
}

#################################################################################################
#-----------------------------------------------------------------------------------------------#
#################################################################################################

# Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion 

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/kitso/.sdkman"
[[ -s "/home/kitso/.sdkman/bin/sdkman-init.sh" ]] && source "/home/kitso/.sdkman/bin/sdkman-init.sh"

#export STARSHIP_CONFIG=~/Dropbox/dotfiles/starship.toml
#eval "$(starship init zsh)"
