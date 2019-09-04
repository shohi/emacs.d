;; -*- coding: utf-8; lexical-binding: t; -*-
;; line numbers

(use-package linum-relative
  :ensure t
  :config
    (setq linum-relative-current-symbol "")
    (add-hook 'prog-mode-hook 'linum-relative-mode))

(provide 'init-linum)
;;; init-linum ends here.
