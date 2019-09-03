;; -*- coding: utf-8; lexical-binding: t; -*-
;; ace-window — select window to switch
;; https://github.com/abo-abo/ace-window

(use-package ace-window
  :ensure t
  :init
  (progn
    (global-set-key [remap other-window] 'ace-window)
    (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
  ))

(provide 'init-acewindow)
;;; init-acewindow.el ends here.
