if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
export PATH="$HOME/bin:$PATH"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git node npm dotenv zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting zsh-npm-scripts-autocomplete)

source $ZSH/oh-my-zsh.sh

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# exa
EXA_BASE="--all --long --git --octal-permissions --no-permissions --header --no-user --icons --color-scale"

alias ll="exa $EXA_BASE"
alias lll="exa $EXA_BASE --tree"
alias lll2="exa $EXA_BASE --tree --level 2"
alias lll3="exa $EXA_BASE --tree --level 3"