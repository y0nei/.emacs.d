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
  (user-error
   (concat "This Emacs configuration requires version 29 or newer, but version "
           emacs-version " was detected.")))

;;; Setup customization file
;; Offload custom-set-variables to a separate file to not clutter init.el
(setq-default custom-file (expand-file-name "custom.el" user-emacs-directory))

;; Load it
;; NOTE: The file gets automatically created so no need to write-region it
(when (file-exists-p custom-file)
  (load custom-file nil t))

;;; init.el ends here
