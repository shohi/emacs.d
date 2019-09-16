;; -*- coding: utf-8; lexical-binding: t; -*-
;; markdown-mode for editing Markdown-formatted text.
;; https://github.com/jrblevin/markdown-mode

(use-package markdown-mode
  :ensure t
  :mode (("README\\.md\\'" . gfm-mode)
	 ("\\.md\\'" . markdown-mode)
	 ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

(provide 'init-markdown)
;;; init-markdown.el ends here.
