;; -*- coding: utf-8; lexical-binding: t; -*-
;; setting for handling links

(use-package orglink
  :ensure t
  :bind ("C-c C-o" . org-open-at-point-global)
  :config
  ;; enable orglink-mode for all buffers
  ;; except org-mode
  (global-orglink-mode)
  )

(provide 'init-link)
;;; init-link ends here
