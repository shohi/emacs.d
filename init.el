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

;; replace with USTC mirror
;; https://mirrors.ustc.edu.cn/help/elpa.html
(require 'package)
(setq package-enable-at-startup nil)
(if (string-equal (getenv "DISABLE_ELPA_MIRROR") "true")
    (setq package-archives
	  '(("localelpa" . "~/.emacs.d/localelpa/")
	    ("gnu" . "https://mirrors.ustc.edu.cn/elpa/gnu/")
	    ("melpa" . "https://mirrors.ustc.edu.cn/elpa/melpa/")
	    ("melpa-stable" . "https://mirrors.ustc.edu.cn/elpa/melpa-stable/")
	    ("org" . "https://mirrors.ustc.edu.cn/elpa/org/")))
  (setq package-archives
	'(("localelpa" . "~/.emacs.d/localelpa/")
	  ("gnu" . "https://elpa.gnu.org/packages/")
	  ("melpa" . "https://melpa.org/packages/")
	  ("melpa-stable" . "https://stable.melpa.org/packages/")
	  ("org" . "https://orgmode.org/elpa/")))
  )

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
  (require-init 'init-mac)
  (require-init 'init-hydra)

  ;; Org Mode
  ;; (require-init 'init-org)

  ;; sane defaults

  ;; OS integration
  (require-init 'init-exepath)

  ;; Selection
  (require-init 'init-select)

  ;; Movement
  (require-init 'init-move)

  ;; Editing
  (require-init 'init-edit)

  ;; Display
  (require-init 'init-display)

  ;; Formatter
  (require-init 'init-formatter)

  (require-init 'init-buffer)
  (require-init 'init-try)

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
  (require-init 'init-lsp)
  (require-init 'init-spinner)
  (require-init 'init-dumbjump)
  (require-init 'init-web)

  ;; (require-init 'init-go)
  (require-init 'init-go)
  (require-init 'init-nim)
  (require-init 'init-rust)

  (require-init 'init-markdown)

  ;; docker
  (require-init 'init-docker)

  ;; diminish
  (require-init 'init-diminish)

  ;; customized setting
  (require-init 'init-custom)

  ;; theme must be put at the bottom
  (require-init 'init-nord)

  ;; Org mode
  (require-init 'init-org)
)

(setq gc-cons-threshold best-gc-cons-threshold)

(when (require 'time-date nil t)
  (message "Emacs startup time: %d seconds."
           (time-to-seconds (time-since emacs-load-start-time))))
