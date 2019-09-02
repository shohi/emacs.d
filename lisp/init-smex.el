;; -*- coding: utf-8; lexical-binding: t; -*-
;; refer, https://github.com/nonsequitur/smex/tree/55aaebe3d793c2c990b39a302eb26c184281c42c

(use-package smex
  :ensure t
  :init (smex-initialize)
  :bind
  ("M-x" . smex)
  ("M-X" . smex-major-mode-commands)
  ("C-c C-c M-x" . execute-extended-command))

(provide 'init-smex)
;;; init-smex.el ends here.
