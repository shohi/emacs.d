;; -*- coding: utf-8; lexical-binding: t; -*-
;; setup buffer

;; make ibuffer default
(defalias 'list-buffers 'ibuffer-other-window)

(use-package buffer-move
  :ensure t)

(provide 'init-buffer)
;;; init-buffer.el ends here.
