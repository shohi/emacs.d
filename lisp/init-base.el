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
  (load-file "~/.emacs.d/init.el"))
(global-set-key (kbd "C-c r") 'config-reload)

;; disable menus and scrollbar
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; disable ring bell
(setq ring-bell-function 'ignore)

;; set utf-8 encoding
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; disable backups and auto-saves
(setq make-backup-files nil) ; stop creating backup~ files
(setq auto-save-default nil) ; stop creating #autosave# files
(setq create-lockfiles nil)  ; stop creating .# files

;; Revert (update) buffers automatically when underlying files are changed externally.
(global-auto-revert-mode t)

;; enable dubug on error
;; (setq debug-on-error t)

;; delete trailing space before save
;; https://stackoverflow.com/questions/7746965/how-do-you-delete-trailng-white-space-in-emacs
;; TODO: not work
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(provide 'init-base)
;;; init-base.el ends here.
