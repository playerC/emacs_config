##############
 emacs_config
##############

一个简单的支持C语言的 GNU Emacs 配置.

A simple GNU Emacs config for c language.

BSD-3-Clause
Copyright (c) 2026 playerc@msn.cn

特性 Feature
============

* 简单.
* 整洁.
* 最少下载. 

* Simple.
* Clean.
* Minamal download.

功能 Functions
==============

1. 显示相对行号.
#. 显示行宽指示器.
#. 添加行间距.
#. 启用符号配对.
#. 启用选中区域大写转换.
#. 启用Tree-sitter-c,c++ 支持.
#. 启用保存时格式化代码.
#. 8空格缩进.
#. BSD 缩进风格.
#. 数字和运算符高亮.

1. Display relative line numbers.
#. Display fill column indicator.
#. Add line spacing.
#. Enable symbol pairing.
#. Enable region case conversion.
#. Enable Tree-sitter C/C++ support.
#. Enable format on save.
#. 8-space indentation.
#. BSD indentation style.
#. Highlight numbers and operators.
      
安装依赖 Install dependencies
=============================

* GNU Emacs.
  https://www.gnu.org/software/emacs/
* CMake ( to compile Tree-sitter-cpp).
  https://cmake.org/download/
* LLVM & Clang & Clangd & Clang-format. 
  https://releases.llvm.org/download.html
* Tree-sitter.
  https://github.com/tree-sitter/tree-sitter
* Tree-sitter-c.
  https://github.com/tree-sitter/tree-sitter-c
* Trea-sitter-cpp ( if not with this, c-ts-mode have warnings.).
  https://github.com/tree-sitter/tree-sitter-cpp
* 0xProto font.
  https://github.com/0xType/0xProto

安装配置文件 Install config file
================================

复制 `src/init.el` 到 `~/.emacs.d/init.el` 即可.

Copy `src/init.el` to `~/.emacs.d/init.el` , done.

其他 Other
==========

* `pipe.sh` 提供了复制相关文件到 `~/.emacs.d` 的功能,使用前请检查其中的代码.
* `init.el` 中提供了 `project-new-c` 函数, 可以通过 `M-x` 在 GNU Emacs 中
  调用, 它会复制模板文件到当前文件所在的目录, 你可以根据需要修改它们.

* `pipe.sh` provides functionality to copy relevant files to
  `~/.emacs.d`. Please review the code before use.
* `init.el` provides the `project-new-c` function, which can be invoked
  via `M-x` in GNU Emacs. It copies template files to the directory of the
  current file; you may modify them as needed.

:~ EOF
