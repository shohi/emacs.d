;; -*- coding: utf-8; lexical-binding: t; -*-

;; set default fonts and frame size
;; 1. if running in terminal, use the terminal settings
;; 2. if running in GUI, apply following settings
;;
;; https://stackoverflow.com/questions/9845661/with-emacs-how-to-go-to-the-pairing-balancing-parentheses
;; https://emacs.stackexchange.com/questions/2501/how-can-i-set-default-font-in-emacs
;; https://emacs.stackexchange.com/questions/7151/is-there-a-way-to-detect-that-emacs-is-running-in-a-terminal
(when (display-graphic-p)
  ;; Do any keybindings and theme setup here

  ;; default fonts
  (add-to-list 'default-frame-alist '(font . "Droid Sans Mono for Powerline-24"))

  ;; default frame size
  (add-to-list 'default-frame-alist '(fullscreen . maximized)))

;; enable auto image view mode
;; image-mode will not work if emacs is started with `-nw` flag.
(setq auto-image-file-mode t)

;; enable view-mode for read-only buffer automatically
;; https://lobste.rs/s/fguinn/batteries_included_with_emacs
(setq view-read-only t)

;;; init-display.el ends here.
