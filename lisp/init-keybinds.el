;;; init-keybinds.el --- Keybindings -*- lexical-binding: t; -*-
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
;; Keybinds and which-key setup for a better experience. Most keybinds are Doom
;; Emacs inspired.
;;
;;; Code:

;;; Package setup
(use-package which-key
  :ensure t
  :init
  (which-key-mode))

(use-package general
  :ensure t
  :after evil
  :config
  (general-evil-setup)
  (general-create-definer yni/leader-keys
    :states '(normal insert visual emacs)
    :keymaps 'override
    :prefix "SPC"
    :global-prefix "M-SPC"))

;; Since elpaca installs and activates packages asynchronously, we need to load
;; general early, otherwise the :general keyword in `use-package' won’t work.
(elpaca-wait)

;;; Keybindings
(yni/leader-keys
  "." '(find-file :wk "File search")
  "," '(switch-to-buffer :wk "Switch to buffer")

  "b" '(:ignore t :wk "buffer")
  "b i" '(ibuffer :wk "iBuffer")
  "b r" '(revert-buffer :wk "Reload buffer")
  "b k" '(kill-this-buffer :wk "Kill current buffer")
  "b ]" '(next-buffer :wk "Next buffer")
  "b [" '(previous-buffer :wk "Previous buffer")

  "w" '(:ignore t :wk "window")
  "w c" '(delete-window :wk "Close current window")
  "w n" '(evil-window-vnew :wk "New window")
  "w s" '(evil-window-split :wk "Horizontal split")
  "w v" '(evil-window-vsplit :wk "Vertical split")
  ;; Window navigation
  "w h" '(evil-window-left :wk "Window left")
  "w j" '(evil-window-down :wk "Window down")
  "w k" '(evil-window-up :wk "Window up")
  "w l" '(evil-window-right :wk "Window right")
  "w w" '(evil-window-next :wk "Goto next window")

  "e v" '(:ignore t :wk "evaluate")
  "e v b" '(eval-buffer :wk "Evaluate elisp in buffer")
  "e v d" '(eval-defun :wk "Evaluate defun containing or after point")
  "e v e" '(eval-expression :wk "Evaluate elisp expression")
  "e v l" '(eval-last-sexp :wk "Evaluate elisp expression before point")
  "e v r" '(eval-region :wk "Evaluate elisp in region")

  "h" '(:ignore t :wk "help")
  "h f" '(describe-function :wk "Describe function")
  "h v" '(describe-variable :wk "Describe variable"))

;; Don't use Escape as a modifier key, make it actually quit things by pressing
;; the key 1 time instead of 3.
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(provide 'init-keybinds)

;;; init-keybinds.el ends here
