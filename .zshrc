# >>> reference: https://carlosneto.dev/blog/2024/2024-02-08-starship-zsh/

# ============================================================================ #
# ░█▀█░█░░░▀█▀░█▀█░█▀▀
# ░█▀█░█░░░░█░░█▀█░▀▀█
# ░▀░▀░▀▀▀░▀▀▀░▀░▀░▀▀▀
# ============================================================================ #

alias ls="eza --icons --group-directories-first"
alias ll="eza -la --icons --group-directories-first --header"
alias lt="eza --tree --level=2 --icons"
alias la="eza -la --icons --group-directories-first"
alias l="eza -l --icons --group-directories-first"

alias llt="eza -la --tree --level=2 --icons"
alias lls="eza -la --icons --group-directories-first --sort=size"
alias llm="eza -la --icons --group-directories-first --sort=modified"

alias tree="eza --tree --icons"
alias tree2="eza --tree --level=2 --icons"
alias tree3="eza --tree --level=3 --icons"
alias treed="eza --tree --only-dirs --icons"

alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias doc="cd ~/Documents"
alias dev="cd ~/dev"
alias conf="cd ~/.config"

alias pacin="sudo pacman -S"
alias pacup="sudo pacman -Syu"
alias pacse="pacman -Ss"
alias pacre="sudo pacman -R"
alias pacrem="sudo pacman -Rns"
alias pacinfo="pacman -Si"
alias paclocal="pacman -Qi"
alias paclog="cat /var/log/pacman.log | tail -n 20"

alias yin="yay -S"
alias yup="yay -Syu"
alias yse="yay -Ss"
alias yrem="yay -Rns"

alias g="git"
alias ga="git add"
alias gaa="git add ."
alias gc="git commit"
alias gcm="git commit -m"
alias gca="git commit -am"
alias gp="git push"
alias gpl="git pull"
alias gs="git status"
alias gst="git status -s"
alias gd="git diff"
alias gdc="git diff --cached"
alias gl="git log --oneline --graph --decorate"
alias gb="git branch"
alias gba="git branch -a"
alias gco="git checkout"
alias gcb="git checkout -b"
alias gm="git merge"
alias gr="git remote"
alias grv="git remote -v"
alias gf="git fetch"
alias gcl="git clone"

alias py="python"
alias py3="python3"

alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"
alias rg="rg --pretty --smart-case"

alias topupsys="topgrade -k --only system"

# ============================================================================ #
# ░█▀▀░█░█░█▀█░█▀█░█▀▄░▀█▀░█▀▀
# ░█▀▀░▄▀▄░█▀▀░█░█░█▀▄░░█░░▀▀█
# ░▀▀▀░▀░▀░▀░░░▀▀▀░▀░▀░░▀░░▀▀▀
# ============================================================================ #

export LANG="en_US.UTF-8"
export EDITOR="nvim"
export STARSHIP_CONFIG=~/.config/starship/starship.toml

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_DIRS="$HOME/.local/share/flatpak/exports/share:/var/lib/flatpak/exports/share:/usr/local/share:/usr/share:$XDG_DATA_DIRS"

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.npm-global/bin:$PATH"

# system wide cli
# export PATH="$PATH:/usr/local/bin"

# set the location and filename of the history file
export HISTFILE="$HOME/.zsh_history"

# set the maximum number of lines to be saved in the history file
export HISTSIZE="100000"
export SAVEHIST="$HISTSIZE"

# fzf parameters used in all widgets - configure layout and wrapped the preview results (useful in large command rendering)
# export FZF_DEFAULT_OPTS="--height 100% --layout reverse --preview-window=wrap"

# CTRL + R: put the selected history command in the preview window - "{}" will be replaced by item selected in fzf execution runtime
# export FZF_CTRL_R_OPTS="--preview 'echo {}'"

# CTRL + T: set "fd-find" as search engine instead of "find" and exclude .git for the results
# export FZF_CTRL_T_COMMAND="fd --exclude .git --ignore-file $HOME/.my-custom-zsh/.fd-fzf-ignore"

# CTRL + T: put the file content if item select is a file, or put tree command output if item selected is directory
# export FZF_CTRL_T_OPTS="--preview '[ -d {} ] && tree -C {} || bat --color=always --style=numbers {}'"

# =========================================================================== #
# ░█▀█░█▀█░▀█▀░▀█▀░█▀█░█▀█░█▀▀
# ░█░█░█▀▀░░█░░░█░░█░█░█░█░▀▀█
# ░▀▀▀░▀░░░░▀░░▀▀▀░▀▀▀░▀░▀░▀▀▀
# =========================================================================== #

# append new history entries to the history file
setopt APPEND_HISTORY

# save each command to the history file as soon as it is executed
setopt INC_APPEND_HISTORY

# ignore commands that start with a space in the history
setopt HIST_IGNORE_SPACE

# =========================================================================== #
# ░█▀█░█░░░█░█░█▀▀░▀█▀░█▀█░█▀▀
# ░█▀▀░█░░░█░█░█░█░░█░░█░█░▀▀█
# ░▀░░░▀▀▀░▀▀▀░▀▀▀░▀▀▀░▀░▀░▀▀▀
# =========================================================================== #

autoload -Uz compinit
compinit

# load zsh-autosuggestions
source "$HOME/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"

# load zsh-syntax-highlighting
source "$HOME/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# start Starship prompt
eval "$(starship init zsh)"
