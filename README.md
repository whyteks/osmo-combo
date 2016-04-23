# osmo-combo


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

## Build

This will build and install all the packages.

```shell
make
```

## Applying/generating patches

Patches are stored in the `patches/xxx` subdirectories. Right now we provide patches to enable
static build, which are stored in the `patches/static-build` directory. Patches are stored in
a "file per project" format.

To apply a patchset:

```shell
./apply_patches.sh static-build
```

To generate/update a patchset:

```shell
./apply_patches.sh static-build
```
