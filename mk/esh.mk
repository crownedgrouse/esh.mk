# 
#  ESH template engine plugin for Erlang.mk 
#  Licence : https://github.com/crownedgrouse/esh.mk/blob/master/LICENCE
#  Author : Eric Pailleau <esh.mk@crownegrouse.com>
#
esh_dir       = $(PWD)/.erlang.mk/esh.mk
esh_script    = $(esh_dir)/esh
esh_version   = 0.3.0
esh_tarball   = https://github.com/jirutka/esh/archive/v$(esh_version)/esh-$(esh_version).tar.gz
esh_templates != find $(PWD) -name '*.esh'

esh_init:
	@mkdir -p $(esh_dir)
	@test -f $(esh_script) || (cd /tmp/ && wget $(esh_tarball) && tar -xzf esh-$(esh_version).tar.gz && cd esh-$(esh_version) && mv -f esh $(esh_dir) && chmod +x $(esh_script) )

app:: esh

esh: esh_init
	$(foreach target,$(esh_templates),$(shell $(esh_script) -o $(target).out -- $(target)  $(ESH_VARS) && mv -f $(target).out $(dirname $(target))/$(basename $(target) .esh)))



