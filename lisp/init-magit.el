;; -*- coding: utf-8; lexical-binding: t; -*-
;; magit, https://github.com/magit/magit

(use-package magit
  :ensure t
  :config
  (setq magit-push-always-verify nil)
  (setq git-commit-summary-max-length 50)
  :bind
  ("C-x g" . magit-status))

(setq magit-status-margin
  '(t "%Y-%m-%d %H:%M " magit-log-margin-width t 18))

(use-package git-gutter
  :ensure t
  :init
  (global-git-gutter-mode +1))

(use-package git-timemachine
  :ensure t)

(provide 'init-magit)
;;; init-magit ends here.
