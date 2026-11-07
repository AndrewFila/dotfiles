export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(git zsh-syntax-highlighting zsh-autosuggestions node npm)

source $ZSH/oh-my-zsh.sh

# Prompt
PROMPT='💻 %F{cyan}%n%f %F{yellow}%~%f $(git_prompt_info)
%F{green}❯%f '

# Aliases
alias vim="nvim"
alias vi="nvim"
alias ll='ls -la'
alias gs='git status'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline --graph'
alias build='npm run build'

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Go to projects
export PROJECTS="$HOME/projects"
alias proj='cd $PROJECTS'
export PATH="$HOME/.local/bin:$PATH"

# Machine-specific / private settings (not tracked)
[ -f "$HOME/.zshrc.local" ] && source "$HOME/.zshrc.local"
