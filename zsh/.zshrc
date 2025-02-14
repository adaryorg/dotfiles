export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export ZSH="$HOME/.oh-my-zsh"


eval "$(starship init zsh)"
eval "$(thefuck --alias)"
# ---- Zoxide (better cd) ----
eval "$(zoxide init zsh)"

# -- FZF stuff --
eval "$(fzf --zsh)"

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}
if [ -f ~/private/fzf-git.sh/fzf-git.sh ]
then
    source ~/private/fzf-git.sh/fzf-git.sh
fi
# -- End FZF stuff -- 

# -- Previews --
show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo ${}'"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}
# -- End Previews --


export EDITOR="nvim"
export PATH=/opt/homebrew/bin:$PATH

# zsh plugins
plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  web-search
  docker
  kubectl
)

source $ZSH/oh-my-zsh.sh
ZSH_THEME=""
# personal aliases
if [ -f ~/.private/ecdn_bom ]
then
    source ~/.private/ecdn_bom
fi
if [ -f ~/.private/host_alias ]
then
    source ~/.private/host_alias
fi

#
alias cat="bat"
alias ls="eza --color=always --long --git --icons=always"
alias cd="z"
alias vi="nvim"
alias vim="nvim"

if [ -f $HOME/.cargo/env ]
then
    . $HOME/.cargo/env
fi

