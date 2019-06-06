#!/bin/bash

SCRIPTDIR=$(dirname $0)

#Execute gdb and connect to openocd via pipe
$OPENOCD/bin/openocd -f $SCRIPTDIR/openocd-genesys2.cfg &
$PULP_RISCV_GCC_TOOLCHAIN_CI/bin/riscv32-unknown-elf-gdb -x $SCRIPTDIR/elf_run.gdb $1 &
sleep 3
minicom -D /dev/ttyUSB0 -b 115200


trap "exit" INT TERM
trap "kill 0" EXIT
