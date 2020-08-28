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
(defun sk/config-visit ()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-set-key (kbd "C-c e") 'config-visit)

;; reload config
(defun sk/config-reload ()
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

;; copy/paster from  system clipboard
;; * copy - `M-|' | pbcopy RET
;; * paste - `M-|' | pbpaste RET

;; set default fonts and frame size
;; 1. if running in terminal, use the terminal settings
;; 2. if running in GUI, apply following settings
;;
;; https://stackoverflow.com/questions/9845661/with-emacs-how-to-go-to-the-pairing-balancing-parentheses
;; https://emacs.stackexchange.com/questions/2501/how-can-i-set-default-font-in-emacs
;; https://emacs.stackexchange.com/questions/7151/is-there-a-way-to-detect-that-emacs-is-running-in-a-terminal
(when (display-graphic-p)
  ;; Do any keybindings and theme setup here

  ;; default fonts
  (add-to-list 'default-frame-alist '(font . "Droid Sans Mono for Powerline-24"))

  ;; default frame size
  (add-to-list 'default-frame-alist '(fullscreen . maximized)))

;; reveal current file in folder
;; reveal-in-folder, https://github.com/jcs-elpa/reveal-in-folder
(use-package reveal-in-folder
  :ensure t)

;; add translator
;; Youdao Dictionary, https://github.com/xuchunyang/youdao-dictionary.el
(use-package youdao-dictionary
  :ensure t
  :bind
  ("C-c y" . youdao-dictionary-search-at-point))

;; uuidgen -  UUID generation implemented in elisp.
;; https://github.com/kanru/uuidgen-el

(use-package uuidgen
  :ensure t)

(provide 'init-base)
;;; init-base.el ends here.
