;; -*- coding: utf-8; lexical-binding: t; -*-
;; setup common libraries

;; dash and dash-functional
;; A modern list library for Emacs
;; https://github.com/magnars/dash.el
(use-package dash
  :ensure t)

(use-package dash-functional
  :ensure t)

;; quickrun -  Run command quickly. This packages is inspired quickrun.vim
;; https://github.com/emacsorphanage/quickrun
(use-package quickrun
  :ensure t)

(provide 'init-library)
;;; init-library.el ends here
