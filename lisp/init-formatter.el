;; -*- coding: utf-8; lexical-binding: t; -*-
;; formatter using external programs

;; basic setting for shellscript modes
(setq-default sh-basic-offset 2)

;; shell formatter
(use-package shfmt
  :ensure t
  :after reformatter
  :config
  ;; use 2 spaces for indent
  (customize-save-variable 'shfmt-arguments '("-ci" "-i" "2"))

  ;; format on save
  (add-hook 'shell-script-mode-hook 'shfmt-on-save-mode))

;; elisp formatter
(use-package elisp-format
  :ensure t)

;; json mode
(use-package json-mode
  :ensure t)

;; reformatter - Define commands which run reformatters on the current Emacs buffer
;; https://github.com/purcell/reformatter.el
(use-package reformatter
  :ensure t)

(provide 'init-formatter)
;;; init-formatter.el ends here.
