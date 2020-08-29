;; -*- coding: utf-8; lexical-binding: t; -*-
;; Treemacs - a tree layout file explorer for Emacs
;; https://github.com/Alexander-Miller/treemacs

(use-package treemacs
  :ensure t
  :defer t
  :config
  (progn
    (setq treemacs-collapse-dirs                 (if treemacs-python-executable 3 0)
          treemacs-deferred-git-apply-delay      0.5
          treemacs-display-in-side-window        t
          treemacs-eldoc-display                 t
          treemacs-file-event-delay              5000
          treemacs-file-follow-delay             0.2
          treemacs-follow-after-init             t
          treemacs-git-command-pipe              ""
          treemacs-goto-tag-strategy             'refetch-index
          treemacs-indentation                   2
          treemacs-indentation-string            " "
          treemacs-is-never-other-window         nil
          treemacs-max-git-entries               5000
          treemacs-missing-project-action        'ask
          treemacs-no-png-images                 nil
          treemacs-no-delete-other-windows       t
          treemacs-project-follow-cleanup        nil
          treemacs-persist-file                  (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
          treemacs-position                      'left
          treemacs-recenter-distance             0.1
          treemacs-recenter-after-file-follow    nil
          treemacs-recenter-after-tag-follow     nil
          treemacs-recenter-after-project-jump   'always
          treemacs-recenter-after-project-expand 'on-distance
          treemacs-show-cursor                   nil
          treemacs-show-hidden-files             t
          treemacs-silent-filewatch              nil
          treemacs-silent-refresh                nil
          treemacs-sorting                       'alphabetic-asc
          treemacs-space-between-root-nodes      t
          treemacs-tag-follow-cleanup            t
          treemacs-tag-follow-delay              1.5
          treemacs-width                         35)

    ;; The default width and height of the icons is 22 pixels. If you are
    ;; using a Hi-DPI display, uncomment this to double the icon size.
    ;;(treemacs-resize-icons 44)

    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode t)
    (pcase (cons (not (null (executable-find "git")))
                 (not (null treemacs-python-executable)))
      (`(t . t)
       (treemacs-git-mode 'deferred))
      (`(t . _)
       (treemacs-git-mode 'simple)))
(defun sk/treemacs--workspace-contains-filename-p (w f)
  "Test whether the workspace W contain filename F. Return t if yes, otherwise nil."
  (require 'dash)
  (let ((pred (lambda (item)
		(s-matches? (treemacs-project->path item) f))))
	 (if (-filter pred (treemacs-workspace->projects w))
	     t
	   nil)))

;; helper function to switch to workspace where current buffer is in
;; refer, https://github.com/Alexander-Miller/treemacs/issues/708
(defun sk/treemacs--find-workspace-by-filename (f)
  "Find treemacs workspace by given file name F, where F is absolute path.
If not found, return nil; otherwise, return the workspace."
  (when (file-exists-p f)
    (require 'dash)
    (let* ((pred (lambda (w) (sk/treemacs--workspace-contains-filename-p w f)))
	   (m (-filter pred treemacs--workspaces)))
      (if m
	  (first m)
	nil))))

(defun sk/treemacs-switch-to-workspace ()
  "Switch to treemacs workspace which containes the file of current buffer.
If no matched workspace found, print a warn."
  (interactive)
  (if (boundp 'treemacs--workspaces)
      (progn
        (let* ((f (buffer-file-name))
	       (w (sk/treemacs--find-workspace-by-filename f)))
	  (when w
	    ;; (treemacs-current-workspace)
            (setf (treemacs-current-workspace) w)
            (treemacs--invalidate-buffer-project-cache)
	    (treemacs--rerender-after-workspace-change)
	    (run-hooks 'treemacs-switch-workspace-hook))))
    ;; init treemacs
    (treemacs))))
  :bind
  (:map global-map
        ("M-0"       . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x t t"   . treemacs)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag)))

(use-package treemacs-projectile
  :after treemacs projectile
  :ensure t)

(use-package treemacs-magit
  :after treemacs magit
  :ensure t)

(defun sk/treemacs--workspace-contains-filename-p (w f)
  "Test whether the workspace W contain filename F. Return t if yes, otherwise nil."
  (require 'dash)
  (let ((pred (lambda (item)
		(s-matches? (treemacs-project->path item) f))))
	 (if (-filter pred (treemacs-workspace->projects w))
	     t
	   nil)))

;; helper function to switch to workspace where current buffer is in
;; refer, https://github.com/Alexander-Miller/treemacs/issues/708
(defun sk/treemacs--find-workspace-by-filename (f)
  "Find treemacs workspace by given file name F, where F is absolute path.
If not found, return nil; otherwise, return the workspace."
  (require 'dash)
  (when (file-exists-p f)
    (let* ((pred (lambda (w) (sk/treemacs--workspace-contains-filename-p w f)))
	   (m (-filter pred treemacs--workspaces)))
      (if m
	  (first m)
	nil))))

(defun sk/treemacs-switch-to-workspace ()
  "Switch to treemacs workspace which containes the file of current buffer.
If no matched workspace found, print a warn."
  (interactive)
  (require 'cl-lib)
  (require 'treemacs)
  (if (boundp 'treemacs--workspaces)
      (progn
        (let* ((f (buffer-file-name))
	       (w (sk/treemacs--find-workspace-by-filename f)))
	  (when w
	    ;; (treemacs-current-workspace)
            (setf (treemacs-current-workspace) w)
            (treemacs--invalidate-buffer-project-cache)
	    (treemacs--rerender-after-workspace-change)
	    (run-hooks 'treemacs-switch-workspace-hook))))
    ;; init treemacs
    (treemacs)))

;; FIXME: not work, always throw error
;; Symbol’s function definition is void: \(setf\ treemacs-current-workspace\)
(global-set-key (kbd "C-x t g") 'sk/treemacs-switch-to-workspace)

(provide 'init-treemacs)
;;; init-treemacs.el ends here.
