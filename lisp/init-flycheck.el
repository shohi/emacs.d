;; -*- coding: utf-8; lexical-binding: t; -*-
;; refer, https://www.flycheck.org/en/latest/

(use-package flycheck
  :ensure t
  :config

  (use-package exec-path-from-shell
    :ensure t
    :config
    (exec-path-from-shell-initialize))

  (global-flycheck-mode))

(provide 'init-flycheck)
;;; init-flycheck.el ends here.
