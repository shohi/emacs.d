;; -*- coding: utf-8; lexical-binding: t; -*-
;; project manager

(use-package projectile
  :ensure t
  :config
  (projectile-mode +1)
  (setq projectile-completion-system 'ivy)
  :bind
  ("C-c p" . projectile-command-map))

(global-set-key (kbd "<f5>") 'projectile-compile-project)

(provide 'init-projectile)
;;; init-projectile ends here.
