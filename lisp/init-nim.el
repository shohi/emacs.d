;; -*- coding: utf-8; lexical-binding: t; -*-
;; nim-lang setup, refer https://lupan.pl/dotemacs/

(use-package lsp-mode
  :ensure t
  :commands lsp
  :config
  ;; Register `nimlsp` from https://github.com/PMunch/nimlsp
  (add-to-list 'lsp-language-id-configuration '(nim-mode . "nim"))
  (lsp-register-client
   (make-lsp-client :new-connection (lsp-stdio-connection '("nimlsp"))
                    :major-modes '(nim-mode)
                    :server-id 'nim-ls)))

(use-package highlight-indent-guides
  :ensure t
  :init
  (setq highlight-indent-guides-method 'character))

(use-package nim-mode
  :ensure t
  :init
  (add-hook 'nim-mode-hook 'highlight-indent-guides-mode))

(provide 'init-nim)
;;; init-nim.el ends here.
