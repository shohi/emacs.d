;; -*- coding: utf-8; lexical-binding: t; -*-
;; org-mode settting, https://github.com/emacs-tw/awesome-emacs#org-mode

;; hide leading stars does not work well with themes
;; (use-package org-bullets
;;   :ensure t
;;   :hook (org-mode . org-bullets-mode))

;; activate default key-bindings
;; https://orgmode.org/manual/Activation.html
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

(provide 'init-org)
;;; init-org.el ends here.
