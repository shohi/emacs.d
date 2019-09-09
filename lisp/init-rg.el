;; -*- coding: utf-8; lexical-binding: t; -*-
;; rg - Emacs search tool based on ripgrep.
;; require `ripgrep` installed, e.g. "brew install ripgrep".
;; https://github.com/dajva/rg.el

(use-package rg
  :ensure t
  :config
  (
   rg-enable-default-bindings)
   ;; (rg-enable-default-bindings "\M-s")
  )

(provide 'init-rg)
;;; init-rg ends here.
