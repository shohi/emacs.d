;; -*- coding: utf-8; lexical-binding: t; -*-
;; lsp-mode setting, refer https://github.com/emacs-lsp/lsp-mode

(use-package lsp-mode
  :ensure t
  :commands lsp)

(use-package company-lsp
  :ensure t)

(use-package company
  :ensure t)

(provide 'init-lsp)
;;; init-lsp.el ends here.
