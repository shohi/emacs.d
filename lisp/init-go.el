;; -*- coding: utf-8; lexical-binding: t; -*-
;; golang setup, refer https://lupan.pl/dotemacs/ 

(defun my-go-electric-brace ()
  "Insert an opening brace may be with the closing one.
If there is a space before the brace also adds new line with
properly indented closing brace and moves cursor to another line
inserted between the braces between the braces."
  (interactive)
  (if (not (looking-back " "))
      (insert "{")
    (insert "{")
    (newline)
    (indent-according-to-mode)
    (save-excursion
      (newline)
      (insert "}")
      (indent-according-to-mode))))

(defun my-go-list-packages ()
  "Return list of Go packages."
  (split-string
   (with-temp-buffer
     (shell-command "go list ... 2>/dev/null" (current-buffer))
     (buffer-substring-no-properties (point-min) (point-max)))
   "\n"))

(defun my-godoc-package ()
  "Display godoc for given package (with completion)."
  (interactive)
  (godoc (helm :sources (helm-build-sync-source "Go packages"
                          :candidates (my-go-list-packages))
               :buffer "*godoc packages*")))

(use-package lsp-mode
  :ensure t
  :commands lsp)

(use-package company-lsp
  :ensure t
  :defer)

(use-package go-guru
  :ensure t
  :defer)

(use-package company
  :ensure t
  :defer)

(use-package go-mode
  :ensure t
  :init
  (setq gofmt-command "goimports"     ; use goimports instead of gofmt
        go-fontify-function-calls nil ; fontifing names of called
                                      ; functions is too much for me
        company-idle-delay nil)	; avoid auto completion popup, use TAB
                                ; to show it
  :bind
  (:map go-mode-map
        ("C-c d" . lsp-describe-thing-at-point)
        ("C-c g" . godoc)
        ("C-c P" . my-godoc-package)
        ("{" . my-go-electric-brace)
        ("C-i" . company-indent-or-complete-common)
        ("C-M-i" . company-indent-or-complete-common)
   )
  :config
  (require 'go-guru)
  (add-hook 'go-mode-hook #'lsp)
  (add-hook 'go-mode-hook #'smartparens-mode)
  ;; run gofmt/goimports when saving the file
  (add-hook 'before-save-hook #'gofmt-before-save))

;; Go/speedbar integration

(eval-after-load 'speedbar
  '(speedbar-add-supported-extension ".go"))

(provide 'init-go)
;;; init-go.el ends here.
