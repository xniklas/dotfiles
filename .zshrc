# >>> reference: https://carlosneto.dev/blog/2024/2024-02-08-starship-zsh/

# ALIAS

# EXPORTS
export LANG="en_US.UTF-8"
export EDITOR="nvim"
export STARSHIP_CONFIG=~/.config/starship/starship.toml
# include user-specific binaries and scripts
export PATH="$HOME/.local/bin:$PATH"
# add Rust binaries to the PATH
export PATH="$PATH:$HOME/.cargo/bin"
# add Go binaries to the PATH
export PATH="$PATH:$HOME/go/bin"

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

# append new history entries to the history file
setopt APPEND_HISTORY

# save each command to the history file as soon as it is executed
setopt INC_APPEND_HISTORY

# ignore commands that start with a space in the history
setopt HIST_IGNORE_SPACE

# >>> load ZSH plugin

# enable kubectl plugin autocompletion
autoload -Uz compinit
compinit

# load zsh-autosuggestions
source "$HOME/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"

# load zsh-syntax-highlighting
source "$HOME/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# start Starship prompt
eval "$(starship init zsh)"
