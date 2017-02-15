#!/bin/bash

wpid=$(xdotool getwindowfocus getwindowpid)
grep tmux -a <(pstree "$wpid") /dev/null | grep -v grep >/dev/null \
	&& $*
#grep tmux -a <(ps --cumulative -h --ppid "$wpid") >/dev/null \
#	&& $*
