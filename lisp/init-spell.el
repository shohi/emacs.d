;; -*- coding: utf-8; lexical-binding: t; -*-

;;; Commentary:
;; spelling check setup
;; * install aspell/hunspell installed, and also corresponding dictionaries
;;     install aspell -  brew install aspell
;;     install hunspell - brew install hunspell
;;
;; * download dictionaries and put them in aspell/hunspell's search path
;; https://stackoverflow.com/questions/62464054/how-to-add-dictionary-path-in-search-path-for-hunspell-on-windows
;; https://www.cnblogs.com/zhenyuyaodidiao/p/9288469.html
;;    git clone https://github.com/LibreOffice/dictionaries
;;    cp dictionaries/en/en* ~/Library/Spelling
;;    hunspell -D

;;; Code:
;; refer https://github.com/redguardtoo/emacs.d/blob/master/lisp/init-spelling.el

;; wucuo - Fastest solution to spell check camel case code or plain text
;; https://github.com/redguardtoo/wucuo
(use-package wucuo
  :ensure t
  :hook
  (prog-mode . wucuo-start)
  (text-mode . wucuo-start))

(provide 'init-spell)
;;; init-spell.el ends here
