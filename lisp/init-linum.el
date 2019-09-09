;; -*- coding: utf-8; lexical-binding: t; -*-
;; line numbers

(use-package linum-relative
  :ensure t
  :config
  (setq linum-relative-current-symbol "")

    ;; use line number instead of relative line number.
    ;; (add-hook 'prog-mode-hook 'linum-relative-mode)
    (add-hook 'prog-mode-hook 'display-line-numbers-mode)
  )

(provide 'init-linum)
;;; init-linum ends here.
