;;; init-org --- settings for orgmode -*- coding: utf-8; lexical-binding: t; -*-

;;; Commentary:

;; org-mode settting
;; refer https://github.com/emacs-tw/awesome-emacs#org-mode

;;; Code:

(require 'org)
;; hide leading stars does not work well with themes
;; (use-package org-bullets
;;   :ensure t
;;   :hook (org-mode . org-bullets-mode))

;; disable electric-indent-mode for orgmode
(use-package org
  :ensure nil
  :config
  ;; ;; activate default key-bindings
  ;; ;; https://orgmode.org/manual/Activation.html

  (global-set-key (kbd "C-c l") 'org-store-link)
  (global-set-key (kbd "C-c a") 'org-agenda)
  (global-set-key (kbd "C-c c") 'org-capture)

  (add-hook 'org-mode-hook (lambda()
			     (electric-indent-local-mode -1))))

;; vimrc-mode - Enables syntax highlighting for .vimrc/_vimrc files
;; https://github.com/mcandre/vimrc-mode
(use-package vimrc-mode
  :ensure t
  :mode ("\\.vim\\(rc\\)?\\'" . vimrc-mode)
  :defer)

;; David O'Toole Org tutorial
;; https://orgmode.org/worg/org-tutorials/orgtutorial_dto.html
(setq org-log-done t)

;; TODO set `org-agenga-files'
;; https://stackoverflow.com/questions/11384516/how-to-make-all-org-files-under-a-folder-added-in-agenda-list-automatically
(setq org-agenda-files '("~/workshop/org"))

(provide 'init-org)
;;; init-org.el ends here
