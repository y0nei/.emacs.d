;;; init-programming.el --- Programming enhancments -*- lexical-binding: t; -*-
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
;; Tweaks to improve general programming experience.
;;
;;; Code:

(use-package highlight-escape-sequences
  :ensure
  (:host github
   :repo "hlissner/highlight-escape-sequences")
  :hook ((prog-mode conf-mode) . highlight-escape-sequences-mode))

;; Many major modes do no highlighting of number literals, so we do it for them.
(use-package highlight-numbers
  :ensure t
  :hook ((prog-mode conf-mode) . highlight-numbers-mode)
  :config
  (setq highlight-numbers-generic-regexp "\\_<[[:digit:]]+\\(?:\\.[0-9]*\\)?\\_>"))

(provide 'init-programming)

;;; init-programming.el ends here
