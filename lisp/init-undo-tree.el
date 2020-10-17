;; -*- coding: utf-8; lexical-binding: t; -*-
;; undo-tree

(use-package undo-tree
  :ensure t
  :defer t
  :diminish undo-tree-mode
  :init
  (global-undo-tree-mode))

(provide 'init-undo-tree)
;;; init-undo-tree.el ends here.
