;; -*- coding: utf-8; lexical-binding: t; -*-
;; markdown-mode for editing Markdown-formatted text.
;; https://github.com/jrblevin/markdown-mode

(use-package markdown-mode
  :ensure t
  :mode (("README\\.md\\'" . gfm-mode)
	 ("\\.md\\'" . markdown-mode)
	 ("\\.markdown\\'" . markdown-mode))
  :init
  ;; use pandoc as markdown generating tool
  ;; `brew install pandoc'
  (setq markdown-command "pandoc")
  )

(provide 'init-markdown)
;;; init-markdown.el ends here.
