;; -*- coding: utf-8; lexical-binding: t; -*-
;; helm - Emacs incremental completion and selection narrowing framework
;; https://github.com/emacs-helm/helm

(use-package helm
  :ensure t
  :init
  (setq helm-split-window-default-side 'other)
  (helm-mode 1)
  :config
  (require 'helm-config)
  (define-key helm-find-files-map
    (kbd "<backtab>") #'helm-select-action)
  (define-key helm-find-files-map
    (kbd "C-i")  #'helm-execute-persistent-action)
  :bind
  (
   ("M-x" . helm-M-x)
   ("M-y" . helm-show-kill-ring)
   ("C-x C-f" . helm-find-files)
   ("C-c o" . helm-occur)
   ("C-x b" . helm-mini)
   ("C-x r b" . helm-bookmarks)
   ("C-h a" . helm-apropos)
   ("C-h d" . helm-info-at-point)
   ("C-c L" . helm-locate)
   ("C-c r" . helm-resume)
   ("C-c i" . helm-imenu)))

;; (use-package helm-swoop
;;  :ensure t
;;  :defer
  ;;
  ;; :bind
  ;; (("C-s" . helm-swoop-without-pre-input)
  ;;  ("C-S-s" . helm-swoop))
;;  )

;; (use-package helm-descbinds
;;  :ensure t
;;  :init
;;  (helm-descbinds-mode))

;; TODO: disable
;; (use-package helm-git-grep
;;  :ensure t
;;  :bind
;;  (("C-c j" . helm-git-grep)
;;   ("C-c J" . helm-git-grep-at-point)))

;; (use-package helm-ls-git
;;  :ensure t
;;  :bind
;;  (("C-c g" . helm-ls-git-ls)))

;; (use-package helm-make
;;  :ensure t
;;  :bind
;;  (("C-c K" . helm-make)))

;; (use-package helm-c-yasnippet
;;  :ensure t
;;  :bind
;;  (("C-c y" . helm-yas-complete)))

;; (use-package helm-mt
;;  :ensure t
;;  :bind (("C-c S" . helm-mt)))

(provide 'init-helm)
;;; init-helm ends here.
