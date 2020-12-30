;; -*- coding: utf-8; lexical-binding: t; -*-
;; java setup

;; meghanada-mode -A Better Java Development Environment for Emacs
;; https://github.com/mopemope/meghanada-emacs
(use-package meghanada
  :ensure t
  :config
  (add-hook 'java-mode-hook
            (lambda ()
	      ;; meghanada-mode on
	      (meghanada-mode t)
	      (flycheck-mode +1)
	      (setq c-basic-offset 2)
	      ;; use code format
	      (add-hook 'before-save-hook 'meghanada-code-beautify-before-save)))
  ;; set java and mvn
  (cond
   ((eq system-type 'windows-nt)
    (setq meghanada-java-path (expand-file-name "bin/java.exe" (getenv "JAVA_HOME")))
    (setq meghanada-maven-path "mvn.cmd"))
   (t
    (setq meghanada-java-path "java")
    (setq meghanada-maven-path "mvn"))))

;; init-java.el ends here.
