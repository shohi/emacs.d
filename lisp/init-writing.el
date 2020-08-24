;; -*- coding: utf-8; lexical-binding: t; -*-

;;; Commentary:
;; setup for writing, refers
;; - https://explog.in/notes/writingsetup.html
;; - https://jacmoes.wordpress.com/2019/09/24/creative-writing-with-emacs/


;;; Code:

;; olivetti - A simple Emacs minor mode for a nice writing environment
;; https://github.com/rnkn/olivetti
(use-package olivetti
  :ensure t)

;; a distraction-free writing mode
;; https://github.com/joostkremers/writeroom-mode
(use-package writeroom-mode
  :ensure t)

;; manually enable follow-mode on buffers for same file
;; M-x follow-mode

(provide 'init-writing)
;;; init-writing.el ends here.
