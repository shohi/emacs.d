;; -*- coding: utf-8; lexical-binding: t; -*-
;; keybinds for efficient selection

;; expand the marked region in semantic increments (negative prefix to reduce region)
(use-package expand-region
  :ensure t
  :bind
  ("C-q" . er/expand-region))

;; Emacs version of vim's ci and co commands
(use-package change-inner
  :ensure t
  ;; :after expand-region
  :bind
  ("M-i" . change-inner)
  ("M-o" . change-outer))

(provide 'init-select)
;;; init-select.el ends here.
