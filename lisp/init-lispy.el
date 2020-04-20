;; -*- coding: utf-8; lexical-binding: t; -*-
;; Emacs lisp formatter setup
;; https://github.com/abo-abo/lispy

;; use lispy as elisp formatter
(use-package lispy
  :ensure t)

;; enable lispy automatically for lisp dialect source.
(add-hook 'emacs-lisp-mode-hook (lambda () (lispy-mode 1)))

;; enable lispy for eval-expression
(defun conditionally-enable-lispy ()
  (when (eq this-command 'eval-expression)
    (lispy-mode 1)))
(add-hook 'minibuffer-setup-hook 'conditionally-enable-lispy)

(provide 'init-formatter)
;;; init-formatter ends here.
