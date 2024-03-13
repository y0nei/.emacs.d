;;; init-defaults.el --- Sane defaults -*- lexical-binding: t; -*-
;;
;; Copyright (c) 2024 Yonei
;;
;; Author: Yonei <y0nei@proton.me>
;; Created: 12 March 2024
;; Version: 0.0.1
;; URL: https://codeberg.org/y0nei/.emacs.d
;; Package-Requires: ((emacs "29.1"))
;; SPDX-License-Identifier: MIT
;;
;; This file is NOT part of GNU Emacs.
;;
;;; Commentary:
;; Emacs is a great editor, but its out-of-the-box experience isn't the best.
;; This file changes some of those settings to more sensible values.
;;
;;; Code:

;;; General usage
;; Make prompts accept y/n instead of yes/no
(fset 'yes-or-no-p #'y-or-n-p)

;; Move files to trash when deleting
(setq delete-by-moving-to-trash t)

;; Allow using other minibuffer commands while inside a minibuffer
(setq enable-recursive-minibuffers t)

;; Automatically show changes if the file has been modified
(global-auto-revert-mode t)
(setq global-auto-revert-non-file-buffers t)  ; Also auto refresh dired

;; Increase how much is read from processes in a single chunk (default is 4kb)
(setq read-process-output-max (* 100 1024))  ; 64KB

;; Warn when opening large files
(setq large-file-warning-threshold (* 100 1024 1024))  ; 100MB

;; Increase some `recentf' limits
(use-package recentf
  :config
  ;; TODO: Move this and `savehist-file' to a specified cache directory
  ;; (setq recentf-save-file (expand-file-name "recentf" user-emacs-directory))
  (setq recentf-max-saved-items 100
        recentf-max-menu-items 15))

;; Remember pointer position in previously visited files
(use-package saveplace
  :config
  (setq save-place-file (expand-file-name "savehist" user-emacs-directory))
  (save-place-mode))

;; Preserve point position when scrolling
(setq scroll-preserve-screen-position 'always)

;; UTF-8'ify everything
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; Show keystrokes in progress faster
;; (setq echo-keystrokes 0.1)

;; Set monday as the first day of the week
(setq calendar-week-start-day 1)
;; Display week numbers in calendar
(setq calendar-intermonth-text
      '(propertize
        (format "%2d"
                (car
                 (calendar-iso-from-absolute
                  (calendar-absolute-from-gregorian (list month day year)))))
        'font-lock-face 'font-lock-function-name-face))

;;; Editing experience
;; Indent with spaces by default
(setq-default indent-tabs-mode nil
              c-basic-offset 4
              tab-width 4)

;; Change the fill-column from 70 to 80 chars
(setq-default fill-column 80)

;; Always add newline at the end of the file
(setq require-final-newline t)

;; Show me empty lines after buffer end
;; (set-default 'indicate-empty-lines t)

;; Write over selected text on input
(delete-selection-mode t)

;; Line numbers configuration
(use-package display-line-numbers
  :hook (prog-mode . display-line-numbers-mode)
  :config
  (setq display-line-numbers-type 'relative)
  ;; Easilly distinguish the current line number by giving it a nice color.
  (set-face-foreground 'line-number-current-line "#F0C674"))

(provide 'init-defaults)

;; init-defaults.el ends here
