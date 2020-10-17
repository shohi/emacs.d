;; -*- coding: utf-8; lexical-binding: t; -*-
;; Smartparens is a minor mode for dealing with pairs in Emacs.
;; https://github.com/Fuco1/smartparens
;; https://ebzzry.io/en/emacs-pairs/

(use-package smartparens
  :ensure t
  :diminish
  :config
  ;; default configure
  (require 'smartparens-config)
  (show-smartparens-global-mode t)

  ;; use sp keybindings
  (sp-use-smartparens-bindings)

  ;; hooks
  (add-hook 'prog-mode-hook 'turn-on-smartparens-strict-mode)
  (add-hook 'markdown-mode-hook 'turn-on-smartparens-strict-mode)

  ;; set local pair
  (sp-local-pair 'go-mode "{" nil :post-handlers '(("||\n[i]" "RET")))

  ;; enable automatic indentation
  ;; https://emacsredux.com/blog/2013/03/29/automatic-electric-indentation/
  (electric-indent-mode +1)
  )

;; Question: how to navigate between balanced pairs?
(provide 'init-smartparens)
;;; init-smartparens ends here.
