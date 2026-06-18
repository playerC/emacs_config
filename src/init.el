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

;; save emacs edit to other file.
;; ------------------------------------------------------------------

;; custom file must load after frame created.

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

;; setup custom theme dir.
;; ------------------------------------------------------------------

(setq custom-safe-themes t)
(add-to-list 'custom-theme-load-path
             (expand-file-name "themes/" user-emacs-directory))

;; setup native-comp
;; ------------------------------------------------------------------
;; there are some issue on `native-compile` .

;;(setq native-comp-verbose 0)
;;(setq byte-compile-debug 0)
;;(setq native-comp-debug 0)
;;(setq native-comp-jit-compilation t)
;;(setq native-comp-driver-options '("-g3 -lsetjmp") )

;; setup globle ui.
;; ------------------------------------------------------------------

;; set vars use ON/nil
(setq-default display-line-numbers-grow-only ON)
(setq-default display-line-numbers-type 'relative)
(setq inhibit-startup-screen ON)

(global-display-line-numbers-mode ON)
(global-completion-preview-mode ON)
(global-display-fill-column-indicator-mode ON)

;; setup mode use ON/OFF
;; ON
(which-key-mode ON)
;;(which-function-mode ON)

;; OFF
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode OFF)
  )

(when (fboundp 'tab-bar-mode)
  (tab-bar-mode OFF)
  )

(when (fboundp 'tool-bar-mode)
  (tool-bar-mode OFF)
  )

(when (fboundp 'menu-bar-mode)
  (menu-bar-mode OFF)
  )

;; setup text layout
;; ------------------------------------------------------------------

(setq-default line-spacing 1)

;;(global-whitespace-mode ON)

;; setup text functions
;; ------------------------------------------------------------------

(electric-pair-mode ON)

;; enable upcase-region.

(put 'upcase-region 'disabled nil)

;; c-ts-mode
;; ------------------------------------------------------------------

(add-to-list 'major-mode-remap-alist '(c-mode . c-ts-mode))
(add-to-list 'major-mode-remap-alist '(c++-mode . c++-ts-mode))
(add-to-list 'major-mode-remap-alist
             '(c-or-c++-mode . c-or-c++-ts-mode))

(add-to-list 'auto-mode-alist '("\\.c\\'" . c-ts-mode))
(add-to-list 'auto-mode-alist '("\\.h\\'" . c-ts-mode))

(add-to-list 'auto-mode-alist '("\\.cpp\\'" . c++-ts-mode))

;;
;; You can install this use M-x pack-ins.
;; If you don't need this ,just comment it.
;;
;; But I recommend you install this, very helpful.
;;
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; setup eglot(lsp)
;; ------------------------------------------------------------------

(add-hook 'c-ts-mode-hook #'eglot-ensure)
(add-hook 'c++-ts-mode-hook #'eglot-ensure)

;; set eglot format on save.
(setq c4-auto-format ON)

(defun my/eglot-fb ()
  "add switch to auto format buffer"
  (when (equal c4-auto-format ON )
    (eglot-format-buffer)
    )
  )

(defun my/eglot-mm-hook ()
  "format source code on save."
  (add-hook 'before-save-hook
            #'my/eglot-fb nil t
            );;~ add-hook
    );;~ defun

(add-hook 'eglot-managed-mode-hook
          #'my/eglot-mm-hook
          );;~ add-hook
;;
;; NOTE: this is for test.
;;
(setq eglot-server-programs
      '((c-ts-mode . ("clangd"
                      "--offset-encoding=utf-8"
                      "--enable-config")
                   ));;~ c-ts-mode
      );;~ setq

;; setup coding style
;; ------------------------------------------------------------------

(defconst my/default-tab-width 8)

(defun c4-use-tab-indent (n)
  "Set indent-tabs-mode use -1 to disable."
  (interactive "n-1 to deactive:")

  (if (or (equal n nil) (equal n -1))
      (setq-default indent-tabs-mode nil)
    (setq-default indent-tabs-mode t)
    )
  )

(defun c4-set-indent-tab-width (n)
  "Set all tab with to same number."

  (setq tab-width n)
  (setq standard-indent n)
  (setq c-basic-offset n)
  (setq c-ts-mode-indent-offset n)
)

(c4-set-indent-tab-width 8)
(c4-use-tab-indent OFF)

(setq-default c-ts-mode-indent-style 'bsd)

;; setup color theme
;; ------------------------------------------------------------------

(setq-default font-lock-maximum-decoration t)
(setq-default treesit-font-lock-level 4)

(defun my/face-setup ()
  "my face-stup func."
  ;; load custom-file here.
  (when (file-exists-p custom-file)
    (load custom-file :no-error :no-message))

  (load-theme 'modus-vivendi-c4 t)
  (custom-set-variables
   '(custom-enabled-themes '(modus-vivendi-c4))
   );;~ custom

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
   '(font-lock-number-face ((t (:inherit font-lock-constant-face))))
   '(font-lock-operator-face ((t (:inherit font-lock-keyword-face))))
   '(font-lock-property-name-face ((t (:inherit font-lock-variable-name-face))))
   '(font-lock-property-use-face ((t (:inherit nil))))
   '(font-lock-variable-use-face ((t (:inherit nil))))
   );;~ custom

  );;~ defun

(defun my/after-mff (frame)
  "hook after mff."
  (with-selected-frame frame
    (my/face-setup)
    );;~ with selected;

  );;~ defun

(add-hook 'after-make-frame-functions #'my/after-mff)
(unless (daemonp) (my/face-setup))

;;
;; Fallback font for zh_CN
;; Site: https://www.foundertype.com/index.php/FontInfo/index/id/131
;;
;; You can use `Source-han-sans' :
;; Site: https://github.com/adobe-fonts/source-han-sans
;; License: SIL OPEN FONT LICENSE Version 1.1 - 26 February 2007
;; Copyright 2014-2025 Adobe
;;
(when (fboundp 'set-fontset-font)
  (set-fontset-font t 'han "方正黑体简体" )
  )

;; Add c4-new-clang function
;; ------------------------------------------------------------------
;;
;; Use `M-x c4-new-clang' to copy template files to current dir.
;;

(defconst my/clang-format-yaml
  (expand-file-name "clang-format.yaml" user-emacs-directory))
(defconst my/clangd-yaml
  (expand-file-name "clangd.yaml" user-emacs-directory))

(defconst my/trg-cf-file ".clang-format")
(defconst my/trg-cl-file ".clangd")

(defun c4-new-clang ()
  "Copy clang-format and clangd config file template to current dir."
  (interactive)
  (let
      (trg-dir trg-cf-file trg-cl-file)

    (unless
        (and
         (file-exists-p my/clang-format-yaml)
         (file-exists-p my/clangd-yaml)
         );;~ and
      (user-error "Template file missing, abort.")
      );;~ unless

    (setq trg-dir (or (and (buffer-file-name)
                           (file-name-directory (buffer-file-name)))
                      default-directory))

    (setq trg-cf-file
          (expand-file-name
           (file-name-nondirectory my/trg-cf-file) trg-dir))
    (setq trg-cl-file
          (expand-file-name
           (file-name-nondirectory my/trg-cl-file) trg-dir))

    (when
        (or
         (file-exists-p trg-cf-file)
         (file-exists-p trg-cl-file)
         )
      (user-error "File has exits in current dir, abort.")
      );;~ when

    (copy-file my/clang-format-yaml trg-cf-file t )
    (copy-file my/clangd-yaml trg-cl-file t )
    (message "Clang files has copied to current dir.")
    );;~ let
  );;~ defun

;; Add change indent size function
;; ------------------------------------------------------------------

(defun c4-indent-width (n)
  "Set indent width easily."
  (interactive "nIndent Width(2,4,8):")

  (c4-set-indent-tab-width n)
  (whitespace-mode t)

  (if (equal n my/default-tab-width)
      (setq c4-auto-format ON)
      (setq c4-auto-format OFF)
      )
  )

;; Add clean function
;; ------------------------------------------------------------------
(defun c4-clean ()
  "Remove spaces and empty lines."
  (interactive)

  (whitespace-mode 'toggle)
  (whitespace-cleanup)
  )

;; Add copy to clipboard when using ssh and mintty
;; ------------------------------------------------------------------
;; must add follow options to ~/.minttyrc
;;```
;; AllowSetSelection=yes
;; AllowPasteSelection=yes
;;```
;;
(defun c4-tty-copy (text &optional _)
  "copy to clipboard use OSC52"
  (let ((enc (base64-encode-string text t))
        )
    (send-string-to-terminal
     (format "\e]52;c;%s\a" enc)
     )
   )
  )

(when (getenv "SSH_TTY")
  (setq interprogram-cut-function #'c4-tty-copy)
    )
