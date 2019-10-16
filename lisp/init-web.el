;; -*- coding: utf-8; lexical-binding: t; -*-
;; web-mode settings, http://web-mode.org/

;; NOTE: web-mode-enable-engine-detection does not working
;; need to call `web-mode-set-engine` manually.
(use-package web-mode
  :ensure t
  :config (setq web-mode-enable-engine-detection t)
  )

(provide 'init-web)
;;; init-web ends here.
