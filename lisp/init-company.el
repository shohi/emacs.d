;; -*- coding: utf-8; lexical-binding: t; -*-
;; company-mode, http://company-mode.github.io/

(use-package company
  :ensure t
  :config (progn
            ;; don't add any dely before trying to complete thing being typed
            ;; the call/response to gopls is asynchronous so this should have little
            ;; to no affect on edit latency
            (setq company-idle-delay 0)
            ;; start completing after a single character instead of 3
            (setq company-minimum-prefix-length 1)
            ;; align fields in completions
            (setq company-tooltip-align-annotations t)
            ))

(add-hook 'after-init-hook 'global-company-mode)

(use-package company-lsp
  :ensure t
  :commands company-lsp)

(provide 'init-company)
;;; init-lsp.el ends here.
