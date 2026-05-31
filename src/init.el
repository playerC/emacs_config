;; File: ~/.emacs.d/init.el
;; License: BSD-3-Clause
;;
;; Copyright (c) 2026 playerc@msn.cn .
;;
;; Redistribution and use in source and binary forms, with or without
;; modification, are permitted provided that the following conditions
;; are met:
;;
;;     1. Redistributions of source code must retain the above
;;     copyright notice, this list of conditions and the following
;;     disclaimer.
;;
;;     2. Redistributions in binary form must reproduce the above
;;     copyright notice, this list of conditions and the following
;;     disclaimer in the documentation and/or other materials provided
;;     with the distribution.
;;
;;     3. Neither the name of the copyright holder nor the names of
;;     its contributors may be used to endorse or promote products
;;     derived from this software without specific prior written
;;     permission.
;;
;; THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
;; "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
;; LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
;; FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
;; COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
;; INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
;; (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
;; SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
;; HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
;; STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
;; ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
;; OF THE POSSIBILITY OF SUCH DAMAGE.
;;

(defconst OFF -1 "mod off value")
(defconst ON 1 "mod on value")

;;== save emacs edit to other file.

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file :no-error :no-message))

;;== setup native-comp

;; there are some issue on `native-compile` .

;;(setq native-comp-verbose 0)
;;(setq byte-compile-debug 0)
;;(setq native-comp-debug 0)
;;(setq native-comp-jit-compilation t)
;;=== set debug flag makes it not crash
;;(setq native-comp-driver-options '("-g3 -lsetjmp") )

;;== setup globle ui.

;; set vars use ON/nil
(setq display-line-numbers-grow-only ON)
(setq display-line-numbers-type 'relative)
(setq inhibit-startup-screen ON)
(setq-default indent-tabs-mode OFF)

(global-display-line-numbers-mode ON)
(global-completion-preview-mode ON)
(global-display-fill-column-indicator-mode ON)

;; setup mode use ON/OFF
;; ON
(which-key-mode ON)

;; OFF

(scroll-bar-mode OFF)
(tab-bar-mode OFF)
(tool-bar-mode OFF)
(menu-bar-mode OFF)

;;== setup text layout

(setq-default line-spacing 1)

;;(global-whitespace-mode ON)

;;== setup text functions

(electric-pair-mode ON)

;;=== enable upcase-region.

(put 'upcase-region 'disabled nil)

;;== c-ts-mode

(add-to-list 'major-mode-remap-alist '(c-mode . c-ts-mode))
(add-to-list 'major-mode-remap-alist '(c++-mode . c++-ts-mode))
(add-to-list 'major-mode-remap-alist
             '(c-or-c++-mode . c-or-c++-ts-mode))

(add-to-list 'auto-mode-alist '("\\.c\\'" . c-ts-mode))
(add-to-list 'auto-mode-alist '("\\.h\\'" . c-ts-mode))

(add-to-list 'auto-mode-alist '("\\.cpp\\'" . c++-ts-mode))

;;== setup eglot(lsp)

(add-hook 'c-ts-mode-hook #'eglot-ensure)
(add-hook 'c++-ts-mode-hook #'eglot-ensure)

;;=== set eglot format on save.

(defun my/eglot-mm-hook ()
  "format source code on save."
  (add-hook 'before-save-hook
	    #'eglot-format-buffer nil t
	    );;~ add-hook
    );;~ defun

(add-hook 'eglot-managed-mode-hook
          #'my/eglot-mm-hook
	  );;~ add-hook

;;== setup coding style

(setq-default c-ts-mode-indent-offset 8)
(setq-default c-ts-mode-indent-style 'bsd)

;;== setup color theme

(setq-default font-lock-maximum-decoration t)
(setq-default treesit-font-lock-level 4)

(custom-set-variables
 '(custom-enabled-themes '(modus-vivendi-tritanopia))
 );;~ custom

;;
;; Fallback font for zh_CN
;; Site: https://www.foundertype.com/index.php/FontInfo/index/id/131
;;
;; You can use `Source-han-sans' :
;; Site: https://github.com/adobe-fonts/source-han-sans
;; License: SIL OPEN FONT LICENSE Version 1.1 - 26 February 2007
;; Copyright 2014-2025 Adobe
;;
(set-fontset-font t 'han "方正黑体简体" )

;;
;; `0xProto NL' a developer font , with nice feature.
;;
;; Site: https://github.com/0xType/0xProto
;; License: The SIL Open Font License, Version 1.1
;; Copyright (c) 2026 0xType
;;
(custom-set-faces
 '(default ((t (:family "0xProto NL"
			:foundry "outline"
			:slant normal
			:weight regular
			:height 100
			:width normal
			))))

 ;;
 ;; fix color issue.
 ;;
 '(eglot-mode-line ((t (:inherit mode-line-buffer-id ))))
 '(font-lock-number-face ((t (:inherit font-lock-builtin-face))))
 '(font-lock-operator-face ((t (:inherit font-lock-keyword-face))))
 '(font-lock-property-name-face ((t (:inherit font-lock-variable-name-face))))
 '(font-lock-property-use-face ((t (:inherit nil))))
 '(font-lock-variable-use-face ((t (:inherit nil))))
 );;~ custom
