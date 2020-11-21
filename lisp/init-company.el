;; -*- coding: utf-8; lexical-binding: t; -*-
;; company-mode, http://company-mode.github.io/

(use-package company
  :ensure t
  :diminish company-mode
  :init (global-company-mode)
  :config
  (progn

    ;; copied from cabins' emacs.d
    (setq company-dabbrev-code-everywhere t
	  company-dabbrev-code-modes t
	  company-dabbrev-code-other-buffers 'all
	  company-dabbrev-downcase nil
	  company-dabbrev-ignore-case t
	  company-dabbrev-other-buffers 'all
	  company-require-match nil
	  company-show-numbers t
	  company-tooltip-limit 20
	  company-echo-delay 0
	  company-tooltip-offset-display 'scrollbar
	  company-begin-commands '(self-insert-command))

    ;; don't add any delay before trying to complete thing being typed
    ;; the call/response to gopls is asynchronous so this should have
    ;; little to no affect on edit latency (setq company-idle-delay 0)

    ;; disable auto idle completion
    (setq company-idle-delay nil)

    ;; start completing after a single character instead of 3
    (setq company-minimum-prefix-length 1)

    ;; align fields in completions
    (setq company-tooltip-align-annotations t)

    ;; refer https://iqss.github.io/IQSS.emacs/init.html
    ;; remap <TAB> to trigger completion
    (define-key company-mode-map [remap indent-for-tab-command] #'company-indent-or-complete-common)
    )
  )

(use-package company-lsp
  :ensure t
  :commands company-lsp)

(provide 'init-company)
;;; init-lsp.el ends here.
