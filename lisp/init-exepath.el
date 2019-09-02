;; -*- coding: utf-8; lexical-binding: t; -*-
;; ensure environment variables inside Emacs look the same as in the user's shell
;; https://github.com/purcell/exec-path-from-shell

(use-package exec-path-from-shell
  :ensure t
  :if (memq window-system '(mac ns))
  :config
  (setq exec-path-from-shell-arguments '("-l"))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "GOROOT")
  (exec-path-from-shell-copy-env "GOPATH")
  (exec-path-from-shell-copy-env "GOBIN")
  (exec-path-from-shell-copy-env "LC_ALL")
  (exec-path-from-shell-copy-env "LANG")
  (exec-path-from-shell-copy-env "LC_TYPE")
  (exec-path-from-shell-copy-env "SHELL")
)

(provide 'init-exepath)
;;; init-exepath.el ends here.
