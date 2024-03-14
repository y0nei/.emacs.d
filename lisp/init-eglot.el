;;; init-eglot.el --- LSP configuration -*- lexical-binding: t; -*-
;;
;; Copyright (c) 2024 Yonei
;;
;; Author: Yonei <y0nei@proton.me>
;; Created: 14 March 2024
;; Version: 0.0.1
;; URL: https://codeberg.org/y0nei/.emacs.d
;; Package-Requires: ((emacs "29.1") (elpaca) (evil) (general))
;; SPDX-License-Identifier: MIT
;;
;; This file is NOT part of GNU Emacs.
;;
;;; Commentary:
;; Built-in Eglot language server protocol configuration.
;;
;;; Code:

(use-package eglot
  :custom-face
  ;; Underline string references
  (eglot-highlight-symbol-face ((t (:underline t :weight bold)))) 
  :hook ((python-mode emacs-lisp-mode) . eglot-ensure)
  :config
  (defun yn/eglot-reconnect ()
    "Helper function to reconnect to an eglot server interactively."
    (interactive)
    (let ((current-server (eglot-current-server)))
      (call-interactively
       (if (and current-server (jsonrpc-running-p current-server))
           #'eglot-reconnect #'eglot))))
  :general
  (:keymaps 'eglot-mode-map
   :prefix "SPC"
   :states '(normal emacs)
   "e p" 'eldoc-box-eglot-help-at-point))

;; Speed up interactions with the LSP server.
;; Need to install: https://github.com/blahgeek/emacs-lsp-booster
(use-package eglot-booster
  :ensure (:host github :repo "jdtsmith/eglot-booster")
  :after eglot
  :config (eglot-booster-mode))

(provide 'init-eglot)

;;; init-eglot.el ends here
