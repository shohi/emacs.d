;; -*- coding: utf-8; lexical-binding: t; -*-
;; refer, https://www.flycheck.org/en/latest/

(use-package flycheck
  :ensure t
  :config
  ;; (add-hook 'go-mode-hook #'flycheck-mode)

  ;; enable flycheck mode on all buffers
  (global-flycheck-mode))

;; Flycheck checker for golangci-lint
;; required golangci-lint installed - https://golangci-lint.run/usage/integrations/
;; (use-package flycheck-golangci-lint
;;   :after flycheck
;;   :ensure t
;;   :hook (go-mode . flycheck-golangci-lint-setup))

(provide 'init-flycheck)
;;; init-flycheck.el ends here.
