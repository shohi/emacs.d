;; -*- coding: utf-8; lexical-binding: t; -*-
;; yasnippet - A template system for Emacs
;; https://github.com/joaotavora/yasnippet
;;
;; global snippets (available for all modes) are defined
;; under `fundamental-mode'
;; https://github.com/joaotavora/yasnippet/issues/936

(use-package yasnippet
  :ensure t
  :diminish yas-minor-mode
  :config
  (use-package yasnippet-snippets
    :ensure t)

  (yas-global-mode 1)
  ;; (yas-reload-all)
  ;; (add-hook 'prog-mode-hook #'yas-minor-mode)
  ;; (add-hook 'org-mode-hook #'yas-minor-mode)
  )

;; refer, https://github.com/joaotavora/yasnippet/blob/master/README.mdown
;; add custom snippets dir. "~/.emacs.d/snippets" is included by default.
;; (add-to-list 'yas-snippet-dirs "path/to/your/snippets/dir")

(provide 'init-yasnippet)
;;; init-yasnippet.el ends here.
