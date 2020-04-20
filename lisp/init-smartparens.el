;; -*- coding: utf-8; lexical-binding: t; -*-
;; Smartparens is a minor mode for dealing with pairs in Emacs.
;; https://github.com/Fuco1/smartparens
;; https://ebzzry.io/en/emacs-pairs/

(use-package smartparens-config
  :ensure smartparens
  :config
  (progn
    (show-smartparens-global-mode t)))

(add-hook 'prog-mode-hook 'turn-on-smartparens-strict-mode)
(add-hook 'markdown-mode-hook 'turn-on-smartparens-strict-mode)

;; Question: how to navigate between balanced pairs?
(provide 'init-smartparens)
;;; init-smartparens ends here.
