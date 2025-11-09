# ---- PATH exports ----
# Note: $HOMEBREW_PREFIX is set by brew shellenv in .zprofile
export PATH="$HOMEBREW_PREFIX/bin:$HOMEBREW_PREFIX/opt/openjdk/bin:$PATH"
export PATH="$PATH:/Users/spyros/.lmstudio/bin"

# ---- Completions ----
fpath=(/Users/spyros/.docker/completions $fpath)
zstyle ':compinstall' filename "$HOME/.zshrc"
autoload -Uz compinit
compinit -C

# Tab completion ignore case
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

# ---- History ----
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# ---- Zsh options ----
setopt PROMPT_SUBST          # Allow prompt substitution
setopt CORRECT               # Spell correction for commands
setopt AUTO_CD               # cd into dirs by name
setopt HIST_IGNORE_DUPS      # Don't record duplicate commands
setopt SHARE_HISTORY         # Share history across sessions
setopt INC_APPEND_HISTORY    # Append to history immediately

# ---- Git branch in prompt setup ----
autoload -Uz vcs_info
autoload -Uz add-zsh-hook
add-zsh-hook precmd vcs_info

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' formats " %F{cyan}(%b)%f"
zstyle ':vcs_info:*' actionformats " %F{cyan}(%b|%a)%f"
zstyle ':vcs_info:*' stagedstr "%F{green}"
zstyle ':vcs_info:*' unstagedstr "%F{red}"
zstyle ':vcs_info:*' check-for-changes true

# Show untracked files indicator
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
+vi-git-untracked() {
  [[ $(git rev-parse --is-inside-work-tree 2>/dev/null) == "true" ]] || return
  git ls-files --others --exclude-standard --directory | grep -q . && hook_com[staged]+="%F{red}"
}

# ---- Prompt ----
# Yellow current directory, cyan git branch, > arrow
PROMPT=$'\n%F{yellow}%~%f$vcs_info_msg_0_ > '

# ---- Plugins ----
source "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

# ---- Tools ----
eval "$(zoxide init zsh)"

# ---- Aliases ----
alias telnet="nc -vz"
