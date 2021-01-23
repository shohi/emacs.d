;; -*- coding: utf-8; lexical-binding: t; -*-
;; rust setup, refer https://lupan.pl/dotemacs/

;; use rustic
;; https://www.reddit.com/r/emacs/comments/gfa4hg/rustide_help_setting_up/
;; https://people.gnome.org/~federico/blog/bringing-my-emacs-from-the-past.html
;; https://emacs-china.org/t/rust-emacs/15568

(use-package rustic
  :ensure t
  :config
  ;; rust-analyzer is required
  ;; https://github.com/rust-analyzer/rust-analyzer
  (setq lsp-rust-analyzer-server-command '("~/.cargo/bin/rust-analyzer"))

  ;; clippy and flychecker
  ;; rustup component add --toolchain nightly clippy
  ;; (push 'rustic-clippy flycheck-checkers)
  )

(provide 'init-rust)
;;; init-rust.el ends here.
