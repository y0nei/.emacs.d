;;; init-helpful.el --- Improved help buffer -*- lexical-binding: t; -*-
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
;; An alternative to the built-in Emacs help that provides much more contextual
;; information.
;;
;;; Code:

(use-package helpful
  :ensure t
  :after evil
  :general
  ([remap describe-function] 'helpful-callable
   [remap describe-command] 'helpful-command
   [remap describe-variable] 'helpful-variable
   [remap describe-symbol] 'helpful-symbol
   [remap describe-key] 'helpful-key))

(provide 'init-helpful)

;;; init-helpful.el ends here
