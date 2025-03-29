alias vim="nvim"
alias ls="ls -ltr"

export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

#set starship config file location
export STARSHIP_CONFIG=~/.config/ghostty/starship.toml

# Docker autocomplete
FPATH="$HOME/.docker/completions:$FPATH"
autoload -Uz compinit
compinit

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

#Homebrew - must be at end of file
eval "$(/opt/homebrew/bin/brew shellenv)"

# starship.rs
eval "$(starship init zsh)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Auto-start tmux with custom config if it exists
if command -v tmux >/dev/null 2>&1 && [ -z "$TMUX" ]; then
  CUSTOM_TMUX_CONF="$HOME/.config/ghostty/tmux.conf"

  if [ -f "$CUSTOM_TMUX_CONF" ]; then
    tmux -f "$CUSTOM_TMUX_CONF" new-session -A -s default
  else
    tmux new-session -A -s default
  fi
fi
