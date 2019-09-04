;; -*- coding: utf-8; lexical-binding: t; -*-
;; expand the marked region in semantic increments (negative prefix to reduce region)
(use-package expand-region
:ensure t
:bind ("C-q" . er/expand-region))

(provide 'init-expandregion)
;;; init-expandregion ends here.
