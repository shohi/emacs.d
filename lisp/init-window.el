;; -*- coding: utf-8; lexical-binding: t; -*-
;; window setup

;; ace-window — select window to switch
;; https://github.com/abo-abo/ace-window
(use-package ace-window
  :ensure t
  :init
  (progn
    (global-set-key [remap other-window] 'ace-window)
    (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
  ))


;; transpose-frame - Transpose windows arrangement in a frame
(use-package transpose-frame
  :ensure t)

(provide 'init-window)
;;; init-window.el ends here.
