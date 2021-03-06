echo Executing ~/.bashrc . . . .

# Paths: tmux seems to invoke path_helper, so we need to
# do some trickery to avoid reordering of paths.
export PATH=":"
eval `/usr/libexec/path_helper -s`
export PATH="$PATH:$HOME/.cabal/bin:/usr/local/share/npm/bin"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
eval "rvm gemset use default > /dev/null"

export INFOPATH="/usr/local/share/info:/usr/share/info"
export NODE_PATH=/usr/local/lib/node_modules

# Add DocBook in XML toolchain 
export XML_CATALOG_FILES="/usr/local/etc/xml/catalog"

## Locale and language
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Global editor
export EDITOR="subl -n -w"
export VISUAL="subl -n -w"

# Terminal colours
export CLICOLOR=1
export LSCOLORS=Exfxcxdxbxegedabagacad

# Prompting
# export PS1='\n\n\n\[\e[37;40m\](\!) (\j)`__git_ps1` \[$(tput bold)\]▼  \w>\[$(tput sgr0)\]  ' 
export PS1='\n\n\n$(if [[ $? = "0" ]]; then echo "\[\e[37;40m\]"; else echo "\[\e[31;40m\]"; fi)(\!) (\j)`__git_ps1` \[$(tput bold)\]▼  \w>\[\e[37;40m$(tput sgr0)\]  ' 
export TERM="xterm-256color"
[ -n "$TMUX" ] && export TERM=screen-256color

# bash completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

# pip completion
eval "`pip completion --bash`"

# vi input mode for bash
set -o vi
bind -m vi-insert '"\C-l":clear-screen'
bind -m vi-insert '"jk":vi-movement-mode'
bind -m vi-insert '"kj":vi-movement-mode'

# Homebrew synaesthesia
export HOMEBREW_NO_EMOJI=1

# tmuxinator completion
source /Users/rammos/Dropbox/Dev/tmuxinator/bin/tmuxinator_completion

# Aliases
alias .=pwd
alias ..='cd ..'

alias proxyon='networksetup -setautoproxystate Wi-Fi on'
alias proxyoff='networksetup -setautoproxystate Wi-Fi off'
alias proxystatus='networksetup -getautoproxyurl Wi-Fi'

alias rm='rm -i'
alias ls='ls -alp'
alias cp='cp -n'
alias emate='emate -v'
alias mv='mv -i'
alias bcleanup='brew cleanup && rm -rf `brew --cache`'
alias bupdate='brew update && brew outdated'

function goto() { cd $(dirname "$@"); }
function gotow() { cd $(dirname `which "$@"`); } 

function cless () { pygmentize -g -O encoding=utf-8 -O style=monokai -f terminal256 "$1" | less -RN; }
function ccat () { pygmentize -g -O encoding=utf-8 -O style=monokai -f terminal256 "$1" | cat -n; }

alias lydoc='open /usr/local/opt/lilypond/share/doc/lilypond/html/index.html'
alias lyreg='open /usr/local/opt/lilypond/share/doc/lilypond/html/input/regression/collated-files.html'
alias lydocreg='lydoc && lyreg'
alias rdocs="rvm docs open"

alias books='cd ~/Dropbox/Book\ collection'
alias articles='cd ~/Dropbox/Article\ and\ chapter\ collection'
alias avanti='cd ~/Dropbox/Dissertation/avanti'
alias dissertation='cd ~/Dropbox/Dissertation'
alias nyustein='cd ~/Dropbox/Dissertation/LaTeX/nyustein'
alias dev='cd ~/Dropbox/Dev'
alias formula='cd `brew --prefix`//Library//Formula'
alias aaltoex='cd ~/Dropbox/Dev/MobileWebAppsExamples'
alias ftthemes='cd ~/Library/Containers/com.foldingtext.FoldingText/Data/Library/Application\ Support/FoldingText/Themes'

alias nyussh="ssh -2 -x theory.smusic.nyu.edu -l rammos"

echo . . . . done!

