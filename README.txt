emacs_config
============

一个简单的支持C语言的 GNU Emacs 配置.

A simple GNU Emacs config for c language.

BSD-3-Clause
Copyright (c) 2026 playerc@msn.cn

特性 Feature
------------

* 简单.
* 整洁.
* 最少下载. 

* Simple.
* Clean.
* Minamal download.

功能 Functions
--------------

1. 显示相对行号.
2. 显示行宽指示器.
3. 添加行间距.
4. 启用符号配对.
5. 启用选中区域大写转换.
6. 启用Tree-sitter-c,c++ 支持.
7. 启用保存时格式化代码.
8. 8空格缩进.
9. BSD 缩进风格.
10. 数字和运算符高亮.
11. 彩虹色定界符.
12. 自定义代码高亮主题.

1. Display relative line numbers.
2. Display fill column indicator.
3. Add line spacing.
4. Enable symbol pairing.
5. Enable region case conversion.
6. Enable Tree-sitter C/C++ support.
7. Enable format on save.
8. 8-space indentation.
9. BSD indentation style.
10. Highlight numbers and operators.
11. Rainbow delimiters.
12. Custom Code Highlighting Theme.
    
安装依赖 Install dependencies
-----------------------------

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
* Rainbow delimiters mode.
  https://github.com/Fanael/rainbow-delimiters

安装配置文件 Install config file
--------------------------------

复制 `src/init.el` 到 `~/.emacs.d/init.el` 即可.

Copy `src/init.el` to `~/.emacs.d/init.el` , done.

其他 Other
----------

* `pipe.sh` 提供了复制相关文件到 `~/.emacs.d` 的功能,使用前请检查其中的代码.
* `init.el` 中提供了 `project-new-c` 函数, 可以通过 `M-x` 在 GNU Emacs 中
  调用, 它会复制模板文件到当前文件所在的目录, 你可以根据需要修改它们.

* `pipe.sh` provides functionality to copy relevant files to
  `~/.emacs.d`. Please review the code before use.
* `init.el` provides the `project-new-c` function, which can be invoked
  via `M-x` in GNU Emacs. It copies template files to the directory of the
  current file; you may modify them as needed.

:~ EOF
