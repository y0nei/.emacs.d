;;; init-ui.el --- Themeing and visual tweaks -*- lexical-binding: t; -*-
;;
;; Copyright (c) 2024 Yonei
;;
;; Author: Yonei <y0nei@proton.me>
;; Created: 13 March 2024
;; Version: 0.0.1
;; URL: https://codeberg.org/y0nei/.emacs.d
;; Package-Requires: ((emacs "29.1") (elpaca))
;; SPDX-License-Identifier: MIT
;;
;; This file is NOT part of GNU Emacs.
;;
;;; Commentary:
;; Anything regarding the look and feel of Emacs, like fonts, themes or visual
;; effects.
;;
;;; Code:

;; Display a ruler at the fill-column width.
(add-hook 'prog-mode-hook #'display-fill-column-indicator-mode)
(add-hook 'text-mode-hook #'display-fill-column-indicator-mode)

;; Fonts
(set-face-attribute 'default nil
                    :font "JetBrainsMono Nerd Font"
                    :height 110
                    :weight 'medium)
(set-face-attribute 'fixed-pitch nil
                    :font "JetBrainsMono Nerd Font"
                    :height 110
                    :weight 'medium)
(set-face-attribute 'variable-pitch nil
                    :font "Overpass"
                    :height 120
                    :weight 'medium)

;; Make commented text and keywords slanted after a theme has loaded.
(advice-add #'load-theme
            :after (lambda (&rest _)
                     (set-face-italic 'font-lock-comment-face t)
                     (set-face-italic 'font-lock-keyword-face t)))

;; Themes
(use-package doom-themes
  :ensure t
  :config
  ;; Set either to nil to universally disable
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  (load-theme 'doom-one t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

;; Modeline
(use-package doom-modeline
  :ensure t
  :hook ((doom-modeline-mode . column-number-mode)
         (doom-modeline-mode . display-battery-mode)
         ((elpaca-after-init-hook after-init) . doom-modeline-mode))
  :init
  (setq doom-modeline-buffer-file-name-style 'truncate-nil
        doom-modeline-total-line-number t))

;; Hide the modeline in some modes
;; (use-package hide-mode-line
;;   :ensure t
;;   :hook (help-mode . turn-on-hide-mode-line-mode))

(provide 'init-ui)

;;; init-ui.el ends here
