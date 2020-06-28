#
# Nicks ~/.zshrc
#

# Dab on the n00bs
neofetch

PATH="$HOME/.local/bin${PATH:+:${PATH}}"	#adding .local/bin to $PATH

# Prompt and Color
autoload -U colors && colors
PROMPT='[%F{cyan}%2~%f]%# ' 

# auto/tab complete
autoload -Uz compinit promptinit 
compinit 
promptinit 
zstyle ':completion:*' menu select
zmodload zsh/complist
setopt COMPLETE_ALIASES
zstyle 'completion::complete:*' gain-privileges 1
_comp_options+=(globdots)		# Include hidden files.

# History
HISTFILE=~/.config/zsh/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Vi mode 
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Alias values
setopt autocd extendedglob  # auto cd
alias ls='ls --color=auto'
alias feh='sw feh'
alias mpv='sw mpv'
alias vim='nvim'
alias la='ls -al'
alias mv='mv -i'
alias cp='cp -i'
alias rm='rm -i'
alias shutdown='sudo shutdown -h now'

# load zsh-syntax-highlighting; should be last
source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

