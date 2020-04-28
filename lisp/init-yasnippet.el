;; -*- coding: utf-8; lexical-binding: t; -*-
;; yasnippet - A template system for Emacs
;; https://github.com/joaotavora/yasnippet

(use-package yasnippet
  :ensure t
  :config
  (use-package yasnippet-snippets
    :ensure t)
  (yas-reload-all)
  ;; (yas-global-mode 1)

  (add-hook 'prog-mode-hook #'yas-minor-mode)
  (add-hook 'org-mode-hook #'yas-minor-mode)
  (add-hook 'go-mode-hook #'yas-minor-mode)
  )

;; refer, https://github.com/joaotavora/yasnippet/blob/master/README.mdown
;; add custom snippets dir. "~/.emacs.d/snippets" is included by default.
;; (add-to-list 'yas-snippet-dirs "path/to/yasnippet-golang")

(provide 'init-yasnippet)
;;; init-yasnippet.el ends here.
