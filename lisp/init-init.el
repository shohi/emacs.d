;; -*- coding: utf-8; lexical-binding: t; -*-
;; basic config, e.g. kbd for editing and reloading configurations.

;; some default global settings
(defalias 'yes-or-no-p 'y-or-n-p)

;; hl-line-mode does not work well with `nord-theme`, disable it.
;;(global-hl-line-mode t)

;; show the current line and column for cursor
(setq line-number-mode t)
(setq column-number-mode t)

;; edit config
(defun config-visit ()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-set-key (kbd "C-c e") 'config-visit)

;; reload config
(defun config-reload ()
  "Reloads ~/.emacs.d/init.el at runtime"
  (interactive)
  (load-file "~/.emacs.d/config.org"))
(global-set-key (kbd "C-c r") 'config-reload)

(provide 'init-init)
;;; init-init.el ends here.

