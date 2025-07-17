# some nitty gritty zsh stuff

[[ -d "$HOME/.config/zshrc" ]] && fpath=($HOME/.config/zshrc $fpath) || echo "zshrc config not found!"

autoload zsh_src zsh_eval

export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME=""

# zsh pluginsV
plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  web-search
  docker
  macos
  thefuck
  z
)

source $ZSH/oh-my-zsh.sh

export EDITOR="nvim"

zsh_eval /opt/homebrew/bin/brew shellenv
zsh_eval starship init zsh
zsh_eval thefuck --alias
zsh_eval zoxide init zsh
zsh_eval atuin init zsh

# FZF setup - TODO move to separate file

#export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
#export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
#export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

#init_fzf_compgen_path() {
#  fd --hidden --exclude .git . "$1"
#}
#_fzf_compgen_dir() {
#  fd --type=d --hidden --exclude .git . "$1"
#}
#zsh_src $HOME/private/fzf-git.sh/fzf-git.sh

#show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

#export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
#export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

#_fzf_comprun() {
#  local command=$1
#  shift
#
#  case "$command" in
#    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
#    export|unset) fzf --preview "eval 'echo ${}'"         "$@" ;;
#    ssh)          fzf --preview 'dig {}'                   "$@" ;;
#    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
#  esac
#}

zsh_eval fzf --zsh

# personal aliases
zsh_src $HOME/.private/ecdn_bom
zsh_src $HOME/.private/host_alias

alias cat="bat"
alias ls="eza --color=always --long --git --icons=always"
alias vi="nvim"
alias vim="nvim"
# [[ -f "$(which kitten)" ]] && alias ssh="kitten ssh"
zsh_src $HOME/.cargo/env

export GOOGLE_CLOUD_PROJECT="143569286330"
