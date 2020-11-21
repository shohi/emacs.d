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

;; deletes all the whitespace when you hit backspace or delete
(use-package hungry-delete
  :ensure t
  :config
  (global-hungry-delete-mode))

;; crux - A Collection of Ridiculously Useful eXtensions for Emacs
;; https://github.com/bbatsov/crux
(use-package crux
  :ensure t
  :bind (("C-a" . crux-move-beginning-of-line)
	 ("C-k" . crux-smart-kill-line)
	 ("C-c j" . crux-top-join-line)
	 ))

(provide 'init-edit)
;;; init-edit.el ends here.
