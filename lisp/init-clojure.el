;; -*- coding: utf-8; lexical-binding: t; -*-
;; clojure setup, refer https://liujiacai.net/blog/2019/04/21/experience-in-clojure/

;; (use-package paredit
;;   :ensure t
;;   :defer)

;; https://github.com/clojure-emacs/clj-refactor.el
(use-package clj-refactor
  :ensure t
  :config
  (cljr-add-keybindings-with-prefix "C-c C-r"))

(use-package inf-clojure
  :ensure t
  ;; TODO: integate with clojure mode
  ;; https://github.com/clojure-emacs/inf-clojure
  )

;; First install the package:
;; https://github.com/borkdude/flycheck-clj-kondo
;; require `clj-kondo` installed.
(use-package flycheck-clj-kondo
  :after flycheck
  :ensure t)

(use-package clojure-mode
  :ensure t
  :mode ("\\.clj$" "\\.cljs$" "\\.cljc$" "\\.edn$" "\\.cljx$")
  :config
  (require 'flycheck-clj-kondo)
  (add-hook 'clojure-mode-hook #'subword-mode)
  (add-hook 'clojure-mode-hook #'rainbow-delimiters-mode)
  ;; (add-hook 'clojure-mode-hook 'enable-paredit-mode)
  (add-hook 'clojure-mode-hook #'smartparens-strict-mode)
  ;; syntax hilighting for midje
  (add-hook 'clojure-mode-hook
            (lambda ()
              (setq inferior-lisp-program "lein repl")
              (font-lock-add-keywords
               nil
               '(("(\\(facts?\\)"
                  (1 font-lock-keyword-face))
                 ("(\\(background?\\)"
                  (1 font-lock-keyword-face))))
              (define-clojure-indent (fact 1))
              (define-clojure-indent (facts 1))))
  ;; clj-refactor
  (add-hook 'clojure-mode-hook
	    (lambda ()
	      (clj-refactor-mode 1)
	      (yas-minor-mode 1)))
  (define-clojure-indent
    (defroutes 'defun)
    (GET 2)
    (POST 2)
    (PUT 2)
    (DELETE 2)
    (HEAD 2)
    (ANY 2)
    (OPTIONS 2)
    (PATCH 2)
    (rfn 2)
    (let-routes 1)
    (context 2))
  ;; https://stackoverflow.com/a/20940456/2163429
  (defun my/toggle-clojure-indent-style ()
    (interactive)
    (setq clojure-defun-style-default-indent (not clojure-defun-style-default-indent)))
  )

;; (use-package clojure-mode-extra-font-locking
;;   :ensure t
;;   :after clojure-mode)

;; (use-package clj-refactor
;;   :after cider
;;   :config
;;   (progn (cljr-add-keybindings-with-prefix "C-c C-m")
;;          (add-hook 'clojure-mode-hook (lambda () (clj-refactor-mode 1)))))

(use-package cider
  :ensure t
  :after clojure-mode
  :pin melpa-stable
  :config
  (progn
    ;; https://docs.cider.mx/cider/0.23/repl/configuration.html#_set_ns_in_repl
    (setq cider-repl-require-ns-on-set t)
    (setq cider-repl-pop-to-buffer-on-connect t)
    (setq cider-show-error-buffer t)
    (setq cider-auto-select-error-buffer t)
    (setq cider-repl-history-file "~/.emacs.d/cider-history")
    (setq cider-repl-wrap-history t)
    ;; (setq cider-default-cljs-repl 'figwheel)
    (add-hook 'cider-repl-mode-hook 'paredit-mode)
    (add-hook 'cider-mode-hook #'eldoc-mode)

    ;; these help me out with the way I usually develop web apps
    (defun cider-start-http-server ()
      (interactive)
      (let ((ns (cider-current-ns)))
        (cider-repl-set-ns ns)
        (cider-interactive-eval (format "(println '(def server (%s/start))) (println 'server)" ns))
        (cider-interactive-eval (format "(def server (%s/start)) (println server)" ns))))

    (defun cider-user-ns ()
      (interactive)
      (cider-repl-set-ns "user"))

    (defun my/cider-figwheel-repl ()
      (interactive)
      (save-some-buffers)
      (with-current-buffer (cider-current-repl)
        (goto-char (point-max))
        (insert "(require 'figwheel-sidecar.repl-api)
             (figwheel-sidecar.repl-api/start-figwheel!)
             (figwheel-sidecar.repl-api/cljs-repl)")
        (cider-repl-return)))
    (defun my/start-cider-repl-with-profile (profile)
      (interactive "sEnter profile name: ")
      (letrec ((lein-params (concat "with-profile +" profile " repl :headless")))
        (message "lein-params set to: %s" lein-params)
        (set-variable 'cider-lein-parameters lein-params)
        (cider-jack-in '())
        (set-variable 'cider-lein-parameters "repl :headless")))

    )
  :bind (("C-c M-RET" . cider-macroexpand-1)
         ("C-c C-v" . cider-start-http-server)
         ("C-M-r" . cider-ns-refresh)
         ("C-c u" . cider-user-ns)))

(provide 'init-clojure)
;;; init-clojure.el ends here.
