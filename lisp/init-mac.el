;; -*- coding: utf-8; lexical-binding: t; -*-
;; emacs kbds for macOS, https://github.com/freetonik/emacs-dotfiles#navigation-and-editing

;; Meta
;; Emacs control is Ctrl. Emacs Super is Command. Emacs Meta is Alt.
;; (setq mac-command-modifier 'super)
;; (setq mac-right-command-modifier 'super)
;; (setq mac-option-modifier 'meta)
;; (setq mac-left-option-modifier 'meta)
;; (setq mac-right-option-modifier 'meta)

;; Right Alt (option) can be used to enter symbols like em dashes `—`.
;; (setq mac-right-option-modifier 'nil)

;; visual
;; matching parenthesis appearance.
;; (set-face-background 'show-paren-match "grey84")
(set-face-attribute 'show-paren-match nil :weight 'extra-bold)

;; kill-line
(global-set-key (kbd "s-<backspace>") 'kill-whole-line)
(global-set-key (kbd "M-S-<backspace>") 'kill-word)

;;Use super (which is Cmd) for movement and selection just like in macOS.
(global-set-key (kbd "s-<right>") 'end-of-visual-line)
(global-set-key (kbd "s-<left>") 'beginning-of-visual-line)
;; (global-set-key (kbd "S-s-<left>") (kbd "M-S-m"))

(global-set-key (kbd "s-<up>") 'beginning-of-buffer)
(global-set-key (kbd "s-<down>") 'end-of-buffer)

(global-set-key (kbd "s-l") 'goto-line)

;; Basic things you should expect from macOS.
(global-set-key (kbd "s-a") 'mark-whole-buffer)       ;; select all
(global-set-key (kbd "s-s") 'save-buffer)             ;; save
(global-set-key (kbd "s-S") 'write-file)              ;; save as
(global-set-key (kbd "s-q") 'save-buffers-kill-emacs) ;; quit
(global-set-key (kbd "s-z") 'undo)                    ;; undo
