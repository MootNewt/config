export EDITOR='nano'

alias vi='nano'
alias vim='nano'
#alias vim="stty stop '' -ixoff ; vim"

alias please='sudo'
alias fucking='sudo'

alias zsh-update='source ~/.zshrc'
alias zshconfig='$EDITOR ~/.zshrc && zsh-update'
alias zshenv='$EDITOR ~/.zshenv && zsh-update'
alias tmuxconfig='$EDITOR ~/.tmux.conf && tmux source-file ~/.tmux.conf'
alias win32-gcc='x86_64-w64-mingw32-gcc-win32'
alias win32-g++='x86_64-w64-mingw32-g++-win32'

#info
alias grep="grep --color=always"
alias tree="tree --charset=ascii"
alias list='cat -n'
alias compgen='sort -u <(ls $path 2>/dev/null) <(zsh-functions) <(zsh-aliases)'
#alias compgen='{ foreach p in $path; do \
#ls $p 2>/dev/null; done; zsh-functions; zsh-aliases; } | sort -u'
#alias compgrep='compgen | GREP_COLORS="mt=01;32" grep'
alias compgrep='compgen | grep'
alias listgrep='list $@ | grep'

# compdef vman="man"
alias todo='grep -IrHn TODO'

#dev
alias vimconfig='$EDITOR ~/.vimrc'
dev="Makefile\|\.mk$\|\.[ch]$\|\.[ch]pp$\|\.frag$\|\.vert$"
dev+="\|\.lua$\|\.py$\|\.s$\|\.lst$"
alias -s c='nano' cpp='nano' tpp='nano' h='nano' hpp='nano' mk='nano'
alias -s lua='nano' frag='nano' vert='nano'
alias -s mp3='vlc'

#alias lessh='LESSOPEN="| source-highlight %s -o STDOUT" less -M '

alias filter-sed='sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]//g"'
alias Makefile='$EDITOR Makefile'
alias readme='nano `ls -R | grep -i readme`'
alias sloc='xargs wc -l'
alias find-sloc='find . -type f | grep $dev | sloc | column | grep "[0-9]* "'
alias wrap-column="sed -e 's/.\{'$(($COLUMNS/2-4))'\}/&\n/g' | column"

#pacman
alias install='_ pacman -S'
alias remove='_ pacman -R'
alias clean='_ pacman '-Sc'
alias update='_ pacman '-Syyu'

#net
alias firefox='firefox --new-tab'
alias -s com='firefox'
alias -s org='firefox'

#env
local new_path=(
"$HOME/bin"
"/usr/bin/core_perl"
"/usr/local/sbin"
"/usr/local/bin"
"/usr/sbin"
"/usr/bin"
"/usr/games"
"/usr/local/games"
"/sbin"
"/bin")
local new_manpath=(
"$HOME/.man"
"/usr/local/man"
"$HOME/.linuxbrew/share/man")

new_ldpath=(
"$HOME/lib"
"$HOME/workspace/boost_1_62_0/stage/lib/"
# "$HOME/Downloads/llvm/lib"
"/usr/lib/python3.5/config-3.5m-x86_64-linux-gnu"
"/usr/lib/python2.7/config-x86_64-linux-gnu"
"/usr/local/lib"
"/usr/lib"
"/lib")
old_ifs="$IFS"
export IFS=":"
export PATH="${new_path[*]}"
export MANPATH="${new_manpath[*]}:$MANPATH"
export LD_LIBRARY_PATH="${new_ldpath[*]}:$LD_LIBRARY_PATH"
export IFS="$old_ifs"

#zsh
export TERM="screen-256color"

export UPDATE_FPS=10
export UPDATE_DELAY=$((1.0/$UPDATE_FPS))

COMPLETION_WAITING_DOTS="true"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(background_jobs context dir)
POWERLEVEL9K_DIR_HOME_BACKGROUND='black'
POWERLEVEL9K_DIR_HOME_FOREGROUND='white'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='black'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='white'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='black'
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='white'
plugins=(git gitfast github wd zsh-_url-httplink)

# ZSH_THEME="bullet-train/bullet-train"
ZSH_THEME="powerlevel9k/powerlevel9k"

export ZSH=~/.oh-my-zsh
source $ZSH/oh-my-zsh.sh
unalias grep
source ~/.zshenv

# Trim newlines from each prompt; fixes Bullet-Train bug (n/a for PL9K)
export PROMPT="$(tr -d '\n' <<< $PROMPT)"
export PS1="$(tr -d '\n' <<< $PS1)"
export PS2="$(tr -d '\n' <<< $PS2)"
export PS3="$(tr -d '\n' <<< $PS3)"
export PS4="$(tr -d '\n' <<< $PS4)"

# Aliases that should override OMZ go here
alias grep='grep --color=auto'
alias ls='ls -Ap --color=tty'

# Run exactly one instance of Triggerhappy
# Add the script as NOPASSWD entry to /etc/sudoers to skip prompt
pidof thd >/dev/null || sudo ~/bin/thd.sh
