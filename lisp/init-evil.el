;;; init-evil.el --- Evil mode setup -*- lexical-binding: t; -*-
;;
;; Copyright (c) 2024 Yonei
;;
;; Author: Yonei <y0nei@proton.me>
;; Created: 11 March 2024
;; Version: 0.0.1
;; URL: https://codeberg.org/y0nei/.emacs.d
;; Package-Requires: ((emacs "29.1") (elpaca))
;; SPDX-License-Identifier: MIT
;;
;; This file is NOT part of GNU Emacs.
;;
;;; Commentary:
;; Vim keybinding system for Emacs and it's utilities.
;;
;;; Code:

(use-package evil
  :ensure t
  ;; BUG: Loading evil on a `after-init' hook, fails to load. Setting it to
  ;; `elpaca-after-init' throws errors regarding general.el keybind definitions.
  :init
  (setq evil-want-keybinding nil)
  (evil-mode)
  :config
  ;; TODO: Use `undo-fu' for undo system
  (evil-set-undo-system 'undo-redo))

;; Evil mode functionality for various other tools
(use-package evil-collection
  :ensure t
  :after evil
  :config
  (setq evil-collection-mode-list '(dired help ibuffer))
  (evil-collection-init))

(provide 'init-evil)

;;; init-evil.el ends here
