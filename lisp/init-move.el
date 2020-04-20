;; -*- coding: utf-8; lexical-binding: t; -*-
;; keybinds for efficient move

;; enable show parenthesis
;; (show-paren-mode)

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
  ("C-c ;" . avy-goto-char-timer)
  ;; `Ctrl-;` and `Ctrl-'` not work in terminal
  ;; https://unix.stackexchange.com/questions/161719/why-cant-emacs-running-in-a-terminal-distinguish-ctrl-from
  ;; ("C-:" . avy-goto-char)
  ;; ("C-'" . avy-goto-char-2)
  )

(provide 'init-move)
;;; init-move.el ends here.
