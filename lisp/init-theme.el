;; -*- coding: utf-8; lexical-binding: t; -*-
;; install frequently used themes, https://emacsthemes.com/popular/index.html
;; - nord theme, https://www.nordtheme.com/docs/ports/emacs/installation
;; - zenburn theme, https://github.com/bbatsov/zenburn-emacs

(use-package zenburn-theme
  :ensure t
  :config
  (load-theme 'zenburn t))

(use-package nord-theme
  :ensure t
  ;; :config
  ;; (load-theme 'nord t)
  )

(provide 'init-theme)
;;; init-theme.el ends here.
