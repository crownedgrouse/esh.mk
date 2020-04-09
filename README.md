# esh.mk

This is an erlang.mk plugin to use the `esh` template engine.

See [esh project](https://github.com/jirutka/esh) and [esh man page](https://github.com/jirutka/esh/blob/master/esh.1.adoc) .

## Install

```make
BUILD_DEPS = esh.mk
DEP_PLUGINS = esh.mk

include erlang.mk
```

if a specific branch or version is required, use this syntax :

```make
BUILD_DEPS = esh.mk
dep_esh.mk = git https://github.com/crownedgrouse/esh.mk master  # for branch master

include erlang.mk
```



## Override environment variables

If environment variables need to be overidden, variable `ESH_VARS` can be used.
Declaration can to be done before make command, or set in `Makefile` file.

```shell
$> ESH_VARS="logs_dir=/var/log tmp_dir=/tmp " make esh
``` 

```make
BUILD_DEPS = esh.mk
DEP_PLUGINS = esh.mk
ESH_VARS="logs_dir=/var/log tmp_dir=/tmp "

include erlang.mk
```
