;;; init-git.el --- Git VCS setup with utils -*- lexical-binding: t; -*-
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
;; Useful Git utilities.
;;
;;; Code:

;; Install transient separately since magit complains that "transient installed
;; version lower than min requiered".
(use-package transient
  :ensure t)

(use-package magit
  :ensure t
  :after transient
  :general
  (yni/leader-keys
    "g" '(:ignore t :wk "git")
    "g s" '(magit-status :wk "Git status in Magit")))

;; Highlight changes for Dired
(use-package dired-k
  :ensure t
  :hook ((dired-initial-position . dired-k)
         (dired-after-readin . dired-k-no-revert))
  :config
  (setq dired-k-padding 1
        dired-k-human-readable t))

;; Highlight changes
(use-package git-gutter
  :if (eq version-control-diff-tool 'git-gutter)
  :ensure t
  :config
  ;; Taken from `git-gutter+.el' and modified to work with `git-gutter.el'.
  (defun yn/git-gutter-popup-hunk-inline ()
    "Show hunk by temporarily expanding it at point"
    (interactive)
    (-when-let (diffinfo (git-gutter:search-here-diffinfo git-gutter:diffinfos))
      (let ((diff (with-temp-buffer
                    (insert (git-gutter-hunk-content diffinfo) "\n")
                    (diff-mode)
                    ;; Force-fontify the invisible temp buffer
                    (font-lock-default-function 'diff-mode)
                    (font-lock-default-fontify-buffer)
                    (buffer-string))))
        (momentary-string-display diff (point-at-bol)))))
  (global-git-gutter-mode)
  :general
  (yni/leader-keys
    "g h" '(:ignore t :wk "hunk")
    "g h p" '(yn/git-gutter-popup-hunk-inline :wk "Show hunk inline at point")
    "g h P" '(git-gutter:popup-hunk :wk "Show hunk at point in a diff buffer")
    "g h s" '(git-gutter:stage-hunk :wk "Stage hunk at point")
    "g h r" '(git-gutter:revert-hunk :wk "Revert hunk at point")
    "g h ]" '(git-gutter:next-hunk :wk "Next hunk")
    "g h [" '(git-gutter:previous-hunk :wk "Previous hunk")))

(use-package git-gutter-fringe
  :if (eq version-control-diff-tool 'git-gutter)
  :ensure t
  :config
  ;; Bitmap values taken from Doom Emacs
  (define-fringe-bitmap 'git-gutter-fr:added [224] nil nil '(center repeated))
  (define-fringe-bitmap 'git-gutter-fr:modified [224] nil nil '(center repeated))
  (define-fringe-bitmap 'git-gutter-fr:deleted [128 192 224 240] nil nil 'bottom))

;; NOTE: `diff-hl' has the ability to show hunk diffs in popups using the
;; `posframe' package. We intentionally avoid it's usage since it can have a
;; buggy behaviour. (from my testing, emacs lost interaction when exiting the
;; popup. Could also be a tiling window manager issue).
(use-package diff-hl
  :if (eq version-control-diff-tool 'diff-hl)
  :ensure t
  :hook ((find-file . diff-hl-mode)
         (vc-dir-mode . diff-hl-dir-mode)
         (magit-pre-refresh . diff-hl-magit-pre-refresh)
         (magit-post-refresh . diff-hl-magit-post-refresh)
         (dired-mode . diff-hl-dired-mode))
  :config
  (setq diff-hl-draw-borders nil
        ;; Reduce load on remote
        diff-hl-disable-on-remote t
        ;; A slightly faster algorithm for diffing
        vc-git-diff-switches '("--histogram"))
  (global-diff-hl-mode)
  :general
  (yni/leader-keys
    "g h" '(:ignore t :wk "hunk")
    "g h p" '(diff-hl-show-hunk :wk "Show hunk inline at point")
    "g h P" '(diff-hl-diff-goto-hunk :wk "Show hunk at point in a diff buffer")
    "g h s" '(diff-hl-stage-current-hunk :wk "Stage hunk at point")
    "g h r" '(diff-hl-revert-hunk :wk "Revert hunk at point")
    "g h ]" '(diff-hl-next-hunk :wk "Next hunk")
    "g h [" '(diff-hl-previous-hunk :wk "Previous hunk")))

(provide 'init-git)

;;; init-git.el ends here
