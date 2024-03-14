;;; init-undo-fu.el --- Better undo system -*- lexical-binding: t; -*-
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
;; Improve the default undo/redo system along with enabling persistent undo/redo
;; functionality.
;;
;;; Code:

(use-package undo-fu
  :ensure t
  :config
  (setq evil-undo-system 'undo-fu)
  :general
  (:states '(normal)
   "u" 'undo-fu-only-undo
   "\C-r" 'undo-fu-only-redo))

;; Persistent undo/redo
(use-package undo-fu-session
  :ensure t
  :after undo-fu
  :hook (elpaca-after-init . undo-fu-session-global-mode)
  :config
  (setq undo-fu-session-incompatible-files
        '("/COMMIT_EDITMSG\\'" "/git-rebase-todo\\'")))

(provide 'init-undo-fu)

;;; init-undo-fu.el ends here
