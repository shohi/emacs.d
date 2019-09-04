;; -*- coding: utf-8; lexical-binding: t; -*-
;; project manager
(use-package projectile
  :ensure t
  :config
  (projectile-global-mode)
  (global-set-key (kbd "<f5>") 'projectile-compile-project)
  :bind
  ("C-c p" . projectile-command-map))

(provide 'init-projectile)
;;; init-projectile ends here.
