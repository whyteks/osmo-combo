# osmo-combo

A "make world" build system for OpenBSC and related packages with an option to build everything statically with no external Osmocom dependancies.

Right now subprojects point to specific commits of all projects to make sure everything builds and runs properly. If you need another version - just update the git submodules.

## Checkout code with all submodules

Checkout this repo with all submodules.

``` shell
git clone https://github.com/fairwaves/osmo-combo.git
cd osmo-combo
git submodule init
git submodule update
```

## Configure

Open `Makefile` and edit `PREFIX` variable to your taste.

You may also want to edit `all` target to exclude/include certain projects from the build.

If you want a static build, run the following command to apply a relevant patchset:

```shell
./apply_patches.sh static-build
```

## Build

This will build and install all the packages.

```shell
make
```

`Make` generates status/timestamp files in the `build` directory which have `<project>.<status>` format, e.g.:
```
libosmocore.configured
libosmocore.installed
libosmocore.made
openbsc.configured
openbsc.installed
openbsc.made
... etc
```

These files are then used by `make` to check which steps has been successfully finished. So if you want to re-run a certain step, you should remove the corresponding file. E.g. if you want to re-build openbsc without re-configuring it, just remove the `openbsc.made` file.

## Applying/generating patches

Patches are stored in the `patches/xxx` subdirectories. Right now we provide patches to enable
static build, which are stored in the `patches/static-build` directory. Patches are stored in
a "file per project" format.

To apply a patchset:

```shell
./apply_patches.sh <dir>
```

To generate/update a patchset:

```shell
./apply_patches.sh <dir>
```
