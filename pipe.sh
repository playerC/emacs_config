#!/usr/bin/env bash
TDIR=~/.emacs.d/
SDIR=./src/

DCDIR=./src.config
TDCDIR=~/.config

cp ${SDIR}init.el ${TDIR} \
    && cp ${SDIR}clang-format.yaml ${TDIR} \
    && cp ${SDIR}clangd.yaml ${TDIR} \
    &&  echo copy init.el [OK]

cp -rf ${SDIR}themes ${TDIR} && echo copy themes [OK]

cp -rf ${DCDIR} ${TDCDIR} && echo copy .config dir [OK]

##:~ EOF
