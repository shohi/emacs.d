;; -*- coding: utf-8; lexical-binding: t; -*-
;; setting for yaml files

(use-package yaml-mode
  :ensure t
  :mode ("\\.yaml\\'" "\\.yml\\'")
  :init
  (add-hook 'yaml-mode-hook '(lambda ()
			       (define-key yaml-mode-map "\C-m" 'newline-and-indent))))

(provide 'init-yaml-mode)
;;; init-yaml-mode ends here.
