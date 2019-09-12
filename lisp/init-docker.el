;; -*- coding: utf-8; lexical-binding: t; -*-
;; dockerfile-mode - An emacs mode for handling Dockerfiles
;; https://github.com/spotify/dockerfile-mode

(use-package dockerfile-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode)))

(provide 'init-docker)
;;; init-docker.el ends here.
