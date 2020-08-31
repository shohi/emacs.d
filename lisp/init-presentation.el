;; -*- coding: utf-8; lexical-binding: t; -*-

;;; Commentary:
;; presentation setting

;;; Code:

;; org-present -  Ultra-minimalist presentation minor-mode for Emacs org-mode.
;; https://github.com/rlister/org-present
(use-package org-present
  :ensure t
  :defer
  :config
  (add-hook 'org-present-mode-hook
            (lambda ()
                 (org-present-big)
                 (org-display-inline-images)
                 (org-present-hide-cursor)
                 (org-present-read-only)))
  (add-hook 'org-present-mode-quit-hook
	    (lambda ()
                 (org-present-small)
                 (org-remove-inline-images)
                 (org-present-show-cursor)
                 (org-present-read-write))))

;; remark-mode - an emacs major mode for remark
;; https://github.com/torgeir/remark-mode.el
;; https://github.com/gnab/remark
;; FIXME: remark-mode does not work with latest markdown-mode
(use-package remark-mode
  :ensure t
  :after markdown-mode
  :defer)

(provide 'init-presentation)
;;; init-presentation.el ends here
