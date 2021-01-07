;; -*- coding: utf-8; lexical-binding: t; -*-
;; quelpa setup

;; bootstrap `quelpa'
; (unless (package-installed-p 'quelpa)
;   (package-refresh-contents)
;   (package-install 'quela))
; (setq quelpa-update-melpa-p nil)
;
; (unless (package-installed-p 'quelpa-use-package)
;   (package-refresh-contents)
;   (package-install 'quela-use-package))
; (require 'quelpa-use-package)

(use-package quelpa
  :ensure t
  :config
  (setq quelpa-update-melpa-p nil))

(use-package quelpa-use-package
  :ensure t
  :after quelpa)

;; init-quelpa.el ends here.
