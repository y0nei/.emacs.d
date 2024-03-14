;;; init-completion-minibuffer.el --- Auto completion -*- lexical-binding: t; -*-
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
;; Add minibuffer completion along with some additional enhancments.
;;
;;; Code:

;; Better minibuffer completion
(use-package vertico
  :ensure t
  :init (vertico-mode)
  :general
  (:keymaps 'vertico-map
   "C-j" 'vertico-next
   "C-k" 'vertico-previous)
  :custom
  (vertico-cycle t))  ;; Wrap around when reaching end of list

(use-package marginalia
  :ensure t
  :after vertico
  :init (marginalia-mode))

(use-package vertico-prescient
  :ensure t
  :after vertico
  :init (vertico-prescient-mode))

;; Center minibuffer on screen, similar to telescope on nvim
;; NOTE: The `mini-frame' package allows more control, test later
(use-package vertico-posframe
  :ensure t
  :after vertico
  :init (vertico-posframe-mode)
  :config
  (setq vertico-posframe-parameters '((left-fringe . 8)
                                      (right-fringe . 8))))

(provide 'init-completion-minibuffer)

;;; init-completion-minibuffer.el ends here
