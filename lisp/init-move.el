;; -*- coding: utf-8; lexical-binding: t; -*-
;; keybinds for efficient move

;; enable show parenthesis
(show-paren-mode)

;; fast switch between matching parenthesis using `%`
;; https://www.gnu.org/software/emacs/manual/html_node/efaq/Matching-parentheses.html
;; By an unknown contributor
(global-set-key "%" 'match-paren)

(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s(") (forward-list 1) (backward-char 1))
	((looking-at "\\s)") (forward-char 1) (backward-list 1))
	(t (self-insert-command (or arg 1)))))

(use-package move-text
  :ensure t
  :bind
  ("M-n" . move-text-down)
  ("M-p" . move-text-up))

;; avy -Jump to things in Emacs tree-style
;; https://github.com/abo-abo/avy
(use-package avy
  :ensure t
  :bind
  ("C-c ;" . avy-goto-char-timer))

(provide 'init-move)
;;; init-move.el ends here.
