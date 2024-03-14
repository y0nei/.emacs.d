;;; init-completion-at-point.el --- Auto completion -*- lexical-binding: t; -*-
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
;; At-point completion configuration.
;;
;;; Code:

;; Completion framework
(use-package corfu
  :ensure t
  :after eglot
  :hook (corfu-mode . corfu-popupinfo-mode)  ; Enable info popups
  :init (global-corfu-mode)
  :custom
  (corfu-auto t)  ; Enable auto-completion
  (corfu-cycle t)  ; Enable cycling
  (completion-cycle-threshold 3)
  (corfu-auto-prefix 2)  ; Set the minimum prefix for completion
  (corfu-auto-delay 0.1)
  (corfu-preselect 'first)
  (corfu-quit-at-boundary 'separator)
  (corfu-popupinfo-delay '(0.25 . 0.1))  ; Don't show help popup immediately
  (eldoc-echo-area-use-multiline-p nil)  ; Don't show documentation in minibuffer
  (corfu-separator ?\s)  ; Necessary for use with orderless
  (corfu-popupinfo-hide nil)  ; Don't hide the popup when candidates switch
  (corfu-bar-width 1)  ; Scroll bar width
  (corfu-scroll-margin 3)
  :general
  (:keymaps 'corfu-map
	 "<escape>" 'corfu-quit
	 "<return>" 'corfu-insert
     "C-j" 'corfu-next
     "C-k" 'corfu-previous
	 (kbd "<tab>") 'corfu-next
	 (kbd "<backtab>") 'corfu-previous))

(use-package corfu-history
  :ensure nil
  :hook (corfu-mode . corfu-history-mode)
  :config
  (unless (bound-and-true-p savehist-mode)
    (savehist-mode 1))
  (add-to-list 'savehist-additional-variables 'corfu-history))

(use-package kind-icon
  :ensure t
  :if (and (display-graphic-p) (image-type-available-p 'svg))
  :after corfu
  :config
  (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter))

(use-package corfu-prescient
  :ensure t
  :hook (corfu-mode . corfu-prescient-mode))

(provide 'init-completion-at-point)

;;; init-completion-at-point.el ends here
