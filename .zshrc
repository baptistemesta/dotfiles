# Path to your oh-my-zsh installation.
export ZSH=/Users/baptiste/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="terminalparty"
#ZSH_THEME="agnoster"
#ZSH_THEME="bmesta"
ZSH_THEME="jonathan"
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
plugins=(git jump autojump history tig)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

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
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#eval "$(hub alias -s)"
alias hgrep="fc -El 0 | grep"
alias tailf="tail -f -n 500"
#alias gw="sh gradlew"
alias gcd="git checkout dev"
# show last 10 modified branched
alias glb="git for-each-ref --count=10 --sort=-committerdate refs/heads/ --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:red)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:green)%(committerdate:relative)%(color:reset))'"
# force update of branch dev
alias gupdev="git fetch && git branch --force dev origin/dev"
# force update of branch master
alias gupmaster="git fetch && git branch --force master origin/master"
# rebase last commit of current branch onto master
alias grbmaster="git rebase --onto master HEAD~"
# rebase last commit of current branch onto dev
alias grbdev="git rebase --onto dev HEAD~"
alias gprreview="git commit -a -m 'PR Review'"

getGitChildren(){
	git rev-list --all --parents | grep "^.\{40\}.*${1}.*" | awk '{print $1}' | xargs -I commit git log -1 --oneline commit | cat -
}

fpath=(~/.zsh/completions $fpath) 
autoload -U compinit && compinit

export GOPATH="${HOME}/.go"
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin:$HOME/bin"

test -d "${GOPATH}" || mkdir "${GOPATH}"
test -d "${GOPATH}/src/github.com" || mkdir -p "${GOPATH}/src/github.com"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/baptiste/.sdkman"
[[ -s "/Users/baptiste/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/baptiste/.sdkman/bin/sdkman-init.sh"


#export PATH=/Users/baptiste/.local/bin/luna-studio:$PATH
export PATH="/usr/local/opt/postgresql@9.4/bin:$PATH"
export PATH="/usr/local/opt/node@8/bin:$PATH"
#export PATH="$PATH:/Users/baptiste/work/istio-1.0.5/bin"
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"


export BAT_THEME="OneHalfLight"


test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export PATH="/usr/local/opt/mysql-client/bin:$PATH"

eval "$(starship init zsh)"

# Added by Amplify CLI binary installer
export PATH="$HOME/.amplify/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
