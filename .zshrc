
[ -n "$TMUX" ] && printf "\033]2;tmux/zsh\033\\"
[ -n "$ZSHRC_FORCED" ] && export ZSHRC_SOURCED=0
[ -n "$ZSHRC_FORCE" ] && export ZSHRC_FORCE=0

export EDITOR='nano'

alias vi='nano'
alias vim='nano'
#alias vim="stty stop '' -ixoff ; vim"

alias -g ~ws=~/workspace
alias -g ~dl=~/Downloads

alias please='sudo'
alias fucking='sudo'

#term
alias zsh-update='source ~/.zshrc'
alias zshconfig='$EDITOR ~/.zshrc && zsh-update'
alias zshenv='$EDITOR ~/.zshenv && zsh-update'
alias tmuxconfig='$EDITOR ~/.tmux.conf && tmux source-file ~/.tmux.conf'

#info
alias tree="tree --charset=ascii"
alias list='cat -n'
alias compgen='sort -u <(ls $path 2>/dev/null) <(zsh-functions) <(zsh-aliases)'
alias count-chars='sed "s/\(.\)/\1\n/g" | grep -o ".\+" | wc -l'
alias filter-sed='sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]//g"'
alias wrap-column="sed -e 's/.\{'$(($COLUMNS/2-4))'\}/&\n/g' | column"
alias compgrep='compgen | grep'
alias listgrep='list $@ | grep'

#search
# List file and line of matches in given files or files in subdirectories
alias irhn='grep -IrHn'
# List as above; any mention of TODO
alias todo='irhn TODO'

#dev
alias win32-gcc='x86_64-w64-mingw32-gcc-win32'
alias win32-g++='x86_64-w64-mingw32-g++-win32'
alias vimconfig='$EDITOR ~/.vimrc'
dev="Makefile\|\.mk$\|\.[ch]$\|\.[ch]pp$\|\.frag$\|\.vert$"
dev+="\|\.lua$\|\.py$\|\.s$\|\.lst$"
alias -s c='nano' cpp='nano' tpp='nano' h='nano' hpp='nano' mk='nano'
alias -s lua='nano' frag='nano' vert='nano'
alias -s mp3='vlc'

alias filter-sed='sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]//g"'
alias Makefile='$EDITOR Makefile'
alias readme='nano `ls -R | grep -i readme`'
alias sloc='xargs wc -l'
alias find-sloc='find . -type f | grep $dev | sloc | column | grep "[0-9]* "'
alias wrap-column="sed -e 's/.\{'$(($COLUMNS/2-4))'\}/&\n/g' | column"
alias set-grep='set|grep -a'

#pacman
alias install='_ pacman -S'
alias remove='_ pacman -R'
alias clean='_ pacman -Sc'
alias update='_ pacman -Syyu'

#net
alias firefox='firefox --new-tab'
alias -s com='firefox'
alias -s org='firefox'
alias google='web-search "google.com/search?q="'
alias google-images='web-search "google.com/search?tbm=isch&q="'
alias gimgs='google-images'
alias duckduckgo='web-search "duckduckgo.com/?q="'
alias ddg='duckduckgo'
alias duckduckgo-images='web-search "duckduckgo.com/?ia=images&iax=1&q="'
alias ddgimgs='duckduckgo-images'
alias wiki='web-search "en.wikipedia.org/w/index.php?search="'
alias youtube='web-search "youtube.com/results?q="'

#git
alias dryad='gaa -n'
alias gaan='dryad'

#sys
alias ns='notify-send'
alias nsc='notify-send -u critical'

#misc
alias washer='sleep 1800 && nsc "Washer"'
alias dryer='sleep 2700 && nsc "Dryer"'

#env
if [ "$ZSHRC_SOURCED" -eq 0 ]; then
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
	"/usr/local/man")

	new_ldpath=(
	"$HOME/lib"
	"$HOME/workspace/boost_1_62_0/stage/lib/"
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
fi

export co_user="231"
export co_root="221"
local co_wt="38;5;255"
local co_lg="38;5;155"
local co_lg="38;5;143"
local co_lg="38;5;215"
local co_lg="38;5;221"
local at=$(printf "\u273b")

BULLETTRAIN_PROMPT_ORDER=(time custom dir cmd_exec_time status)
BULLETTRAIN_PROMPT_SEPARATE_LINE=false
BULLETTRAIN_PROMPT_ADD_NEWLINE=false
BULLETTRAIN_DIR_CONTEXT_SHOW=false
BULLETTRAIN_CUSTOM_MSG="\$(printf '%%n %s %%m' $at)"
BULLETTRAIN_STATUS_EXIT_SHOW=true
BULLETTRAIN_EXEC_TIME_ELAPSED=0
BULLETTRAIN_PROMPT_CHAR=$at

BG_PALETTE=(202 208 214 220 220 221 222)
BULLETTRAIN_TIME_BG=${BG_PALETTE[1]}
BULLETTRAIN_CUSTOM_BEG=${BG_PALETTE[2]}
BULLETTRAIN_DIR_BG=${BG_PALETTE[3]}
BULLETTRAIN_STATUS_BG=${BG_PALETTE[6]}
BULLETTRAIN_STATUS_ERROR_BG=${BG_PALETTE[6]}
BULLETTRAIN_EXEC_TIME_BG=${BG_PALETTE[5]}

for v ('TIME_FG' 'CUSTOM_FG' 'CONTEXT_FG' 'DIR_FG'
	'STATUS_FG' 'STATUS_ERROR_FG' 'EXEC_TIME_FG') \
		export "BULLETTRAIN_$V"=16;

# COMPLETION_WAITING_DOTS="true"
# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(background_jobs context dir)
# POWERLEVEL9K_DIR_HOME_BACKGROUND='black'
# POWERLEVEL9K_DIR_HOME_FOREGROUND='white'
# POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='black'
# POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='white'
# POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='black'
# POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='white'
plugins=(git gitfast github wd zsh-_url-httplink)

ZSH_THEME="bullet-train/bullet-train"
# ZSH_THEME="powerlevel9k/powerlevel9k"

if [ "$ZSHRC_SOURCED" -eq 0 ] || [ "$ZSHRC_FORCE" -eq 1 ]; then
	export ZSH=~/.oh-my-zsh
	source $ZSH/oh-my-zsh.sh
fi
export ZSHRC_SOURCED=$((ZSHRC_SOURCED+1))

# source $ZSH/oh-my-zsh.sh
# unalias grep

# Trim newlines from each prompt; fixes Bullet-Train bug (n/a for PL9K)
# export PROMPT="$(tr -d '\n' <<< $PROMPT)"
# export PS1="$(tr -d '\n' <<< $PS1)"
# export PS2="$(tr -d '\n' <<< $PS2)"
# export PS3="$(tr -d '\n' <<< $PS3)"
# export PS4="$(tr -d '\n' <<< $PS4)"

# Aliases that should override OMZ go here
# alias grep='grep --color=auto'
# alias ls='ls -Ap --color=tty'
alias grep >&/dev/null && \
	unalias grep && alias grep='grep --color=auto'
alias ls >&/dev/null && \
	unalias ls && alias ls='ls -Ap --color=tty'

export GREP_COLORS='sl='$co_wt';;1:mt='$co_lg':'\
'cx=2:se='$co_wt';;1:fn='$co_dg':ln='$co_dg
eval "$(dircolors -b ~/.dircolors)"
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# Run exactly one instance of Triggerhappy
# Add the script as NOPASSWD entry to /etc/sudoers to skip prompt
pidof thd >/dev/null || sudo ~/bin/thd.sh
source ~/.zshenv
