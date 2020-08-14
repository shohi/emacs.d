;; -*- coding: utf-8; lexical-binding: t; -*-

;;; Commentary:
;; Golang setup

;; refer, gopls-config.el
;; https://gist.github.com/psanford/b5d2689ff1565ec7e46867245e3d2c76
;; https://arenzana.org/2019/12/emacs-go-mode-revisited/
;; https://glassonion.hatenablog.com/entry/2020/02/17/144008

;; rely on
;; - init-lsp.el
;; - init-flycheck.el
;; - init-company.el

;; NOT: lsp format/organize not work
;; - lsp-format-buffer
;; - lsp-organize-imports

;; TODO
;; 1. delete func and save it to the ring
;; 2. go-impl does not work and not detect struct or interface under cursor

;;; Code:

;; Provides functions to switch between test and implementation
;; https://github.com/wjdix/go-alternate.el
(defun go-alternate-visit-at-point ()
  "Visit alternate file to currently visited go buffer."
  (interactive)
  (switch-to-buffer (find-file (go-alternate-alternate-file-name))))

(defun go-alternate-alternate-file-name ()
  "Find alternate file name of open buffer."
  (interactive)
  (let ((dir (file-name-directory buffer-file-name))
        (extension (file-name-extension buffer-file-name 't)))

    (unless (string= extension ".go")
      (error "Not in a go file"))

    (if (string-match "_test.go" buffer-file-name)
        (go-alternate--implementation-file-name buffer-file-name)
      (go-alternate--test-file-name buffer-file-name))))

(defun go-alternate--implementation-file-name (file-name)
  "Get name of implementation file corresponding to FILE-NAME."
  (replace-regexp-in-string "_test.go" ".go" file-name))

(defun go-alternate--test-file-name (file-name)
  "Get name of test file corresponding to FILE-NAME."
  (concat (file-name-sans-extension file-name) "_test.go"))

(use-package go-mode
  :ensure t
  :mode ("\\.go\\'" . go-mode)
  :bind (:map go-mode-map
	      ("C-c R" . go-remove-unused-imports)
	      ("<f1>" . godoc-at-point))
  :config
  ;; require `goimports' installed
  (setq gofmt-command "goimports")
  (add-hook 'before-save-hook 'gofmt-before-save)
  (bind-key "C-x C-v" #'go-alternate-visit-at-point)
  )

;; gotest: Emacs mode to go unit test command line tool
;; https://github.com/nlamirault/gotest.el
(use-package gotest
  :ensure t
  :bind (:map go-mode-map
	      ("C-c t p" . go-test-current-project)
	      ("C-c t f" . go-test-current-file)
	      ("C-c t t" . go-test-current-test)
	      ("C-c t c" . go-test-current-coverage))
  )

;; impl generates method stubs for implementing an interface.
;; required binaries - `impl' and `godoc'
;; go get -u github.com/josharian/impl (or github.com/shohi/impl)
;; go get -u golang.org/x/tools/cmd/godoc

(use-package go-impl
  :ensure t)

;; NOTE: already handled by lsp
;; (use-package flycheck-golangci-lint
;;   :after flycheck
;;   :ensure t
;;   :hook (go-mode . flycheck-golangci-lint-setup))


(provide 'init-go)
;;; init-go.el ends here
