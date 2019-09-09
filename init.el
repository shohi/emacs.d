;; -*- coding: utf-8; lexical-binding: t; -*-
;; (advice-add #'package-initialize :after #'update-load-path)

;;----------------------------------------------------------------------------
;; Emacs check
;;----------------------------------------------------------------------------

;; (let ((path (expand-file-name  "~/.emacs.d/lisp")))
;;  (if (file-accessible-directory-p path)
;;    (add-to-list 'load-path path t)))
(push (expand-file-name "~/.emacs.d/lisp") load-path)

(let* ((minver "24.4"))
  (when (version< emacs-version minver)
    (error "Emacs v%s or higher is required" minver)))

(defvar best-gc-cons-threshold
  4000000
  "Best default gc threshold value. Should NOT be too big!")

;; don't GC during startup to save time
(setq gc-cons-threshold most-positive-fixnum)

(setq emacs-load-start-time (current-time))

;; {{ emergency security fix
;; https://bugs.debian.org/766397
(eval-after-load "enriched"
  '(defun enriched-decode-display-prop (start end &optional param)
     (list start end)))
;; }}

;;----------------------------------------------------------------------------
;; Which functionality to enable (use t or nil for true and false)
;;----------------------------------------------------------------------------
(setq *is-a-mac* (eq system-type 'darwin))
(setq *win64* (eq system-type 'windows-nt))
(setq *cygwin* (eq system-type 'cygwin) )
(setq *linux* (or (eq system-type 'gnu/linux) (eq system-type 'linux)) )
(setq *unix* (or *linux* (eq system-type 'usg-unix-v) (eq system-type 'berkeley-unix)) )
(setq *emacs24* (>= emacs-major-version 24))
(setq *emacs25* (>= emacs-major-version 25))
(setq *emacs26* (>= emacs-major-version 26))
(setq *no-memory* (cond
                   (*is-a-mac*
                    (< (string-to-number (nth 1 (split-string (shell-command-to-string "sysctl hw.physmem")))) 4000000000))
                   (*linux* nil)
                   (t nil)))

;; @see https://www.reddit.com/r/emacs/comments/55ork0/is_emacs_251_noticeably_slower_than_245_on_windows/
;; Emacs 25 does gc too frequently
(when *emacs25*
  ;; (setq garbage-collection-messages t) ; for debug
  (setq best-gc-cons-threshold (* 64 1024 1024))
  (setq gc-cons-percentage 0.5)
  (run-with-idle-timer 5 t #'garbage-collect))

;;----------------------------------------------------------------------------
;; workaround settings
;;----------------------------------------------------------------------------

;; package `undo-tree` is unavailable.
;; https://github.com/bbatsov/prelude/issues/1225
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

;;----------------------------------------------------------------------------
;; global setting and package bootloader
;;----------------------------------------------------------------------------
(defmacro require-init (pkg)
  `(load (file-truename (format "~/.emacs.d/lisp/%s" ,pkg)) t t))

;; replace with 163 mirror
(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives
    '(("localelpa" . "~/.emacs.d/localelpa/")
      ("melpa" . "https://mirrors.163.com/elpa/melpa/")
      ("melpa-stable" . "https://mirrors.163.com/elpa/melpa-stable/")
      ;; ("gnu" . "https://elpa.gnu.org/packages/")
      ;; ("melpa" . "https://melpa.org/packages/")
      ;; ("melpa-stable" . "https://stable.melpa.org/packages/")
      ))
(package-initialize)

;; inhibit startup message
(setq inhibit-startup-message t)

;; bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; @see https://www.reddit.com/r/emacs/comments/3kqt6e/2_easy_little_known_steps_to_speed_up_emacs_start/
;; Normally file-name-handler-alist is set to
;; (("\\`/[^/]*\\'" . tramp-completion-file-name-handler)
;; ("\\`/[^/|:][^/|]*:" . tramp-file-name-handler)
;; ("\\`/:" . file-name-non-special))
;; Which means on every .el and .elc file loaded during start up, it has to runs those regexps against the filename.
;; TODO: use init.org instead.
(let* ((file-name-handler-alist nil))
  ;; basic
  (require-init 'init-base)

  ;; sane defaults
  (require-init 'init-simpleclip)

  ;; OS integration
  (require-init 'init-exepath)

  (require-init 'init-buffer)
  (require-init 'init-try)
  (require-init 'init-nord)
  (require-init 'init-flycheck)
  (require-init 'init-whichkey)
  (require-init 'init-beacon)

  (require-init 'init-linum)
  (require-init 'init-hungrydelete)
  (require-init 'init-eyebrowse)
  (require-init 'init-rainbow)
  (require-init 'init-acewindow)
  (require-init 'init-sysmon)

  ;; not available on melpa yet, use local source
  (require-init 'init-undo-tree)

  (require-init 'init-magit)
  (require-init 'init-expandregion)
  (require-init 'init-yasnippet)

  (require-init 'init-swiper)
  ;; (require-init 'init-smex)

  (require-init 'init-helm)
  (require-init 'init-smartparens)
  (require-init 'init-multiplecursors)
  (require-init 'init-wsbutler)
  (require-init 'init-rg)
  (require-init 'init-fzf)
  (require-init 'init-gotochg)

  ;; project
  (require-init 'init-projectile)
  (require-init 'init-treemacs)

  ;; programming
  (require-init 'init-spinner)

  ;; (require-init 'init-go)
  (require-init 'init-go)
  (require-init 'init-nim)
  (require-init 'init-rust)

  ;; diminish
  (require-init 'init-diminish)
)

(setq gc-cons-threshold best-gc-cons-threshold)

(when (require 'time-date nil t)
  (message "Emacs startup time: %d seconds."
           (time-to-seconds (time-since emacs-load-start-time))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (simpleclip yasnippet-snippets ws-butler which-key use-package try treemacs-projectile treemacs-magit symon smex smartparens rg rainbow-mode rainbow-delimiters racer nord-theme nim-mode multiple-cursors linum-relative hungry-delete highlight-indent-guides helm-swoop helm-mt helm-make helm-ls-git helm-git-grep helm-descbinds helm-c-yasnippet goto-chg gotest gorepl-mode go-rename go-guru go-eldoc git-timemachine git-gutter fzf flycheck-rust flycheck-gometalinter flycheck-golangci-lint eyebrowse expand-region exec-path-from-shell diminish counsel company-lsp company-go cargo beacon))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
