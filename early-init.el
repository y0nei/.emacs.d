;;; early-init.el --- Early init file -*- lexical-binding: t; no-byte-compile: t -*-
;;
;; Copyright (c) 2024 Yonei
;;
;; Author: Yonei <y0nei@proton.me>
;; Created: 11 March 2024
;; Version: 0.0.1
;; URL: https://codeberg.org/y0nei/.emacs.d
;; Package-Requires: ((emacs "29.1"))
;; SPDX-License-Identifier: MIT
;;
;; This file is NOT part of GNU Emacs.
;;
;;; Commentary:
;; Since version 27, Emacs introduces an early init file. It is loaded before
;; the package system and GUI is initialized. This file contains mainly startup
;; optimizations.
;;
;;; Code:

;; Prevent package.el loading packages prior to their init-file loading.
(setq package-enable-at-startup nil)

;; Defer garbage collection further back in the startup process
(setq gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 0.6)

;; Setting the face here prevents flashes of color as the theme gets activated
(push '(background-color . "#17191a") default-frame-alist)

;; Disable GUI elements (before they get a chance to be initialized)
;; NOTE: Disabling GUI elements this way does not trigger/queue an extra redraw
;; compared to using e.g. `(menu-bar-mode -1)' which can.
(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)

;; Disable startup minibuffer advertisement entirely
;; https://yrh.dev/blog/rant-obfuscation-in-emacs/
(put 'inhibit-startup-echo-area-message 'saved-value
     (setq inhibit-startup-echo-area-message (user-login-name)))

;; Disable the GNU Emacs welcome screen
(setq inhibit-splash-screen t)

;; Resize by pixels instead of cols/rows.
(setq-default window-resize-pixelwise t
              frame-resize-pixelwise t)

;; Resizing the Emacs frame (to accommodate fonts that are smaller or larger
;; than the system default font) appears to severely impact startup time. The
;; larger the delta in font size, the greater the delay.
(setq frame-inhibit-implied-resize t)

;;; early-init.el ends here
