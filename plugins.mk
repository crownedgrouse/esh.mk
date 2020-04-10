# 
#  ESH template engine plugin for Erlang.mk 
#  Licence : https://github.com/crownedgrouse/esh.mk/blob/master/LICENCE
#  Author : Eric Pailleau <esh.mk@crownegrouse.com>
#  Version : 1.0.0

help-plugins::
	@printf "%s\n" "  esh            Apply esh template engine plugin"
	@printf "%s\n" "  esh_help       Help of esh template engine"


THIS := $(dir $(realpath $(lastword $(MAKEFILE_LIST))))
include $(THIS)/mk/esh.mk

test::
	@$(MAKE) -f $(realpath $(lastword $(MAKEFILE_LIST))) esh && diff test/test1.ref test/test1
