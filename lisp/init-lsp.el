;; -*- coding: utf-8; lexical-binding: t; -*-
;; lsp-mode setting, refer https://github.com/emacs-lsp/lsp-mode

(use-package lsp-mode
  :ensure t
  ;; uncomment to enable gopls http debug server
  ;; :custom (lsp-gopls-server-args '("-debug" "127.0.0.1:0"))
  :commands (lsp lsp-defered)
  :config (progn
	    ;; use flycheck, not flymake
            (setq lsp-prefer-flymake nil)))

;; optional - provides fancy overlay information
(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  :config (progn
            ;; disable inline documentation
            (setq lsp-ui-sideline-enable nil)
            ;; disable showing docs on hover at the top of the window
            (setq lsp-ui-doc-enable nil)))

(provide 'init-lsp)
;;; init-lsp.el ends here.
