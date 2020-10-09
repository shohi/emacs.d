;; -*- coding: utf-8; lexical-binding: t; -*-
;; key-chord setting up

;; key-chord - Map pairs of simultaneously pressed keys to commands
;; refer, https://emacsredux.com/blog/2013/04/28/execute-commands-ninja-style-with-key-chord-mode/
;; NOTE: not work
(use-package key-chord
  :ensure t
  :init
  (key-chord-define-global "jf" 'beginning-of-defun)
  (key-chord-define-global "jk" 'beginning-of-buffer)

  (key-chord-mode +1))

(provide 'init-key-chord)
;;; init-key-chord.el ends here.
