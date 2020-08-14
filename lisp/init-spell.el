;; -*- coding: utf-8; lexical-binding: t; -*-

;;; Commentary:
;; spelling check setup
;; * need aspell/hunspell installed, and also corresponding dictionaries

;; install aspll -  brew install aspell


;;; Code:
;; refer https://github.com/redguardtoo/emacs.d/blob/master/lisp/init-spelling.el


;; wucuo - Fastest solution to spell check camel case code or plain text
;; https://github.com/redguardtoo/wucuo
(use-package wucuo
  :ensure t
  :hook
  (prog-mode . wucuo-start)
  (text-mode . wucuo-start))

(provide 'init-spell)
;;; init-spell.el ends here
