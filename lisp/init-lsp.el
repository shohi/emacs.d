;; -*- coding: utf-8; lexical-binding: t; -*-
;; lsp-mode setting, refer https://github.com/emacs-lsp/lsp-mode

(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :config (progn
	    ;; use flycheck, not flymake
	    (setq lsp-prefer-flymake nil)
	    (setq lsp-enable-file-watchers nil)

	    ;; org-store-link binds to "C-c l" globally
	    ;; here using "C-c C-l" for lsp-keymap-prefix
	    ;; https://github.com/emacs-lsp/lsp-mode/issues/1532
	    (define-key lsp-mode-map (kbd "C-c C-l") lsp-command-map))
  :hook ((lsp-mode . lsp-enable-which-key-integration)
	 (go-mode . lsp-deferred))

  )

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
