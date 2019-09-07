;; -*- coding: utf-8; lexical-binding: t; -*-
;; rust setup, refer https://lupan.pl/dotemacs/ 

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
  :bind
  (:map rust-mode-map
   ("C-i" . company-indent-or-complete-common)))

(provide 'init-rust)
;;; init-rust.el ends here.
