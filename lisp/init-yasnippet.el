;; -*- coding: utf-8; lexical-binding: t; -*-
;; yasnippet - A template system for Emacs
;; https://github.com/joaotavora/yasnippet

(use-package yasnippet
  :ensure t
  :config
  (use-package yasnippet-snippets
    :ensure t)
  (yas-reload-all))

(provide 'init-yasnippet)
;;; init-yasnippet.el ends here.
