;; -*- coding: utf-8; lexical-binding: t; -*-

;;; Commentary:
;; evil mode setup

;;; Code:

;; evil - The extensible vi layer for Emacs.
;; https://github.com/emacs-evil/evil
(use-package evil
  :ensure t
  :config
  ;; enable evil mode
  ;;(evil-mode 1)
  )

;; evil-nerd-commenter -  Comment/uncomment lines efficiently. Like Nerd Commenter in Vim
;; https://github.com/redguardtoo/evil-nerd-commenter
;; NOTE: evil is optional for this plugin
(use-package evil-nerd-commenter
  :ensure t
  :config
  ;; not enable default key-bindings as it has conflict
  ;; with `projectile' prefix - `C-c p'
  ;; (evilnc-default-hotkeys)
  (global-set-key (kbd "M-;") 'evilnc-comment-or-uncomment-lines))

;; evil-matchit -  Vim matchit ported into Emacs
;; https://github.com/redguardtoo/evil-matchit
(use-package evil-matchit
  :ensure t
  :after evil
  :config
  (global-evil-matchit-mode 1))


(provide 'init-evil)
;;; init-evil.el ends here
