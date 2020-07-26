;; -*- coding: utf-8; lexical-binding: t; -*-
;; magit, https://github.com/magit/magit

(use-package magit
  :ensure t
  ;; :config
  ;; (setq git-commit-summary-max-length 50)
  :bind ("C-x g" . magit-status))

(setq magit-status-margin
      '(t "%Y-%m-%d %H:%M " magit-log-margin-width t 18))

;; use diff-hl instead of git-gutter
;; https://github.com/dgutov/diff-hl/issues/92
(use-package diff-hl
  :ensure t
  :bind (("C-c C-p" . diff-hl-previous-hunk)
	 ("C-c C-n" . diff-hl-next-hunk))
  :config
  ;; Highlight changed files in the fringe of Dired
  (add-hook 'dired-mode-hook 'diff-hl-dired-mode)

  ;; TODO: integrate diff-hl into treemacs
  (global-diff-hl-mode)

  ;; Fall back to the display margin, if the fringe is unavailable
  (unless (display-graphic-p) (diff-hl-margin-mode)))

;; (use-package git-gutter
;;   :ensure t
;;   :bind (("C-c C-p" . git-gutter:previous-hunk)
;;          ("C-c C-n" . git-gutter:next-hunk))
;;   :init (global-git-gutter-mode 1))

(use-package git-timemachine
  :ensure t)

(use-package magit-todos
  :ensure t)

(provide 'init-magit)
;;; init-magit ends here.
