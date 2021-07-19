;; -*- coding: utf-8; lexical-binding: t; -*-
;; dumbjump setup, https://github.com/jacktasia/dumb-jump

(use-package dumb-jump
  :ensure t)

(defhydra dumb-jump-hydra (:color blue :columns 3)
    "Dumb Jump"
    ("j" dumb-jump-go "Go")
    ("o" dumb-jump-go-other-window "Other window")
    ("e" dumb-jump-go-prefer-external "Go external")
    ("x" dumb-jump-go-prefer-external-other-window "Go external other window")
    ("i" dumb-jump-go-prompt "Prompt")
    ("l" dumb-jump-quick-look "Quick look")
    ("b" dumb-jump-back "Back"))

(global-set-key (kbd "M-g") 'dumb-jump-hydra/body)
(add-hook 'xref-backend-functions #'dumb-jump-xref-activate)

(provide 'init-dumbjump)
;;; init-dumbjump.el ends here.
