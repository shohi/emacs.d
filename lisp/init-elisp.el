;; -*- coding: utf-8; lexical-binding: t; -*-
;; elisp setup

;; package-lint
;; A linting library for elisp package metadata
;; https://github.com/purcell/package-lint
(use-package package-lint
  :ensure t)

;; flycheck-package
;; Flycheck checker for elisp package metadata
;; https://github.com/purcell/flycheck-package
(use-package flycheck-package
  :after package-lint flycheck
  :ensure t)

;; TODO: how to integrate into flycheck-package
(eval-after-load 'flycheck '(flycheck-package-setup))

(provide 'init-elisp)
;;; init-elisp.el ends here.
