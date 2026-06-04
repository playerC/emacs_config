#!/usr/bin/env bash
TDIR=~/.emacs.d/
SDIR=./src/

cp ${SDIR}init.el ${TDIR} \
    && cp ${SDIR}clang-format.yaml ${TDIR} \
    && cp ${SDIR}clangd.yaml ${TDIR} \
    &&  echo [OK]

cp -rf ${SDIR}themes ${TDIR} && echo [OK]

##:~ EOF
