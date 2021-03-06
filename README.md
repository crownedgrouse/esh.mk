# esh.mk

This is an [erlang.mk plugin](https://erlang.mk/) to use the `esh` template engine.

See [esh project](https://github.com/jirutka/esh) and [esh man page](https://github.com/jirutka/esh/blob/master/esh.1.adoc) .

This plugin can be used to generate any Erlang project file which content can depends of OS or environment.

## Install

```make
BUILD_DEPS = esh_mk
DEP_PLUGINS = esh_mk

include erlang.mk
```

if a specific branch or version is required, use this syntax :

```make
BUILD_DEPS = esh_mk
dep_esh_mk = git https://github.com/crownedgrouse/esh.mk master  # for branch master

include erlang.mk
```

## Usage

Once esh plugin declared in your project's Makefile, simply run :

```shell
$> make esh          # Generate targets from esh templates only
```
or
```shell
$> make app          # Generate targets from esh templates before app
```

First call will show the wget command output to download `esh` tarball. If some proxy parameters are needed, considere use of [`wgetrc` file](https://www.gnu.org/software/wget/manual/html_node/Startup-File.html#Startup-File).

Any file with suffix `.esh` found under project's root directory will be treated and a target file generated in same directory with same name without `.esh` suffix.

For instance :
- `.config` files
- `vm.args` file

No output is displayed unless a syntax error occurs. In such case error will be printed.

## Common caveat

As `make` is using `/bin/sh` by default, underneath command `esh` is launched with this shell too by default. 
If your current shell is not `/bin/sh` and your template is using environment variables in any way, you must tell `make` and `esh` to use your prefered shell.

For instance for `/bin/bash` :

```shell
export MAKESHELL=$SHELL ; export ESH_SHELL=$MAKESHELL

```

## Override environment variables

If environment variables need to be overridden, variable `ESH_VARS` can be used.
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
See also next section Help for other esh variables.

## Help

Using erlang.mk `help-plugins` target will tell you that target `esh_help` will output `esh` script help. This help will show you other variables available to tune `esh`.

## Force update/install

In order to force install or update again, considere removing `.erlang.mk/esh.mk/` and `deps/esh.mk/` directories.

