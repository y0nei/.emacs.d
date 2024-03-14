;;; init.el --- Emacs configuration entrypoint -*- lexical-binding: t; -*-
;;
;; 888888 8b    d8    db     dP""b8 .dP"Y8
;; 88__   88b  d88   dPYb   dP   `" `Ybo."
;; 88""   88YbdP88  dP__Yb  Yb      o.`Y8b
;; 888888 88 YY 88 dP""""Yb  YboodP 8bodP'
;;
;; Copyright (c) 2024 Yonei
;;
;; Author: Yonei <y0nei@proton.me>
;; Created: 10 March 2024
;; Version: 0.0.1
;; URL: https://codeberg.org/y0nei/.emacs.d
;; Package-Requires: ((emacs "29.1"))
;; SPDX-License-Identifier: MIT
;;
;; This file is NOT part of GNU Emacs.
;;
;;; Commentary:
;; My personal Emacs configuration
;;
;;; Code:

;; Guardrail
(when (< emacs-major-version 29)
  (user-error (concat "This Emacs configuration requires version 29 or newer,"
                      " but version %s was detected.") emacs-version))

;; Show useful information at startup
(defun yni/display-startup-diagnostics ()
  (message "Emacs %s loaded from %s in %s with %d garbage collections."
           emacs-version user-emacs-directory
           (format "%.3f seconds"
                   (float-time
                    (time-subtract after-init-time before-init-time)))
           gcs-done))

(add-hook 'emacs-startup-hook #'yni/display-startup-diagnostics)

;; Override startup minibuffer advertisement with something usefull
;; NOTE: Overriding this function ignores `inhibit-startup-echo-area-message'
;; and shows the message regardless if its disabled or not.
;;
;; (defun display-startup-echo-area-message ()
;;   (message (format "Emacs %s loaded from %s in %s"
;;             emacs-version user-emacs-directory (emacs-init-time))))

;; Reset the garbage collection threshold for early startup. Garbage collection
;; is later managed by `gcmh' loaded in `init-core.el'.
(setq gc-cons-threshold (* 128 1024 1024))  ; 128MB, 0.76MB by default

(defvar version-control-diff-tool 'diff-hl
  "Tool used to display diff indicators. Either `diff-hl' or `git-gutter'.")
(defconst sys/arch (intern (car (split-string system-configuration "-")))
  "The system's architecture. Returns a symbol like `x86_64', `aarch64', ...")

;;; Load libraries
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; Packages and configuration
(require 'init-elpaca)
(require 'init-core)
(require 'init-defaults)
(require 'init-evil)
(require 'init-keybinds)
(require 'init-undo-fu)

(require 'init-ui)
(require 'init-dired)
(require 'init-git)
(require 'init-helpful)
(require 'init-treemacs)

(require 'init-eglot)
(require 'init-completion-minibuffer)
(require 'init-completion-at-point)

(require 'init-programming)
(require 'init-lang-elisp)

;;; init.el ends here
