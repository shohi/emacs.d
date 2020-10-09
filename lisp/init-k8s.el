;; -*- coding: utf-8; lexical-binding: t; -*-
;; setting for k8s utilities

;; k8s-mode - Kubernetes mode in Emacs
;; https://github.com/TxGVNN/emacs-k8s-mode
(use-package k8s-mode
  :ensure t
  :after yasnippet
  :hook (k8s-mode . yas-minor-mode))

(provide 'init-yaml-mode)
;;; init-k8s ends here.
