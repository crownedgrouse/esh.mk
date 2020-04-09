# 
#  ESH template engine plugin for Erlang.mk 
#  Licence : https://github.com/crownedgrouse/esh.mk/blob/master/LICENCE
#  Author : Eric Pailleau <esh.mk@crownegrouse.com>
#

help::
	@printf "%s\n" "  esh            Apply esh template engine plugin"


THIS := $(dir $(realpath $(lastword $(MAKEFILE_LIST))))
include $(THIS)/mk/esh.mk
