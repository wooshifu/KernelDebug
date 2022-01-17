#!/usr/bin/env bash

set -euxo pipefail

cd /build/linux

make olddefconfig

./scripts/config --set-str SYSTEM_TRUSTED_KEYS ""
./scripts/config --set-val CONFIG_RANDOMIZE_BASE y
./scripts/config --set-val CONFIG_DEBUG_INFO y
./scripts/config --set-val CONFIG_DEBUG_INFO_DWARF4 y
./scripts/config --set-val CONFIG_SERIAL_KGDB_NMI y
./scripts/config --set-val CONFIG_GDB_SCRIPTS y
./scripts/config --set-val CONFIG_HAVE_ARCH_KGDB y
./scripts/config --set-val CONFIG_KGDB y
./scripts/config --set-val CONFIG_KGDB_HONOUR_BLOCKLIST y
./scripts/config --set-val CONFIG_KGDB_SERIAL_CONSOLE y

make -j`nproc` bzImage
