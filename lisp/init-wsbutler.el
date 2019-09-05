;; -*- coding: utf-8; lexical-binding: t; -*-
;; fix trailing spaces but only in modified lines
;; https://github.com/lewang/ws-butler

(use-package ws-butler
  :ensure t
  :defer
  :init
  (add-hook 'prog-mode-hook #'ws-butler-mode))

(provide 'init-wsbutler)
;;; init-wsbutler ends here.
