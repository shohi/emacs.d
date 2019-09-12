;; -*- coding: utf-8; lexical-binding: t; -*-
;; customized setting

;; kill current buffer
(defun sk/kill-current-buffer ()
  "Kills the current buffer."
  (interactive)
  (kill-buffer (current-buffer)))
