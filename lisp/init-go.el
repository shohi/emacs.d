;; -*- coding: utf-8; lexical-binding: t; -*-
;; refer, gopls-config.el
;; https://gist.github.com/psanford/b5d2689ff1565ec7e46867245e3d2c76

;; https://arenzana.org/2019/12/emacs-go-mode-revisited/

;; rely on
;; - init-lsp.el
;; - init-flycheck.el
;; - init-company.el

(use-package go-mode
  :ensure t
  :mode ("\\.go\\'" . go-mode)
  :bind (
         ;; If you want to switch existing go-mode bindings to use lsp-mode/gopls instead
         ;; uncomment the following lines
         ;; ("C-c C-j" . lsp-find-definition)
         ;; ("C-c C-d" . lsp-describe-thing-at-point)
         )
  :hook ((go-mode . lsp-deferred)
         (before-save . lsp-format-buffer)
         (before-save . lsp-organize-imports)))

(provide 'init-go)
;;; init-go.el ends here.
