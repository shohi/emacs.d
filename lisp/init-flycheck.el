;; -*- coding: utf-8; lexical-binding: t; -*-
;; refer, https://www.flycheck.org/en/latest/

(use-package flycheck
  :ensure t
  :config
  ;; (add-hook 'go-mode-hook #'flycheck-mode)

  ;; enable flycheck mode on all buffers
  (global-flycheck-mode))

(provide 'init-flycheck)
;;; init-flycheck.el ends here.
