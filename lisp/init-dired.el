;;; init-dired.el --- Dired setup -*- lexical-binding: t; -*-
;;
;; Copyright (c) 2024 Yonei
;;
;; Author: Yonei <y0nei@proton.me>
;; Created: 12 March 2024
;; Version: 0.0.1
;; URL: https://codeberg.org/y0nei/.emacs.d
;; Package-Requires: ((emacs "29.1") (elpaca) (evil) (general))
;; SPDX-License-Identifier: MIT
;;
;; This file is NOT part of GNU Emacs.
;;
;;; Commentary:
;; Dired improvements.
;;
;;; Code:

(use-package dired
  :config
  (setq dired-listing-switches "-alh -v --group-directories-first"))

;; Colorize dired buffers.
(use-package diredfl
  :ensure t
  :hook (dired-mode . diredfl-mode))

;; Reuse the current dired buffer to visit another directory.
(use-package dired-single
  :ensure t
  :general
  (:keymaps 'dired-mode-map
   [remap dired-find-file] #'dired-single-buffer
   [remap dired-mouse-find-file-other-window] #'dired-single-buffer-mouse
   [remap dired-up-directory] #'dired-single-up-directory))

;; Improve file path rendering by chaining directories where each one only has
;; one child, they are concatenated together and shown on the first level in
;; this collapsed form. Empty directories are grayed out.
(use-package dired-collapse
  :ensure t
  :hook (dired-mode . dired-collapse-mode)
  :general
  ;; TODO: Set this to a better keybinding
  (:keymaps 'dired-mode-map
   :states 'normal
   (kbd "<C-tab>") 'dired-collapse-mode))

(provide 'init-dired)

;;; init-dired.el ends here
