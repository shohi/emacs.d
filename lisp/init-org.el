;; -*- coding: utf-8; lexical-binding: t; -*-
;; org-mode settting, https://github.com/emacs-tw/awesome-emacs#org-mode

(require 'org)
;; hide leading stars does not work well with themes
;; (use-package org-bullets
;;   :ensure t
;;   :hook (org-mode . org-bullets-mode))

;; activate default key-bindings
;; https://orgmode.org/manual/Activation.html
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

;; David O'Toole Org tutorial
;; https://orgmode.org/worg/org-tutorials/orgtutorial_dto.html
(setq org-log-done t)

;; TODO set `org-agenga-files'
;; https://stackoverflow.com/questions/11384516/how-to-make-all-org-files-under-a-folder-added-in-agenda-list-automatically
(setq org-agenda-files '("~/workshop/org"))

(provide 'init-org)
;;; init-org.el ends here.
