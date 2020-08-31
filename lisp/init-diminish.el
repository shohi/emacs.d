;; -*- coding: utf-8; lexical-binding: t; -*-
;; Diminished modes are minor modes with no modeline display

(use-package diminish
  :ensure t
  :init
  (diminish 'which-key-mode)
  (diminish 'linum-relative-mode)
  (diminish 'hungry-delete-mode)
  (diminish 'visual-line-mode)
  (diminish 'subword-mode)
  (diminish 'beacon-mode)
  (diminish 'irony-mode)
  (diminish 'page-break-lines-mode)
  (diminish 'auto-revert-mode)
  (diminish 'rainbow-delimiters-mode)
  (diminish 'rainbow-mode)
  (diminish 'yas-minor-mode)
  (diminish 'flycheck-mode)
  (diminish 'helm-mode)
  (diminish 'git-gutter-mode)
  (diminish 'osx-clipboard-mode))

(provide 'init-diminish)
;;; init-diminish ends here.
