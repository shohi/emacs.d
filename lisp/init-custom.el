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

(defun sk/insert-week-num-at-point ()
  "Insert current week num at the cursor"
  (interactive)
  (insert (format-time-string "W%W")))


;; copy/paste/cut from/to macOS clipboard
;; https://apple.stackexchange.com/questions/85222/configure-emacs-to-cut-and-copy-text-to-mac-os-x-clipboard
;; https://emacs.stackexchange.com/questions/10900/copy-text-from-emacs-to-os-x-clipboard
(if (eq system-type 'darwin)
    (progn
      (defun pbcopy ()
	"copy region to clipboard"
	(interactive)
	(let ((deactivate-mark t))
	  (call-process-region (point)
			       (mark) "pbcopy")))
      (defun pbpaste ()
	"paste from clipboard"
	(interactive)
	(call-process-region (point)
			     (if mark-active (mark)
			       (point)) "pbpaste" t t))
      (defun pbcut ()
	"cut region to clipboard"
	(interactive)
	(pbcopy)
	(delete-region (region-beginning)
		       (region-end)))
      (global-set-key (kbd "C-c c") 'pbcopy)
      (global-set-key (kbd "C-c v") 'pbpaste)
      (global-set-key (kbd "C-c x") 'pbcut)))
