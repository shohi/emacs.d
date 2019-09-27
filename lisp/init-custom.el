;; -*- coding: utf-8; lexical-binding: t; -*-
;; customized setting

;; kill current buffer
(defun sk/kill-current-buffer ()
  "Kills the current buffer."
  (interactive)
  (kill-buffer (current-buffer)))

;; kill all buffers
;; https://stackoverflow.com/questions/3417438/close-all-buffers-besides-the-current-one-in-emacs
(defun sk/kill-all-buffers ()
  "Kill all buffers"
  (interactive)
  (mapc 'kill-buffer (buffer-list)))

;; kill all-other buffers
;; https://www.emacswiki.org/emacs/KillingBuffers
(defun sk/kill-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))
