;; -*- coding: utf-8; lexical-binding: t; -*-
;; Multiple cursors for emacs.
;; https://github.com/magnars/multiple-cursors.el
;; TODO: find more convenient kbd

(use-package multiple-cursors
  :ensure t
  :bind
  (("C-c n" . mc/mark-next-like-this)
   ("C-c p" . mc/mark-previous-like-this)))


(provide 'init-multiplecursors)
;;; init-multiplecursors ends here.
