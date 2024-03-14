;;; init-treemacs.el --- File explorer sidebar -*- lexical-binding: t; -*-
;;
;; Copyright (c) 2024 Yonei
;;
;; Author: Yonei <y0nei@proton.me>
;; Created: 15 March 2024
;; Version: 0.0.1
;; URL: https://codeberg.org/y0nei/.emacs.d
;; Package-Requires: ((emacs "29.1") (elpaca) (evil) (general))
;; SPDX-License-Identifier: MIT
;;
;; This file is NOT part of GNU Emacs.
;;
;;; Commentary:
;; Config for the Treemacs file explorer along with useful integrations.
;;
;;; Code:

(use-package treemacs
  :ensure t
  :hook ((treemacs-mode . treemacs-filewatch-mode)
         (treemacs-mode . treemacs-follow-mode))
  :custom
  (treemacs-user-mode-line-format 'none)  ; Disable modeline
  (treemacs-file-event-delay 5000)
  (treemacs-file-follow-delay 0.2)
  (treemacs-follow-after-init t)
  (treemacs-git-integration t)
  :general
  (yni/leader-keys
    "t" '(:ignore t :wk "toggle")
    "t e" '(treemacs :wk "Open treemacs")))

(use-package treemacs-nerd-icons
  :ensure t
  :after treemacs
  :config
  (treemacs-load-theme "nerd-icons"))

(use-package treemacs-magit
  :after (treemacs magit))

(provide 'init-treemacs)

;;; init-treemacs.el ends here
