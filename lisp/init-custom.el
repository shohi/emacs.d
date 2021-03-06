;; -*- coding: utf-8; lexical-binding: t; -*-

;;; Commentary:
;; customized setting

;;; Code:
;; kill current buffer
(defun sk/kill-current-buffer ()
  "Kill the current buffer."
  (interactive)
  (kill-buffer (current-buffer)))

;; kill all buffers
;; https://stackoverflow.com/questions/3417438/close-all-buffers-besides-the-current-one-in-emacs
(defun sk/kill-all-buffers ()
  "Kill all buffers."
  (interactive)
  (mapc 'kill-buffer (buffer-list)))

;; kill all-other buffers
;; https://www.emacswiki.org/emacs/KillingBuffers
(defun sk/kill-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))

;; set calendar-week-start-day to monday
(setq calendar-week-start-day 1)

(defun sk/insert-week-num-at-point ()
  "Insert current week num at the cursor."
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

;; show current file's full path
;; https://stackoverflow.com/questions/3669511/the-function-to-show-current-files-full-path-in-mini-buffer
(defun sk/show-file-name ()
  "Show the full path file name in the minibuffer."
  (interactive)
  (message (buffer-file-name)))

;; go to last heading for org-mode
;; https://emacs.stackexchange.com/questions/3318/org-mode-goto-last-heading
(defun sk/org-goto-last-heading ()
  (interactive)
  (org-end-of-subtree))

;; show current file's full path in mini buffer
;; https://stackoverflow.com/questions/3669511/the-function-to-show-current-files-full-path-in-mini-buffer
(defun sk/show-file-name ()
  "Show the full path file name in the minibuffer."
  (interactive)
  (message (buffer-file-name)))

;; open a temporary buffer
;; https://stackoverflow.com/questions/10363982/how-can-i-open-a-temporary-buffer
(defun sk/create-temp-org-buffer ()
  "Generate temporary orgmode buffer and switch to it."
  (interactive)
  (switch-to-buffer
   (get-buffer-create
    (concat "*scratch-"
	    (format-time-string "%m.%dT%H.%M.%S")
	    "*")))
  ;; set to org-mode
  (org-mode))

;; switch to previous buffer
;; https://emacsredux.com/blog/2013/04/28/switch-to-previous-buffer/
;; or using `mode-line-other-buffer'
(defun sk/switch-to-previous-buffer ()
  "Switch to previously open buffer.
Repeated invocations toggle between the two most recently open buffers."
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))

;; effective editing
;; https://sites.google.com/site/steveyegge2/effective-emacs
;; 1. swap Caps-Lock and Control
;; 2. invoke M-x without the alt key
;; 3. prefer backward-kill-word over backspace
;; 4. use incremental search for navigation
;; 5. use temp buffers
;; 6. master the buffer and window commands
;; 7. lose the UI
;; 8. learn the most important help functions
;; 9. master emacs's regular expressions

;; require helm
(global-set-key "\C-x\C-m" 'helm-M-x)
(global-set-key "\C-c\C-m" 'helm-M-x)

(global-set-key "\C-c\C-d" 'backward-kill-word)
;; (global-set-key "\C-x\C-k" 'kill-region)
;; (global-set-key "\C-c\C-k" 'kill-region)

(defalias 'qrr 'query-replace-regexp)

;; FIXME: add function to open `init-[package].el' from init.el

;; http proxy
(defun sk/use-socks-proxy ()
  (interactive)
  (setq url-gateway-method 'socks)
  (setq socks-server '("Default server" "localhost" 1080 5))
  )

;; https://stackoverflow.com/questions/23299314/finding-the-exit-code-of-a-shell-command-in-elisp
(defun sk/process-exit-code-and-output (program &rest args)
  "Run PROGRAM with ARGS and return the exit code and output in a list."
  (with-temp-buffer
    (list (apply 'call-process program nil (current-buffer) nil args)
          (buffer-string))))


(defun sk/kill-gpg-agent ()
  "Kill gpgagent to make it restart for resolving commit sign failure."
  (interactive)
  (let ((r (sk/process-exit-code-and-output "gpgconf" "--kill" "gpg-agent")))
    (if (= 0 (nth 0 r))
	   (message "gpg-agent killed")
	(message (nth 1 r)))))

(provide 'init-custom)
;;; init-custom.el ends here
