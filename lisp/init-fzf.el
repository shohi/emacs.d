;; -*- coding: utf-8; lexical-binding: t; -*-
;; fzf.el - A front-end for fzf.
;; require `fzf` installed, e.g, "brew install fzf".
;; https://github.com/bling/fzf.el

(defun my-lcd ()
  (interactive)
  (fzf/start default-directory
             (fzf/grep-cmd "lcd" "-l %s")))

(use-package fzf
  :ensure t
  :init
  (autoload 'fzf/start "fzf")
  :bind
  (("C-c f" . fzf)
   ("C-c d" . my-lcd)))

(provide 'init-fzf)
;;; init-fzf ends here.
