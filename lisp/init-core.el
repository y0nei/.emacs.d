;;; init-core.el --- Core configuration -*- lexical-binding: t; -*-
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
;; Configuration that improves/fixes core Emacs functionality lives here.
;; This is intended to load after the package system is initialized.
;;
;;; Code:

;; Enforce a sneaky Garbage Collection strategy to minimize GC interference with
;; user activity. During normal use a high GC threshold is set. When idling GC
;; is triggered and a low threshold is set. (more info at http://akrl.sdf.org/)
(use-package gcmh
  :ensure t
  :hook (elpaca-after-init . gcmh-mode)
  :custom
  (gcmh-idle-delay 10)  ; Default is 15s, setting to auto triggers it too often
  (gcmh-auto-idle-delay-factor 10)
  (gcmh-verbose nil)  ; Set to t for a log per each collection
  ;; 1GB by default is probably too high. Set it to 256MB on 64bit systems
  ;; or 16MB on 32bit ones.
  (gcmh-high-cons-threshold (* 1024 1024 (if (string-suffix-p
                                              "64" (symbol-name
                                                    sys/arch)) 256 16))))

(provide 'init-core)

;;; init-core.el ends here
