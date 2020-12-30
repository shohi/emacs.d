;;; init.el --- Load the full configuration -*- coding: utf-8; lexical-binding: t; -*-

;;; Commentary:

;; This file bootstraps the configuration, which is divided into
;; a number of other files.

;;; Code:

;; (advice-add #'package-initialize :after #'update-load-path)
;;----------------------------------------------------------------------------
;; Emacs check
;;----------------------------------------------------------------------------

;; (let ((path (expand-file-name  "~/.emacs.d/lisp")))
;;  (if (file-accessible-directory-p path)
;;    (add-to-list 'load-path path t)))
(push (expand-file-name "~/.emacs.d/lisp") load-path)
;; (push (locate-user-emacs-file "lisp") load-path)

(let* ((minver "27.1"))
  (when (version< emacs-version minver)
    (error "Emacs v%s or higher is required" minver)))

(defvar best-gc-cons-threshold
  4000000
  "Best default gc threshold value. Should NOT be too big!")

;; don't GC during startup to save time
(setq gc-cons-threshold most-positive-fixnum)

(setq emacs-load-start-time (current-time))

;;----------------------------------------------------------------------------
;; Source directory
;;----------------------------------------------------------------------------
;; put emacs source codes at `~/.emacs.d/.repo/emacs-mirror/emacs'
;; git clone https://github.com/emacs-mirror/emacs.git
(if (file-directory-p "~/.emacs.d/.repo/emacs-mirror/emacs")
    (setq source-directory "~/.emacs.d/.repo/emacs-mirror/emacs"))

;;----------------------------------------------------------------------------
;; Which functionality to enable (use t or nil for true and false)
;;----------------------------------------------------------------------------
(defconst *is-a-mac* (eq system-type 'darwin))
(defconst *win64* (eq system-type 'windows-nt))
(defconst *cygwin* (eq system-type 'cygwin) )
(defconst *linux* (or (eq system-type 'gnu/linux) (eq system-type 'linux)) )
(defconst *unix* (or *linux* (eq system-type 'usg-unix-v) (eq system-type 'berkeley-unix)) )
(defconst *no-memory* (cond
                   (*is-a-mac*
                    (< (string-to-number (nth 1 (split-string (shell-command-to-string "sysctl hw.physmem")))) 4000000000))
                   (*linux* nil)
                   (t nil)))

;;----------------------------------------------------------------------------
;; workaround settings
;;----------------------------------------------------------------------------

;; package `undo-tree` is unavailable.
;; https://github.com/bbatsov/prelude/issues/1225
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

;; unable to install package due to signature check failure
;; https://emacs.stackexchange.com/questions/233/how-to-proceed-on-package-el-signature-check-failure
(setq package-check-signature nil)

;;----------------------------------------------------------------------------
;; global setting and package bootloader
;;----------------------------------------------------------------------------
;; (defmacro require-init (pkg)
;;   `(load (file-truename (format "~/.emacs.d/lisp/%s" ,pkg)) t t))

(defconst my-emacs-d (file-name-as-directory user-emacs-directory)
  "Directory of folder - emacs.d.")

(defconst my-site-lisp-dir (concat my-emacs-d "site-lisp")
  "Directory of subfolder - site-lisp.")

(defconst my-lisp-dir (concat my-emacs-d "lisp")
  "Directory of subfolder - lisp.")

(defun require-init (pkg &optional maybe-disabled)
  "Load PKG if MAYBE-DISABLED is nil or it's nil but start up in normal slowly."
  (when (not maybe-disabled)
    (load (file-truename (format "%s/%s" my-lisp-dir pkg)) t t)))

;; TODO
;; https://www.gnu.org/software/emacs/manual/html_node/elisp/Misc-Network.html
(defun check-vpn-up (&optional private-addr-pattern)
  "Check whether the vpn is up. The address pattern is designated by
PRIVATE-ADDR-PATTERN. If not provided, `172.24.*' will be used.

VPN is considered to be up when
- its flags contain `up'/`running'/`pointtopoint'
- its address matches PRIVATE-ADDR-PATTERN
")

;; http proxy
(setq url-gateway-method 'socks)
(setq socks-server '("Default server" "localhost" 1080 5))

(defun use-elpa-mirror-p ()
  "Return whether elpa mirror should be used.
If `USE_ELPA_MIRROR' env is set to `true' or VPN is not up, return true.
Otherwise, return nil. Refer https://www.gnu.org/software/emacs/manual/html_node/elisp/Misc-Network.html.
Rules:
1. vpn tunnel interface starts with `utun'
2. vpn tunnel is assigned wit IPv4 address like [172 31 1 16 0]
"
  (string-equal (getenv "USE_ELPA_MIRROR") "true"))

(require 'package)
(setq package-enable-at-startup nil)

;; use tsinghua source if elpa mirror is enablde
;; https://mirrors.tuna.tsinghua.edu.cn/help/elpa/
;; NOTE: alternative USTC mirror - https://mirrors.ustc.edu.cn/help/elpa.html
(if (use-elpa-mirror-p)
    (setq package-archives
	'(("localelpa" . "~/.emacs.d/localelpa/")
	  ("gnu" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
	  ("melpa" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
      ("melpa-stable" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa-stable/")
      ("org" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/org/")))
  (setq package-archives
	  '(("localelpa" . "~/.emacs.d/localelpa/")
	    ("gnu" . "https://elpa.gnu.org/packages/")
	    ("melpa" . "https://melpa.org/packages/")
	    ("melpa-stable" . "https://stable.melpa.org/packages/")
	    ("org" . "https://orgmode.org/elpa/"))))

(package-initialize)

;; inhibit startup message
(setq inhibit-startup-message t)

;; set custom file
(setq custom-file "~/.emacs.d/custom.el")
;; (setq custom-file (locate-user-emacs-file "custom.el"))

;; bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; install benchmark-init
(use-package benchmark-init
  :ensure t
  :config
  ;; To disable collection of benchmark data after init is done.
  (add-hook 'after-init-hook 'benchmark-init/deactivate))

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
  (require-init 'init-spell)
  (require-init 'init-link)

  ;; Org Mode
  ;; (require-init 'init-org)

  ;; sane defaults

  ;; OS integration
  (require-init 'init-exepath)

  ;; Selection
  (require-init 'init-select)

  ;; Movement
  (require-init 'init-move)
  (require-init 'init-key-chord)

  ;; Editing
  (require-init 'init-edit)

  ;; Display
  (require-init 'init-display)

  ;; lispy confilicts with smartparens
  ;; disabled
  ;; (require-init 'init-lispy)

  (require-init 'init-buffer)
  (require-init 'init-try)

  (require-init 'init-flycheck)
  (require-init 'init-whichkey)
  (require-init 'init-beacon)

  (require-init 'init-linum)
  (require-init 'init-eyebrowse)
  (require-init 'init-rainbow)
  (require-init 'init-window)
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
  (require-init 'init-library)
  (require-init 'init-company)
  (require-init 'init-lsp)
  (require-init 'init-spinner)
  (require-init 'init-dumbjump)

  (require-init 'init-evil)

  (require-init 'init-elisp)
  (require-init 'init-web)
  (require-init 'init-go)
  (require-init 'init-nim)
  (require-init 'init-rust)
  (require-init 'init-lua)

  (require-init 'init-markdown)
  (require-init 'init-formatter)

  ;; writing
  (require-init 'init-anki)
  (require-init 'init-writing)

  ;; docker
  (require-init 'init-docker)

  ;; yaml
  (require-init 'init-yaml-mode)
  (require-init 'init-k8s)

  ;; customized setting
  (require-init 'init-custom)
  (require-init 'init-debug)
  (require-init 'init-presentation)

  ;; Org mode
  (require-init 'init-org)

  ;; clojure
  (require-init 'init-clojure)

  ;; osx clipboard
  (require-init 'init-clipboard)

  ;; diminish
  (require-init 'init-diminish)

  ;; theme must be put at the bottom
  (require-init 'init-theme))

(setq gc-cons-threshold best-gc-cons-threshold)

(when (require 'time-date nil t)
  (message "Emacs startup time: %d seconds."
           (time-to-seconds (time-since emacs-load-start-time))))

;; load custom file if exits
;; (when (file-exists-p custom-file)
;;  (load-file custom-file))

(provide 'init)

;; Local Variables:
;; no-byte-compile: t
;; End:
;;; init.el ends here
