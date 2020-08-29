;; -*- coding: utf-8; lexical-binding: t; -*-
;; rust setup, refer https://lupan.pl/dotemacs/

;; TODO: update setting - use rustic
;; https://people.gnome.org/~federico/blog/bringing-my-emacs-from-the-past.html
;; https://lupan.pl/dotemacs/

(use-package cargo
  :ensure t
  :defer)

(use-package racer
  :ensure t
  :defer)

(use-package rust-mode
  :ensure t
  :init
  (setq company-tooltip-align-annotations t
        rust-format-on-save t)
  :config
  (add-hook 'rust-mode-hook #'company-mode)
  (add-hook 'rust-mode-hook #'cargo-minor-mode)
  (add-hook 'rust-mode-hook #'racer-mode)

  (add-hook 'racer-mode-hook #'eldoc-mode)
  (add-hook 'racer-mode-hook #'company-mode)

  (use-package flycheck-rust
     :ensure t)
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)

  :bind
  (:map rust-mode-map
   ("C-i" . company-indent-or-complete-common)))

(provide 'init-rust)
;;; init-rust.el ends here.
