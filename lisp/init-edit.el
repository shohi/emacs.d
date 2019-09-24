;; -*- coding: utf-8; lexical-binding: t; -*-
;; setup for efficient editing.

;; Edit regions in separate buffers
;; https://github.com/Fanael/edit-indirect/blob/master/edit-indirect.el
(use-package edit-indirect
  :ensure t)

;; simpleclip - Simplified access to the system clipboard in Emacs.
;; https://github.com/rolandwalker/simpleclip
(use-package simpleclip
  :ensure t
  :config
  (simpleclip-mode 0))

(provide 'init-edit)
;;; init-edit.el ends here.
