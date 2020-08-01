;; -*- coding: utf-8; lexical-binding: t; -*-
;; formatter using external programs

;; shell formatter
(use-package shfmt
  :ensure t)

;; elisp formatter
(use-package elisp-format
  :ensure t)

;; json mode
(use-package json-mode
  :ensure t)

;; reformatter - Define commands which run reformatters on the current Emacs buffer
;; https://github.com/purcell/reformatter.el
(use-package reformatter
  :ensure t)

(provide 'init-formatter)
;;; init-formatter.el ends here.
