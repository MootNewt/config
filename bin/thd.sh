#!/bin/bash

thd --daemon --user di0genes \
	--socket /var/run/thd.socket \
	--pidfile /var/run/thd.pid \
	--triggers /home/di0genes/triggerhappy.conf \
	/dev/input/event0
