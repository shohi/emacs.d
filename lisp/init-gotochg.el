;; -*- coding: utf-8; lexical-binding: t; -*-
;; go to last buffer change.
;; https://melpa.org/#/goto-chg

(use-package goto-chg
  :ensure t
  :bind
  ("C-c g" . goto-last-change)
  ;; ("C-c G" . goto-last-change-reverse)
  )

(provide 'init-gotochg)
;;; init-gotochg ends here.
